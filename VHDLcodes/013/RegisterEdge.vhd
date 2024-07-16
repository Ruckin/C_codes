-- 013 VHDL CODE
-- FREDERICO ANTONIAZZI - 01/07/2024
--
-- SYNCHRONOUS CIRCUITS
-- REGISTER SENSTIVE OF EDGE
--

-- CREATING THE ENTITY
entity RegisterEdge is port
(

clk : in bit; -- CLOCK INPUT
rst : in bit; -- RESET INPUT
set : in bit; -- SET INPUT

data : in bit_vector(2 downto 0); -- DATA VECTOR INPUT

Q : out bit_vector(2 downto 0) -- DATA VECTOR OUTPUT

);
end RegisterEdge; -- ENDING THE ENTITY

-- CREATING THE ARCHITECTURE
architecture Hardware of RegisterEdge is
begin
	process(clk)
	begin
		if (clk'event AND clk = '1') then -- TESTING THE CLOCK SIGNAL IN THE UP EDGE
			if (rst = '1') then
				Q <= "000";
				
			elsif (set = '1') then
				Q <= "111";
				
			else
				Q <= data;
				
			end if; -- END FOR RESET AND SET
		end if;    -- END FOR CLOCK EVENT
	end process;  -- ENDING THE PROCESS
end Hardware;    -- ENDING THE ARCHITECTURE
