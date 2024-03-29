LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_PC IS
END Test_PC;
 
ARCHITECTURE behavior OF Test_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Constante : IN  std_logic_vector(7 downto 0);
         ESCR_PC : IN  std_logic;
         Endereco : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');
   signal ESCR_PC : std_logic := '0';

 	--Outputs
   signal Endereco : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          clk => clk,
          reset => reset,
          Constante => Constante,
          ESCR_PC => ESCR_PC,
          Endereco => Endereco
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
		 -- Mantém o estado de reset por 100 ns para garantir que o sistema esteja completamente resetado.
		 wait for 100 ns;

		 -- Espera por 10 ciclos de clock para garantir que o sistema tenha estabilizado após o reset.
		 wait for clk_period * 10;

		 -- Configuração inicial do registrador de controle (ESCR_PC) e da constante.
		 ESCR_PC <= '1'; -- Ativa a escrita no registrador de controle.
		 Constante <= "00010000"; -- Define o valor da constante.
		 wait for clk_period * 2; -- Espera para garantir que a escrita seja realizada.

		 ESCR_PC <= '0'; -- Desativa a escrita no registrador de controle.
		 wait for clk_period * 5; -- Espera para estabilização.

		 reset <= '1'; -- Ativa o sinal de reset para reiniciar o sistema.

		 -- Aqui você pode inserir estímulos adicionais conforme necessário para testar o sistema.

		 -- Espera infinita para manter a simulação em execução.
		 wait;
	end process;

END;
