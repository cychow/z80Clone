`timescale 1ns/1ps

module z80_tb_top (

);

reg M1_n;
reg MREQ_n;
reg IORQ_n;
reg RD_n;
reg WR_n;
reg RFSH_n;
reg HALT_n;
reg WAIT_n;
reg INT_n;
reg NMI_n;
reg RESET_n;
reg BUSRQ_n;
reg BUSACK;
reg [15:0] A;
reg CLK;
inout D;

// instantiate the DUT
z80_top I_z80_core (
    .M1_n    (M1_n    ),
    .MREQ_n  (MREQ_n  ),
    .IORQ_n  (IORQ_n  ),
    .RD_n    (RD_n    ),
    .WR_n    (WR_n    ),
    .RFSH_n  (RFSH_n  ),
    .HALT_n  (HALT_n  ),
    .WAIT_n  (WAIT_n  ),
    .INT_n   (INT_n   ),
    .NMI_n   (NMI_n   ),
    .RESET_n (RESET_n ),
    .BUSRQ_n (BUSRQ_n ),
    .BUSACK  (BUSACK  ),
    .A       (A       ),
    .D       (D       ),
    .CLK     (CLK     )
);


initial begin
    // initialize pin values
    WAIT_n = 1'b0;
    INT_n = 1'b0;
    NMI_n = 1'b0;
    RESET_n = 1'b0;
    BUSRQ_n = 1'b0;
    //D = 1'b0;
    CLK = 1'b0;
end

// clock generator
always begin
    CLK = #10ns ~CLK;
end
endmodule