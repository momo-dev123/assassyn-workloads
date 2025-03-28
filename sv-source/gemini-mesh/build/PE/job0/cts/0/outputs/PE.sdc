###############################################################################
# Created by write_sdc
# Fri Mar 28 17:23:46 2025
###############################################################################
current_design PE
###############################################################################
# Timing Constraints
###############################################################################
###############################################################################
# Environment
###############################################################################
set_load -pin_load 13.3540 [get_ports {io_outL[7]}]
set_load -pin_load 13.3540 [get_ports {io_outL[6]}]
set_load -pin_load 13.3540 [get_ports {io_outL[5]}]
set_load -pin_load 13.3540 [get_ports {io_outL[4]}]
set_load -pin_load 13.3540 [get_ports {io_outL[3]}]
set_load -pin_load 13.3540 [get_ports {io_outL[2]}]
set_load -pin_load 13.3540 [get_ports {io_outL[1]}]
set_load -pin_load 13.3540 [get_ports {io_outL[0]}]
set_load -pin_load 13.3540 [get_ports {io_outU[7]}]
set_load -pin_load 13.3540 [get_ports {io_outU[6]}]
set_load -pin_load 13.3540 [get_ports {io_outU[5]}]
set_load -pin_load 13.3540 [get_ports {io_outU[4]}]
set_load -pin_load 13.3540 [get_ports {io_outU[3]}]
set_load -pin_load 13.3540 [get_ports {io_outU[2]}]
set_load -pin_load 13.3540 [get_ports {io_outU[1]}]
set_load -pin_load 13.3540 [get_ports {io_outU[0]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clock}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dir}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_en}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[7]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[6]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[5]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[4]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[3]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[2]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[1]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inD[0]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[7]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[6]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[5]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[4]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[3]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[2]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[1]}]
set_driving_cell -lib_cell BUFx10_ASAP7_75t_R -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_inR[0]}]
###############################################################################
# Design Rules
###############################################################################
