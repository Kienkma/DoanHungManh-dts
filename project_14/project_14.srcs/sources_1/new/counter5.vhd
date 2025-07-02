library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt_5 is
    Port ( 
        CLK       : in  STD_LOGIC;
        cnt5       : out STD_LOGIC_VECTOR(2 downto 0);  -- Đầu ra counter (000 → 100)
        carry_out5 : out STD_LOGIC                      -- Báo tràn khi cnt = "100" (4)
    );
end cnt_5;

architecture Structural of cnt_5 is
    component JK_FF
        Port ( 
            J     : in  STD_LOGIC;
            K     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;
    
    signal Q_sig : STD_LOGIC_VECTOR(2 downto 0) := "000";  -- Tín hiệu nội bộ
    signal J, K  : STD_LOGIC_VECTOR(2 downto 0);           -- Điều khiển JK FF
    signal Q_inv_sig : STD_LOGIC_VECTOR(2 downto 0);       -- Ngõ ra đảo (không dùng)
    
begin
    -- Logic điều khiển J, K (từ bảng chuyển trạng thái)
    J(0) <= not Q_sig(2);                    -- FF0 luôn ở chế độ toggle (J=1, K=1) khi Q1=1
    K(0) <= '1';                 -- K0 = Q1
    
    J(1) <= Q_sig(0);                 -- J1 = Q0
    K(1) <= Q_sig(0);     -- K1 = Q0 OR Q2
    
    J(2) <= Q_sig(0) and Q_sig(1);    -- J2 = Q0 AND Q1
    K(2) <= '1';                      -- K2 luôn = 1 (reset khi cần)
    
    -- Kết nối 3 JK Flip-Flop
    FF0: JK_FF port map (J(0), K(0), CLK, Q_sig(0), Q_inv_sig(0));
    FF1: JK_FF port map (J(1), K(1), CLK, Q_sig(1), Q_inv_sig(1));
    FF2: JK_FF port map (J(2), K(2), CLK, Q_sig(2), Q_inv_sig(2));
    
    -- Đầu ra
    cnt5 <= Q_sig;
    carry_out5 <= Q_sig(2);
end Structural;