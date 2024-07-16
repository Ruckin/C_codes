-- 016 VHDL CODE
-- FREDERICO ANTONIAZZI - 01/07/2024
--
-- VHDL CODE FOR IMPLEMENTING A FINITE STATE MACHINE
-- USING MOORE APPROACH
--

-- CREATING THE ENTITY
entity FiniteStateMachine is port
(

clk : in bit;     -- CLOCK INPUT
rst : in bit;     -- RESET INPUT
control : in bit; -- CONTROL OF SEQUENCE

Q : out bit_vector(1 downto 0) -- STATE OUTPUT

);
end FiniteStateMachine; -- ENDING THE ENTITY

-- CREATING THE ARCHITECTURE
architecture Hardware of FiniteStateMachine is

type st is (case_3, case_2, case_1, case_0); -- NEW DEFINITION TYPE
signal state : st;                           -- CREATING A SIGNAL AND INITIALIZATION

begin

	myStateMachine : process(rst, clk)
	begin
	
		if (rst = '1') then
		
			state <= case_0; -- STARTING
			
		elsif (clk'event AND clk = '1') then
		
			case state is			
				when case_0 =>
					if control = '1' then 
						state <= case_1;
					else                  
						state <= case_3;
					
					end if;
				when case_1 =>
					if control = '1' then 
						state <= case_2;
					else                  
						state <= case_0;
					
					end if;
				when case_2 =>
					if control = '1' then 
						state <= case_3;
					else                  
						state <= case_1;
					
					end if;
				when case_3 =>
					if control = '1' then 
						state <= case_0;
					else                  
						state <= case_2;
					
					end if;
			end case;
		end if;
	end process myStateMachine;
	
	with state select
		Q <= "00" when case_0,
		     "01" when case_1,
		     "11" when case_2,
		     "10" when case_3;
	
end Hardware; -- ENDING THE ARCHITECTURE
