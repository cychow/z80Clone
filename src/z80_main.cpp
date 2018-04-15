#include "Vz80_top.h"
#include <verilated.h>
#include <verilated_vcd_c.h>

#define MAX_TIME 3000000
vluint32_t main_time = 0;

double sc_time_stamp () {
    return main_time;
}

int main(int argc, char ** argv, char ** env) {
    Verilated::commandArgs(argc, argv);
    Vz80_top * top = new Vz80_top;


    // instantiate trace
    VerilatedVcdC* tfp = new VerilatedVcdC;
    Verilated::traceEverOn(true);
    top->trace(tfp, 99);
    tfp->open("obj_dir/waves.vcd");

    VL_PRINTF("Launching...\n");
    top->RESET_n = 0;
    top->WAIT_n = 0;
    top->INT_n = 0;
    top->NMI_n = 0;
    top->BUSRQ_n = 0;
    
    while (!Verilated::gotFinish() && main_time <= MAX_TIME) {
        top -> eval();
        if (main_time % 100000 == 0) {
            VL_PRINTF("Timestamp: %ld ns\n", main_time);
        }
        if (main_time > 10 && top->RESET_n == 0) {
            top->RESET_n = 1;
            VL_PRINTF("Deasserting reset...\n");
        }
        if ((main_time % 10) == 1) {
            top->CLK = 1;
        }
        if ((main_time % 10) == 6) {
            top->CLK = 0;
        }
        top->eval();
        tfp->dump(main_time);
        main_time++;
    }
    top->final();
    delete top;
    exit(0);
}
