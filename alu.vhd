library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
  port (
    A, B: in std_logic_vector(7 downto 0);
    F: out std_logic_vector(7 downto 0);
    cout: out std_logic;
    cin: in std_logic;
    Sel: in std_logic_vector(3 downto 0)
  );
end alu;

architecture arch of alu is

    component partB is
      port (
        A, B: in std_logic_vector(7 downto 0);
        xor_res, nand_res, or_res, not_res: out std_logic_vector(7 downto 0);
        cout: out std_logic
      );
    end component;

    component partC is
      port (
        A: in std_logic_vector(7 downto 0);
        Cin: in std_logic;
        SL, RL, RLC, rst: out std_logic_vector(7 downto 0);
        Co_SL, Co_RL, Co_RLC, Co_rst: out std_logic
      );
    end component;

    component partD is
      port (
        A: in std_logic_vector(7 downto 0);
        Cin: in std_logic;
        SR, RR, RRC, ARA: out std_logic_vector(7 downto 0);
        Co_SR, Co_RR, Co_RRC, Co_ara: out std_logic
      );
    end component;

    signal xor_res, nand_res, or_res, not_res: std_logic_vector(7 downto 0);
    signal SL_res, RL_res, RLC_res, rst_res: std_logic_vector(7 downto 0);
    signal SR_res, RR_res, RRC_res, ARA_res: std_logic_vector(7 downto 0);
    signal coB: std_logic; 
    signal coSL, coRL, coRLC, coRST: std_logic;
    signal coSR, coRR, coRRC, coARA: std_logic;

begin

    partB_inst: partB port map(A, B, xor_res, nand_res, or_res, not_res, coB);
    partC_inst: partC port map(A, cin, SL_res, RL_res, RLC_res, rst_res, coSL, coRL, coRLC, coRST);
    partD_inst: partD port map(A, cin, SR_res, RR_res, RRC_res, ARA_res, coSR, coRR, coRRC, coARA);

    F <= xor_res when Sel = "0100" else
        nand_res when Sel = "0101" else
        or_res when Sel = "0110" else
        not_res when Sel = "0111" else
        SL_res when Sel = "1000" else
        RL_res when Sel = "1001" else
        RLC_res when Sel = "1010" else
        rst_res when Sel = "1011" else
        SR_res when Sel = "1100" else
        RR_res when Sel = "1101" else
        RRC_res when Sel = "1110" else
        ARA_res when Sel = "1111" else
        (others => '0');

    cout <= coB when Sel(3 downto 2) = "01" else
            coSL when Sel = "1000" else
            coRL when Sel = "1001" else
            coRLC when Sel = "1010" else
            coRST when Sel = "1011" else
            coSR when Sel = "1100" else
            coRR when Sel = "1101" else
            coRRC when Sel = "1110" else
            coARA when Sel = "1111" else
            '0';

end arch;
