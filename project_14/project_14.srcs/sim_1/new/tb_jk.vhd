library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_JK_FF_CNT is
end tb_JK_FF_CNT;

architecture behavior of tb_JK_FF_CNT is

    -- Gọi đúng entity cần test
    component JK_FF_CNT
        Port (
            CLK : in STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Tín hiệu mô phỏng
    signal clk   : STD_LOGIC := '0';
    signal q_out : STD_LOGIC_VECTOR(2 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    -- Liên kết DUT
    uut: JK_FF_CNT port map (
        CLK => clk,
        Q   => q_out
    );

    -- Tạo clock
    clk_process: process
    begin
        while true loop  -- chạy 30 chu kỳ
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

end behavior;
