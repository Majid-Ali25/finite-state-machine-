module FSM_Testbench;
    logic clk;
    logic reset;
    logic in;
    logic [3:0] out_binary;
    logic [3:0] out_onehot;
    logic [3:0] out_onehot_reversed;

    
    FSM_Binary fsm_binary (.clk(clk), .reset(reset), .in(in), .out(out_binary));
    FSM_OneHot fsm_onehot (.clk(clk), .reset(reset), .in(in), .out(out_onehot));
    FSM_OneHot_Reversed fsm_onehot_reversed (.clk(clk), .reset(reset), .in(in), .out(out_onehot_reversed));

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

   
    initial begin
        reset = 1;
        in = 0;
        #10;
        
        reset = 0;
        in = 1;
        #80; 
        
        in = 0;
        #10;
        
        $stop;
    end

   
    initial begin
        $monitor("Time:  %0t  |  in:  %0b  |  out_binary:  %0b  |  out_onehot:  %0b  |  out_onehot_reversed:  %0b", 
                 $time, in, out_binary, out_onehot, out_onehot_reversed);
    end
endmodule

