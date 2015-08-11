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

Flow Status	Successful - Tue Aug 11 06:03:56 2015
Quartus II 64-Bit Version	13.0.1 Build 232 06/12/2013 SP 1 SJ Web Edition
Revision Name	FGPAmstrad_MiST_top
Top-level Entity Name	FGPAmstrad_MiST_top
Family	Cyclone III
Device	EP3C25E144C8
Timing Models	Final
Total logic elements	13,933 / 24,624 ( 57 % )
Total combinational functions	13,110 / 24,624 ( 53 % )
Dedicated logic registers	4,775 / 24,624 ( 19 % )
Total registers	4791
Total pins	70 / 83 ( 84 % )
Total virtual pins	0
Total memory bits	532,496 / 608,256 ( 88 % )
Embedded Multiplier 9-bit elements	30 / 132 ( 23 % )
Total PLLs	1 / 4 ( 25 % )

