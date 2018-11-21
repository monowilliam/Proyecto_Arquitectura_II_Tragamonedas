library verilog;
use verilog.vl_types.all;
entity UC_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        Opcode          : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end UC_vlg_sample_tst;
