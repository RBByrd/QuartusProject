LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
LIBRARY Altera_mf;
USE altera_mf.altera_mf_components.all;
ENTITY MEM_ACCESS IS 
PORT( 
	clock, reset : IN STD_LOGIC; 
   IR4 : IN STD_LOGIC_VECTOR (7 DOWNTO 0); 
   Z4 : IN STD_LOGIC_VECTOR (31 DOWNTO 0); 
   MD4 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);  
   IR5 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);	
   Z5  : OUT STD_LOGIC_VECTOR (31 DOWNTO 0) 
   ); 
END MEM_ACCESS; 

ARCHITECTURE a OF MEM_ACCESS IS
	
	--SIGNAL state: STATE_TYPE;
	signal MWo : STD_LOGIC;
	Signal SMDo : STD_LOGIC_VECTOR (31 DOWNTO 0);
	Signal SMDi : STD_LOGIC_VECTOR (31 DOWNTO 0);
	Signal SMARo : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL MP5 : STD_LOGIC;

BEGIN

   
DATA_memory: altsyncram 
    GENERIC MAP( 
  operation_mode => "SINGLE_PORT", 
      width_a => 32, 
      widthad_a => 8, 
      lpm_type  => "altsyncram", 
      outdata_reg_a => "UNREGISTERED", 
       -- Reads in mif file for initial program and data values 
      init_file => "data.mif", 
      intended_device_family => "Cyclone" 
  ) 
    PORT MAP( 
		wren_a => MWo, 
      data_a => SMDo, 
		q_a => SMDi, 
		clock0 => clock, 
      address_a => SMARo  
  ); 
  
	SMARo <= Z4(7 DOWNTO 0);
	SMDo  <= MD4;
	
 PROCESS(CLOCK, RESET)
 BEGIN
		
		IF reset = '1'then

		ELSIF clock'EVENT AND clock = '1' THEN
		
			CASE IR4(7 DOWNTO 3) IS -- TAKES OP CODE TO DETERMINE LD/ST other
				WHEN "00001" => --LOAD 
					Z5 <= SMDi;
					MWo <= '0';
					IR5 <= IR4;
				WHEN "00010" => -- LDR
					Z5 <= SMDi;
					MWo <= '0';
					IR5 <= IR4;
				WHEN "00011" => -- ST
					MWo <= '1';
					IR5 <= IR4;
				WHEN "00100" => -- STR
					MWo <= '1';
					IR5 <= IR4;
				WHEN OTHERS =>
					Z5 <= Z4;
					MWo <= '0';
					IR5 <= IR4;
			END CASE;		
		
		end IF;
		
END PROCESS;
END ARCHITECTURE;