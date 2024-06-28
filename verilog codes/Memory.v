module Memory(
    input wire clock,
    input wire rst,
    input wire wr_enable,
    input wire rd_enable,
    input [8:0] addr, // 9-bit address for 512 memory locations
    input signed [511:0] wr_data,
    output reg signed [511:0] rd_data
);

    reg [31:0] memory_array [0:511];
    integer k;
    reg [8:0] write_addr;
    reg [31:0] data_chunk;

    // Asynchronous reset and memory initialization
    always @(posedge clock or posedge rst) begin
        if (rst) begin
            $readmemh("hex.txt", memory_array);
        end
    end

    // Write operation
    always @(posedge clock) begin
        if (!rst && wr_enable) begin
            for (k = 0; k < 16; k = k + 1) begin
                write_addr = (addr + k) % 512;
                data_chunk = wr_data[(k * 32) +: 32];
                memory_array[write_addr] <= data_chunk;
            end
        end
    end

    // Read operation
    always @(posedge clock) begin
        if (!rst && rd_enable) begin
            rd_data = 'b0; // Clear read_data before assignment
            for (k = 0; k < 16; k = k + 1) begin
                read_addr = (addr + k) % 512;
                temp_data = memory_array[read_addr];
                rd_data[(k * 32) +: 32] <= temp_data;
            end
        end
    end
endmodule

