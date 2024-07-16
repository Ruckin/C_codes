-- 014 VHDL CODE
-- FREDERICO ANTONIAZZI - 01/07/2024
--
-- ASYNCHRONOUS CIRCUITS
-- REGISTER SENSTIVE OF EDGE IN THE START
--

-- CREATING THE ENTITY
entity RegisterAsynchronousEdge is port
(

clk : in bit; -- CLOCK INPUT
rst : in bit; -- RESET INPUT
set : in bit; -- SET INPUT

data : in bit_vector(2 downto 0); -- DATA VECTOR INPUT

Q : out bit_vector(2 downto 0) -- DATA VECTOR OUTPUT

);
end RegisterAsynchronousEdge; -- ENDING THE ENTITY

-- CREATING THE ARCHITECTURE
architecture Hardware of RegisterAsynchronousEdge is
begin
	process(rst, set, clk)
	begin
		if    (rst = '1') then
		
			Q <= "000";
			
		elsif (set = '1') then
		
			Q <= "111";
			
		elsif (clk'event AND clk = '1') then -- TESTING THE CLOCK SIGNAL IN THE UP EDGE

				Q <= data;
				
			end if; -- END FOR RESET, SET AND CLOCK
	end process;  -- ENDING THE PROCESS
end Hardware;    -- ENDING THE ARCHITECTURE
