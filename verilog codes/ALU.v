module ALU(
    input signed [511:0] A1,
    input signed [511:0] A2,
    input wire [1:0] operation, // 00: Addition, 01: Multiplication
    output signed [1023:0] output_data
);

    reg [1023 : 0] ALUOut;
    integer i, j;
    assign output_data = ALUOut;

    always @(*) begin
        case (operation)
            2'b00: begin
                for (i = 0; i < 16; i = i + 1) begin
                    ALUOut[i * 64 +: 64] <= (A1[i * 32 +: 32]) + (A2[i * 32 +: 32]);
                end
            end
            2'b01: begin
                for (j = 0; j < 16; j = j + 1) begin
                    ALUOut[j * 64 +: 64] <= (A1[j * 32 +: 32]) * (A2[j * 32 +: 32]);
                end
            end
            default: begin
                ALUOut = 1024'b0;
            end
        endcase
    end
endmodule
