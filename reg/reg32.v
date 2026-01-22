module reg32(
    input clk,res_n,    //active-low
    input [31:0] in,
    output reg [31:0] out
);

    always @(posedge clk)
    begin 
    if(!res_n)
            out <= 32'b0;
        else 
            out <= in;
    end
endmodule 