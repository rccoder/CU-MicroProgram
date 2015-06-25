--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:47:05 06/16/2015
-- Design Name:   
-- Module Name:   C:/project10/CU_tb.vhd
-- Project Name:  project10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CU_tb IS
END CU_tb;
 
ARCHITECTURE behavior OF CU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         clk : IN  std_logic;
         op_code : IN  std_logic_vector(4 downto 0);
         ctrl_signal : OUT  std_logic_vector(17 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal op_code : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ctrl_signal : std_logic_vector(17 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          clk => clk,
          op_code => op_code,
          ctrl_signal => ctrl_signal
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
		op_code<="00000";
		wait for 40 ns;
			op_code<="00010";
		wait for 40 ns;
			op_code<="00011";
		wait for 40 ns;
			op_code<="00100";
		wait for 40 ns;
			op_code<="00101";
		wait for 40 ns;
			op_code<="00110";
		wait for 40 ns;
			op_code<="00111";
		wait for 60 ns;
			op_code<="01001";
		wait for 60 ns;
			op_code<="01011";
		wait for 60 ns;
			op_code<="01101";
		wait for 40 ns;
			op_code<="01111";
		wait for 40 ns;
			op_code<="00000";
      -- insert stimulus here 

      wait;
   end process;

END;
