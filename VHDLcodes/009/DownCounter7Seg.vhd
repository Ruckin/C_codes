-- 009 VHDL CODE
-- FREDERICO ANTONIAZZI - 27/06/2024
--
-- IMPLEMENTATION OF A DOWN COUNTER USING A
-- 7-SEGMENT DISPLAY
--

-- LOADING THE LIBRARY
library IEEE;
use IEEE.std_logic_1164.all; -- USING THE LIBRARY

-- CREATING THE ENTITY
entity DownCounter7Seg is port
(

clk : in std_logic; -- CLOCK INPUT

disp7_bar : out std_logic_vector(6 downto 0) -- OUTPUT VECTOR FOR THE DISPLAY

);
end DownCounter7Seg; -- ENDING THE ENTITY

-- CREATING THE ARCHITECTURE THAT IMPLEMENTS THE COUNTER AND THE 7-SEGMENT DISPLAY
architecture Hardware of DownCounter7Seg is
begin

	process(clk) -- BEGINNING OF A PROCESS THAT SENSES THE CLOCK
		
		variable counter : integer range 0 to 10; -- CREATING A VARIABLE TO COUNT THE CLOCK INPUT
		
		begin
			if (clk = '1') then -- CHECKING IF CLOCK IS IN THE UPPER EDGE
			
					counter := counter + 1; -- IF THE CLOCK IS, SO COUNTER INCRESSES
					
					if (counter = 10) then
						
						counter := 0; -- RESTARTS THE COUNTER WHEN CLOCK GOES UP MORE THEN 10 TIMES
						
					end if;
			end if;
			
			case counter is
			
				when 0 => disp7_bar <= "1111110";
				when 1 => disp7_bar <= "0110000";
				when 2 => disp7_bar <= "1101101";
				when 3 => disp7_bar <= "1111001";
				when 4 => disp7_bar <= "0110011";
				when 5 => disp7_bar <= "1011011";
				when 6 => disp7_bar <= "1011111";
				when 7 => disp7_bar <= "1110000";
				when 8 => disp7_bar <= "1111111";
				when 9 => disp7_bar <= "1111011";
				when others => disp7_bar <= "0000000";
			
			end case;
	end process;
end Hardware; -- ENDING THE HARDWARE
