library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity bai1 is
 Port (
  a,b,c: in std_logic;
  y: out std_logic
  );
end bai1;

architecture Behavioral of bai1 is
signal m,n,p,q,r: std_logic;
begin
m <= a nand a;
n <= m nand b;
p <= m nand c;
q <= n nand p;
r <= b nand c;
y <= q nand r;

end Behavioral;
