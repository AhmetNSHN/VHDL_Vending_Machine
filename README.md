# VHDL Vending Machine

This project implements a Cola vending machine using VHDL. You can see diagrams below.


## Overview

The vending machine accepts three types of coins: 
- **D1** = $1
- **D2** = $2
- **D5** = $5

The machine has two output signals:
- **give_can**: When set to `1`, the machine dispenses a can of cola.
- **give_change**: When set to `1`, the machine dispenses change.

### State Machine (Moore Machine)

The vending machine operates as a Moore state machine with four distinct states:

1. **insert_coin**: 
   - The machine remains in this state when no coin is inserted.
   - Upon inserting `$1`, the state transitions to `insert_again`, waiting for an additional coin.
   - Inserting `$2` transitions the state to `givecan`, setting the `give_can` signal to `1`.
   - Inserting `$5` transitions the state to `givechange`, setting both the `give_can` and `give_change` signals to `1`.

2. **insert_again**:
   - The machine enters this state if the user has not yet inserted enough coins to purchase a can.
   - If an additional `$1` is inserted, the state transitions to `givecan`.
   - If `$2` or `$5` is inserted, the state transitions to `givechange`.

3. **givecan**:
   - In this state, the machine sets the `give_can` signal to `1`, dispensing a can.
   - The machine then returns to the `insert_coin` state.

4. **givechange**:
   - The machine enters this state if more than `$2` is accumulated.
   - Both `give_can` and `give_change` signals are set to `1`, dispensing a can and the appropriate change.
   - The machine then returns to the `insert_coin` state.

## Diagrams

### State Diagram
![State Diagram](https://user-images.githubusercontent.com/64427438/234561397-68473bcc-4bf2-4533-9413-5b022f2bbe84.png)

### Signal Waveform
![Signal Waveform](https://user-images.githubusercontent.com/64427438/234562504-a87bf596-d163-4607-8ebd-bae8f37df0ee.png)

## Summary

This VHDL project effectively models a simple vending machine, capable of handling various coin inputs and providing appropriate outputs. The state machine design ensures that the machine operates efficiently, transitioning between states based on the user's input to dispense the correct products and change.
