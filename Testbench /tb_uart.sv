module tb_uart_interface;
    // Interface instance - this interface is defined in design.sv
    uart_if uart();
    
    // DUT instance - this module is defined in design.sv
    uart_interface dut (.uart(uart));
    
    // Clock generation (50 MHz)
    initial uart.clk = 0;
    always #10 uart.clk = ~uart.clk;

    environment env;
    
    initial begin
        // Create waveform dump
        $dumpfile("uart.vcd");
        $dumpvars(0, tb_uart_interface);
        
        $display("\n===========================================");
        $display("UART TESTBENCH START");
        $display("===========================================\n");
        
        // Initialize signals
        uart.reset = 1;
        uart.transmit = 0;
        uart.TxData = 0;
        #100;
        
        // Release reset
        uart.reset = 0;
        #100;
        
        $display("[TB] Reset released, starting environment...\n");
        
        // Create and run environment
        env = new(uart);
        env.run();
        
        // Simulation completion
        $display("\n===========================================");
        $display("[TB] Simulation completed successfully!");
        $display("===========================================\n");
        #100;
        $finish;
    end
    
    // Simulation timeout - INCREASED for UART simulation
    initial begin
        #10000000; // 10ms timeout (increased from 5ms)
        $display("\n===========================================");
        $display("[TB] ERROR: Simulation timeout!");
        $display("===========================================\n");
        $finish;
    end
endmodule
