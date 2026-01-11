interface uart_if;
    logic clk;
    logic reset;
    logic transmit;
    logic busy;
    logic [7:0] TxData;
    logic TxD;
    logic valid_rx;
    logic [7:0] RxData;
endinterface
