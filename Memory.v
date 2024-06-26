module Memory(
    input wire clk,
    input wire reset,
    input wire write_en,
    input wire read_en,
    input [8:0] address, // 9 bits for 512 locations
    input signed [511:0] write_data,
    output reg signed [511:0] read_data
);

    reg [31:0] mem [0:511];

    always @(posedge clk) begin
        if(reset) begin
            mem[0] <= 32'h0;
            mem[1] <= 32'h0;
            mem[2] <= 32'hFFFFFFFF;
            mem[3] <= 32'hF0000000;
            mem[4] <= 32'hF0000000;
            mem[5] <= 32'h0000000F;
            mem[6] <= 32'h1;
            mem[7] <= 32'h1;
            mem[8] <= 32'h80000000;
            mem[9] <= 32'h0F0000F0;
            mem[10] <= 32'h0F0000F0;
        end else begin
            if (write_en) begin
                mem[address] <= write_data;
            end
            if (read_en) begin
                read_data <= mem[address];
            end else begin
                read_data <= 32'bz; // High impedance state when read is disabled
            end
        end
    end

endmodule