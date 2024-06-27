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
        #25 clk = ~clk;

    initial begin
        reset <= 1;
        #45
        reset <= 0;
        instruction <= 13'b1000000000000;  //  A4:A3 = A1 + A2
        #40
        instruction <= 13'b1100000000000;  // A4:A3 = A1 * A2
        #40
        instruction <= 13'b0000000000001;  //  A1 <= memory[000000001]
        #40
        instruction <= 13'b0001000001000;  //  A2 <= memory[000001000]
        #40
        instruction <= 13'b1000000000000;  //  A4:A3 = A1 + A2
        #40
        instruction <= 13'b0110000000001;  //  memory[000000001] <= A3
        #40
        instruction <= 13'b0111000001000;  //  memory[000001000] <= A4
        #40
        instruction <= 13'b0000000000010;  //  A1 <= memory[000000010]
        #40
        instruction <= 13'b0001000000011;  //  A2 <= memory[000000011]
        #40
        instruction <= 13'b1100000000000;  //  A4:A3 = A1 * A2
        #40
        instruction <= 13'b0110000000010;  //  memory[000000010] <= A3
        #40
        instruction <= 13'b0111000000011;  //  memory[000000011] <= A4

        $stop;
    end

    initial
        $monitor($time, ":\nA1 = %h\nA2 = %h\nA3 = %h\nA4 = %h\n",
                    A1, A2, A3, A4);

endmodule


