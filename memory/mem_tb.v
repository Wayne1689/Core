`timescale 1ns/1ps  
module mem_tb;

    reg [31:0] t_data_in;
    reg [7:0] t_address;
    reg t_clk,t_mode;     // 1:read, 0:write
    wire [31:0] t_data_out;

    mem uut(
        .data_in(t_data_in),
        .address(t_address),
        .clk(t_clk),
        .mode(t_mode),     // 1:read, 0:write
        .data_out(t_data_out)
    );

    initial t_clk = 0;
    always #5 t_clk = ~t_clk;

    initial begin 
        $dumpfile("mem_wave.vcd");
        $dumpvars(0,mem_tb);
        $monitor("Time=%0t | Address=%b | mode=%d | In=%d | Out=%d", $time,t_address,t_mode,t_data_in,t_data_out);

        //start test
        t_mode = 0; // write 
        t_address = 8'd2;
        t_data_in = 32'd30;
        #12 
        //another 
        t_address = 8'd4;
        t_data_in = 32'd40;
        #5
        //read 
        t_mode = 1;
        t_address = 8'd2;
        #10 
        //read another 
        t_address = 8'd4;
        #5
        $finish; 
    end 
endmodule 