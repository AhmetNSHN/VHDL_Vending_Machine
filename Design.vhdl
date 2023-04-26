
library IEEE;
use IEEE.std_logic_1164.all;
ENTITY io IS
PORT(
   clock: IN std_logic;
   reset: IN std_logic;
   D1 : IN std_logic;
   D2 : IN std_logic;
   D5 : IN std_logic;
   give_can : OUT std_logic;
   give_change : OUT std_logic);
END io;

ARCHITECTURE vending_machine OF io IS
TYPE state_type IS (insert_coin, insert_again, givecan, givechange);
signal state : state_type;
begin
   U_Moore: process(clock, reset)
   BEGIN
   IF(reset = '1') THEN
      state <= insert_coin;
   ELSIF rising_edge(clock) then
      case state is
        WHEN insert_coin =>
           IF D1 = '1' THEN
              state <= insert_again;
           ELSIF D2 = '1' THEN
              state <= givecan;
           ELSIF D5 = '1' THEN
              state <= givechange;
           ELSE
              state <= insert_coin;
           END IF;
        WHEN insert_again =>
           IF D1 = '1' THEN
              state <= givecan;
           ELSIF D2 = '1' THEN
              state <= givechange;
           ELSIF D5 = '1' THEN
              state <= givechange;
           END IF;
        WHEN givecan =>
           state <= insert_coin;
        WHEN givechange =>
           state <= insert_coin;
      END CASE;
   END IF;
   END process;

WITH state SELECT
give_change <= '1' WHEN givechange,
               '0' WHEN OTHERS;
WITH state SELECT
   give_can <= '1' WHEN givecan,
               '1' WHEN givechange,
               '0' WHEN OTHERS;
END vending_machine;
