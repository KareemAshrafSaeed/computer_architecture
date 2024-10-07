library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity partD is
  port (
    A: in std_logic_vector(7 downto 0);
    Cin: in std_logic;
    SR, RR, RRC, ARA: out std_logic_vector(7 downto 0);
    Co_SR, Co_RR, Co_RRC, Co_ara: out std_logic
  );
end partD;

architecture archC of partD is 
begin
  SR <= '0' & A(7 downto 1);
  Co_SR <= A(0);

  RR <= A(0) & A(7 downto 1);
  Co_RR <= A(0);

  RRC <= Cin & A(7 downto 1);
  Co_RRC <= A(0);

  ARA <= A(7) & A(7 downto 1);
  Co_ara <= A(0);
end archC;
