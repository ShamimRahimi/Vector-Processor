module Register_File(
    input wire clk,
    input wire reset,
    input wire [1:0] write_sel,
    input wire [511:0] write_data,
    input wire [1:0] write_sel2,
    input wire [511:0] write_data2,
    input wire write_en,
    input wire write_en2,
    input wire [1:0] read_sel,
    output wire [511:0] read_data,
    output signed [511:0] A1,
    output signed [511:0] A2,
    output signed [511:0] A3,
    output signed [511:0] A4
);

    reg signed [511:0] registers [0:3];

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            registers[0] <= 512'b0;
            registers[1] <= 512'b0;
            registers[2] <= 512'b0;
            registers[3] <= 512'b0;
        end else begin
            if (write_en) begin
                registers[write_sel] <= write_data;
            end
            if (write_en2) begin
                registers[write_sel2] <= write_data2;
            end
        end
    end

    assign read_data = registers[read_sel];
    assign A1 = registers[0];
    assign A2 = registers[1];
    assign A3 = registers[2];
    assign A4 = registers[3];

endmodule
