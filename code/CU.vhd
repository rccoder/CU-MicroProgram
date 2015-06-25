----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    17:23:59 06/15/2015
-- Design Name:
-- Module Name:    CU - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
--convertaddr
library IEEE;
use IEEE.STD_LOGIC_1164.ALL,IEEE.NUMERIC_STD.ALL;
entity convertaddr is
    Port ( op : in  STD_LOGIC_VECTOR (4 downto 0);
           op_add : out  STD_LOGIC_VECTOR (4 downto 0));
end convertaddr;

architecture Behavioral of convertaddr is
begin
	process(op)
		begin
			op_add <= op(3 downto 0) & '0';
		end process;
end Behavioral;

--MUX
library IEEE;
use IEEE.STD_LOGIC_1164.ALL,IEEE.NUMERIC_STD.ALL;
entity MUX is
PORT(
	mode:IN STD_LOGIC;
	next_add:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	op_addr :IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	out_add :OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
end MUX;


architecture Behavioral of MUX is
begin
	process(mode,next_add,op_addr)
	begin
		case mode is
			when'0' => out_add<=next_add;
			when others => out_add<=op_addr;
		end case;
	end process;
end Behavioral;


--ROM
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
entity ROM is
    Port ( add : in  STD_LOGIC_VECTOR (4 downto 0);
           data_out : out  STD_LOGIC_VECTOR (0 to 23));
end ROM;

architecture Behavioral of ROM is
type microcode_array is array(28 downto 0) of std_logic_vector(0 to 23);
constant code : microcode_array:=(
0=> "110000000000000000000001", 1=> "001100000000000000000010", 2=> "0000100000000000001UUUUU", 4=> "000001000000000000000000",
6=> "000000100000000000000000", 8=> "000000010000000000000000", 10=> "000000001000000000000000", 12=> "000000000100000000000000",
14=> "010000000010000000001111", 15=> "001000000000000000010000", 16=> "000000000001000000000000",18=> "000000000010100000010011",
19=> "000000000000010000010100",20=> "000000000000001000000000", 22=> "010000000010000000010111", 23=> "001000000000000000011000",
24=> "000000000000000100000000", 26=> "000000000000000010000000", 28=> "000000000000000001000000",others=>"000000000000000000000000");
begin
	data_out <= code(conv_integer(add));
end Behavioral;


--Splitcode
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Splitcode is
Port (
	clock   : IN Std_logic;
	u_op : in  STD_LOGIC_VECTOR (0 TO 23);
	control : out  STD_LOGIC_VECTOR (0 TO 17);
	mode_sel: out  STD_LOGIC;
	next_add : out  STD_LOGIC_VECTOR (4 DOWNTO 0));
end Splitcode;


architecture Behavioral of Splitcode is
SIGNAL int_reg : Std_logic_vector(0 TO 23);
BEGIN
	main_proc : PROCESS
	BEGIN
		WAIT UNTIL falling_edge(clock);
		int_reg <= u_op;
	END PROCESS;
	control <= int_reg(0 TO 17);
	mode_sel<= int_reg(18);
	next_add <= int_reg(19 TO 23);
end Behavioral;


--CU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CU is
    Port ( clk : in  STD_LOGIC;
           op_code : in  STD_LOGIC_VECTOR (4 downto 0);
           ctrl_signal : out  STD_LOGIC_VECTOR (17 downto 0));end CU;
architecture Behavioral of CU is
component Splitcode
	Port (
		clock   : IN Std_logic;
		u_op : in  STD_LOGIC_VECTOR (0 TO 23);
		control : out  STD_LOGIC_VECTOR (0 TO 17);
		mode_sel: out  STD_LOGIC;
		next_add : out  STD_LOGIC_VECTOR (4 DOWNTO 0));
end component;
component convertaddr
    Port (
		op : in  STD_LOGIC_VECTOR (4 downto 0);
      op_add : out  STD_LOGIC_VECTOR (4 downto 0));
end component;
component MUX
	PORT(
		mode:IN STD_LOGIC;
		next_add:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		op_addr  :IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_add :OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
end component;
component ROM
    Port (
		add : in  STD_LOGIC_VECTOR (4 downto 0);
      data_out : out  STD_LOGIC_VECTOR (0 to 23));
end component;

signal op_add_MUX:std_logic_vector(4 downto 0);
signal mode_MUX  :std_logic;
signal next_add_MUX:std_logic_vector(4 downto 0);
signal MUX_CM  :std_logic_vector(4 downto 0);
signal CM_CMAR   :std_logic_vector(0 to 23);

begin
unit1:convertaddr port map(op_code, op_add_MUX);
unit2:MUX port map(mode_MUX, next_add_MUX, op_add_MUX, MUX_CM);
unit3:ROM port map(MUX_CM, CM_CMAR);
unit4:Splitcode port map(clk, CM_CMAR, ctrl_signal, mode_MUX, next_add_MUX);
end Behavioral;
