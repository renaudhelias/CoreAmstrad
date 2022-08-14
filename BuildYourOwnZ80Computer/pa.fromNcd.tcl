
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name BuildYourOwnZ80Computer -dir "C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/planAhead_run_2" -part xc7a100tcsg324-1
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_switch_z80_vga_sd.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer} }
set_property target_constrs_file "Nexys4_Master.ucf" [current_fileset -constrset]
add_files [list {Nexys4_Master.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_switch_z80_vga_sd.ncd"
if {[catch {read_twx -name results_1 -file "C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_switch_z80_vga_sd.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/fpgamstrad/BuildYourOwnZ80Computer_amstrad_vhdl_002_repack/BuildYourOwnZ80Computer/amstrad_switch_z80_vga_sd.twx\": $eInfo"
}
