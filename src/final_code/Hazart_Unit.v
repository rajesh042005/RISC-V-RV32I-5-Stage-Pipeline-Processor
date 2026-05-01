`timescale 1ns/1ps

module hazard_unit (
    input      [4:0] Rs1E, Rs2E, RdM, RdW, Rs1D, Rs2D, RdE,
    input      [1:0] ResultSrcE,
    input            RegWriteM, RegWriteW, PCSrcE,
    output reg       StallF, StallD, FlushE, FlushD,
    output reg [1:0] ForwardAE, ForwardBE
);

    reg lwStall;

    always @(*) begin
        // Forward A
        if ((Rs1E == RdM) && RegWriteM && (Rs1E != 0))
            ForwardAE = 2'b10;
        else if ((Rs1E == RdW) && RegWriteW && (Rs1E != 0))
            ForwardAE = 2'b01;
        else
            ForwardAE = 2'b00;

        // Forward B
        if ((Rs2E == RdM) && RegWriteM && (Rs2E != 0))
            ForwardBE = 2'b10;
        else if ((Rs2E == RdW) && RegWriteW && (Rs2E != 0))
            ForwardBE = 2'b01;
        else
            ForwardBE = 2'b00;

        // Load-use hazard
        lwStall = ResultSrcE[0] & ((Rs1D == RdE) | (Rs2D == RdE));

        StallD = lwStall;
        StallF = lwStall;
        FlushE = lwStall | PCSrcE;
        FlushD = PCSrcE;
    end

endmodule
