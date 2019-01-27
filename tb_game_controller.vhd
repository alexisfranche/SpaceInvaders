library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;


Entity tb_game_controller is
end tb_game_controller;

Architecture behaviour of tb_game_controller is
	component game_controller is
		port(
		clk             : in std_logic; -- Clock for the system
        	rst             : in std_logic; -- Resets the state machine
		tmp 		: in std_logic; -- check gamoeover
        		-- Inputs
        	shoot           : in std_logic; -- User shoot
        	move_left       : in std_logic; -- User left
        	move_right      : in std_logic; -- User right
		  
		  pixel_x         : in integer; -- X position of the cursor
		  pixel_y		   : in integer; -- Y position of the cursor
        
		  -- Outputs
        	pixel_color		: out std_logic_vector (2 downto 0)
         
         );
end component;
		--Initiliaze signals
		signal clk_in          :  std_logic; 
        	signal rst_in          :  std_logic; 
        	signal tmp_in		: std_logic;
        	signal shoot_in        :  std_logic; 
        	signal move_left_in    :  std_logic; 
        	signal move_right_in   :  std_logic;
		  
		signal pixel_x_in      :  integer; 
		signal pixel_y_in      :  integer; 
        
		  
        	signal pixel_color_out :  std_logic_vector (2 downto 0);

begin

	--Instantiate the game controller
	dut: game_controller	
	port map(
		clk => clk_in,             
        	rst  => rst_in,          

        	tmp => tmp_in,
        	shoot => shoot_in,         
        	move_left => move_left_in,     
        	move_right => move_right_in,
		  
		  pixel_x => pixel_x_in,      
		  pixel_y => pixel_y_in,
        
	
        	pixel_color => pixel_color_out

	);

	test: process
	begin
	 

	rst_in <= '1';
	wait for 30ns;
	rst_in <= '0';

	shoot_in <= '1';
	wait for 30ns;
	shoot_in <= '0';
	--assert dut.current_state = "00000000" report "Error, case 0" severity Error;

	--(dut.aliens(59).visible = '1');
	--dut.aliens(59).y_pos <= 416;

	--assert dut.current_state = "00000011" report "Error, case 1" severity Error;
	tmp_in <= '1';
	wait for 10ns;
 	tmp_in <= '0';
	end process;
	
	clk_process: process
	begin
		clk_in <= '0';
		wait for 5ns;
		clk_in <= '1';
		wait for 5ns;
	end process;



end behaviour;