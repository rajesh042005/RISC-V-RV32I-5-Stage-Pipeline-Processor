`timescale 1ns/1ps

module Register_File (
    input      [4:0]  A1,
    input      [4:0]  A2,
    input      [4:0]  RdW,
    input      [31:0] ResultW,
    input             clk,
    input             RegWriteW,
    input             rst,
    output reg [31:0] RD1,
    output reg [31:0] RD2,
    output reg [31:0] checkx1,
    output reg [31:0] checkx2,
    output reg [31:0] checkx3,
    output reg [31:0] checkx4,
    output reg [31:0] checkx5,
    output reg [31:0] checkx6
);

    reg [31:0] Registers[31:0];
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 32; i = i + 1)
                Registers[i] <= 32'd0;

            // initialize some registers
            Registers[28] <= 32'd6;
            Registers[22] <= 32'd4;
            Registers[18] <= 32'd6;
        end 
        else if (RegWriteW && (|RdW)) begin
            Registers[RdW] <= ResultW;
        end

        // synchronous read
        RD1 <= Registers[A1];
        RD2 <= Registers[A2];

        // debug outputs
        checkx1 <= Registers[1];
        checkx2 <= Registers[2];
        checkx3 <= Registers[3];
        checkx4 <= Registers[19];
        checkx5 <= Registers[5];
        checkx6 <= Registers[6];
    end

endmodule
