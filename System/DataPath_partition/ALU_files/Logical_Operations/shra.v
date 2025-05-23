module shra (
    input wire signed[31:0] A, 
    input wire [4:0] amount,
    output wire [63:0] result
);

assign result[31:0] = A >>> amount;
assign result[63:32] = 32'd0;
    
endmodule