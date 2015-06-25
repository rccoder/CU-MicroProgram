--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:46:59 06/16/2015
-- Design Name:   
-- Module Name:   C:/project10/Splitcode_tb.vhd
-- Project Name:  project10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Splitcode
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
 
ENTITY Splitcode_tb IS
END Splitcode_tb;
 
ARCHITECTURE behavior OF Splitcode_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Splitcode
    PORT(
         clock : IN  std_logic;
         u_op : IN  std_logic_vector(0 to 23);
         control : OUT  std_logic_vector(0 to 17);
         mode_sel : OUT  std_logic;
         next_add : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal u_op : std_logic_vector(0 to 23) := (others => '0');

 	--Outputs
   signal control : std_logic_vector(0 to 17);
   signal mode_sel : std_logic;
   signal next_add : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Splitcode PORT MAP (
          clock => clock,
          u_op => u_op,
          control => control,
          mode_sel => mode_sel,
          next_add => next_add
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		wait for clock_period;
			u_op<="0000100000000000001UUUUU";
		wait for clock_period;
			u_op<="110000000000000000000001";
		wait for clock_period;
			u_op<="001100000000000000000010";
		wait for clock_period;
			u_op<="000000000000000000000000";
      -- insert stimulus here 

      wait;
   end process;

END;
