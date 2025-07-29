module tb_ring_counter;
    reg clk, reset;
    wire [3:0] out;

    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10 reset = 0;
        #100 $finish;
    end

    initial begin
      $dumpfile("ring_counter.vcd");
      $dumpvars;
        $monitor("Time = %0d : out = %b", $time, out);
    end
endmodule