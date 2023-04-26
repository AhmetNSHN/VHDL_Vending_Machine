# VHDL_Vending_Machine
Cola vending machine design written with VHDL

<img width="531" alt="Diagram" src="https://user-images.githubusercontent.com/64427438/234561397-68473bcc-4bf2-4533-9413-5b022f2bbe84.png">



There are two output signals; give_can, give_change. Machine give can if give_can is equal to 1 and give change if give_change is equal to 1. Machine Have 4 States(Moore Machine):
insert_coin: machine will remain in this state if there is no coin.when we inset 1$ it change state to insert_again and wait for another coin. If client insert 2$ state become “givecan" which change give_can signal  to 1. If we insert 5$ state become givechange.
Insert_again:If machine is in this state it means client didn’t put enough coin to get can.If client insert 1$ state become givecan, if he insert 2$ or 5$ state become givechange.
givecan: this state change give_can signal to 1. Always turn back to insert_coin state.
givechange: Macine choose this state if more than 2$ accumulated in it. give_can and give_change signals become 1 in this state. Always turn back to insert_coin state.
