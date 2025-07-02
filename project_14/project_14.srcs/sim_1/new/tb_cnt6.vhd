library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_counter6 is
end tb_counter6;

architecture behavior of tb_counter6 is

    -- Gọi đúng entity cần test
    component counter6
        Port (
            CLK        : in  STD_LOGIC;
            Q          : out STD_LOGIC_VECTOR(2 downto 0);
            carry_out  : out STD_LOGIC
        );
    end component;

    -- Tín hiệu mô phỏng
    signal clk        : STD_LOGIC := '0';
    signal q_out      : STD_LOGIC_VECTOR(2 downto 0);
    signal carry_flag : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin

    -- Kết nối DUT
    uut: counter6 port map (
        CLK       => clk,
        Q         => q_out,
        carry_out => carry_flag
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
