library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity partB is
  port (
    A, B: in std_logic_vector(7 downto 0);
    xor_res, nand_res, or_res, not_res: out std_logic_vector(7 downto 0);
    cout: out std_logic
  );
end partB;

architecture archB of partB is
begin
  xor_res <= A xor B;
  nand_res <= A nand B;
  or_res <= A or B;
  not_res <= not A;
  cout <= '0';
end archB;
