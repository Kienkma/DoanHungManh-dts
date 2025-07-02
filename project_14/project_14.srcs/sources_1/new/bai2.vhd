library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bai2 is
 Port (
  A, B, C: in std_logic;
  F: out std_logic
  );
end bai2;

architecture Behavioral of Bai2 is
signal not_A, term1, term2, term3, temp: std_logic;
begin
not_A <= A nor A;
term1 <= (not_A nor not_A) nor (B nor B);
term2 <= (not_A nor not_A) nor (C nor C);
term3 <= (B nor B) nor (C nor C);
temp <= term1 nor term2;
F <= temp nor term3;

end Behavioral;