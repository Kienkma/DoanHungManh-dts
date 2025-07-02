library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt_6 is
    Port ( 
        CLK        : in  STD_LOGIC;
        cnt6       : out STD_LOGIC_VECTOR(2 downto 0);  -- Đếm từ 000 đến 101
        carry_out6 : out STD_LOGIC                      -- = '1' khi cnt = "101" (5)
    );
end cnt_6;

architecture Structural of cnt_6 is
    component JK_FF
        Port ( 
            J     : in  STD_LOGIC;
            K     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;

    signal Q_sig      : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Q_inv_sig  : STD_LOGIC_VECTOR(2 downto 0);
    signal J, K       : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- FF0: luôn toggle
    J(0) <= '1';
    K(0) <= '1';

    -- FF1: toggle khi Q0 = 1
    J(1) <= Q_sig(0);
    K(1) <= Q_sig(0);

    -- FF2: toggle khi Q1 AND Q0 = 1
    J(2) <= Q_sig(1) and Q_sig(0);
    K(2) <= Q_sig(1) and Q_sig(0);

    -- Kết nối Flip-Flops
    FF0: JK_FF port map (J(0), K(0), CLK, Q_sig(0), Q_inv_sig(0));
    FF1: JK_FF port map (J(1), K(1), CLK, Q_sig(1), Q_inv_sig(1));
    FF2: JK_FF port map (J(2), K(2), CLK, Q_sig(2), Q_inv_sig(2));

    -- Output
    cnt6       <= Q_sig;
    carry_out6 <= '1' when Q_sig = "101" else '0';

end Structural;
