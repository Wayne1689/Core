`timescale 1ns / 1ps

module alu_tb;

    // 1. 宣告變數
    // 給 ALU 的輸入 (我們要在這裡改變它們，所以用 reg)
    reg  [31:0] t_a;
    reg  [31:0] t_b;
    reg  [3:0]  t_ctrl;
    
    // 從 ALU 接出來的輸出 (我們只是觀察，所以用 wire)
    wire [31:0] t_result;
    wire t_zero;

    // 2. 把你的 ALU 接上來 (Device Under Test, DUT)
    alu uut (
        .a(t_a), 
        .b(t_b), 
        .Alu_ctrl(t_ctrl), 
        .Result(t_result), 
        .Zero(t_zero)
    );

    // 3. 測試腳本
    initial begin
        // 為了讓波形圖好看，可以產生 .vcd 檔 (給 GTKWave 用)
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, alu_tb);

        // 格式化輸出監控
        $monitor("Time=%0t | Ctrl=%b | A=%d B=%d | Result=%d (Hex=%h) | Zero=%b", 
                 $time, t_ctrl, t_a, t_b, t_result, t_result, t_zero);

        // --- 開始測試 ---
        
        // Test 1: ADD (10 + 20)
        t_a = 32'd10; t_b = 32'd20; t_ctrl = 4'b0000; // ADD
        #10; // 等待 10ns

        // Test 2: SUB (20 - 15)
        t_a = 32'd20; t_b = 32'd15; t_ctrl = 4'b0001; // SUB
        #10;

        // Test 3: SUB 造成 Zero (100 - 100)
        t_a = 32'd100; t_b = 32'd100; t_ctrl = 4'b0001; // SUB
        #10;

        // Test 4: AND (Binary 1010 & 1100 = 1000 -> Decimal 8)
        t_a = 32'b1010; t_b = 32'b1100; t_ctrl = 4'b0010; // AND
        #10;

        // Test 5: SLL (Logic Shift Left, 1 << 2 = 4)
        t_a = 32'd1; t_b = 32'd2; t_ctrl = 4'b0101; // SLL
        #10;

        // Test 6: SLT (Set Less Than, -10 < 5 ?)
        // -10 的二補數是一個很大的正數(以無號看)，但在有號比較下它是負的
        t_a = -32'd10; t_b = 32'd5; t_ctrl = 4'b1001; // SLT
        #10;

        // 結束模擬
        $finish;
    end

endmodule