module Vector_Processor(
    input wire clk,
    input wire reset,
    input wire [12:0] instruction, // 00: load, 01: store, 10: addition, 11: multiplication
    output signed [511 : 0] A1,
    output signed [511 : 0] A2,
    output signed [511 : 0] A3,
    output signed [511 : 0] A4
);

    wire signed [511 : 0] RF_out;
    reg [511 : 0] RF_in;
    reg [511 : 0] RF_in2;
    wire signed [511 : 0] RF_A1;
    wire signed [511 : 0] RF_A2;
    wire signed [511 : 0] RF_A3;
    wire signed [511 : 0] RF_A4;
    reg[1:0] write_sel;
    reg[1:0] write_sel2;
    reg[1:0] read_sel;
    reg write_en, write_en2;
    Register_File register_file(clk, reset, write_sel, RF_in, write_sel2, RF_in2, write_en, write_en2, 
                                read_sel, RF_out, RF_A1, RF_A2, RF_A3, RF_A4);


    reg [511 : 0] ALU_in_1;
    reg [511 : 0] ALU_in_2;
    reg [1:0] ALUOp;
    wire signed [1023 : 0] ALU_out;
    ALU alu (ALU_in_1, ALU_in_2, ALUOp, ALU_out);

    reg signed [511 : 0] DM_in;
    wire signed [511 : 0] DM_out;
    reg [8 : 0] DM_address;
    reg DM_write_enable;
    reg DM_read_enable;
    Memory data_memory (clk, reset, DM_write_enable, DM_read_enable, DM_address, DM_in, DM_out);

    assign A1 = RF_A1;
    assign A2 = RF_A2;
    assign A3 = RF_A3;
    assign A4 = RF_A4;
    
    integer i;
    always @(posedge clk) begin
        #5
        case (instruction[12:11])
            2'b00: begin // load
                DM_write_enable <= 0;
                DM_read_enable <= 1;
                DM_address <= instruction[8:0];
                write_en <= 1;
                write_sel <= instruction[10:9];
                #5
                RF_in <= DM_out;
            end
            2'b01: begin // store
                DM_write_enable <= 1;
                DM_read_enable <= 0;
                DM_address <= instruction[8:0];
                write_en <= 0;
                read_sel <= instruction[10:9];
                #1
                DM_in <= RF_out;
            end
            2'b10: begin // addition
                DM_write_enable <= 0;
                DM_read_enable <= 0;
                write_en <= 1;
                write_en2 <= 1;
                write_sel <= 2'b10;
                write_sel2 <= 2'b11;
                ALUOp = 2'b00;
                ALU_in_1 <= RF_A1;
                ALU_in_2 <= RF_A2;
                #5
                for(i = 0; i < 16; i = i + 1) begin
                    RF_in[32 * i +: 32] <= ALU_out[64 * i +: 32];
                    RF_in2[32 * i +: 32] <= ALU_out[64 * i + 32 +: 32];
                end
            end
            2'b11: begin // multiplication
                DM_write_enable <= 0;
                DM_read_enable <= 0;
                write_en <= 1;
                write_en <= 2;
                write_sel <= 2'b10;
                write_sel2 <= 2'b11;
                ALUOp = 2'b01;
                ALU_in_1 <= RF_A1;
                ALU_in_2 <= RF_A2;
                #5
                for(i = 0; i < 16; i = i + 1) begin
                    RF_in[32 * i +: 32] <= ALU_out[64 * i +: 32];
                    RF_in2[32 * i +: 32] <= ALU_out[64 * i + 32 +: 32];
                end
            end
        endcase
    end
endmodule
