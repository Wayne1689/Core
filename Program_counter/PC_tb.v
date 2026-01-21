module PC_tb;

    reg [31:0] t_pc_in;
    reg t_res;
    reg t_clk; //In initial and always have to use reg
    wire [31:0] t_pc_out;

    PC uut(
        .PC_input(t_pc_in),
        .CLK(t_clk),
        .reset(t_res),
        .PC_output(t_pc_out)
    );

    initial t_clk = 0; // initial executes once, stargin at simulation time 0,runs sequentially
    // After finishing, the initial block stops forever
    always #5 t_clk = ~t_clk; //always starts at simulation time 0, repeats forever 

    initial begin 
        $dumpfile("pc_wave.vcd");
        $dumpvars(0, PC_tb);
        $monitor("Time=%0t | Reset=%b | In=%d | Out=%d", $time, t_res, t_pc_in, t_pc_out);
        // start test 
        t_res = 0;
        t_pc_in = 32'd100;
        #12
        // set reset to 1 
        t_res = 1;
        #10 // PC read the t_pc_in now 
        //new_input 
        t_pc_in = 32'd200;
        #10
        //new_input 
        t_pc_in = 32'd300;
        #2
        #8
        #20
        $finish;
    end 

endmodule