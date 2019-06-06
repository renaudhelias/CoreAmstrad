//    {@{@{@{@{@{@
//  {@{@{@{@{@{@{@{@  This code is covered by CoreAmstrad synthesis r004
//  {@    {@{@    {@  A core of Amstrad CPC 6128 running on MiST-board platform
//  {@{@{@{@{@{@{@{@
//  {@  {@{@{@{@  {@  CoreAmstrad is implementation of FPGAmstrad on MiST-board
//  {@{@        {@{@   Contact : renaudhelias@gmail.com
//  {@{@{@{@{@{@{@{@   @see http://code.google.com/p/mist-board/
//    {@{@{@{@{@{@     @see FPGAmstrad at CPCWiki
//
//
//------------------------------------------------------------------------------
// *.v : MiST-board controllers
// This type of components is only used on my main schematic.
// Hexa 7 segments for debug purpose (can had bad "time constraint" border effect, so unplug them in deployed versions)
// Less memory used (poor character display...)
// see CoreAmstradDevNotes wiki
//------------------------------------------------------------------------------
//
// A simple OSD implementation. Can be hooked up between a cores
// VGA output and the physical VGA pins

module osd (
	// OSDs pixel clock, should be synchronous to cores pixel clock to
	// avoid jitter.
	input 			pclk,

	// SPI interface
	input         sck,
	input         ss,
	input         sdi,

	// VGA signals coming from core
	input [5:0]  	red_in,
	input [5:0]  	green_in,
	input [5:0]  	blue_in,
	input				hs_in,
	input				vs_in,
	
	// green/scanlines
	input green,
	
	// debug 7seg input examples
	//input [7:0] leds8,
	//input [3:0] leds4,
	//input [2:0] leds3,
	//input       leds1,
	
	//input [39:0] leds8_debug,
	input [19:0] leds8_debug1,
	input [19:0] leds8_debug2,
	
	//input [7:0] leds8,
	
	//input [16:0] leds_mouse_data,
	
	//input [7:0] leds8_fat32,
	//input [255:0] dir_entry,
	//input [15:0] leds8_debug_crc_c,
	//input [15:0] leds8_debug_crc_r,
	//input [31:0] leds8_debug_chrn,
	//input [31:0] leds8_debug_chrnR,
	
	// VGA signals going to video connector
	output reg [5:0]  	red_out,
	output reg [5:0]  	green_out,
	output reg [5:0]  	blue_out
	//output			hs_out,
	//output			vs_out
);

parameter OSD_X_OFFSET = 10'd0;
parameter OSD_Y_OFFSET = 10'd0;
parameter OSD_COLOR    = 3'd0;

localparam OSD_WIDTH  = 10'd256;
localparam OSD_HEIGHT = 10'd128;
localparam SEG7_HEIGHT = 10'd256;

// *********************************************************************************
// spi client
// *********************************************************************************

// this core supports only the display related OSD commands
// of the minimig
reg [7:0]      sbuf;
reg [7:0]      cmd;
reg [4:0]      cnt;
reg [10:0]     bcnt;
reg    			osd_enable;

reg [7:0] osd_buffer [1024:0];  // the OSD buffer itself

