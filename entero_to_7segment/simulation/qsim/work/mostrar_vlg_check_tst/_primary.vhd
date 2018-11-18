library verilog;
use verilog.vl_types.all;
entity mostrar_vlg_check_tst is
    port(
        n1              : in     vl_logic_vector(31 downto 0);
        n2              : in     vl_logic_vector(31 downto 0);
        n3              : in     vl_logic_vector(31 downto 0);
        n4              : in     vl_logic_vector(31 downto 0);
        segmento0       : in     vl_logic_vector(6 downto 0);
        segmento1       : in     vl_logic_vector(6 downto 0);
        segmento2       : in     vl_logic_vector(6 downto 0);
        segmento3       : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end mostrar_vlg_check_tst;
