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
//--------------------------------------------------------------------------------
// *.v : MiST-board controllers
// This type of component is only used on my main schematic.
// see CoreAsmtradDevNotes
//--------------------------------------------------------------------------------
//
// data_io.v
//
// io controller writable ram for the MiST board
// http://code.google.com/p/mist-board/
//
// Copyright (c) 2014 Till Harbaum <till@harbaum.org>
//
// This source file is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This source file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

module data_io (
	// io controller spi interface
	input             sck,
	input             ss,
	input             sdi,

	output            downloading,   // signal indicating an active download
	output [24:0]     size,          // number of bytes in input buffer
	output reg [4:0]  index,         // menu index used to upload the file

	//output [255:0] dir_entry,        // directory entry user has selected
	input dir_entry_clk,
	output reg [7:0] dir_entry_d,
	input dir_entry_r,
	output reg dir_entry_ack,
	output reg dir_entry_downloading,
	
	// external ram interface
	input 			   clk,
	output reg        wr,
	output reg [24:0] a,
	output [7:0]      d
);

assign d = data;

parameter START_ADDR = 25'h0;

assign size = addr;

// *********************************************************************************
// spi client
// *********************************************************************************

reg [6:0]      sbuf;
reg [7:0]      cmd;
reg [7:0]      data;
reg [4:0]      cnt;
reg [4:0]      bcnt;

reg [24:0]     addr;
reg rclk;

localparam UIO_FILE_TX      = 8'h53;
localparam UIO_FILE_TX_DAT  = 8'h54;
localparam UIO_FILE_INDEX   = 8'h55;
localparam UIO_FILE_INFO    = 8'h56;

assign downloading = downloading_reg;
reg downloading_reg = 1'b0;

//// plus de place en RAM interne si je commente ce code...
//// convert byte array into 256 bit vector
//assign dir_entry = { 
//	dir_entry_reg[ 0], dir_entry_reg[ 1], dir_entry_reg[ 2], dir_entry_reg[ 3],
//	dir_entry_reg[ 4], dir_entry_reg[ 5], dir_entry_reg[ 6], dir_entry_reg[ 7],
//	dir_entry_reg[ 8], dir_entry_reg[ 9], dir_entry_reg[10], dir_entry_reg[11],
//	dir_entry_reg[12], dir_entry_reg[13], dir_entry_reg[14], dir_entry_reg[15],
//	dir_entry_reg[16], dir_entry_reg[17], dir_entry_reg[18], dir_entry_reg[19],
//	dir_entry_reg[20], dir_entry_reg[21], dir_entry_reg[22], dir_entry_reg[23],
//	dir_entry_reg[24], dir_entry_reg[25], dir_entry_reg[26], dir_entry_reg[27],
//	dir_entry_reg[28], dir_entry_reg[29], dir_entry_reg[30], dir_entry_reg[31]
//};
(* ramstyle = "logic" *) reg [7:0] dir_entry_reg [31:0] /* synthesis noprune */;

// filter spi clock. the 8 bit gate delay is ~2.5ns in total
wire [7:0] spi_sck_D = { spi_sck_D[6:0], sck } /* synthesis keep */;
wire spi_sck = (spi_sck && spi_sck_D != 8'h00) || (!spi_sck && spi_sck_D == 8'hff);

// data_io has its own SPI interface to the io controller
always@(posedge spi_sck, posedge ss) begin
	if(ss == 1'b1) begin
		cnt <= 5'd0;
		bcnt <= 5'd0;
	end else begin
		rclk <= 1'b0;

		// don't shift in last bit. It is evaluated directly
		// when writing to ram
		if(cnt != 15)
			sbuf <= { sbuf[5:0], sdi};

		// increase target address after write
		if(rclk)
			addr <= addr + 25'd1;
	 
		// count 0-7 8-15 8-15 ... 
		if(cnt < 15)
			cnt <= cnt + 4'd1;
		else begin
			cnt <= 4'd8;
			bcnt <= bcnt + 5'd1;
		end

		// finished command byte
      if(cnt == 7)
			cmd <= {sbuf, sdi};

		// prepare/end transmission
		if((cmd == UIO_FILE_TX) && (cnt == 15)) begin
			// prepare
			if(sdi) begin
				addr <= START_ADDR;
				downloading_reg <= 1'b1; 
			end else
				downloading_reg <= 1'b0; 
		end
		
		// command 0x54: UIO_FILE_TX
		if((cmd == UIO_FILE_TX_DAT) && (cnt == 15)) begin
			data <= {sbuf, sdi};
			rclk <= 1'b1;
			a <= addr;
		end

		// expose file (menu) index
		if((cmd == UIO_FILE_INDEX) && (cnt == 15))
			index <= {sbuf[3:0], sdi};
			
		if((cmd == UIO_FILE_INFO) && (cnt == 15)) begin
			dir_entry_reg[bcnt] <= {sbuf, sdi};
		end
	end
end

reg rclkD, rclkD2;
always@(posedge clk) begin
	// bring rclk from spi clock domain into core clock domain
	rclkD <= rclk;
	rclkD2 <= rclkD;
	wr <= 1'b0;
	
	if(rclkD && !rclkD2) 
		wr <= 1'b1;
end

reg [4:0] bcntRead=5'd0;
// transmitting
always@(posedge dir_entry_clk) begin
	dir_entry_downloading<=downloading_reg;
	if (downloading_reg) begin
		bcntRead<=5'd0;
		dir_entry_ack<=1'b0;
	end else if (dir_entry_r) begin
		dir_entry_d<=dir_entry_reg[bcntRead];
		if (bcntRead==31)
			dir_entry_ack<=1'b1; // last one need to be readen also :)
		else begin
			bcntRead<=bcntRead+1;
			dir_entry_ack<=1'b1;
		end;
	end else
		dir_entry_ack<=1'b0;
	//end;
end

endmodule