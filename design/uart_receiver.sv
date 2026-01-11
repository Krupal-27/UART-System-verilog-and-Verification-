module Uart_Receiver (uart_if uart);
    parameter int clk_freq = 50_000_000;
    parameter int baud_rate = 1_000_000; // 1 Mbps for simulation
    parameter int div_sample = clk_freq / baud_rate;
    parameter int mid_sample = div_sample / 2;
    parameter int total_bits = 10;

    logic [3:0] state, nextstate;
    logic [7:0] sample_counter;
    logic [3:0] bit_counter;
    logic [9:0] rxshift_reg;
    logic shift, clear_samplecounter, inc_samplecounter;
    logic clear_bitcounter, inc_bitcounter;
    logic valid_rx_next;

    always_ff @(posedge uart.clk or posedge uart.reset) begin
        if (uart.reset) begin
            state <= 0;
            sample_counter <= 0;
            bit_counter <= 0;
            rxshift_reg <= 0;
            uart.valid_rx <= 0;
        end else begin
            state <= nextstate;
            if (clear_samplecounter) sample_counter <= 0;
            else if (inc_samplecounter) sample_counter <= sample_counter + 1;
            if (clear_bitcounter) bit_counter <= 0;
            else if (inc_bitcounter) bit_counter <= bit_counter + 1;
            if (shift) rxshift_reg <= {uart.TxD, rxshift_reg[9:1]};
            uart.valid_rx <= valid_rx_next;
        end
    end

    always_comb begin
        shift = 0;
        clear_samplecounter = 0;
        inc_samplecounter = 0;
        clear_bitcounter = 0;
        inc_bitcounter = 0;
        valid_rx_next = 0;
        nextstate = state;

        case (state)
            0: begin
                if (!uart.TxD) begin
                    nextstate = 1;
                    clear_bitcounter = 1;
                    clear_samplecounter = 1;
                end
            end
            1: begin
                if (sample_counter == mid_sample) shift = 1;
                if (sample_counter == div_sample - 1) begin
                    clear_samplecounter = 1;
                    if (bit_counter == total_bits - 1) begin
                        if (rxshift_reg[9]) valid_rx_next = 1;
                        nextstate = 0;
                    end else begin
                        inc_bitcounter = 1;
                    end
                end else begin
                    inc_samplecounter = 1;
                end
            end
        endcase
    end

    assign uart.RxData = rxshift_reg[8:1];
endmodule
