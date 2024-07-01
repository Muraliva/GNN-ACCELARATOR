module top(x0_node0, x1_node0, x2_node0, x3_node0, 
           x0_node1, x1_node1, x2_node1, x3_node1, 
           x0_node2, x1_node2, x2_node2, x3_node2, 
           x0_node3, x1_node3, x2_node3, x3_node3, 
           w04, w05, w06, w07, w14, w15, w16, w17, 
           w24, w25, w26, w27, w34, w35, w36, w37, 
           w48, w58, w49, w59, w68, w69, w78, w79, 
           out0_node0, out1_node0, out0_node1, out1_node1, 
           out0_node2, out1_node2, out0_node3, out1_node3, 
           out10_ready_node0, out11_ready_node0, out10_ready_node1, out11_ready_node1, 
           out10_ready_node2, out11_ready_node2, out10_ready_node3, out11_ready_node3, 
           in_ready, clk);

input logic signed [4:0] x0_node0, x1_node0, x2_node0, x3_node0;
input logic signed [4:0] x0_node1, x1_node1, x2_node1, x3_node1;
input logic signed [4:0] x0_node2, x1_node2, x2_node2, x3_node2;
input logic signed [4:0] x0_node3, x1_node3, x2_node3, x3_node3;

input logic signed [4:0] w04, w05, w06, w07;
input logic signed [4:0] w14, w15, w16, w17;
input logic signed [4:0] w24, w25, w26, w27;
input logic signed [4:0] w34, w35, w36, w37;
input logic signed [4:0] w48, w58, w49, w59, w68, w69, w78, w79;

input in_ready, clk;

output logic signed [20:0] out0_node0, out1_node0, out0_node1, out1_node1, out0_node2, out1_node2, out0_node3, out1_node3;
output logic out10_ready_node0, out11_ready_node0, out10_ready_node1, out11_ready_node1, out10_ready_node2, out11_ready_node2, out10_ready_node3, out11_ready_node3;


logic signed [6:0] x0_node0_f, x1_node0_f, x2_node0_f, x3_node0_f;
logic signed [6:0] x0_node1_f, x1_node1_f, x2_node1_f, x3_node1_f;
logic signed [6:0] x0_node2_f, x1_node2_f, x2_node2_f, x3_node2_f;
logic signed [6:0] x0_node3_f, x1_node3_f, x2_node3_f, x3_node3_f;

logic signed [6:0] x0_node0_agg, x1_node0_agg, x2_node0_agg, x3_node0_agg;
logic signed [6:0] x0_node1_agg, x1_node1_agg, x2_node1_agg, x3_node1_agg;
logic signed [6:0] x0_node2_agg, x1_node2_agg, x2_node2_agg, x3_node2_agg;
logic signed [6:0] x0_node3_agg, x1_node3_agg, x2_node3_agg, x3_node3_agg;

logic signed [13:0] y0_node0, y1_node0, y2_node0, y3_node0;
logic signed [13:0] y0_node1, y1_node1, y2_node1, y3_node1;
logic signed [13:0] y0_node2, y1_node2, y2_node2, y3_node2; 
logic signed [13:0] y0_node3, y1_node3, y2_node3, y3_node3;

logic signed [13:0] y0_node0_f, y1_node0_f, y2_node0_f, y3_node0_f; 
logic signed [13:0] y0_node1_f, y1_node1_f, y2_node1_f, y3_node1_f;
logic signed [13:0] y0_node2_f, y1_node2_f, y2_node2_f, y3_node2_f; 
logic signed [13:0] y0_node3_f, y1_node3_f, y2_node3_f, y3_node3_f;
logic signed [20:0] out0_node0_f, out1_node0_f, out0_node1_f, out1_node1_f, out0_node2_f, out1_node2_f, out0_node3_f, out1_node3_f;
logic stg_2_rdy;

logic stg_1_rdy;


