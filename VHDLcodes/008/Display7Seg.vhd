-- 008 VHDL CODE
-- FREDERICO ANTONIAZZI - 27/06/2024
--
-- CODE IMPLEMENTING A 7-SEGMENT DISPLAY SYSTEM
-- IN VHDL
--

-- LOADING THE LIBRARIES
library IEEE;
use IEEE.std_logic_1164.all; -- USING THE LIBRARY

-- CREATING THE ENTITY OF THE DISPLAY
entity Display7Seg is port
(

	clk : in std_logic; -- CLOCK INPUT

	dis7bar : out std_logic_vector(6 downto 0) -- OUTPUT VECTOR FOR THE DISPLAY

);
end Display7Seg; -- ENDING THE ENTITY

-- CREATING THE ARCHITECTURE THAT IMPLEMENTS THE 7-SEGMENT DISPLAY IN HARDWARE
architecture Hardware of Display7Seg is
begin

	process(clk) -- BEGINNING A PROCESS THAT SENSES THE CLOCK
	
		-- CREATING A LOCAL COUNTER VARIABLE FOR THE PROCESS
		variable counter : integer range 0 to 10;
	
		begin
		
			if (clk = '1') then
					
				counter := counter + 1;
					
				if (counter = 10) then
					
					counter := 0;
					
				end if;
			end if;
			
		case counter is
			
			when 0 => dis7bar <= "1111110";
			when 1 => dis7bar <= "0110000";
			when 2 => dis7bar <= "1101101";
			when 3 => dis7bar <= "1111001";
			when 4 => dis7bar <= "0110011";
			when 5 => dis7bar <= "1011011";
			when 6 => dis7bar <= "1011111";
			when 7 => dis7bar <= "1110000";
			when 8 => dis7bar <= "1111111";
			when 9 => dis7bar <= "1111011";
			when others => dis7bar <= "0000000";
		
		end case;
	end process;
end Hardware; -- ENDING THE HARDWARE
