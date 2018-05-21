LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY RA_WRITE IS
PORT(
	CLOCK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	IR5 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
	Z5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--	A3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
--	R3 : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	W3 : OUT STD_LOGIC
	);
  end RA_WRITE;

 
ARCHITECTURE a OF RA_WRITE IS 
  
  
  Begin
	
	PROCESS(CLOCK, RESET)
	begin
		IF reset = '1' THEN
		
		ELSIF clock'EVENT AND clock = '1' THEN 
			CASE IR5(7 DOWNTO 3) IS
				WHEN "00001" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "00010" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "00101" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "00110" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "01001" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "01100" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "01101" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "01110" =>
				--	R3 <= Z5;
				--	A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "01111" =>
				--	R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "11010" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "11011" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "11100" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN "11101" =>
					--R3 <= Z5;
					--A3 <= IR5(2 DOWNTO 0);
					W3 <= '1';
				WHEN OTHERS =>
					W3 <= '0';
			END CASE;	
			
		END IF;	
	END PROCESS;
  END ARCHITECTURE;