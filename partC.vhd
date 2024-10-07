library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity partC is
  port (
    A: in std_logic_vector(7 downto 0);
    Cin: in std_logic;
    SL, RL, RLC, rst: out std_logic_vector(7 downto 0);
    Co_SL, Co_RL, Co_RLC, Co_rst: out std_logic
  );
end partC;


architecture archC of partC is 
begin
  SL <= A(6 downto 0) & '0';
  Co_SL <= A(7);

  RL <= A(6 downto 0) & A(7);
  Co_RL <= A(7);

  RLC <= A(6 downto 0) & Cin;
  Co_RLC <= A(7);

  rst <= (others => '0');
  Co_rst <= '0';
end archC;
