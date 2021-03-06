#!modelsim
#
# Apply TR-FSM bitstreams
#
# Auto-generated by ../scripts/reconf-module-postproc.tcl
#

# TRFSM0 used by \SensorFSM_State
set TRFSMBase "/max6682_tb/DUT/MyReconfigLogic_0/MyInterSynthModule_0/cell_80/TRFSM_1"
do max6682-extract-intersynth-trfsm0-bitstream-modelsim.do
# TRFSM1 used by \SPI_FSM_State
set TRFSMBase "/max6682_tb/DUT/MyReconfigLogic_0/MyInterSynthModule_0/cell_81/TRFSM_1"
do max6682-extract-intersynth-trfsm1-bitstream-modelsim.do
# InterSynth bitdata
set BitDataReg "/max6682_tb/DUT/MyReconfigLogic_0/CfgRegbitdata"
do max6682-bitdata-bitstream-modelsim.do
# Reconf.signals config register
set ReconfSignalsReg "/max6682_tb/DUT/MyReconfigLogic_0/CfgRegReconfSignals"
do max6682-reconfsignals-bitstream-modelsim.do
