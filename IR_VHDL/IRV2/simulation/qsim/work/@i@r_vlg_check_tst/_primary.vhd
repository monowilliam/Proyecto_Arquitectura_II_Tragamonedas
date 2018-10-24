library verilog;
use verilog.vl_types.all;
entity IR_vlg_check_tst is
    port(
        const           : in     vl_logic_vector(13 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        rs              : in     vl_logic_vector(3 downto 0);
        rt              : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end IR_vlg_check_tst;
