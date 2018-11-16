library verilog;
use verilog.vl_types.all;
entity sieteS_vlg_check_tst is
    port(
        Output          : in     vl_logic_vector(13 downto 0);
        SS0             : in     vl_logic_vector(6 downto 0);
        SS1             : in     vl_logic_vector(6 downto 0);
        SS2             : in     vl_logic_vector(6 downto 0);
        SS3             : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end sieteS_vlg_check_tst;