assign x0_node0_agg = x0_node0 + x0_node1 + x0_node2;
assign x1_node0_agg = x1_node0 + x1_node1 + x1_node2;
assign x2_node0_agg = x2_node0 + x2_node1 + x2_node2;
assign x3_node0_agg = x3_node0 + x3_node1 + x3_node2;
assign x0_node1_agg = x0_node0 + x0_node1 + x0_node3;
assign x1_node1_agg = x1_node0 + x1_node1 + x1_node3;
assign x2_node1_agg = x2_node0 + x2_node1 + x2_node3;
assign x3_node1_agg = x3_node0 + x3_node1 + x3_node3;
assign x0_node2_agg = x0_node0 + x0_node2 + x0_node3;
assign x1_node2_agg = x1_node0 + x1_node2 + x1_node3;
assign x2_node2_agg = x2_node0 + x2_node2 + x2_node3;
assign x3_node2_agg = x3_node0 + x3_node2 + x3_node3;
assign x0_node3_agg = x0_node1 + x0_node2 + x0_node3;
assign x1_node3_agg = x1_node1 + x1_node2 + x1_node3;
assign x2_node3_agg = x2_node1 + x2_node2 + x2_node3;
assign x3_node3_agg = x3_node1 + x3_node2 + x3_node3;

always@(posedge clk)
begin
	if(in_ready)
	begin
		stg_1_rdy <= in_ready;
		x0_node0_f <= x0_node0_agg;
		x1_node0_f <= x1_node0_agg;
		x2_node0_f <= x2_node0_agg;
		x3_node0_f <= x3_node0_agg;
		x0_node1_f <= x0_node1_agg;
		x1_node1_f <= x1_node1_agg;
		x2_node1_f <= x2_node1_agg;
		x3_node1_f <= x3_node1_agg;
		x0_node2_f <= x0_node2_agg;
		x1_node2_f <= x1_node2_agg;
		x2_node2_f <= x2_node2_agg;
		x3_node2_f <= x3_node2_agg;
		x0_node3_f <= x0_node3_agg;
		x1_node3_f <= x1_node3_agg;
		x2_node3_f <= x2_node3_agg;
		x3_node3_f <= x3_node3_agg;
	 end

	 else
	 begin
		stg_1_rdy <= 1'b0;
		x0_node0_f <= 21'b0;
		x1_node0_f <= 21'b0;
		x2_node0_f <= 21'b0;
		x3_node0_f <= 21'b0;
		x0_node1_f <= 21'b0;
		x1_node1_f <= 21'b0;
		x2_node1_f <= 21'b0;
		x3_node1_f <= 21'b0;
		x0_node2_f <= 21'b0;
		x1_node2_f <= 21'b0;
		x2_node2_f <= 21'b0;
		x3_node2_f <= 21'b0;
		x0_node3_f <= 21'b0;
		x1_node3_f <= 21'b0;
		x2_node3_f <= 21'b0;
		x3_node3_f <= 21'b0;
		
	 end
end

dnn dnn0(.x0(x0_node0_f), .x1(x1_node0_f), .x2(x2_node0_f), .x3(x3_node0_f), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node0), .y1(y1_node0), .y2(y2_node0), .y3(y3_node0),
.stg_1_rdy(stg_1_rdy), .stg_2_rdy(stg_2_rdy),.clk(clk));

dnn dnn1(.x0(x0_node1_f), .x1(x1_node1_f), .x2(x2_node1_f), .x3(x3_node1_f), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node1), .y1(y1_node1), .y2(y2_node1), .y3(y3_node1),
.stg_1_rdy(stg_1_rdy), .stg_2_rdy(stg_2_rdy),.clk(clk));

dnn dnn2(.x0(x0_node2_f), .x1(x1_node2_f), .x2(x2_node2_f), .x3(x3_node2_f), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node2), .y1(y1_node2), .y2(y2_node2), .y3(y3_node2),
.stg_1_rdy(stg_1_rdy), .stg_2_rdy(stg_2_rdy),.clk(clk));

dnn dnn3(.x0(x0_node3_f), .x1(x1_node3_f), .x2(x2_node3_f), .x3(x3_node3_f), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node3), .y1(y1_node3), .y2(y2_node3), .y3(y3_node3),
.stg_1_rdy(stg_1_rdy), .stg_2_rdy(stg_2_rdy),.clk(clk));


