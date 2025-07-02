library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity tb_bai13 is
end tb_bai13;

architecture behavior of tb_bai13 is

    component bai13
        Port (
            CLK : in STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal clk   : STD_LOGIC := '0';
    signal q_out : STD_LOGIC_VECTOR(3 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    -- Liên kết với thiết kế cần test
    uut: bai13 port map (
        CLK => clk,
        Q   => q_out
    );

    -- Tạo xung clock
    clk_process: process
    begin
      while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
end behavior;
