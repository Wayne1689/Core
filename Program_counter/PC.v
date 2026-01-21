module PC(
    input [31:0] PC_input,
    input reset,CLK, // reset,low active
    output reg [31:0] PC_output
);

    always @(posedge CLK) begin
        if(!reset) begin
            PC_output <= 32'b0;
        end 
        else begin 
            PC_output <= PC_input; // "==" like C language is sequential, but "<=" is like doing thing at the same time 
        end 
    end 

endmodule 