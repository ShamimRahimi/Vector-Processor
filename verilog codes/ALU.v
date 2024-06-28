module ALU(
    input signed [511:0] A1,
    input signed [511:0] A2,
    input wire [1:0] operation, // 00: Addition, 01: Multiplication
    output reg signed [1023:0] output_data
);

    integer k;
    reg [8:0] read_addr;
    reg [31:0] data_chunk;

    always @* begin
        // Default assignment
        output_data = 1024'b0;

        // Perform operation based on operation select
        case (operation)
            2'b00: begin // Addition
                for (k = 0; k<16; k=k+1) begin
                    read_addr = i * 32 +: 32;
                    data_chunk = A1[read_addr] + A2[read_addr];
                    output_data[i * 64 +: 64] = data_chunk;
                end
            end
            2'b01: begin // Multiplication
                for (k = 0; k<16; k=k+1) begin
                    read_addr = i * 32 +: 32;
                    data_chunk = A1[read_addr] * A2[read_addr];
                    output_data[i * 64 +: 64] = data_chunk;
                end
            end
            default: begin // Default case (no operation)
                output_data = 1024'b0;
            end
        endcase
    end

endmodule
