#!modelsim
#
# Apply TR-FSM bitstreams
#
# Auto-generated by ../scripts/reconf-module-postproc.tcl
#

# TRFSM0 used by \State
set TRFSMBase "/extadc_tb/DUT/MyReconfigLogic_0/MyInterSynthModule_0/cell_80/TRFSM_1"
do extadc-extract-intersynth-trfsm0-bitstream-modelsim.do
# TRFSM1 is unused
# InterSynth bitdata
set BitDataReg "/extadc_tb/DUT/MyReconfigLogic_0/CfgRegbitdata"
do extadc-bitdata-bitstream-modelsim.do
# Reconf.signals config register
set ReconfSignalsReg "/extadc_tb/DUT/MyReconfigLogic_0/CfgRegReconfSignals"
do extadc-reconfsignals-bitstream-modelsim.do
