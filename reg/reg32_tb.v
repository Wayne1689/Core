module reg32_tb;

    reg t_clk;
    reg t_res;
    reg [31:0] t_in;
    wire [31:0] t_out;

    reg32 uut(
        .clk(t_clk),
        .res_n(t_res),
        .in(t_in),
        .out(t_out)
    );

    initial t_clk = 0;
    always #5 t_clk = ~t_clk;

    initial begin 
        $dumpfile("reg32_wave.vcd");
        $dumpvars(0, reg32_tb);
        $monitor("Time=%0t | Reset=%b | In=%d | Out=%d", $time, t_res, t_in, t_out);
        // start test
        t_res = 0;
        t_in = 32'd100;
        #13;
        // unreset 
        t_res = 1;
        #5;
        //new test 
        t_in = 32'd200;
        #10;
        //new
        t_in = 32'd300; 
        #5;

        #20;
        $finish;
    end
     
endmodule 