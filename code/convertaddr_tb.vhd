--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:38:59 06/16/2015
-- Design Name:   
-- Module Name:   C:/project10/convertaddr_tb.vhd
-- Project Name:  project10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: convertaddr
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
 
ENTITY convertaddr_tb IS
END convertaddr_tb;
 
ARCHITECTURE behavior OF convertaddr_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT convertaddr
    PORT(
         op : IN  std_logic_vector(4 downto 0);
         op_add : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal op_add : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: convertaddr PORT MAP (
          op => op,
          op_add => op_add
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op<="00000";
      wait for 20 ns;	
			op<="00010";
		wait for 20 ns;	
			op<="00011";
		wait for 20 ns;	
			op<="00100";
		wait for 20 ns;	
			op<="00101";

      -- insert stimulus here 

      wait;
   end process;

END;
