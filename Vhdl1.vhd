LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY vhdl1 IS
PORT(
	CLOCK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	IR2	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	PC2   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	IR3	: OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
	X3		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	Y3 	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	R1		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	R2		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	MP2 : OUT STD_LOGIC;
	MD3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MP1 : OUT STD_LOGIC
	);
  end vhdl1;

 
ARCHITECTURE a OF vhdl1 IS 

signal MP3 : STD_LOGIC; 
signal MP4 : STD_LOGIC_VECTOR(1 DOWNTO 0);
 
  
  Begin
	
	PROCESS(CLOCK, RESET)
	begin
		IF reset = '1' THEN
		
		ELSIF clock'EVENT AND clock = '1' THEN 
				
				IR3(13 DOWNTO 0) <= IR2(31 DOWNTO 18); --fwr op + ra + rb + rc to alu
			
			
			CASE IR2(31 DOWNTO 27) IS
				
				--relative instruction or branch-link instructions PC2
				WHEN "00010" => --load relative 
					MP1 <= '0';
					MP3 <= '0';	 -- PC2
					MP4(1 DOWNTO 0) <= "00"; -- c1
				WHEN "00100" => --store relative
					MP1 <= '0';
					MP2 <= '1'; --ra
					MP3 <= '0';	-- PC2
					MP4(1 DOWNTO 0) <= "00"; -- c1
				WHEN "00110" => --LAR
					MP1 <= '0';
					MP3 <= '0';	-- PC2
					MP4(1 DOWNTO 0) <= "00"; -- c1
				WHEN "01000" => --Branch nothing should hapen for branches
					MP1 <= '1';
					MP3 <= '0';	-- PC2
					MP4(1 DOWNTO 0) <= "00"; --Relative instructions c1
					MD3(31 DOWNTO 0) <= R2(31 DOWNTO 0);
				WHEN "01001" => --Branch left nothing should hapen for branches
					MP1 <= '1';
					MP3 <= '0';	-- PC2
					MP4(1 DOWNTO 0) <= "00"; --Relative instructions c1
					MD3(31 DOWNTO 0) <= R2(31 DOWNTO 0);
				--displacment calculations or arithmatic logic instructions R[rb]
				WHEN "00001" => --Load
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "01";
				WHEN "00011" => --store
					MP1 <= '0';
					MP2 <= '1'; --ra
					MP3 <= '1';	--rb
					MP4(1 DOWNTO 0) <= "01";
				WHEN "00101" => --LA
					MP1 <= '0';
					MP3 <= '1';	--rb
					MP4(1 DOWNTO 0) <= "01";
				WHEN "01100" => --add
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "01101" => --addi
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "01110" => --sub
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "01111" => --neg
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "10100" => --and
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "10101" => --andi
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "10110" => --or
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "10111" => --ori
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "11000" => --not
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "10";
				WHEN "11010" => --SHR
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <="11";
				WHEN "11011" => --shra
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "11";
				WHEN "11100" => --shl
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "11";
				WHEN "11101" => --shc
					MP1 <= '0';
					MP3 <= '1'; --rb
					MP4(1 DOWNTO 0) <= "11";
				WHEN OTHERS =>
					MP1 <= '0';
					MP2 <= '0';
					MP3 <= '0';
					MP4(1 DOWNTO 0) <= "00";
			END CASE;
			
			
				
			--MP3
			CASE MP3 IS
				WHEN '0' => --Relative
					X3(31 DOWNTO 0) <= PC2(31 DOWNTO 0);
				WHEN '1' => --Displacment and arithmatic 	
					X3(31 DOWNTO 0) <= R1(31 DOWNTO 0);
			END CASE;
				
			--MP4 
			CASE MP4(1 DOWNTO 0) IS
				WHEN "00" => 
					Y3(31 DOWNTO 0) <= SXT(IR2(21 DOWNTO 0), 32); --c1
				WHEN "01" =>
					Y3(31 DOWNTO 0) <= SXT(IR2(16 DOWNTO 0), 32); --c2
				WHEN "10" =>
					Y3(31 DOWNTO 0) <= R2(31 DOWNTO 0); --R[rc]
				WHEN "11" =>
					IF IR2(20 DOWNTO 16) = "000" THEN --if rc = 0
						Y3(31 DOWNTO 0) <= SXT(IR2(3 DOWNTO 0), 32); --count
						ELSE
						Y3(31 DOWNTO 0) <= R2(31 DOWNTO 0); --R[rc]
					END IF;
			WHEN OTHERS =>
			END CASE;		
					
					
	END IF;		
	END PROCESS;
  END ARCHITECTURE;
  
  
  