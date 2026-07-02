module clock_gating(
    input clk,
    input enable,
    input rst,
    input d,
    output reg q
);

    wire gated_clk;
    assign gated_clk=clk & enable;

    always @(posedge gated_clk) 
        begin 
            if(rst)
                q<=0;
            else
                q<=d;
            end
endmodule


        