#!tcl
#
# Information on FSM<->TRFSM mapping
#
# Auto-generated by ../scripts//insert-trfsm-replace.tcl
#

# FSMs
set FSMs [list {\SensorFSM_State} {\SPI_FSM_State} ]

# $fsm cell instances
set FSMInstances [list {$fsm$\SensorFSM_State$738} {$techmap\MAX6682_SPI_FSM_1.$fsm$\SPI_FSM_State$743} ]

# FSM -> TR-FSM mapping: associative array, key = index into $FSMs and
# $FSMInstances, value = index into $TRFSMs
set FSMMapping(0) 0
set FSMMapping(1) 1

# TR-FSM -> FSM mapping: associative array, key = index into $TRFSMs,
# value = index into $FSMs and $FSMInstances, -1 means unused
set TRFSMMapping(0) 0
set TRFSMMapping(1) 1

