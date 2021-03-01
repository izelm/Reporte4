----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2021 16:44:54
-- Design Name: 
-- Module Name: tb_fullAdderSubstractor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_fullAdderSubstractor is
--  Port ( );
end tb_fullAdderSubstractor;

architecture Behavioral of tb_fullAdderSubstractor is
    Component bitAdderSubstractor is 
        port(a:in bit_vector(7 downto 0);
            b:in bit_vector(7 downto 0);
            Subs:in bit;
            sum:out bit_vector(7 downto 0);
            cout:out bit);
    end component;
--ENTRADAS
SIGNAL A, B : bit_vector(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL T : bit := '0';

--SALIDAS
SIGNAL C_flag, Ov_flag : bit;
SIGNAL R : bit_vector(7 DOWNTO 0);

CONSTANT period : TIME := 5 ns;
begin
DUT : bitAdderSubstractor
PORT MAP(a => A,
         b => B,
         subs => T,
         Cout => C_flag,
         Sum => R);
process
    BEGIN
    --RESET
    WAIT FOR 50 NS;
    WAIT FOR PERIOD * 10;
    
    --ESTIMULOS DE SUMA
    T <= '0';
    
    A <= x"07"; -- 7 
    B <= x"04"; -- 4
    WAIT FOR PERIOD * 10;
    A <= x"0F"; -- 15
    B <= x"FA"; -- -6
    WAIT FOR PERIOD * 10;
    A <= x"10"; -- 16
    B <= x"E8"; -- -24
    WAIT FOR PERIOD * 10;
    A <= x"FB"; -- -5
    B <= x"F7"; -- -9
    WAIT FOR PERIOD * 10;
    A <= x"7D"; -- 125
    B <= x"3A"; -- 58
    WAIT FOR PERIOD * 10;
    
    --ESTIMULOS DE RESTA
    T <= '1';
    
    A <= x"0F"; -- 15
    B <= x"06"; -- 6
    WAIT FOR PERIOD * 10;
    A <= x"10"; -- 16
    B <= x"18"; -- 24
    WAIT FOR PERIOD * 10;
    A <= x"82"; -- -125
    B <= x"34"; -- 58
    WAIT FOR PERIOD * 10;
    A <= x"FA"; -- -6
    B <= x"0C"; -- 13
    WAIT FOR PERIOD * 10;
    A <= x"00"; -- 0
    B <= x"00"; -- 0
    
    WAIT;
    END PROCESS; 
end Behavioral;
