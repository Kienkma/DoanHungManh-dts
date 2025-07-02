library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF_CNT is
    Port ( 
        CLK : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(2 downto 0)
    );
end JK_FF_CNT;

architecture Behavioral of JK_FF_CNT is
    signal Q_tmp : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal J0, K0, J1, K1, J2, K2 : STD_LOGIC;
begin

--bai6: lui 7
--J0 <= Q_tmp(1) or Q_tmp(2);
--K0 <= '1';
--J1 <= not Q_tmp(0);
--K1 <= not Q_tmp(0);
--J2 <= (not Q_tmp(0)) and(not Q_tmp(1));
--K2 <= (not Q_tmp(0)) and(not Q_tmp(1));
    
--bai8: dem 2,4,6,8
-- J0 <= '0';
--K0 <= '0';
--J2 <=  Q_tmp(1);
--K2 <=  Q_tmp(1);
--J1 <= '1';
--K1 <= '1';
   
--bai10
-- J0 <= '1';
-- K0 <= (not Q_tmp(2)) and Q_tmp(1);
-- J1 <= Q_tmp(2) or Q_tmp(0);
-- K1 <= '1';
-- J2 <= Q_tmp(1);
-- K2 <=  Q_tmp(0);
   
--bai 11
-- J0 <= '1';
--K0 <= '0';
--J1 <= Q_tmp(0);
--K1 <= '1';
--J2 <= Q_tmp(1);
--K2 <=  Q_tmp(1);
  
--bai 15
    J0 <= Q_tmp(2) ;
    K0 <= '1';
    J1 <= '1';
    K1 <= '1';
    J2 <= Q_tmp(1);
    K2 <=  Q_tmp(1);
    
    FF0: entity work.JK_FF
        port map (
            J => J0,
            K => K0,
            CLK => CLK,
            Q => Q_tmp(0),
            Q_inv => open
        );

    
    FF1: entity work.JK_FF
        port map (
            J => J1,
            K => K1,
            CLK => CLK,
            Q => Q_tmp(1),
            Q_inv => open
        );

   
    FF2: entity work.JK_FF
        port map (
            J => J2,
            K => K2,
            CLK => CLK,
            Q => Q_tmp(2),
            Q_inv => open
        );
    Q <= Q_tmp;

end Behavioral;
