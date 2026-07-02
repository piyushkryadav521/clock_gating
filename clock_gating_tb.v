module clock_gating_tb;
    reg clk = 0;
    reg enable = 0;
    reg rst = 0;
    reg d = 0;
    wire q;

    always #5 clk = ~clk;

    clock_gating uut (
        .clk(clk),
        .enable(enable),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, clock_gating_tb);

        rst = 1; enable = 1; d = 0; 
        #15 rst = 0;                 

        enable = 0; d = 1; #10;
        d = 0; #10;

        enable = 1; 
        d = 1; #10;                 
        d = 0; #10;                 

        enable = 0;
        d = 1; #20;                 

        $finish;
    end
endmodule