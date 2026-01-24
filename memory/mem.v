module mem(         //store and take 
    input [31:0] data_in,
    input [7:0] address,
    input clk,mode,     // 1:read, 0:write
    output reg[31:0] data_out
    );
    
    initial begin
        // Write "test_memory.txt" into memory
        $readmemh("test_memory.txt", mem);
    end
    reg [31:0] mem [0:255];
    
    always @(posedge clk) begin 
        if(!mode) begin      //low is write
            mem[address] <= data_in;    //In clock, "<=" for timing 
        end
    end
    
    always @(*) begin   //In general, in @(*) use "=", update immediately 
        if(mode) begin 
            data_out = mem[address];
        end
        else begin 
            data_out = 32'b0;
        end
    end


endmodule 

