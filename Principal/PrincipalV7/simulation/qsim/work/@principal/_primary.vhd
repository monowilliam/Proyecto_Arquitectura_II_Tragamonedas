library verilog;
use verilog.vl_types.all;
entity Principal is
    port(
        clk             : in     vl_logic;
        switches0       : in     vl_logic_vector(3 downto 0);
        switches1       : in     vl_logic_vector(3 downto 0);
        switches2       : in     vl_logic_vector(1 downto 0);
        SS0             : out    vl_logic_vector(6 downto 0);
        SS1             : out    vl_logic_vector(6 downto 0);
        SS2             : out    vl_logic_vector(6 downto 0);
        SS3             : out    vl_logic_vector(6 downto 0);
        EnterButton     : in     vl_logic;
        ledsR           : out    vl_logic_vector(9 downto 0);
        ledsV           : out    vl_logic_vector(7 downto 0)
    );
end Principal;
