module Register_File(
    input wire clk,
    input wire reset,
    input wire [1:0] write_sel,
    input wire [511:0] write_data,
    input wire [1:0] write_sel2,
    input wire [511:0] write_data2,
    input wire write_en,
    input wire write_en2,
    input wire read_en,
    input wire [1:0] read_sel,
    output wire [511:0] read_data,
    output signed [511:0] A1,
    output signed [511:0] A2,
    output signed [511:0] A3,
    output signed [511:0] A4
);

    reg signed [511:0] registers [0:3];
    integer index;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (index = 0; index < 4; index = index + 1) begin
                registers[index] <= 512'b0;
            end
        end else begin
            if (write_en) begin
                case (write_sel)
                    2'b00: registers[0] <= write_data;
                    2'b01: registers[1] <= write_data;
                    2'b10: registers[2] <= write_data;
                    2'b11: registers[3] <= write_data;
                endcase
            end
            if (write_en2) begin
                case (write_sel2)
                    2'b00: registers[0] <= write_data2;
                    2'b01: registers[1] <= write_data2;
                    2'b10: registers[2] <= write_data2;
                    2'b11: registers[3] <= write_data2;
                endcase
            end
            if (read_en) begin
                case (read_sel)
                2'b00: read_data <= registers[0];
                2'b01: read_data <= registers[1];
                2'b10: read_data <= registers[2];
                2'b11: read_data <= registers[3];
            endcase
            end
        end
    end
    
    assign A1 = registers[0];
    assign A2 = registers[1];
    assign A3 = registers[2];
    assign A4 = registers[3];

endmodule
