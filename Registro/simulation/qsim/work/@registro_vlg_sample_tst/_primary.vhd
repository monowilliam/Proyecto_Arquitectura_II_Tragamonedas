library verilog;
use verilog.vl_types.all;
entity Registro_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(13 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Registro_vlg_sample_tst;
