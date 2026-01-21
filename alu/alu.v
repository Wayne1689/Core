module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] Alu_ctrl, // 8 control 
    output reg[31:0] Result, // add reg because use in always
    output Zero
);

    always @(*) begin 
        case(Alu_ctrl)
            4'b0000: Result = a + b; //add,addi
            4'b0001: Result = a - b; //sub
            4'b0010: Result = a & b; //AND
            4'b0011: Result = a | b; // OR
            4'b0100: Result = a ^ b; // XOR
            4'b0101: Result = a<<b[4:0];//SLL, because 32bit, it's there is 2^5 number to shift
            4'b0110: Result = a>>b[4:0];//SRL, it and SLL are used to unsigned number 
            // because it don't represent the negative 
            4'b0111: Result = $signed(a) >>> b[4:0];// ASR, used to singed number, when shifting, it replace with 1 
            4'b1000: Result = (a<b)?32'b1:32'b0;//SLTU, set less then(unsigned)
            4'b1001: Result = ($signed(a)<$signed(b))?32'b1:32'b0;//SLU(Signed),$singed(just change the display way)
            4'b1010: Result = b; //lui
            default: Result = 32'b0;
        endcase 
    end 

    assign Zero = (Result==32'b0);

endmodule 