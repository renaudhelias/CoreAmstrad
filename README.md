# CoreAmstrad
CoreAmstrad source code

This core was refactored into Xilinx NEXYS4 dev platform, and then translated finally into MiST-board final platform (Altera)

* vhd : vhdl files
* v : verilog files (MiST-board controllers, added in main quartus schematic)

* qpf : quartus project (FGPAmstrad.qpf)
* bdf : quartus visual schematic (FGPAmstrad_MiST_top.bdf)
* bsf : quartus visual component
* sdc : quartus time constraints (FPGAmstrad_MiST_top.sdc)
* qsf : quartus port mapping (FPGAmstrad_MiST_top.qsf)

* xise : Xilinx webpack project (BuildYourOwnZ80Computer.xise/gise)
* sch : Xilinx webpack visual schematic
* sym : Xilinx webpack visual component
* ucf : Xilinx webpack time constraints and port mapping (Nexys4_Master.ucf)

* vhf : vhd file generated from sch file

* FPGAmstrad_amstrad_motherboard : amstrad_motherboard.sch Xilinx schematic converted into a vhf/vhd/bsf Quartus component
* FPGAmstrad_amstrad_video : amstrad_video.sch Xilinx schematic converted into a vhf/vhd/bsf Quartus component
* FPGAmstrad_bootloader_sd : bootloader_sd.sch Xilinx schematic converted into a vhf/vhd/bsf Quartus component

MIST_* MiST glue code (added in main quartus schematic)







