library verilog;
use verilog.vl_types.all;
entity UC is
    port(
        Opcode          : in     vl_logic_vector(3 downto 0);
        Clk             : in     vl_logic;
        PCWrite         : out    vl_logic;
        Beq             : out    vl_logic;
        Bne             : out    vl_logic;
        Bgt             : out    vl_logic;
        Jump            : out    vl_logic;
        RMI             : out    vl_logic;
        WIR             : out    vl_logic;
        Dg              : out    vl_logic;
        WRF             : out    vl_logic;
        AluSrcA         : out    vl_logic;
        AluOut          : out    vl_logic;
        DatSel          : out    vl_logic;
        RMD             : out    vl_logic;
        WMD             : out    vl_logic;
        AluOP           : out    vl_logic_vector(1 downto 0);
        IO              : out    vl_logic_vector(2 downto 0)
    );
end UC;
