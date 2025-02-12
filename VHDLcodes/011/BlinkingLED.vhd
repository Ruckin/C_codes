-- 011 VHDL CODE
-- FREDERICO ANTONIAZZI - 28/06/2024
--
-- IMPLEMENTATION OF BLINKING ROUTINE FOR LED
--

-- LOADING THE LIBRARY
library IEEE;
use IEEE.std_logic_1164.all; -- USE THE LOGIC LIBRARY

-- CREATING THE ENTITY
entity BlinkingLED is port
(

clk    : in std_logic;              -- CLOCK INPUT
OutLED : out integer range 0 to 255 -- VECTOR OUTPUT WITH 8 BITS

);
end BlinkingLED; -- ENDING THE ENTITY

-- CREATING THE ARCHITECTURE THAT IMPLEMENTS THIS PROCESS
architecture Hardware of BlinkingLED is
begin
	process(clk)
		
		-- .5 s = 9999999*(1/20M)	
		variable counter   : integer range 0 to 255;     -- VARIABLE TO TURN ON OR OFF LED
		variable prescaler : integer range 0 to 9999999; -- RESPONSABLE FOR SETTING THE FREQUENCY(MUST BE COMPATIBLE WITH YOUR CRISTAL)
	
		begin
		
			if(clk'event AND clk = '1') then
			
				prescaler := prescaler + 1;
				
				if(prescaler = 0) then
				
					counter := 255 - counter; -- ALWAYS INVERT COUNTER FROM 255(HIGH/POWER ON) TO 0(LOW/POWER OFF)
					
				end if;
			end if;
			
			OutLED <= counter; -- BLINKING LED IN THE OUTPUT
	
	end process;
end Hardware; -- ENDING ARCHITECTURE
