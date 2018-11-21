library verilog;
use verilog.vl_types.all;
entity UC_vlg_check_tst is
    port(
        AluOP           : in     vl_logic_vector(1 downto 0);
        AluOut          : in     vl_logic;
        AluSrcA         : in     vl_logic;
        Beq             : in     vl_logic;
        Bgt             : in     vl_logic;
        Bne             : in     vl_logic;
        DatSel          : in     vl_logic;
        Dg              : in     vl_logic;
        IO              : in     vl_logic_vector(2 downto 0);
        Jump            : in     vl_logic;
        PCWrite         : in     vl_logic;
        RMD             : in     vl_logic;
        RMI             : in     vl_logic;
        WIR             : in     vl_logic;
        WMD             : in     vl_logic;
        WRF             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end UC_vlg_check_tst;
