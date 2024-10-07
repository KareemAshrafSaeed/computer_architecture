library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture test of alu_tb is

    signal A, B: std_logic_vector(7 downto 0);
    signal F: std_logic_vector(7 downto 0);
    signal cout: std_logic;
    signal cin: std_logic;
    signal Sel: std_logic_vector(3 downto 0);

    component alu is
        port (
            A, B: in std_logic_vector(7 downto 0);
            F: out std_logic_vector(7 downto 0);
            cout: out std_logic;
            cin: in std_logic;
            Sel: in std_logic_vector(3 downto 0)
        );
    end component;

begin

    alu_inst: alu port map (
        A => A,
        B => B,
        F => F,
        cout => cout,
        cin => cin,
        Sel => Sel
    );

    process
    begin

        -- 0100: XOR operation
        A <= x"F0";  
        B <= x"B0";  
        Sel <= "0100"; 
        wait for 10 ns;

        -- 0101: NAND operation
        A <= x"F0";  
        B <= x"0B";  
        Sel <= "0101"; 
        wait for 10 ns;

        -- 0110: OR operation
        A <= x"F0";  
        B <= x"B0";  
        Sel <= "0110"; 
        wait for 10 ns;

        -- 0111: NOT operation
        A <= x"F0";  
        B <= (others => '0');  
        Sel <= "0111"; 
        wait for 10 ns;
        
        -- 1000: Logic shift left
        A <= x"F0";  
        Sel <= "1000"; 
        wait for 10 ns;

        -- 1001: Rotate left
        A <= x"F0";  
        Sel <= "1001"; 
        wait for 10 ns;

        -- 1010: Rotate left with cin = 0
        A <= x"F0";  
        cin <= '0';
        Sel <= "1010"; 
        wait for 10 ns;

        -- 1011: F = 0000
        A <= x"F0";  
        Sel <= "1011"; 
        wait for 10 ns;

        -- 1100: Logic shift right
        A <= x"F0";  
        Sel <= "1100"; 
        wait for 10 ns;

        -- 1101: Rotate right
        A <= x"F0";  
        Sel <= "1101"; 
        wait for 10 ns;

        -- 1110: Rotate right with cin = 0
        A <= x"F0";  
        cin <= '0';
        Sel <= "1110"; 
        wait for 10 ns;

        -- 1111: Arithmetic shift right
        A <= x"F0";  
        Sel <= "1111"; 
        wait for 10 ns;

        -- 1010: Rotate left with cin = 1
        A <= x"F0";  
        cin <= '1';
        Sel <= "1010"; 
        wait for 10 ns;

        -- 1110: Rotate right with cin = 1
        A <= x"F0";  
        cin <= '1';
        Sel <= "1110"; 
        wait for 10 ns;

        wait;
    end process;

end test;
