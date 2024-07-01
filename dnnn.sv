module dnn(x0, x1, x2, x3, 
           w04, w05, w06, w07, 
           w14, w15, w16, w17, 
           w24, w25, w26, w27, 
           w34, w35, w36, w37, 
           w48, w58, w49, w59, 
           w68, w69, w78, w79, 
           y0,y1,y2,y3, 
           stg_1_rdy, stg_2_rdy, clk);

input logic signed [6:0] x0, x1, x2, x3;
input logic signed [4:0] w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37, w48, w58, w49, w59, w68, w69, w78, w79;

input stg_1_rdy;
input clk;

output logic signed [13:0] y0,y1,y2,y3;
logic signed [13:0] y0_initial,y1_initial,y2_initial,y3_initial;
logic signed [13:0] y0_f,y1_f,y2_f,y3_f;
output logic stg_2_rdy;

assign y0_initial= x0*w04 + x1*w14 + x2*w24 + x3*w34;
assign y1_initial= x0*w05 + x1*w15 + x2*w25 + x3*w35;
assign y2_initial= x0*w06 + x1*w16 + x2*w26 + x3*w36;
assign y3_initial= x0*w07 + x1*w17 + x2*w27 + x3*w37;

assign y0_f = (y0_initial>0) ? y0_initial : 21'h0;
assign y1_f = (y1_initial>0) ? y1_initial : 21'h0;
assign y2_f = (y2_initial>0) ? y2_initial : 21'h0;
assign y3_f = (y3_initial>0) ? y3_initial : 21'h0;


always@(posedge clk)
begin
	if(stg_1_rdy)
	 begin
		stg_2_rdy <= stg_1_rdy;
		y0 <= y0_f;
		y1 <= y1_f;
		y2 <= y2_f;
		y3 <= y3_f;
	 end
	else
	 begin
		stg_2_rdy <= 1'b0;
		y0 <= 21'd0;
		y1 <= 21'd0;
		y2 <= 21'd0;
		y3 <= 21'd0;
	 end
end

		
endmodule


