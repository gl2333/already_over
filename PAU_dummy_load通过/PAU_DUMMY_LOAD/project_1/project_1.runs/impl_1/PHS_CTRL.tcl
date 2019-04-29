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
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param general.maxThreads 8
  set_param xicom.use_bs_reader 1
  set_param simulator.modelsimInstallPath C:/modeltech64_10.4/win64
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir E:/Users/Ykersatomi/Desktop/project_1/project_1.cache/wt [current_project]
  set_property parent.project_path E:/Users/Ykersatomi/Desktop/project_1/project_1.xpr [current_project]
  set_property ip_output_repo E:/Users/Ykersatomi/Desktop/project_1/project_1.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  add_files -quiet E:/Users/Ykersatomi/Desktop/project_1/project_1.runs/synth_1/PHS_CTRL.dcp
  add_files -quiet e:/Users/Ykersatomi/Desktop/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.dcp
  set_property netlist_only true [get_files e:/Users/Ykersatomi/Desktop/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.dcp]
  read_xdc -prop_thru_buffers -ref clk_gen -cells inst e:/Users/Ykersatomi/Desktop/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_board.xdc
  set_property processing_order EARLY [get_files e:/Users/Ykersatomi/Desktop/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_board.xdc]
  read_xdc -ref clk_gen -cells inst e:/Users/Ykersatomi/Desktop/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.xdc
  set_property processing_order EARLY [get_files e:/Users/Ykersatomi/Desktop/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.xdc]
  read_xdc E:/Users/Ykersatomi/Desktop/project_1/project_1.srcs/constrs_1/new/PHS_CTRL.xdc
  link_design -top PHS_CTRL -part xc7a100tftg256-3
  write_hwdef -file PHS_CTRL.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force PHS_CTRL_opt.dcp
  catch { report_drc -file PHS_CTRL_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force PHS_CTRL_placed.dcp
  catch { report_io -file PHS_CTRL_io_placed.rpt }
  catch { report_utilization -file PHS_CTRL_utilization_placed.rpt -pb PHS_CTRL_utilization_placed.pb }
  catch { report_control_sets -verbose -file PHS_CTRL_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force PHS_CTRL_routed.dcp
  catch { report_drc -file PHS_CTRL_drc_routed.rpt -pb PHS_CTRL_drc_routed.pb -rpx PHS_CTRL_drc_routed.rpx }
  catch { report_methodology -file PHS_CTRL_methodology_drc_routed.rpt -rpx PHS_CTRL_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file PHS_CTRL_timing_summary_routed.rpt -rpx PHS_CTRL_timing_summary_routed.rpx }
  catch { report_power -file PHS_CTRL_power_routed.rpt -pb PHS_CTRL_power_summary_routed.pb -rpx PHS_CTRL_power_routed.rpx }
  catch { report_route_status -file PHS_CTRL_route_status.rpt -pb PHS_CTRL_route_status.pb }
  catch { report_clock_utilization -file PHS_CTRL_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force PHS_CTRL_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  catch { write_mem_info -force PHS_CTRL.mmi }
  write_bitstream -force -no_partial_bitfile PHS_CTRL.bit 
  catch { write_sysdef -hwdef PHS_CTRL.hwdef -bitfile PHS_CTRL.bit -meminfo PHS_CTRL.mmi -file PHS_CTRL.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

