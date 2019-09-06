
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set BI_RBO_n [ create_bd_port -dir IO BI_RBO_n ]
  set GND [ create_bd_port -dir I GND ]
  set POWER [ create_bd_port -dir I POWER ]
  set Y0_n [ create_bd_port -dir O Y0_n ]
  set Y1_n [ create_bd_port -dir O Y1_n ]
  set Y2_n [ create_bd_port -dir O Y2_n ]
  set Y3_n [ create_bd_port -dir O Y3_n ]
  set Y4_n [ create_bd_port -dir O Y4_n ]
  set a [ create_bd_port -dir O a ]
  set b [ create_bd_port -dir O b ]
  set c [ create_bd_port -dir O c ]
  set clk_in [ create_bd_port -dir I clk_in ]
  set d [ create_bd_port -dir O d ]
  set e [ create_bd_port -dir O e ]
  set f [ create_bd_port -dir O f ]
  set g [ create_bd_port -dir O g ]

  # Create instance: BCD2SEG7_0, and set properties
  set BCD2SEG7_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_0 ]

  # Create instance: clk_div_0, and set properties
  set clk_div_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_0 ]
  set_property -dict [ list CONFIG.N {99999}  ] $clk_div_0

  # Create instance: clk_div_1, and set properties
  set clk_div_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_1 ]
  set_property -dict [ list CONFIG.N {99999999}  ] $clk_div_1

  # Create instance: decimal_counter_0, and set properties
  set decimal_counter_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_0 ]

  # Create instance: decimal_counter_1, and set properties
  set decimal_counter_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_1 ]

  # Create instance: decimal_counter_2, and set properties
  set decimal_counter_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_2 ]

  # Create instance: decimal_counter_3, and set properties
  set decimal_counter_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_3 ]

  # Create instance: decimal_counter_4, and set properties
  set decimal_counter_4 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_4 ]

  # Create instance: decode138_0, and set properties
  set decode138_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:decode138:1.0 decode138_0 ]

  # Create instance: four_2_input_nand_gate_0, and set properties
  set four_2_input_nand_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_nand_gate:1.0 four_2_input_nand_gate_0 ]

  # Create instance: mux_8_to_1_0, and set properties
  set mux_8_to_1_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_0 ]

  # Create instance: mux_8_to_1_1, and set properties
  set mux_8_to_1_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_1 ]

  # Create instance: mux_8_to_1_2, and set properties
  set mux_8_to_1_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_2 ]

  # Create instance: mux_8_to_1_3, and set properties
  set mux_8_to_1_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_3 ]

  # Create instance: six_not_gate_0, and set properties
  set six_not_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_0 ]

  # Create port connections
  connect_bd_net -net BCD2SEG7_0_a [get_bd_ports a] [get_bd_pins BCD2SEG7_0/a]
  connect_bd_net -net BCD2SEG7_0_b [get_bd_ports b] [get_bd_pins BCD2SEG7_0/b]
  connect_bd_net -net BCD2SEG7_0_c [get_bd_ports c] [get_bd_pins BCD2SEG7_0/c]
  connect_bd_net -net BCD2SEG7_0_d [get_bd_ports d] [get_bd_pins BCD2SEG7_0/d]
  connect_bd_net -net BCD2SEG7_0_e [get_bd_ports e] [get_bd_pins BCD2SEG7_0/e]
  connect_bd_net -net BCD2SEG7_0_f [get_bd_ports f] [get_bd_pins BCD2SEG7_0/f]
  connect_bd_net -net BCD2SEG7_0_g [get_bd_ports g] [get_bd_pins BCD2SEG7_0/g]
  connect_bd_net -net LT_n_1 [get_bd_ports POWER] [get_bd_pins BCD2SEG7_0/LT_n] [get_bd_pins BCD2SEG7_0/RBI_n] [get_bd_pins decode138_0/E1]
  connect_bd_net -net Net [get_bd_ports BI_RBO_n] [get_bd_pins BCD2SEG7_0/BI_RBO_n]
  connect_bd_net -net R0_1_1 [get_bd_ports GND] [get_bd_pins decimal_counter_0/R0_1] [get_bd_pins decimal_counter_0/R9_2] [get_bd_pins decimal_counter_1/R9_1] [get_bd_pins decimal_counter_1/R9_2] [get_bd_pins decimal_counter_2/R9_1] [get_bd_pins decimal_counter_2/R9_2] [get_bd_pins decimal_counter_3/R0_1] [get_bd_pins decimal_counter_3/R9_2] [get_bd_pins decimal_counter_4/R9_1] [get_bd_pins decimal_counter_4/R9_2] [get_bd_pins decode138_0/A2] [get_bd_pins decode138_0/E2_n] [get_bd_pins decode138_0/E3_n] [get_bd_pins mux_8_to_1_0/A2] [get_bd_pins mux_8_to_1_0/S_n] [get_bd_pins mux_8_to_1_1/A2] [get_bd_pins mux_8_to_1_1/S_n] [get_bd_pins mux_8_to_1_2/A2] [get_bd_pins mux_8_to_1_2/S_n] [get_bd_pins mux_8_to_1_3/A2] [get_bd_pins mux_8_to_1_3/S_n]
  connect_bd_net -net clk_div_0_clk_out [get_bd_pins clk_div_0/clk_out] [get_bd_pins decimal_counter_4/CP1_n]
  connect_bd_net -net clk_div_1_clk_out [get_bd_pins clk_div_1/clk_out] [get_bd_pins decimal_counter_0/CP1_n]
  connect_bd_net -net clk_in_1 [get_bd_ports clk_in] [get_bd_pins clk_div_0/clk_in] [get_bd_pins clk_div_1/clk_in]
  connect_bd_net -net decimal_counter_0_Qa [get_bd_pins decimal_counter_0/CP2_n] [get_bd_pins decimal_counter_0/Qa] [get_bd_pins four_2_input_nand_gate_0/A1] [get_bd_pins mux_8_to_1_2/D0]
  connect_bd_net -net decimal_counter_0_Qb [get_bd_pins decimal_counter_0/Qb] [get_bd_pins mux_8_to_1_0/D0]
  connect_bd_net -net decimal_counter_0_Qc [get_bd_pins decimal_counter_0/Qc] [get_bd_pins mux_8_to_1_1/D0]
  connect_bd_net -net decimal_counter_0_Qd [get_bd_pins decimal_counter_0/Qd] [get_bd_pins four_2_input_nand_gate_0/B1] [get_bd_pins mux_8_to_1_3/D0]
  connect_bd_net -net decimal_counter_1_Qa [get_bd_pins decimal_counter_1/CP2_n] [get_bd_pins decimal_counter_1/Qa] [get_bd_pins mux_8_to_1_2/D3]
  connect_bd_net -net decimal_counter_1_Qb [get_bd_pins decimal_counter_1/Qb] [get_bd_pins four_2_input_nand_gate_0/A4] [get_bd_pins mux_8_to_1_0/D3]
  connect_bd_net -net decimal_counter_1_Qc [get_bd_pins decimal_counter_1/Qc] [get_bd_pins four_2_input_nand_gate_0/B4] [get_bd_pins mux_8_to_1_1/D3]
  connect_bd_net -net decimal_counter_1_Qd [get_bd_pins decimal_counter_1/Qd] [get_bd_pins mux_8_to_1_3/D3]
  connect_bd_net -net decimal_counter_2_Qa [get_bd_pins decimal_counter_2/CP2_n] [get_bd_pins decimal_counter_2/Qa] [get_bd_pins mux_8_to_1_2/D1]
  connect_bd_net -net decimal_counter_2_Qb [get_bd_pins decimal_counter_2/Qb] [get_bd_pins four_2_input_nand_gate_0/A2] [get_bd_pins mux_8_to_1_0/D1]
  connect_bd_net -net decimal_counter_2_Qc [get_bd_pins decimal_counter_2/Qc] [get_bd_pins four_2_input_nand_gate_0/B2] [get_bd_pins mux_8_to_1_1/D1]
  connect_bd_net -net decimal_counter_2_Qd [get_bd_pins decimal_counter_2/Qd] [get_bd_pins mux_8_to_1_3/D1]
  connect_bd_net -net decimal_counter_3_Qa [get_bd_pins decimal_counter_3/CP2_n] [get_bd_pins decimal_counter_3/Qa] [get_bd_pins four_2_input_nand_gate_0/A3] [get_bd_pins mux_8_to_1_2/D2]
  connect_bd_net -net decimal_counter_3_Qb [get_bd_pins decimal_counter_3/Qb] [get_bd_pins mux_8_to_1_0/D2]
  connect_bd_net -net decimal_counter_3_Qc [get_bd_pins decimal_counter_3/Qc] [get_bd_pins mux_8_to_1_1/D2]
  connect_bd_net -net decimal_counter_3_Qd [get_bd_pins decimal_counter_3/Qd] [get_bd_pins four_2_input_nand_gate_0/B3] [get_bd_pins mux_8_to_1_3/D2]
  connect_bd_net -net decimal_counter_4_Qa [get_bd_pins decimal_counter_4/CP2_n] [get_bd_pins decimal_counter_4/Qa] [get_bd_pins decode138_0/A0] [get_bd_pins mux_8_to_1_0/A0] [get_bd_pins mux_8_to_1_1/A0] [get_bd_pins mux_8_to_1_2/A0] [get_bd_pins mux_8_to_1_3/A0]
  connect_bd_net -net decimal_counter_4_Qb [get_bd_pins decimal_counter_4/Qb] [get_bd_pins decode138_0/A1] [get_bd_pins mux_8_to_1_0/A1] [get_bd_pins mux_8_to_1_1/A1] [get_bd_pins mux_8_to_1_2/A1] [get_bd_pins mux_8_to_1_3/A1]
  connect_bd_net -net decimal_counter_4_Qd [get_bd_pins decimal_counter_4/Qd] [get_bd_pins decimal_counter_4/R0_1] [get_bd_pins decimal_counter_4/R0_2]
  connect_bd_net -net decode138_0_Y0_n [get_bd_ports Y0_n] [get_bd_pins decode138_0/Y0_n]
  connect_bd_net -net decode138_0_Y1_n [get_bd_ports Y1_n] [get_bd_pins decode138_0/Y1_n]
  connect_bd_net -net decode138_0_Y2_n [get_bd_ports Y2_n] [get_bd_ports Y4_n] [get_bd_pins decode138_0/Y2_n]
  connect_bd_net -net decode138_0_Y3_n [get_bd_ports Y3_n] [get_bd_pins decode138_0/Y3_n]
  connect_bd_net -net four_2_input_nand_gate_0_Y1 [get_bd_pins four_2_input_nand_gate_0/Y1] [get_bd_pins six_not_gate_0/A1]
  connect_bd_net -net four_2_input_nand_gate_0_Y2 [get_bd_pins four_2_input_nand_gate_0/Y2] [get_bd_pins six_not_gate_0/A2]
  connect_bd_net -net four_2_input_nand_gate_0_Y3 [get_bd_pins four_2_input_nand_gate_0/Y3] [get_bd_pins six_not_gate_0/A3]
  connect_bd_net -net four_2_input_nand_gate_0_Y4 [get_bd_pins four_2_input_nand_gate_0/Y4] [get_bd_pins six_not_gate_0/A4]
  connect_bd_net -net mux_8_to_1_0_Q [get_bd_pins BCD2SEG7_0/BCD_B] [get_bd_pins mux_8_to_1_0/Q]
  connect_bd_net -net mux_8_to_1_1_Q [get_bd_pins BCD2SEG7_0/BCD_C] [get_bd_pins mux_8_to_1_1/Q]
  connect_bd_net -net mux_8_to_1_2_Q [get_bd_pins BCD2SEG7_0/BCD_A] [get_bd_pins mux_8_to_1_2/Q]
  connect_bd_net -net mux_8_to_1_3_Q [get_bd_pins BCD2SEG7_0/BCD_D] [get_bd_pins mux_8_to_1_3/Q]
  connect_bd_net -net six_not_gate_0_Y1 [get_bd_pins decimal_counter_2/CP1_n] [get_bd_pins six_not_gate_0/Y1]
  connect_bd_net -net six_not_gate_0_Y2 [get_bd_pins decimal_counter_2/R0_1] [get_bd_pins decimal_counter_2/R0_2] [get_bd_pins decimal_counter_3/CP1_n] [get_bd_pins six_not_gate_0/Y2]
  connect_bd_net -net six_not_gate_0_Y3 [get_bd_pins decimal_counter_1/CP1_n] [get_bd_pins six_not_gate_0/Y3]
  connect_bd_net -net six_not_gate_0_Y4 [get_bd_pins decimal_counter_1/R0_1] [get_bd_pins decimal_counter_1/R0_2] [get_bd_pins six_not_gate_0/Y4]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