// the OSD has its own SPI interface to the io controller
always@(posedge sck, posedge ss) begin
  if(ss == 1'b1) begin
      cnt <= 5'd0;
      bcnt <= 11'd0;
  end else begin
    sbuf <= { sbuf[6:0], sdi};

    // 0:7 is command, rest payload
    if(cnt < 15)
      cnt <= cnt + 4'd1;
    else
      cnt <= 4'd8;

      if(cnt == 7) begin
       cmd <= {sbuf[6:0], sdi};
      
      // lower three command bits are line address
      bcnt <= { sbuf[1:0], sdi, 8'h00};

      // command 0x40: OSDCMDENABLE, OSDCMDDISABLE
      if(sbuf[6:3] == 4'b0100)
        osd_enable <= sdi;
    end

    // command 0x20: OSDCMDWRITE
    if((cmd[7:3] == 5'b00100) && (cnt == 15)) begin
      if (bcnt[0]== 1'b1) osd_buffer[bcnt[10:1]] <= {sbuf[6:0], sdi};
      bcnt <= bcnt + 11'd1;
    end
  end
end

// *********************************************************************************
// video timing and sync polarity anaylsis
// *********************************************************************************

// horizontal counter
reg [9:0] h_cnt;
reg hsD, hsD2;
reg [9:0] hs_low, hs_high;
wire hs_pol = hs_high < hs_low;
wire [9:0] h_dsp_width = hs_pol?hs_low:hs_high;
wire [9:0] h_dsp_ctr = { 1'b0, h_dsp_width[9:1] };

always @(posedge pclk) begin
	// bring hsync into local clock domain
	hsD <= hs_in;
	hsD2 <= hsD;

	// falling edge of hs_in
	if(!hsD && hsD2) begin	
		h_cnt <= 10'd0;
		hs_high <= h_cnt;
	end

	// rising edge of hs_in
	else if(hsD && !hsD2) begin	
		h_cnt <= 10'd0;
		hs_low <= h_cnt;
	end 
	
	else
		h_cnt <= h_cnt + 10'd1;
end

// vertical counter
reg [9:0] v_cnt;
reg vsD, vsD2;
reg [9:0] vs_low, vs_high;
wire vs_pol = vs_high < vs_low;
wire [9:0] v_dsp_width = vs_pol?vs_low:vs_high;
wire [9:0] v_dsp_ctr = { 1'b0, v_dsp_width[9:1] };

always @(posedge hs_in) begin
	// bring vsync into local clock domain
	vsD <= vs_in;
	vsD2 <= vsD;

	// falling edge of vs_in
	if(!vsD && vsD2) begin	
		v_cnt <= 10'd0;
		vs_high <= v_cnt;
	end

	// rising edge of vs_in
	else if(vsD && !vsD2) begin	
		v_cnt <= 10'd0;
		vs_low <= v_cnt;
	end 
	
	else
		v_cnt <= v_cnt + 10'd1;
end

// area in which OSD is being displayed
wire [9:0] h_osd_start = h_dsp_ctr + OSD_X_OFFSET - (OSD_WIDTH >> 1);
wire [9:0] h_osd_end   = h_dsp_ctr + OSD_X_OFFSET + (OSD_WIDTH >> 1) - 1;
wire [9:0] v_osd_start = v_dsp_ctr + OSD_Y_OFFSET - (OSD_HEIGHT >> 1);
wire [9:0] v_osd_end   = v_dsp_ctr + OSD_Y_OFFSET + (OSD_HEIGHT >> 1) - 1;
wire [9:0] v_seg7_end   = v_dsp_ctr + OSD_Y_OFFSET + (SEG7_HEIGHT >> 1) - 1;


reg h_osd_active, v_osd_active, v_seg7_active;
always @(posedge pclk) begin
	if(hs_in != hs_pol) begin
		if(h_cnt == h_osd_start) h_osd_active <= 1'b1;
		if(h_cnt == h_osd_end)   h_osd_active <= 1'b0;
	end
	if(vs_in != vs_pol) begin
		if(v_cnt == v_osd_start) v_osd_active <= 1'b1;
		if(v_cnt == v_osd_end)   v_osd_active <= 1'b0;
		if(!v_osd_active) begin
			if(v_cnt == v_osd_end)   v_seg7_active <= 1'b1;
			if(v_cnt == v_seg7_end)   v_seg7_active <= 1'b0;
		end
	end
end

wire osd_de = osd_enable && h_osd_active && v_osd_active;
wire seg7_de = osd_enable && h_osd_active && v_seg7_active;

wire [7:0] osd_hcnt = h_cnt - h_osd_start + 7'd1;  // one pixel offset for osd_byte register
wire [7:0] seg7_hcnt = h_cnt - h_osd_start + 7'd1;
wire [6:0] osd_vcnt = v_cnt - v_osd_start;
wire [6:0] seg7_vcnt = v_cnt - v_osd_end;

wire osd_pixel = osd_byte[osd_vcnt[3:1]];

reg [7:0] osd_byte; 
always @(posedge pclk)
  osd_byte <= osd_buffer[{osd_vcnt[6:4], osd_hcnt[7:1]}];

wire [2:0] osd_color = OSD_COLOR;

//assign red_out   = !osd_de?red_in:  {osd_pixel, osd_pixel, osd_color[2], red_in[5:3]  };
//assign green_out = !osd_de?green_in:{osd_pixel, osd_pixel, osd_color[1], green_in[5:3]};
//assign blue_out  = !osd_de?blue_in: {osd_pixel, osd_pixel, osd_color[0], blue_in[5:3] };

wire [6:0] segment [9:0];

//osd_HEXA_7SEG my7segConverter0(.halfByte(3'b000 & leds_mouse_data[16]),.segment(segment[0]));
//osd_HEXA_7SEG my7segConverter1(.halfByte(leds_mouse_data[15:12]),.segment(segment[1]));
//osd_HEXA_7SEG my7segConverter2(.halfByte(leds_mouse_data[11:8]),.segment(segment[2]));
//osd_HEXA_7SEG my7segConverter3(.halfByte(leds_mouse_data[7:4]),.segment(segment[3]));
//osd_HEXA_7SEG my7segConverter4(.halfByte(leds_mouse_data[3:0]),.segment(segment[4]));


//osd_HEXA_7SEG my7segConverter0(.halfByte(dir_entry[255:252]),.segment(segment[0]));
//osd_HEXA_7SEG my7segConverter1(.halfByte(dir_entry[251:248]),.segment(segment[1]));
//osd_HEXA_7SEG my7segConverter2(.halfByte(dir_entry[247:244]),.segment(segment[2]));
//osd_HEXA_7SEG my7segConverter3(.halfByte(dir_entry[243:240]),.segment(segment[3]));
//osd_HEXA_7SEG my7segConverter4(.halfByte(dir_entry[239:236]),.segment(segment[4]));
//osd_HEXA_7SEG my7segConverter5(.halfByte(dir_entry[235:232]),.segment(segment[5]));
//osd_HEXA_7SEG my7segConverter6(.halfByte(dir_entry[231:228]),.segment(segment[6]));
//osd_HEXA_7SEG my7segConverter7(.halfByte(dir_entry[227:224]),.segment(segment[7]));
//osd_HEXA_7SEG my7segConverter8(.halfByte(dir_entry[223:220]),.segment(segment[8]));
//osd_HEXA_7SEG my7segConverter9(.halfByte(dir_entry[219:216]),.segment(segment[9]));

//osd_HEXA_7SEG my7segConverter0(.halfByte(4'h0),.segment(segment[0]));
//osd_HEXA_7SEG my7segConverter1(.halfByte(4'h0),.segment(segment[1]));
//osd_HEXA_7SEG my7segConverter2(.halfByte(4'hA),.segment(segment[2]));
//osd_HEXA_7SEG my7segConverter3(.halfByte(4'hB),.segment(segment[3]));
////osd_HEXA_7SEG my7segConverter2(.halfByte(leds4[3:0]),.segment(segment[2]));
////osd_HEXA_7SEG my7segConverter3(.halfByte(leds3[2:0] & leds1),.segment(segment[3]));
////osd_HEXA_7SEG my7segConverter2(.halfByte(leds8_fat32[7:4]),.segment(segment[2]));
////osd_HEXA_7SEG my7segConverter3(.halfByte(leds8_fat32[3:0]),.segment(segment[3]));
//osd_HEXA_7SEG my7segConverter4(.halfByte(4'hC),.segment(segment[4]));
//osd_HEXA_7SEG my7segConverter5(.halfByte(4'hD),.segment(segment[5]));
//osd_HEXA_7SEG my7segConverter6(.halfByte(4'hE),.segment(segment[6]));
//osd_HEXA_7SEG my7segConverter7(.halfByte(4'hF),.segment(segment[7]));
//osd_HEXA_7SEG my7segConverter8(.halfByte(4'h0),.segment(segment[8]));
//osd_HEXA_7SEG my7segConverter9(.halfByte(4'h0),.segment(segment[9]));

//osd_HEXA_7SEG my7segConverter0(.halfByte(leds8_debug_crc_c[15:12]),.segment(segment[0]));
//osd_HEXA_7SEG my7segConverter1(.halfByte(leds8_debug_crc_c[11:8]),.segment(segment[1]));
//osd_HEXA_7SEG my7segConverter2(.halfByte(leds8_debug_crc_c[7:4]),.segment(segment[2]));
//osd_HEXA_7SEG my7segConverter3(.halfByte(leds8_debug_crc_c[3:0]),.segment(segment[3]));
//osd_HEXA_7SEG my7segConverter4(.halfByte(4'h0),.segment(segment[4]));
//osd_HEXA_7SEG my7segConverter5(.halfByte(4'h0),.segment(segment[5]));
//osd_HEXA_7SEG my7segConverter6(.halfByte(leds8_debug_crc_r[15:12]),.segment(segment[6]));
//osd_HEXA_7SEG my7segConverter7(.halfByte(leds8_debug_crc_r[11:8]),.segment(segment[7]));
//osd_HEXA_7SEG my7segConverter8(.halfByte(leds8_debug_crc_r[7:4]),.segment(segment[8]));
//osd_HEXA_7SEG my7segConverter9(.halfByte(leds8_debug_crc_r[3:0]),.segment(segment[9]));

//osd_HEXA_7SEG my7segConverter0(.halfByte(leds8[7:4]),.segment(segment[0]));
//osd_HEXA_7SEG my7segConverter1(.halfByte(leds8[3:0]),.segment(segment[1]));

//osd_HEXA_7SEG my7segConverter0(.halfByte(leds8_debug[39:36]),.segment(segment[0]));
//osd_HEXA_7SEG my7segConverter1(.halfByte(leds8_debug[35:32]),.segment(segment[1]));
//osd_HEXA_7SEG my7segConverter2(.halfByte(leds8_debug[31:28]),.segment(segment[2]));
//osd_HEXA_7SEG my7segConverter3(.halfByte(leds8_debug[27:24]),.segment(segment[3]));
//osd_HEXA_7SEG my7segConverter4(.halfByte(leds8_debug[23:20]),.segment(segment[4]));
//osd_HEXA_7SEG my7segConverter5(.halfByte(leds8_debug[19:16]),.segment(segment[5]));
//osd_HEXA_7SEG my7segConverter6(.halfByte(leds8_debug[15:12]),.segment(segment[6]));
//osd_HEXA_7SEG my7segConverter7(.halfByte(leds8_debug[11:8]),.segment(segment[7]));
//osd_HEXA_7SEG my7segConverter8(.halfByte(leds8_debug[7:4]),.segment(segment[8]));
//osd_HEXA_7SEG my7segConverter9(.halfByte(leds8_debug[3:0]),.segment(segment[9]));

osd_HEXA_7SEG my7segConverter0(.halfByte(leds8_debug1[19:16]),.segment(segment[0]));
osd_HEXA_7SEG my7segConverter1(.halfByte(leds8_debug1[15:12]),.segment(segment[1]));
osd_HEXA_7SEG my7segConverter2(.halfByte(leds8_debug1[11:8]),.segment(segment[2]));
osd_HEXA_7SEG my7segConverter3(.halfByte(leds8_debug1[7:4]),.segment(segment[3]));
osd_HEXA_7SEG my7segConverter4(.halfByte(leds8_debug1[3:0]),.segment(segment[4]));
osd_HEXA_7SEG my7segConverter5(.halfByte(leds8_debug2[19:16]),.segment(segment[5]));
osd_HEXA_7SEG my7segConverter6(.halfByte(leds8_debug2[15:12]),.segment(segment[6]));
osd_HEXA_7SEG my7segConverter7(.halfByte(leds8_debug2[11:8]),.segment(segment[7]));
osd_HEXA_7SEG my7segConverter8(.halfByte(leds8_debug2[7:4]),.segment(segment[8]));
osd_HEXA_7SEG my7segConverter9(.halfByte(leds8_debug2[3:0]),.segment(segment[9]));

//osd_HEXA_7SEG my7segConverter0(.halfByte(4'h0),.segment(segment[0]));
//osd_HEXA_7SEG my7segConverter1(.halfByte(4'h0),.segment(segment[1]));
//osd_HEXA_7SEG my7segConverter2(.halfByte(4'hA),.segment(segment[2]));
//osd_HEXA_7SEG my7segConverter3(.halfByte(4'hB),.segment(segment[3]));
//osd_HEXA_7SEG my7segConverter4(.halfByte(4'hC),.segment(segment[4]));
//osd_HEXA_7SEG my7segConverter5(.halfByte(4'hD),.segment(segment[5]));
//osd_HEXA_7SEG my7segConverter6(.halfByte(4'hE),.segment(segment[6]));
//osd_HEXA_7SEG my7segConverter7(.halfByte(4'hF),.segment(segment[7]));
//osd_HEXA_7SEG my7segConverter8(.halfByte(4'h0),.segment(segment[8]));
//osd_HEXA_7SEG my7segConverter9(.halfByte(4'h0),.segment(segment[9]));



wire matrice_pixel [9:0];
reg [1:0] matrice_h [9:0];
reg [2:0] matrice_v [9:0];
osd_7SEG my7segDisplayer0(.segment(segment[0]), .h(matrice_h[0]), .v(matrice_v[0]), .pixel(matrice_pixel[0]) ); 
osd_7SEG my7segDisplayer1(.segment(segment[1]), .h(matrice_h[1]), .v(matrice_v[1]), .pixel(matrice_pixel[1]) ); 
osd_7SEG my7segDisplayer2(.segment(segment[2]), .h(matrice_h[2]), .v(matrice_v[2]), .pixel(matrice_pixel[2]) ); 
osd_7SEG my7segDisplayer3(.segment(segment[3]), .h(matrice_h[3]), .v(matrice_v[3]), .pixel(matrice_pixel[3]) ); 
osd_7SEG my7segDisplayer4(.segment(segment[4]), .h(matrice_h[4]), .v(matrice_v[4]), .pixel(matrice_pixel[4]) ); 
osd_7SEG my7segDisplayer5(.segment(segment[5]), .h(matrice_h[5]), .v(matrice_v[5]), .pixel(matrice_pixel[5]) ); 
osd_7SEG my7segDisplayer6(.segment(segment[6]), .h(matrice_h[6]), .v(matrice_v[6]), .pixel(matrice_pixel[6]) ); 
osd_7SEG my7segDisplayer7(.segment(segment[7]), .h(matrice_h[7]), .v(matrice_v[7]), .pixel(matrice_pixel[7]) ); 
osd_7SEG my7segDisplayer8(.segment(segment[8]), .h(matrice_h[8]), .v(matrice_v[8]), .pixel(matrice_pixel[8]) ); 
osd_7SEG my7segDisplayer9(.segment(segment[9]), .h(matrice_h[9]), .v(matrice_v[9]), .pixel(matrice_pixel[9]) ); 

reg [2:0] seg7_hB=3'd0; // horizontal big pixel counter from 0 to 5 (include borders)
reg [1:0] seg7_h=2'd0; // horizontal big pixel counter from 0 to 3
wire [4:0] seg7_vcntDiv4=seg7_vcnt[6:2]; // vertical big pixel counter
wire [1:0] seg7_hcntModulo4=seg7_hcnt[1:0]; // inside a big pixel
reg [3:0] seg7_i=0; // current 7segment selected
always @(posedge pclk) begin
	if (osd_de)
		begin
			if (green == 1'b0)
				begin
					red_out   <= {osd_pixel, osd_pixel, osd_color[2], red_in[5:3]  };
					blue_out  <= {osd_pixel, osd_pixel, osd_color[0], blue_in[5:3] };
				end
			else
				begin
					red_out   <= {1'b0, 1'b0, osd_color[2], red_in[5:3]  };
					blue_out  <= {1'b0, 1'b0, osd_color[0], blue_in[5:3] };
				end
			//end
			green_out <= {osd_pixel, osd_pixel, osd_color[1], green_in[5:3]};
			seg7_hB<=3'd0;
			seg7_h<=2'd0;
			seg7_i<=0;
		end
	else if (seg7_de && seg7_vcntDiv4<7)
		begin
			// 7 SEGMENTS // 4 pixels width/7 pixels height + horizontal border 1 left 1 right.
			if (seg7_hcnt/4<2 || seg7_hcnt/4>2+10*6)
				begin
					// mini border left & mini border right, transparent
					red_out   <= red_in;
					green_out <= green_in;
					blue_out  <= blue_in;
					seg7_hB<=3'd0;
					seg7_h<=2'd0;
					seg7_i<=0;
				end
			//end
			else
				begin
					reg seg7_pixel = 1'b0;
					matrice_v[seg7_i]<=seg7_vcntDiv4[2:0];
					matrice_h[seg7_i]<=seg7_h;
					seg7_pixel<=matrice_pixel[seg7_i];
					if (green == 1'b0)
						begin
							red_out   <= {seg7_pixel, seg7_pixel, osd_color[2], red_in[5:3]  };
							green_out <= {osd_color[1], osd_color[1], osd_color[1], green_in[5:3]};
							blue_out  <= {osd_color[0], osd_color[0], osd_color[0], blue_in[5:3] };
						end
					else
						begin
							red_out   <= {1'b0, 1'b0, osd_color[2], red_in[5:3]  };
							green_out   <= {seg7_pixel, seg7_pixel, osd_color[1], red_in[5:3]  };
							blue_out  <= {1'b0, 1'b0, osd_color[0], blue_in[5:3] };
						end
					//end
					
					if (seg7_hB==3'd0 || seg7_hB==3'd5)
						begin
							// separators
							if (green == 1'b0)
								begin
									red_out   <= {osd_color[2], osd_color[2], osd_color[2], red_in[5:3]  };
									blue_out  <= {osd_color[0], osd_color[0], osd_color[0], blue_in[5:3] };
								end
							else
								begin
									red_out   <= {1'b0, 1'b0, osd_color[2], red_in[5:3]  };
									blue_out  <= {1'b0, 1'b0, osd_color[0], blue_in[5:3] };
								end
							//end
							green_out <= {osd_color[1], osd_color[1], osd_color[1], green_in[5:3]};
						end
					//end
					if (seg7_hB==3'd1)
						begin
							// This is a strange FIX -- but a beautifull one ^^'
							if (green == 1'b0)
								begin
									red_out   <= {osd_color[2], osd_color[2], osd_color[2], red_in[5:3]  };
									blue_out  <= {osd_color[0], osd_color[0], osd_color[0], blue_in[5:3] };
								end
							else
								begin
									red_out   <= {1'b0, 1'b0, osd_color[2], red_in[5:3]  };
									blue_out  <= {1'b0, 1'b0, osd_color[0], blue_in[5:3] };
								end
							//end
							green_out <= {osd_color[1], osd_color[1], osd_color[1], green_in[5:3]};
						end
					//end
					if (seg7_hcntModulo4==2'd3)
						begin
							if (seg7_hB==3'd5)
								begin
									seg7_hB<=3'd0;
									seg7_h<=2'd0;
									if (seg7_i==9)
										seg7_i<=0;
									else
										seg7_i<=seg7_i+1;
									//end
								end
							else
								begin
									if (seg7_hB>3'd0 && seg7_hB<3'd5)
										seg7_h<=seg7_h+2'd1;
									//end
									seg7_hB<=seg7_hB+3'd1;
								end
							//end
						end
					//end
				end
			//end
		end
	else
		begin
			red_out   <= red_in;
			green_out <= green_in;
			blue_out  <= blue_in;
		end
	//end
end

//assign hs_out = hs_in;
//assign vs_out = vs_in;

endmodule