library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_CNT is
    Port (
        CLK : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(3 downto 0)
    );
end DFF_CNT;

architecture Behavioral of DFF_CNT is
    signal Q_tmp : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal D0, D1, D2, D3 : STD_LOGIC;
begin

--bai9: dem 1,3,5,6
-- D3 <= '0';
--D0 <=  Q_tmp(1);
--D1 <= ((not Q_tmp(0)) and (not Q_tmp(2))) or(not Q_tmp(1));
--D2 <= (Q_tmp(0) and Q_tmp(1)) or ( Q_tmp(2) and (not Q_tmp(1)));

--bai12
D0 <= (not Q_tmp(1)) or (not Q_tmp(3)) or ((not Q_tmp(2)) and Q_tmp(3));
D1 <=(not Q_tmp(1)) and Q_tmp(0);
D2 <= Q_tmp(2) xor Q_tmp(1);
D3 <= (Q_tmp(3) and (not Q_tmp(1))) or (Q_tmp(3) and(not Q_tmp(2)))or((not Q_tmp(3)) and Q_tmp(2) and Q_tmp(1));

    FF0: entity work.D_FF
        port map (
            D => D0,
            CLK => CLK,
            Q => Q_tmp(0),
            Q_inv => open
        );

    FF1: entity work.D_FF
        port map (
            D => D1,
            CLK => CLK,
            Q => Q_tmp(1),
            Q_inv => open
        );

    FF2: entity work.D_FF
        port map (
            D => D2,
            CLK => CLK,
            Q => Q_tmp(2),
            Q_inv => open
        );

    FF3: entity work.D_FF
        port map (
            D => D3,
            CLK => CLK,
            Q => Q_tmp(3),
            Q_inv => open
        );

    Q <= Q_tmp;
end Behavioral;
