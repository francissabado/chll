/* Generated by Yosys 0.3.0+ (git sha1 3b52121) */

(* src = "../../verilog/extadc.v:1" *)
(* top = 1 *)
module ExtADC(Reset_n_i, Clk_i, Enable_i, CpuIntr_o, SensorPower_o, SensorStart_o, SensorReady_i, AdcStart_o, AdcDone_i, AdcValue_i, PeriodCounterPreset_i, SensorValue_o, Threshold_i);
  (* src = "../../../../addsubcmp/verilog/addsubcmp_greater.v:8" *)
  wire \$extract$\AddSubCmp_Greater_Direct$728.Carry_s ;
  (* src = "../../../../addsubcmp/verilog/addsubcmp_greater.v:7" *)
  wire [15:0] \$extract$\AddSubCmp_Greater_Direct$728.D_s ;
  (* src = "../../../../addsubcmp/verilog/addsubcmp_greater.v:11" *)
  wire \$extract$\AddSubCmp_Greater_Direct$728.Overflow_s ;
  (* src = "../../../../addsubcmp/verilog/addsubcmp_greater.v:10" *)
  wire \$extract$\AddSubCmp_Greater_Direct$728.Sign_s ;
  (* src = "../../../../addsubcmp/verilog/addsubcmp_greater.v:9" *)
  wire \$extract$\AddSubCmp_Greater_Direct$728.Zero_s ;
  (* src = "../../../../counter/verilog/counter_rv1.v:14" *)
  wire [15:0] \$extract$\Counter_RV1_Timer$725.D_s ;
  (* src = "../../../../counter/verilog/counter_rv1.v:15" *)
  wire \$extract$\Counter_RV1_Timer$725.Overflow_s ;
  (* src = "../../verilog/extadc.v:167" *)
  wire [15:0] AbsDiffResult;
  (* intersynth_conntype = "Bit" *)
  (* intersynth_port = "AdcConvComplete_i" *)
  (* src = "../../verilog/extadc.v:19" *)
  input AdcDone_i;
  (* intersynth_conntype = "Bit" *)
  (* intersynth_port = "AdcDoConvert_o" *)
  (* src = "../../verilog/extadc.v:17" *)
  output AdcStart_o;
  (* intersynth_conntype = "Word" *)
  (* intersynth_port = "AdcValue_i" *)
  (* src = "../../verilog/extadc.v:21" *)
  input [15:0] AdcValue_i;
  (* intersynth_port = "Clk_i" *)
  (* src = "../../verilog/extadc.v:5" *)
  input Clk_i;
  (* intersynth_conntype = "Bit" *)
  (* intersynth_port = "ReconfModuleIRQs_s" *)
  (* src = "../../verilog/extadc.v:9" *)
  output CpuIntr_o;
  (* intersynth_conntype = "Bit" *)
  (* intersynth_port = "ReconfModuleIn_s" *)
  (* src = "../../verilog/extadc.v:7" *)
  input Enable_i;
  (* intersynth_conntype = "Word" *)
  (* intersynth_param = "PeriodCounterPreset_i" *)
  (* src = "../../verilog/extadc.v:23" *)
  input [15:0] PeriodCounterPreset_i;
  (* intersynth_port = "Reset_n_i" *)
  (* src = "../../verilog/extadc.v:3" *)
  input Reset_n_i;
  (* intersynth_conntype = "Bit" *)
  (* intersynth_port = "Outputs_o" *)
  (* src = "../../verilog/extadc.v:11" *)
  output SensorPower_o;
  (* intersynth_conntype = "Bit" *)
  (* intersynth_port = "Inputs_i" *)
  (* src = "../../verilog/extadc.v:15" *)
  input SensorReady_i;
  (* intersynth_conntype = "Bit" *)
  (* intersynth_port = "Outputs_o" *)
  (* src = "../../verilog/extadc.v:13" *)
  output SensorStart_o;
  (* intersynth_conntype = "Word" *)
  (* intersynth_param = "SensorValue_o" *)
  (* src = "../../verilog/extadc.v:25" *)
  output [15:0] SensorValue_o;
  (* src = "../../verilog/extadc.v:43" *)
  wire StoreNewValue;
  (* intersynth_conntype = "Word" *)
  (* intersynth_param = "Threshold_i" *)
  (* src = "../../verilog/extadc.v:27" *)
  input [15:0] Threshold_i;
  (* src = "../../verilog/extadc.v:41" *)
  wire TimerEnable;
  (* src = "../../verilog/extadc.v:39" *)
  wire TimerOvfl;
  (* src = "../../verilog/extadc.v:40" *)
  wire TimerPreset;
  AbsDiff \$extract$\AbsDiff$726  (
    .A_i(AdcValue_i),
    .B_i(SensorValue_o),
    .D_o(AbsDiffResult)
  );
  (* src = "../../../../addsubcmp/verilog/addsubcmp_greater.v:13" *)
  AddSubCmp \$extract$\AddSubCmp_Greater_Direct$728.ThisAddSubCmp  (
    .A_i(AbsDiffResult),
    .AddOrSub_i(1'b1),
    .B_i(Threshold_i),
    .Carry_i(1'b0),
    .Carry_o(\$extract$\AddSubCmp_Greater_Direct$728.Carry_s ),
    .D_o(\$extract$\AddSubCmp_Greater_Direct$728.D_s ),
    .Overflow_o(\$extract$\AddSubCmp_Greater_Direct$728.Overflow_s ),
    .Sign_o(\$extract$\AddSubCmp_Greater_Direct$728.Sign_s ),
    .Zero_o(\$extract$\AddSubCmp_Greater_Direct$728.Zero_s )
  );
  (* src = "../../../../counter/verilog/counter_rv1.v:20" *)
  Counter \$extract$\Counter_RV1_Timer$725.ThisCounter  (
    .Clk_i(Clk_i),
    .D_o(\$extract$\Counter_RV1_Timer$725.D_s ),
    .Direction_i(1'b1),
    .Enable_i(TimerEnable),
    .Overflow_o(\$extract$\Counter_RV1_Timer$725.Overflow_s ),
    .PresetVal_i(PeriodCounterPreset_i),
    .Preset_i(TimerPreset),
    .ResetSig_i(1'b0),
    .Reset_n_i(Reset_n_i),
    .Zero_o(TimerOvfl)
  );
  WordRegister \$extract$\WordRegister$727  (
    .Clk_i(Clk_i),
    .D_i(AdcValue_i),
    .Enable_i(StoreNewValue),
    .Q_o(SensorValue_o),
    .Reset_n_i(Reset_n_i)
  );
  (* fsm_encoding = "auto" *)
  (* src = "../../verilog/extadc.v:37" *)
  \$fsm  #(
    .ARST_POLARITY(1'b0),
    .CLK_POLARITY(1'b1),
    .CTRL_IN_WIDTH(32'b00000000000000000000000000000110),
    .CTRL_OUT_WIDTH(32'b00000000000000000000000000000111),
    .NAME("\\State"),
    .STATE_BITS(32'b00000000000000000000000000000011),
    .STATE_NUM(32'b00000000000000000000000000000110),
    .STATE_NUM_LOG2(32'b00000000000000000000000000000011),
    .STATE_RST(32'b00000000000000000000000000000000),
    .STATE_TABLE(18'b011101001010100000),
    .TRANS_NUM(32'b00000000000000000000000000001101),
    .TRANS_TABLE(247'b101zzz0zz1011010010101zzz1zz0011011010100zzzzzz0111000001011zz0z1z0110100000011zz1z1z0101010000011zzzz0z0001000000010zzzzzz101101001000101zzz110010111100011zzzz1011101101000100zzz10111011010001zzzzz00011011010000zzzz1z0110100000000zzzz0z0001000000)
  ) \$fsm$\State$713  (
    .ARST(Reset_n_i),
    .CLK(Clk_i),
    .CTRL_IN({ \$extract$\AddSubCmp_Greater_Direct$728.Zero_s , \$extract$\AddSubCmp_Greater_Direct$728.Carry_s , TimerOvfl, SensorReady_i, Enable_i, AdcDone_i }),
    .CTRL_OUT({ TimerPreset, TimerEnable, SensorPower_o, AdcStart_o, StoreNewValue, SensorStart_o, CpuIntr_o })
  );
endmodule
