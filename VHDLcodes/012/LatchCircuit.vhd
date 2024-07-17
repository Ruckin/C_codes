-- 012 VHDL CODE
-- FREDERICO ANTONIAZZI - 01/07/2024
--
-- ASYNCHRONOUS CIRCUITS
-- LATCH CIRCUIT
--

-- CREATING THE ENTITY
entity LatchCircuit is port
(

en  : in bit; -- ENABLE INPUT
rst : in bit; -- RESET INPUT
set : in bit; -- SET INPUT

data : in bit_vector(2 downto 0); -- DATA INPUT

Q : out bit_vector(2 downto 0) -- DATA output

);
end LatchCircuit; -- ENDING THE ENTITY

-- CREATING THE ARCHITECTURE
architecture Hardware of LatchCircuit is
begin
	process(en, rst, set, data)
		begin
		
			if (rst = '1') then
			
					Q <= "000";
					
			elsif (set = '1') then
			
					Q <= "111";
					
			elsif (en = '1') then
			
					Q <= data;
		
			end if;
	end process;
end Hardware; -- ENDING THE ARCHITECTURE
