proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir {D:/The Second Semester/Digital Circuits and Logical Design Laboratory/Final Assignment/basys3_1/clock.cache/wt} [current_project]
  set_property parent.project_path {D:/The Second Semester/Digital Circuits and Logical Design Laboratory/Final Assignment/basys3_1/clock.xpr} [current_project]
  set_property ip_repo_paths {
  {d:/The Second Semester/Digital Circuits and Logical Design Laboratory/Final Assignment/basys3_1/clock.cache/ip}
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS42_1.0
  D:/BaiduNetdiskDownload/201803/74IP/xup_74LS148_1.0
  D:/BaiduNetdiskDownload/201803/74IP/xup_74LS90_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS21_1.0
  D:/BaiduNetdiskDownload/201803/74IP/xup_74LS48_1.0
  D:/BaiduNetdiskDownload/201803/74IP
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS30_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_SPI_master_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS138_1.0
  D:/BaiduNetdiskDownload/201803/74IP/xup_nand4_1
  D:/BaiduNetdiskDownload/201803/74IP/xup_74LS164_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS32_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS74_1.0
  D:/BaiduNetdiskDownload/201803/74IP/xup_clk_div_1.0
  D:/BaiduNetdiskDownload/201803/74IP/xup_74LS151_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_VGA_1440x900_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS27_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_UART_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS11_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS20_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS10_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS04_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS02_1.0
  D:/BaiduNetdiskDownload/201803/74IP/XUP_74LS00_1.0
} [current_project]
  set_property ip_output_repo {{d:/The Second Semester/Digital Circuits and Logical Design Laboratory/Final Assignment/basys3_1/clock.cache/ip}} [current_project]
  add_files -quiet {{D:/The Second Semester/Digital Circuits and Logical Design Laboratory/Final Assignment/basys3_1/clock.runs/synth_1/design_1_wrapper.dcp}}
  read_xdc {{D:/The Second Semester/Digital Circuits and Logical Design Laboratory/Final Assignment/basys3_1/clock.srcs/constrs_1/new/clock.xdc}}
  link_design -top design_1_wrapper -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force design_1_wrapper_opt.dcp
  catch {report_drc -file design_1_wrapper_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file design_1_wrapper.hwdef}
  place_design 
  write_checkpoint -force design_1_wrapper_placed.dcp
  catch { report_io -file design_1_wrapper_io_placed.rpt }
  catch { report_utilization -file design_1_wrapper_utilization_placed.rpt -pb design_1_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file design_1_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force design_1_wrapper_routed.dcp
  catch { report_drc -file design_1_wrapper_drc_routed.rpt -pb design_1_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file design_1_wrapper_timing_summary_routed.rpt -rpx design_1_wrapper_timing_summary_routed.rpx }
  catch { report_power -file design_1_wrapper_power_routed.rpt -pb design_1_wrapper_power_summary_routed.pb }
  catch { report_route_status -file design_1_wrapper_route_status.rpt -pb design_1_wrapper_route_status.pb }
  catch { report_clock_utilization -file design_1_wrapper_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force design_1_wrapper.bit 
  catch { write_sysdef -hwdef design_1_wrapper.hwdef -bitfile design_1_wrapper.bit -meminfo design_1_wrapper.mmi -ltxfile debug_nets.ltx -file design_1_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

