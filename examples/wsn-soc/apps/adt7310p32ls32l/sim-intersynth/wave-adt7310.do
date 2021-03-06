onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /adt7310p32ls32l_tb/Reset_n_i
add wave -noupdate /adt7310p32ls32l_tb/Clk_i
add wave -noupdate /adt7310p32ls32l_tb/Enable_i
add wave -noupdate /adt7310p32ls32l_tb/CpuIntr_o
add wave -noupdate -radix unsigned /adt7310p32ls32l_tb/SensorValue_o
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Start_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Done_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Byte0_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Byte1_s
add wave -noupdate /adt7310p32ls32l_tb/SPI_CPOL_o
add wave -noupdate /adt7310p32ls32l_tb/SPI_CPHA_o
add wave -noupdate /adt7310p32ls32l_tb/SPI_LSBFE_o
add wave -noupdate /adt7310p32ls32l_tb/SPI_SPPR_SPR_o
add wave -noupdate /adt7310p32ls32l_tb/SPI_Write_o
add wave -noupdate /adt7310p32ls32l_tb/SPI_ReadNext_o
add wave -noupdate /adt7310p32ls32l_tb/SPI_Data_i
add wave -noupdate /adt7310p32ls32l_tb/SPI_Data_o
add wave -noupdate /adt7310p32ls32l_tb/SPI_FIFOFull_i
add wave -noupdate /adt7310p32ls32l_tb/SPI_FIFOEmpty_i
add wave -noupdate /adt7310p32ls32l_tb/SPI_Transmission_i
add wave -noupdate /adt7310p32ls32l_tb/SCLK_s
add wave -noupdate /adt7310p32ls32l_tb/DIN_s
add wave -noupdate /adt7310p32ls32l_tb/DOUT_s
add wave -noupdate /adt7310p32ls32l_tb/CT_n_s
add wave -noupdate /adt7310p32ls32l_tb/INT_n_s
add wave -noupdate /adt7310p32ls32l_tb/Temp_s
add wave -noupdate -divider SensorFSM
add wave -noupdate /adt7310p32ls32l_tb/DUT/TRFSM0_1/TRFSM_1/NextState_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/TRFSM0_1/TRFSM_1/State_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/Enable_i
add wave -noupdate {/adt7310p32ls32l_tb/DUT/\SensorFSM_1.SensorFSM_TimerOvfl }
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Done_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/CpuIntr_o
add wave -noupdate {/adt7310p32ls32l_tb/DUT/\SensorFSM_1.SensorFSM_StoreNewValue }
add wave -noupdate {/adt7310p32ls32l_tb/DUT/\SensorFSM_1.SensorFSM_TimerEnable }
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Start_s
add wave -noupdate {/adt7310p32ls32l_tb/DUT/\SensorFSM_1.SensorFSM_TimerPreset }
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Byte0_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/SPIFSM_Byte1_s
add wave -noupdate -radix decimal /adt7310p32ls32l_tb/DUT/Threshold_i
add wave -noupdate -radix decimal /adt7310p32ls32l_tb/DUT/PeriodCounterPresetL_i
add wave -noupdate -radix decimal /adt7310p32ls32l_tb/DUT/PeriodCounterPresetH_i
add wave -noupdate -radix decimal {/adt7310p32ls32l_tb/DUT/\SensorFSM_1.SensorValue }
#add wave -noupdate -radix decimal {/adt7310p32ls32l_tb/DUT/\SensorFSM_1.Word0 }
add wave -noupdate -radix decimal {/adt7310p32ls32l_tb/DUT/\SensorFSM_1.AbsDiffResult }
add wave -noupdate -radix decimal [find nets {/adt7310p32ls32l_tb/DUT/*AbsDiff* /DiffAB} ]
add wave -noupdate -radix decimal [find nets {/adt7310p32ls32l_tb/DUT/*AbsDiff* /DiffBA} ]
add wave -noupdate [find nets {/adt7310p32ls32l_tb/DUT/*AddSubCmp* /Carry_o} ]
add wave -noupdate [find nets {/adt7310p32ls32l_tb/DUT/*AddSubCmp* /Zero_o} ]
add wave -noupdate -divider SPI-FSM
add wave -noupdate /adt7310p32ls32l_tb/DUT/TRFSM1_1/TRFSM_1/NextState_s
add wave -noupdate /adt7310p32ls32l_tb/DUT/TRFSM1_1/TRFSM_1/State_s
add wave -noupdate {/adt7310p32ls32l_tb/DUT/\SPIFSM_1.SPI_FSM_TimerOvfl }
add wave -noupdate -divider {ADT7310 Sensor}
add wave -noupdate /adt7310p32ls32l_tb/adt7310_1/SCLK_i
add wave -noupdate /adt7310p32ls32l_tb/adt7310_1/DOUT_o
add wave -noupdate /adt7310p32ls32l_tb/adt7310_1/DIN_i
add wave -noupdate /adt7310p32ls32l_tb/adt7310_1/CS_n_i
add wave -noupdate /adt7310p32ls32l_tb/adt7310_1/CT_n_o
add wave -noupdate /adt7310p32ls32l_tb/adt7310_1/INT_n_o
add wave -noupdate /adt7310p32ls32l_tb/adt7310_1/Temp_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {662544046154 ps} 0}
configure wave -namecolwidth 321
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {1370261550 ns}
