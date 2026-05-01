`timescale 1ns/1ps

module Data_Memory (
    input      [31:0] WriteDataM,
    input      [31:0] ALUResultM,
    input             clk,
    input             MemWriteM,
    input             rst,
    output reg [31:0] ReadData,
    output reg [31:0] DM0
);

    // 64-word memory
    reg [31:0] Data_Mem [63:0];
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 64; i = i + 1)
                Data_Mem[i] <= 32'd0;
        end else begin
            if (MemWriteM)
                Data_Mem[ALUResultM[7:2]] <= WriteDataM;

            ReadData <= Data_Mem[ALUResultM[7:2]];
        end
    end

    always @(*) begin
        DM0 = Data_Mem[0]; // debug
    end

endmodule
