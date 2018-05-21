LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY hazards02 IS
PORT(
	CLOCK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	IR3 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	IR5 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	MPB : OUT STD_LOGIC;
	MPC : OUT STD_LOGIC
	);
  end hazards02;

 
ARCHITECTURE a OF hazards02 IS 
  
  
  Begin
	
	PROCESS(CLOCK, RESET)
	begin
		IF reset = '1' THEN
		
		ELSIF clock'EVENT AND clock = '1' THEN 
			CASE IR5(7 DOWNTO 3) IS
				WHEN "00001" =>
					IF (IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3)) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "00010" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "00101" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "00110" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "01001" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "01100" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "01101" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "01110" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "01111" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "11010" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "11011" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "11100" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN "11101" =>
					IF IR5(2 DOWNTO 0) = IR3(5 DOWNTO 3) THEN
						MPB <= '1';
					ELSE
						MPB <= '0';
					end if;
					IF IR5(2 DOWNTO 0) = IR3(2 DOWNTO 0) THEN
						MPC <= '1';
						ELSE
						MPC <= '0';
					end if;
				WHEN OTHERS =>
					MPB <= '0';
					MPC <= '0';
			END CASE;	
			
		END IF;	
	END PROCESS;
  END ARCHITECTURE;