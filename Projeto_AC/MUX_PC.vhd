library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_PC is
    Port ( zero : in  STD_LOGIC;
           um : in  STD_LOGIC;
           S_FLAG : in  STD_LOGIC;
           O7 : in  STD_LOGIC;
           SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
			  NOR_Operando1 : in STD_LOGIC;
           ESCR_PC : out  STD_LOGIC);
end MUX_PC;

architecture Behavioral of MUX_PC is

begin

	process(zero, um, S_FLAG, O7, SEL_PC, NOR_Operando1)
	begin
	
		-- Início da estrutura de seleção de casos dependendo do valor de SEL_PC
		case SEL_PC is
		
			-- Atribui o valor de uma das entradas á saída ESCR_PC dependendo do valor de SEL_PC
			when "000" => ESCR_PC <= zero;
			when "001" => ESCR_PC <= um;
			when "010" => ESCR_PC <= S_FLAG;
			when "011" => ESCR_PC <= O7;
			when "100" => ESCR_PC <= NOR_Operando1;
			-- Para qualquer outro valor de SEL_PC, atribui 'X' a ESCR_PC
			when others => ESCR_PC <= 'X';
			
		end case;
	
	end process;

end Behavioral;

