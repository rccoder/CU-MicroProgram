--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:21:59 06/16/2015
-- Design Name:   
-- Module Name:   C:/project10/ROM_tb.vhd
-- Project Name:  project10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
 
ENTITY ROM_tb IS
END ROM_tb;
 
ARCHITECTURE behavior OF ROM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         add : IN  std_logic_vector(4 downto 0);
         data_out : OUT  std_logic_vector(0 to 23)
        );
    END COMPONENT;
    

   --Inputs
   signal add : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(0 to 23);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          add => add,
          data_out => data_out
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		add<="00000";
      wait for 20 ns;	
			add<="00001";
		wait for 20 ns;	
			add<="00010";
		wait for 20 ns;	
			add<="00100";
		wait for 20 ns;	
			add<="00110";
		wait for 20 ns;	
			add<="01000";
		wait for 20 ns;
			add<="01010";
		wait for 20 ns;	
			add<="01100";
		wait for 20 ns;	
			add<="01110";
      -- insert stimulus here 

      wait;
   end process;

END;