assign y0_node0_f = y0_node0 + y0_node1 + y0_node2;
assign y1_node0_f = y1_node0 + y1_node1 + y1_node2;
assign y2_node0_f = y2_node0 + y2_node1 + y2_node2;
assign y3_node0_f = y3_node0 + y3_node1 + y3_node2;
assign y0_node1_f = y0_node0 + y0_node1 + y0_node3;
assign y1_node1_f = y1_node0 + y1_node1 + y1_node3;
assign y2_node1_f = y2_node0 + y2_node1 + y2_node3;
assign y3_node1_f = y3_node0 + y3_node1 + y3_node3;
assign y0_node2_f = y0_node0 + y0_node2 + y0_node3;
assign y1_node2_f = y1_node0 + y1_node2 + y1_node3;
assign y2_node2_f = y2_node0 + y2_node2 + y2_node3;
assign y3_node2_f = y3_node0 + y3_node2 + y3_node3;
assign y0_node3_f = y0_node1 + y0_node2 + y0_node3;
assign y1_node3_f = y1_node1 + y1_node2 + y1_node3;
assign y2_node3_f = y2_node1 + y2_node2 + y2_node3;
assign y3_node3_f = y3_node1 + y3_node2 + y3_node3;
     
        


 assign out0_node0_f = y0_node0_f*w48 + y1_node0_f*w58 + y2_node0_f*w68 +y3_node0_f*w78;
 assign out1_node0_f = y0_node0_f*w49 + y1_node0_f*w59 + y2_node0_f*w69 +y3_node0_f*w79; 
 assign out0_node1_f = y0_node1_f*w48 + y1_node1_f*w58 + y2_node1_f*w68 +y3_node1_f*w78;
 assign out1_node1_f = y0_node1_f*w49 + y1_node1_f*w59 + y2_node1_f*w69 +y3_node1_f*w79;

 assign out0_node2_f = y0_node2_f*w48 + y1_node2_f*w58 + y2_node2_f*w68 +y3_node2_f*w78;
 assign out1_node2_f = y0_node2_f*w49 + y1_node2_f*w59 + y2_node2_f*w69 +y3_node2_f*w79;
 assign out0_node3_f = y0_node3_f*w48 + y1_node3_f*w58 + y2_node3_f*w68 +y3_node3_f*w78;
 assign out1_node3_f = y0_node3_f*w49 + y1_node3_f*w59 + y2_node3_f*w69 +y3_node3_f*w79;

always @(posedge clk) begin
  if (stg_2_rdy) begin
         out10_ready_node0 <= stg_2_rdy;
         out11_ready_node0 <= stg_2_rdy;
         out10_ready_node1 <= stg_2_rdy;
         out11_ready_node1 <= stg_2_rdy;
         out10_ready_node2 <= stg_2_rdy;
         out11_ready_node2 <= stg_2_rdy;
         out10_ready_node3 <= stg_2_rdy;
         out11_ready_node3 <= stg_2_rdy;

         
         out0_node0  <= out0_node0_f;
         out1_node0  <= out1_node0_f;
         out0_node1  <= out0_node1_f;
         out1_node1  <= out1_node1_f;
         out0_node2  <= out0_node2_f;
         out1_node2  <= out1_node2_f;
         out0_node3  <= out0_node3_f;
         out1_node3  <= out1_node3_f;
  end else begin
        
         out10_ready_node0 <= 1'b0;
         out11_ready_node0 <= 1'b0;
         out10_ready_node1 <= 1'b0;
         out11_ready_node1 <= 1'b0;
         out10_ready_node2 <= 1'b0;
         out11_ready_node2 <= 1'b0;
         out10_ready_node3 <= 1'b0;
         out11_ready_node3 <= 1'b0;

         
         out0_node0  <= 21'b0;
         out1_node0  <= 21'b0;
         out0_node1  <= 21'b0;
         out1_node1  <= 21'b0;
         out0_node2  <= 21'b0;
         out1_node2  <= 21'b0;
         out0_node3  <= 21'b0;
         out1_node3  <= 21'b0;
   end 
  end 


endmodule

