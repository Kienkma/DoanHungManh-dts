library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cnt_5 is
end tb_cnt_5;

architecture behavior of tb_cnt_5 is

    -- Gọi đúng component từ entity gốc
    component cnt_5
        Port ( 
            CLK       : in  STD_LOGIC;
            cnt5       : out STD_LOGIC_VECTOR(2 downto 0);
            carry_out5 : out STD_LOGIC
        );
    end component;

    -- Tín hiệu mô phỏng
    signal clk        : STD_LOGIC := '0';
    signal cnt_output : STD_LOGIC_VECTOR(2 downto 0);
    signal carry_out  : STD_LOGIC;

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Liên kết DUT (Design Under Test)
    uut: cnt_5 port map (
        CLK       => clk,
        cnt5       => cnt_output,
        carry_out5 => carry_out
    );
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;
end behavior;
