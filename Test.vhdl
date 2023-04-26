library IEEE;
use IEEE.std_logic_1164.all;

entity vending_machine is
end entity;

architecture testbench of vending_machine is
   signal clock:  std_logic;
   signal reset:  std_logic;
   signal D1 :  std_logic;
   signal D2 :  std_logic;
   signal D5 :  std_logic;
   signal give_can :  std_logic;
   signal give_change :  std_logic;

   BEGIN
    vm_control: entity work.io
    port map (
    clock => clock,
    reset => reset,
    D1 => D1,
    D2 => D2,
    D5 => D5,
    give_can => give_can,
    give_change => give_change);


  proc_clock: process
  begin
    clock <= '0';
    loop
      wait for 10 ns;
      clock <= not clock;
    end loop;
  end process;

  proc_reset: process
  begin
    reset <= '1';
    wait until rising_edge(clock);
    wait for 2 ns;
    reset <= '0';
    wait;
  end process;

  proc_stimulus: process
  begin
  D1 <= '0';
  D2 <= '0';
  D5 <= '0';
  wait until falling_edge(reset);

  --no coin
  wait until falling_edge(clock);
  D1 <= '0';
  D2 <= '0';
  D5 <= '0';

  --insert 1$
  wait until falling_edge(clock);
  D1 <= '1';
  D2 <= '0';
  D5 <= '0';
  wait until falling_edge(clock);
  -- insert 1$ again to get can
  wait until falling_edge(clock);
  D1 <= '1';
  D2 <= '0';
  D5 <= '0';

  -- insert 1$
  wait until falling_edge(clock);
  D1 <= '1';
  D2 <= '0';
  D5 <= '0';
  -- insert 2$ to get can
  wait until falling_edge(clock);
  D1 <= '0';
  D2 <= '1';
  D5 <= '0';

  -- insert 1$
  wait until falling_edge(clock);
  D1 <= '1';
  D2 <= '0';
  D5 <= '0';
  wait until falling_edge(clock);
  -- insert 5$ to get can
  wait until falling_edge(clock);
  D1 <= '0';
  D2 <= '0';
  D5 <= '1';
  wait until falling_edge(clock);

  -- insert 2$ to get can
  wait until falling_edge(clock);
  D1 <= '0';
  D2 <= '1';
  D5 <= '0';
  wait until falling_edge(clock);

  -- insert 5$ to get can
  wait until falling_edge(clock);
  D1 <= '0';
  D2 <= '0';
  D5 <= '1';
  wait until falling_edge(clock);

  wait until falling_edge(clock);
  report "Finished simulation" severity failure;
  end process;


end testbench;
