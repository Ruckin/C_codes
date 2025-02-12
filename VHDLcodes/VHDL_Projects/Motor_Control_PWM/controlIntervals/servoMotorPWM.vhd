-- VHDL CONTROL OF SERVO MOTOR BY INTERAVLS
-- FREDERICO ANTONIAZZI - 17/07/2024
-- 
-- THIS CODE IMPLEMENTS A CODE FOR CONTROLLING A SERVO MOTOR POSITION BASED ON INTERVALS USING PWM IN VHDL
--

-- LOADING THE LIBRARIES:
library IEEE;
use IEEE.numeric_std.all;    -- USING THE LIBRARY FOR NUMERIC CALCULATIONS
use IEEE.std_logic_1164.all; -- USING THE LIBRARY FOR LOGIC DECLARATIONS


-- CREATING THE ENTITY:
entity servoMotorPWM is port
(

	clk : in std_logic;                    -- CLOCK INPUT
	rst : in std_logic;                    -- RESET INPUT
	ADC : in std_logic_vector(7 downto 0); -- INPUT OF ADC CONVERTER
	
	Segments : out std_logic_vector(6 downto 0); -- 7-SEGMENT DISPLAY ACTIVATION POSITIONS
	display  : out std_logic_vector(3 downto 0); -- DISPLAY OF INTERVAL OF POSITIONS SELECTED
	servo    : out std_logic                     -- SERVO MOTOR POSITION OUTPUT

); 
end servoMotorPWM;-- END OF THE ENTITY

-- CREATING THE ARCHITECTURE FOR THE HARDWARE IMPLEMENTATION:
architecture Hardware of servoMotorPWM is

signal counter : integer range 0 to 3333 := 0; -- COUNTER SIGNAL DECLARATION, INITIALIZATION(0) AND RANGE OF ADMISSIBLE VALUES
signal temporal : std_logic;
signal cnt : unsigned(11 downto 0) := (others => '0');
signal PWM_1 : unsigned(5 downto 0);
signal PWM : std_logic_vector(3 downto 0);

begin -- BEGINNING THE ARCHITECTURE

-- INITIATING THE FREQUENCY DIVISION PROCESS: 
Frequency_division_process : process(clk, rst, counter, temporal)
	begin
	
		if(rst = '1') then -- TESTING IF RESET IS ON(PRESSED)
			
			counter <= 0;    --
			temporal <= '0'; --
		-- DIFFERENT PROBABLE SINTAXE:
	-- elsif (clk'event AND clk = '1') then -- DETECTION OF THE POSTIVE ESGE OF THE CLOCK
		elsif(rising_edge(clk)) then
			if(counter = 3333) then            -- WHEN 1666 POSITIVE EDGES OF THE CLOCK
				
				temporal <= not(temporal); -- CHANGING THE LOGIC VALUE OF TEMPORAL 0->1 OR 1->0
				counter <= 0;              -- RESETING THE COUNTER
				
			else
			
				counter <= counter + 1;    -- IF THE TIME DIDN'T PASS SO WE UPDATE COUNTER UNTIL THAT HAPPENS
				
			end if;                        -- ENDING THE IF FOR
		end if;                           -- ENDING THE IF FOR
end process Frequency_division_process; -- ENDING THE PROCESS OF FREQUENCY DIVISION

-- INITIATING THE PWM CALCULATION PROCESS:
calculating_PWM_process : process(ADC, rst)
	begin
		
		if(rst = '1') then		
			PWM <= "0000";
		
		elsif(ADC >= "00000000" AND ADC < "00010001") then
				PWM <= "0000";
				
		elsif(ADC >= "00010001" AND ADC < "00100010") then
				PWM <= "0001";
				
		elsif(ADC >= "00100010" AND ADC < "00110011") then
				PWM <= "0010";
				
		elsif(ADC >= "00110011" AND ADC < "01000100") then
				PWM <= "0011";
		
		elsif(ADC >= "01000100" AND ADC < "01010101") then
				PWM <= "0100";
				
		elsif(ADC >= "01010101" AND ADC < "01100110") then
				PWM <= "0101";
				
		elsif(ADC >= "01100110" AND ADC < "01110111") then
				PWM <= "0110";
				
		elsif(ADC >= "01110111" AND ADC < "10001000") then
				PWM <= "0111";
				
		elsif(ADC >= "10001000" AND ADC < "10011001") then
				PWM <= "1000";
				
		elsif(ADC >= "10011001" AND ADC < "10101010") then
				PWM <= "1001";
				
		elsif(ADC >= "10101010" AND ADC < "10111011") then
				PWM <= "1010";
				
		elsif(ADC >= "10111011" AND ADC < "11001100") then
				PWM <= "1011";
		
		elsif(ADC >= "11001100" AND ADC < "11011101") then
				PWM <= "1100";
				
		elsif(ADC >= "11011101" AND ADC < "11101110") then
				PWM <= "1101";
				
		elsif(ADC >= "11101110" AND ADC < "11111111") then
				PWM <= "1110";
				
		elsif(ADC >= "11111111") then
				PWM <= "1111";
				
		else		
			PWM <= "1000";
			
		end if;                        -- ENDING IF FOR
end process calculating_PWM_process; -- ENDING THE PROCESS FOR CALCULATING THE PWM

-- INITIATING THE CONTROL OF THE SERVO MOTOR:
servo_control : process(cnt, PWM, rst, temporal, PWM_1)
	begin
	
		if(rst = '1') then
			
			cnt <= "111111111111";
			
		-- DIFFERENT PROBABLE SINTAXE:
	-- elsif(temporal'event AND temporal = '1') then
		elsif(rising_edge(temporal)) then
			if(cnt = 150) then
				
				cnt <= (others => '0');
				
			else
			
				cnt <= cnt + 1;
				
			end if; -- ENDING IF FOR
		end if;    -- ENDING IF FOR
		
		PWM_1 <= unsigned("00" & PWM) + 4; -- 
		
end process servo_control; -- ENDING THE PROCESS SERVO CONTROL

servo <= '1' when cnt < PWM_1 else '0';

Display <= "1110";

Segments <= "0000001" when PWM = "0000" else -- 0
				"1001111" when PWM = "0001" else -- 1
				"0010010" when PWM = "0010" else -- 2
				"0000110" when PWM = "0011" else -- 3
				"1001100" when PWM = "0100" else -- 4
				"0100100" when PWM = "0101" else -- 5
				"0100000" when PWM = "0110" else -- 6
				"0001111" when PWM = "0111" else -- 7
				"0000000" when PWM = "1000" else -- 8
				"0000100" when PWM = "1001" else -- 9
				"0001000" when PWM = "1010" else -- A
				"1100000" when PWM = "1011" else -- B DEVE SER O MINUSCULO(b)
				"0110001" when PWM = "1100" else -- C
				"1000010" when PWM = "1101" else -- D DEVE SER O MINUSCULO(d)
				"0110000" when PWM = "1110" else -- E
				"0111000" when PWM = "1111" else -- F
				"1111111";                       -- ERROR CASE

end Hardware; -- END OF ARCHITECTURE
