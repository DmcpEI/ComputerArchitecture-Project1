LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Test_Banco_de_Registos IS
END Test_Banco_de_Registos;
 
ARCHITECTURE behavior OF Test_Banco_de_Registos IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Banco_de_Registos
    PORT(
         ESCR_R : IN  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         SEL_R : IN  std_logic_vector(5 downto 0);
         Dados_R : IN  std_logic_vector(7 downto 0);
         Operando1 : OUT  std_logic_vector(7 downto 0);
         Operando2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ESCR_R : std_logic_vector(1 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal SEL_R : std_logic_vector(5 downto 0) := (others => '0');
   signal Dados_R : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Operando1 : std_logic_vector(7 downto 0);
   signal Operando2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Banco_de_Registos PORT MAP (
          ESCR_R => ESCR_R,
          clk => clk,
          SEL_R => SEL_R,
          Dados_R => Dados_R,
          Operando1 => Operando1,
          Operando2 => Operando2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		ESCR_R <= "01"; Dados_R <= "01010101"; SEL_R <= "000000"; wait for 10 ns;
		ESCR_R <= "00"; Dados_R <= "01111101"; SEL_R <= "010001"; wait for 10 ns;
		ESCR_R <= "01"; Dados_R <= "01010101"; SEL_R <= "011000"; wait for 10 ns;
		ESCR_R <= "01"; Dados_R <= "01011101"; SEL_R <= "001001"; wait for 10 ns;
		  
   end process;

END;
