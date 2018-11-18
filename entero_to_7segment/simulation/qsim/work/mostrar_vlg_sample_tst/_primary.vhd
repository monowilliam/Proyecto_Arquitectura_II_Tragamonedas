library verilog;
use verilog.vl_types.all;
entity mostrar_vlg_sample_tst is
    port(
        boton           : in     vl_logic;
        n1              : in     vl_logic_vector(31 downto 0);
        n2              : in     vl_logic_vector(31 downto 0);
        n3              : in     vl_logic_vector(31 downto 0);
        n4              : in     vl_logic_vector(31 downto 0);
        numeroVector    : in     vl_logic_vector(13 downto 0);
        sampler_tx      : out    vl_logic
    );
end mostrar_vlg_sample_tst;
