library verilog;
use verilog.vl_types.all;
entity Registro_vlg_check_tst is
    port(
        Output          : in     vl_logic_vector(13 downto 0);
        sampler_rx      : in     vl_logic
    );
end Registro_vlg_check_tst;
