library verilog;
use verilog.vl_types.all;
entity lab4_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        CLR             : in     vl_logic;
        \OPEN\          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab4_vlg_sample_tst;
