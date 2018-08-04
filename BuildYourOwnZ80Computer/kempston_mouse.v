////////////////////////////////////////////////////////////////////////////////
//
//  PS2-to-Kempston Mouse v2
//  (C) 2017,2018 Sorgelig
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
////////////////////////////////////////////////////////////////////////////////

module kempston_mouse
(
	input        clk_sys,
	input        reset_n,

	//input ps2_mouse_new,
	input [16:0] ps2_mouse,
	
	input  [22:0] addr,
	//input io_rd,
	//output       sel,
	output [7:0] dout
);

assign dout = data;
//assign sel  = port_sel;

//reg [11:0] dx;
//reg [11:0] dy;

reg  [7:0] data;
//reg        port_sel;
always @* begin
	//port_sel = 1;
	
//wire [3:0] fdc_sel = {cpu_addr[10],cpu_addr[8],cpu_addr[7],cpu_addr[0]};
//b010X

//A(10) & A(8) & A(7) = "010" FDC
	
	//casex({addr[0], ~addr[4] & ~addr[10] & io_rd, addr[8]})
	casex({addr[0], ~addr[4] & ~addr[10], addr[8]})
		 3'b011: data = ps2_mouse[15:8];
		 3'b111: data = ps2_mouse[7:0];
		 3'bX10: data = ~{5'b00000,ps2_mouse[16], ps2_mouse[16], 1'b0} ;
		default: data = 8'hFF;
	endcase
end

//always @(posedge clk_sys) begin
//	//reg old_status;
//	//old_status <= ps2_mouse[24];
//
//	if(~reset_n) begin
//		dx <= 128; // dx != dy for better mouse detection
//		dy <= 0;
//	end
//	else if(~ps2_mouse_new) begin
//		dx <= dx + {{4{ps2_mouse[4]}},ps2_mouse[15:8]};
//		dy <= dy + {{4{ps2_mouse[5]}},ps2_mouse[23:16]};
//	end
//end

endmodule
