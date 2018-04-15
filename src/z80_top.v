// z80_top.v
//

// Pinouts from Pin description,
// Figure 3: UM008004-1204
module z80_top (
    // System Control
    output M1_n,
    output MREQ_n,
    output IORQ_n,
    output RD_n,
    output WR_n,
    output RFSH_n,
    // CPU Control
    output HALT_n,
    input WAIT_n,
    input INT_n,
    input NMI_n,
    input RESET_n,
    // CPU Bus control
    input BUSRQ_n,
    output BUSACK,
    // Address Bus
    output [15:0] A,
    inout D,
    // misc
    input CLK
    // input vdd,
    // input vss
);

assign M1_n = 0;
assign MREQ_n = 0;
assign IORQ_n = 0;
assign RD_n = 0;
assign WR_n = 0;
assign RFSH_n = 0;
assign HALT_n = 0;
assign BUSACK = 0;
assign A = 16'hDEAD;

endmodule
