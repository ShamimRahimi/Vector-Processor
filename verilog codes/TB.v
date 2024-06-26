module TB;

    reg clk;
    reg reset;
    reg [12:0] instruction;
    wire [511:0] A1;
    wire [511:0] A2;
    wire [511:0] A3;
    wire [511:0] A4;

    Vector_Processor processor (clk, reset, instruction, A1, A2, A3, A4);

    initial
        clk = 0;
    always
        #20 clk = ~clk;

    initial begin
        reset <= 1;
        #45
        reset <= 0;
        instruction <= {2'b10, 11'b0};
        #40
        instruction <= {2'b11, 11'b0};
        #40
        instruction <= {4'b0000, 9'b0};
        #40
        instruction <= {4'b0001, 9'b10000};
        #40
        instruction <= {2'b10, 11'b0};
        #40
        instruction <= {2'b11, 11'b0};
        #40
        instruction <= {4'b0110, 9'b111111};
        #40 
        instruction <= {4'b0111, 9'b1111111};
        #40
        instruction <= {4'b0000, 9'b111111};
        #40
        instruction <= {4'b0001, 9'b1111111};
        #40
        instruction <= {2'b10, 11'b0};
        #40
        instruction <= {2'b11, 11'b0};
        #40
        $stop;
    end

    initial
        $monitor($time, ":\nA1 = %h\nA2 = %h\nA3 = %h\nA4 = %h\n--------------------",
                    A1, A2, A3, A4);

endmodule
