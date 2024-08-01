--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.49d
--  \   \         Application: netgen
--  /   /         Filename: MainCPU_synthesis.vhd
-- /___/   /\     Timestamp: Sun Jun 09 14:28:08 2024
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm MainCPU -w -dir netgen/synthesis -ofmt vhdl -sim MainCPU.ngc MainCPU_synthesis.vhd 
-- Device	: xc6slx16-3-csg324
-- Input file	: MainCPU.ngc
-- Output file	: E:\CPU\RTL\PANZER16\netgen\synthesis\MainCPU_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: MainCPU
-- Xilinx	: E:\xiling\14.4\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity MainCPU is
  port (
    Clk : in STD_LOGIC := 'X'; 
    RST : in STD_LOGIC := 'X'; 
    IPReady : in STD_LOGIC := 'X'; 
    DPReady : in STD_LOGIC := 'X'; 
    IPTrans : out STD_LOGIC; 
    DPTrans : out STD_LOGIC; 
    DPReadWrite : out STD_LOGIC; 
    DPReadBus : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    IPReadBus : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    IPAdressBus : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    DPAdressBus : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    DPWriteBus : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    DataSize : out STD_LOGIC_VECTOR ( 1 downto 0 ) 
  );
end MainCPU;

architecture Structure of MainCPU is
  signal IPReadBus_6_IBUF_0 : STD_LOGIC; 
  signal IPReadBus_3_IBUF_1 : STD_LOGIC; 
  signal IPReadBus_2_IBUF_2 : STD_LOGIC; 
  signal IPReadBus_1_IBUF_3 : STD_LOGIC; 
  signal IPReadBus_0_IBUF_4 : STD_LOGIC; 
  signal Clk_BUFGP_5 : STD_LOGIC; 
  signal IPReady_IBUF_6 : STD_LOGIC; 
  signal DPReady_IBUF_7 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R4_dout_6_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R4_dout_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R4_dout_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R4_dout_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R4_dout_0_Q : STD_LOGIC; 
  signal CachInstructionBusy : STD_LOGIC; 
  signal CachInstructionEmpty : STD_LOGIC; 
  signal DPTrans_OBUF_31 : STD_LOGIC; 
  signal CU_CachDequeueInstruction_36 : STD_LOGIC; 
  signal CachUnit_DataInBuffer_FifoRST : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_FifoRST : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_IsFull : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_4_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_5_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_6_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_7_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_8_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_9_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_10_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_11_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_12_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_13_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_14_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_15_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In2 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_In : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_In : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78 : STD_LOGIC; 
  signal CachUnit_DataInBuffer_CurrentState_FSM_FFd3_In_79 : STD_LOGIC; 
  signal CachUnit_DataInBuffer_CurrentState_FSM_FFd2_In : STD_LOGIC; 
  signal CachUnit_DataInBuffer_CurrentState_FSM_FFd3_81 : STD_LOGIC; 
  signal CachUnit_DataInBuffer_CurrentState_FSM_FFd2_82 : STD_LOGIC; 
  signal CachUnit_DataOutBuffer_CurrentState_FSM_FFd6 : STD_LOGIC; 
  signal CachUnit_DataOutBuffer_CurrentState_FSM_FFd3 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_lut_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_0_Q_86 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_Q_87 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_Q_88 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_Q_89 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_Q_90 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_Q_91 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_Q_92 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_Q_93 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_Q_94 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_Q_95 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_Q_96 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_Q_97 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_Q_98 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_Q_99 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_Q_100 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_n0065_inv : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_Reset_OR_DriverANDClockEnable : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R3_dout_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R3_dout_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R3_dout_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R3_dout_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R3_dout_6_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R2_dout_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R2_dout_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R2_dout_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R2_dout_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R2_dout_6_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_6_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_6_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_6_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R1_dout_0_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R1_dout_1_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R1_dout_2_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R1_dout_3_Q : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_R1_dout_6_Q : STD_LOGIC; 
  signal CachUnit_DataInBuffer_InternalFifo_n0065_inv : STD_LOGIC; 
  signal CU_GND_120_o_Instruction1Buffer_3_equal_11_o_3_1 : STD_LOGIC; 
  signal CU_SetUpPass_FSM_FFd1_In : STD_LOGIC; 
  signal CU_CPUState_FSM_FFd1_In : STD_LOGIC; 
  signal CU_CPUState_FSM_FFd2_In : STD_LOGIC; 
  signal CU_CPUState_FSM_FFd3_In_161 : STD_LOGIC; 
  signal CU_SelInstR1 : STD_LOGIC; 
  signal CU_SelInstRegisters_163 : STD_LOGIC; 
  signal CU_hasConstant_164 : STD_LOGIC; 
  signal CU_InstructionBufferSwitch_165 : STD_LOGIC; 
  signal CU_CPUState_FSM_FFd3_166 : STD_LOGIC; 
  signal CU_CPUState_FSM_FFd2_167 : STD_LOGIC; 
  signal CU_CPUState_FSM_FFd1_168 : STD_LOGIC; 
  signal CU_SetUpPass_FSM_FFd1_169 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In1_170 : STD_LOGIC; 
  signal CU_SetUpPass_FSM_FFd1_In1_171 : STD_LOGIC; 
  signal CU_SetUpPass_FSM_FFd1_In2_172 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_rt_233 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_rt_234 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_rt_235 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_rt_236 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_rt_237 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_rt_238 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_rt_239 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_rt_240 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_rt_241 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_rt_242 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_rt_243 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_rt_244 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_rt_245 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_rt_246 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_15_rt_247 : STD_LOGIC; 
  signal CU_CachDequeueInstruction_rstpot_248 : STD_LOGIC; 
  signal CU_hasConstant_rstpot_249 : STD_LOGIC; 
  signal CU_InstructionBufferSwitch_rstpot_250 : STD_LOGIC; 
  signal CU_SelInstRegisters_rstpot_251 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_n0078_inv11_cepot_252 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxSelect_0_dpot_253 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxSelect_1_dpot_254 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxSelect_2_dpot_255 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_1_258 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_1_259 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_0_dpot_260 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_1_dpot_261 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_2_dpot_262 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_3_dpot_263 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_4_dpot_264 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_5_dpot_265 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_6_dpot_266 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_7_dpot_267 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_8_dpot_268 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_9_dpot_269 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_10_dpot_270 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_11_dpot_271 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_12_dpot_272 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_13_dpot_273 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_14_dpot_274 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout_15_dpot_275 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_0_dpot_277 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_1_dpot_278 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_2_dpot_279 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_3_dpot_280 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_4_dpot_281 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_5_dpot_282 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_6_dpot_283 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_7_dpot_284 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_8_dpot_285 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_9_dpot_286 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_10_dpot_287 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_11_dpot_288 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_12_dpot_289 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_13_dpot_290 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_14_dpot_291 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout_15_dpot_292 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2_293 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_1_294 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_2_295 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal CachUnit_InstructionBuffer_Reg_Adress_dout : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal CU_InstructionRegister1_dout : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal CachUnit_InstructionBuffer_Reg_Inc_dout : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal CachUnit_InstructionBuffer_InternalFifo_Result : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal CachUnit_InstructionBuffer_InternalFifo_MuxSelect : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal CachUnit_InstructionBuffer_InternalFifo_DataCounter : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal CachUnit_InstructionBuffer_InternalFifo_RegSelect : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal CachUnit_DataInBuffer_InternalFifo_Result : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal CachUnit_DataInBuffer_InternalFifo_DataCounter : STD_LOGIC_VECTOR ( 2 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3
    );
  XST_VCC : VCC
    port map (
      P => CachUnit_DataOutBuffer_CurrentState_FSM_FFd6
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_15_dpot_292,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(15)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_14_dpot_291,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(14)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_13_dpot_290,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(13)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_12_dpot_289,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(12)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_11_dpot_288,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(11)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_10_dpot_287,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(10)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_9_dpot_286,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(9)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_8_dpot_285,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(8)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_7_dpot_284,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(7)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_6_dpot_283,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(6)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_5_dpot_282,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(5)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_4_dpot_281,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(4)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_3_dpot_280,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(3)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_2_dpot_279,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(2)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_1_dpot_278,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(1)
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot,
      D => CachUnit_InstructionBuffer_Reg_Inc_dout_0_dpot_277,
      Q => CachUnit_InstructionBuffer_Reg_Inc_dout(0)
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78
    );
  CachUnit_DataInBuffer_CurrentState_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_DataInBuffer_CurrentState_FSM_FFd3_In_79,
      Q => CachUnit_DataInBuffer_CurrentState_FSM_FFd3_81
    );
  CachUnit_DataInBuffer_CurrentState_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_DataInBuffer_CurrentState_FSM_FFd2_In,
      Q => CachUnit_DataInBuffer_CurrentState_FSM_FFd2_82
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_0_Q : MUXCY
    port map (
      CI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd6,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_lut_0_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_0_Q_86
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_0_Q : XORCY
    port map (
      CI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_lut_0_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_0_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_0_Q_86,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_rt_233,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_Q_87
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_1_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_0_Q_86,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_rt_233,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_1_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_Q_87,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_rt_234,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_Q_88
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_2_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_Q_87,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_rt_234,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_2_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_Q_88,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_rt_235,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_Q_89
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_3_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_Q_88,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_rt_235,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_3_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_Q_89,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_rt_236,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_Q_90
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_4_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_Q_89,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_rt_236,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_4_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_Q_90,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_rt_237,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_Q_91
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_5_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_Q_90,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_rt_237,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_5_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_Q_91,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_rt_238,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_Q_92
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_6_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_Q_91,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_rt_238,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_6_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_Q_92,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_rt_239,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_Q_93
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_7_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_Q_92,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_rt_239,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_7_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_Q_93,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_rt_240,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_Q_94
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_8_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_Q_93,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_rt_240,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_8_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_Q_94,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_rt_241,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_Q_95
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_9_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_Q_94,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_rt_241,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_9_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_Q_95,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_rt_242,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_Q_96
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_10_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_Q_95,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_rt_242,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_10_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_Q_96,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_rt_243,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_Q_97
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_11_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_Q_96,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_rt_243,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_11_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_Q_97,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_rt_244,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_Q_98
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_12_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_Q_97,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_rt_244,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_12_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_Q_98,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_rt_245,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_Q_99
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_13_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_Q_98,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_rt_245,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_13_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_Q : MUXCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_Q_99,
      DI => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      S => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_rt_246,
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_Q_100
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_14_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_Q_99,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_rt_246,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_14_Q
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_15_Q : XORCY
    port map (
      CI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_Q_100,
      LI => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_15_rt_247,
      O => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_15_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_DataCounter_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_n0065_inv,
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_Result(2),
      Q => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2)
    );
  CachUnit_InstructionBuffer_InternalFifo_DataCounter_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_n0065_inv,
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_Result(1),
      Q => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1)
    );
  CachUnit_InstructionBuffer_InternalFifo_DataCounter_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_n0065_inv,
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_Result(0),
      Q => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0)
    );
  CachUnit_InstructionBuffer_InternalFifo_RegSelect_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(3),
      Q => CachUnit_InstructionBuffer_InternalFifo_RegSelect(3)
    );
  CachUnit_InstructionBuffer_InternalFifo_RegSelect_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(2),
      Q => CachUnit_InstructionBuffer_InternalFifo_RegSelect(2)
    );
  CachUnit_InstructionBuffer_InternalFifo_RegSelect_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(1),
      Q => CachUnit_InstructionBuffer_InternalFifo_RegSelect(1)
    );
  CachUnit_InstructionBuffer_InternalFifo_RegSelect_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(0),
      Q => CachUnit_InstructionBuffer_InternalFifo_RegSelect(0)
    );
  CachUnit_InstructionBuffer_InternalFifo_MuxSelect_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_n0078_inv11_cepot_252,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxSelect_2_dpot_255,
      R => CachUnit_InstructionBuffer_InternalFifo_Reset_OR_DriverANDClockEnable,
      Q => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(2)
    );
  CachUnit_InstructionBuffer_InternalFifo_MuxSelect_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_n0078_inv11_cepot_252,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxSelect_1_dpot_254,
      R => CachUnit_InstructionBuffer_InternalFifo_Reset_OR_DriverANDClockEnable,
      Q => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(1)
    );
  CachUnit_InstructionBuffer_InternalFifo_MuxSelect_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_n0078_inv11_cepot_252,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxSelect_0_dpot_253,
      R => CachUnit_InstructionBuffer_InternalFifo_Reset_OR_DriverANDClockEnable,
      Q => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(0)
    );
  CachUnit_DataInBuffer_InternalFifo_DataCounter_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_DataInBuffer_InternalFifo_n0065_inv,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_DataInBuffer_InternalFifo_Result(2),
      Q => CachUnit_DataInBuffer_InternalFifo_DataCounter(2)
    );
  CachUnit_DataInBuffer_InternalFifo_DataCounter_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_DataInBuffer_InternalFifo_n0065_inv,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_DataInBuffer_InternalFifo_Result(1),
      Q => CachUnit_DataInBuffer_InternalFifo_DataCounter(1)
    );
  CachUnit_DataInBuffer_InternalFifo_DataCounter_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_DataInBuffer_InternalFifo_n0065_inv,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_DataInBuffer_InternalFifo_Result(0),
      Q => CachUnit_DataInBuffer_InternalFifo_DataCounter(0)
    );
  CachUnit_InstructionBuffer_InternalFifo_R4_dout_6 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(0),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_6_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R4_dout_6_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R4_dout_3 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(0),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_3_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R4_dout_3_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R4_dout_2 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(0),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_2_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R4_dout_2_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R4_dout_1 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(0),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_1_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R4_dout_1_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R4_dout_0 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(0),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_0_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R4_dout_0_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R3_dout_6 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(1),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_6_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R3_dout_6_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R3_dout_3 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(1),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_3_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R3_dout_3_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R3_dout_2 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(1),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_2_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R3_dout_2_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R3_dout_1 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(1),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_1_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R3_dout_1_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R3_dout_0 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(1),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_0_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R3_dout_0_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R2_dout_6 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(2),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_6_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R2_dout_6_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R2_dout_3 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(2),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_3_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R2_dout_3_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R2_dout_2 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(2),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_2_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R2_dout_2_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R2_dout_1 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(2),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_1_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R2_dout_1_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R2_dout_0 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(2),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_0_Q,
      Q => CachUnit_InstructionBuffer_InternalFifo_R2_dout_0_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R1_dout_6 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(3),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => IPReadBus_6_IBUF_0,
      Q => CachUnit_InstructionBuffer_InternalFifo_R1_dout_6_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R1_dout_3 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(3),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => IPReadBus_3_IBUF_1,
      Q => CachUnit_InstructionBuffer_InternalFifo_R1_dout_3_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R1_dout_2 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(3),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => IPReadBus_2_IBUF_2,
      Q => CachUnit_InstructionBuffer_InternalFifo_R1_dout_2_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R1_dout_1 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(3),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => IPReadBus_1_IBUF_3,
      Q => CachUnit_InstructionBuffer_InternalFifo_R1_dout_1_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_R1_dout_0 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_InternalFifo_RegSelect(3),
      CLR => CachUnit_InstructionBuffer_FifoRST,
      D => IPReadBus_0_IBUF_4,
      Q => CachUnit_InstructionBuffer_InternalFifo_R1_dout_0_Q
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_15 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_15_dpot_275,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(15)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_14 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_14_dpot_274,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(14)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_13 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_13_dpot_273,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(13)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_12 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_12_dpot_272,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(12)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_11 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_11_dpot_271,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(11)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_10 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_10_dpot_270,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(10)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_9 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_9_dpot_269,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(9)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_8 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_8_dpot_268,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(8)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_7 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_7_dpot_267,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(7)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_6 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_6_dpot_266,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(6)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_5 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_5_dpot_265,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(5)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_4 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_4_dpot_264,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(4)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_3 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_3_dpot_263,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(3)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_2 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_2_dpot_262,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(2)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_1 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_1_dpot_261,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(1)
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_0 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_Reg_Adress_dout_0_dpot_260,
      Q => CachUnit_InstructionBuffer_Reg_Adress_dout(0)
    );
  CU_InstructionRegister1_dout_0 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CU_SelInstR1,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_R4_dout_0_Q,
      Q => CU_InstructionRegister1_dout(0)
    );
  CU_InstructionRegister1_dout_1 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CU_SelInstR1,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_R4_dout_1_Q,
      Q => CU_InstructionRegister1_dout(1)
    );
  CU_InstructionRegister1_dout_2 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CU_SelInstR1,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_R4_dout_2_Q,
      Q => CU_InstructionRegister1_dout(2)
    );
  CU_InstructionRegister1_dout_3 : FDCE
    port map (
      C => Clk_BUFGP_5,
      CE => CU_SelInstR1,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_InternalFifo_R4_dout_3_Q,
      Q => CU_InstructionRegister1_dout(3)
    );
  CU_CPUState_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CU_CPUState_FSM_FFd1_In,
      Q => CU_CPUState_FSM_FFd1_168
    );
  CU_CPUState_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CU_CPUState_FSM_FFd2_In,
      Q => CU_CPUState_FSM_FFd2_167
    );
  CU_SetUpPass_FSM_FFd1 : FDC
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CU_SetUpPass_FSM_FFd1_In,
      Q => CU_SetUpPass_FSM_FFd1_169
    );
  CU_CPUState_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CU_CPUState_FSM_FFd3_In_161,
      Q => CU_CPUState_FSM_FFd3_166
    );
  CachUnit_InstructionBuffer_CurrentState_Control_0_1 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_1_294,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2_293,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_2_295,
      O => CachInstructionBusy
    );
  CachUnit_DTrans1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => CachUnit_DataInBuffer_CurrentState_FSM_FFd2_82,
      I1 => CachUnit_DataInBuffer_CurrentState_FSM_FFd3_81,
      O => DPTrans_OBUF_31
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_In1 : LUT5
    generic map(
      INIT => X"880088A2"
    )
    port map (
      I0 => CU_CachDequeueInstruction_36,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I4 => CachInstructionEmpty,
      O => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_In
    );
  CachUnit_InstructionBuffer_InternalFifo_Mram_DataCounter_2_GND_117_o_wide_mux_5_OUT11 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      O => CachInstructionEmpty
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux3_Mmux_Output11 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(0),
      I1 => IPReadBus_0_IBUF_4,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R3_dout_0_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_0_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux3_Mmux_Output81 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(0),
      I1 => IPReadBus_1_IBUF_3,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R3_dout_1_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_1_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux3_Mmux_Output91 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(0),
      I1 => IPReadBus_2_IBUF_2,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R3_dout_2_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_2_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux3_Mmux_Output101 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(0),
      I1 => IPReadBus_3_IBUF_1,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R3_dout_3_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_3_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux3_Mmux_Output131 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(0),
      I1 => IPReadBus_6_IBUF_0,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R3_dout_6_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_0_6_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux2_Mmux_Output11 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(1),
      I1 => IPReadBus_0_IBUF_4,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R2_dout_0_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_0_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux2_Mmux_Output81 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(1),
      I1 => IPReadBus_1_IBUF_3,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R2_dout_1_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_1_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux2_Mmux_Output91 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(1),
      I1 => IPReadBus_2_IBUF_2,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R2_dout_2_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_2_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux2_Mmux_Output101 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(1),
      I1 => IPReadBus_3_IBUF_1,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R2_dout_3_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_3_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux2_Mmux_Output131 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(1),
      I1 => IPReadBus_6_IBUF_0,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R2_dout_6_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_1_6_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux1_Mmux_Output11 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(2),
      I1 => IPReadBus_0_IBUF_4,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R1_dout_0_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_0_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux1_Mmux_Output81 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(2),
      I1 => IPReadBus_1_IBUF_3,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R1_dout_1_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_1_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux1_Mmux_Output91 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(2),
      I1 => IPReadBus_2_IBUF_2,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R1_dout_2_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_2_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux1_Mmux_Output101 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(2),
      I1 => IPReadBus_3_IBUF_1,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R1_dout_3_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_3_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Mux1_Mmux_Output131 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(2),
      I1 => IPReadBus_6_IBUF_0,
      I2 => CachUnit_InstructionBuffer_InternalFifo_R1_dout_6_Q,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxOut_2_6_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Full_2_1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      O => CachUnit_InstructionBuffer_IsFull
    );
  CachUnit_DataInBuffer_InternalFifo_n0065_inv11 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => CachUnit_DataInBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_DataInBuffer_CurrentState_FSM_FFd3_81,
      I2 => CachUnit_DataInBuffer_CurrentState_FSM_FFd2_82,
      O => CachUnit_DataInBuffer_InternalFifo_n0065_inv
    );
  CachUnit_DataInBuffer_InternalFifo_Result_1_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => CachUnit_DataInBuffer_InternalFifo_DataCounter(0),
      I1 => CachUnit_DataInBuffer_InternalFifo_DataCounter(1),
      O => CachUnit_DataInBuffer_InternalFifo_Result(1)
    );
  CachUnit_DataInBuffer_InternalFifo_Result_2_1 : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => CachUnit_DataInBuffer_InternalFifo_DataCounter(0),
      I1 => CachUnit_DataInBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_DataInBuffer_InternalFifo_DataCounter(2),
      O => CachUnit_DataInBuffer_InternalFifo_Result(2)
    );
  CU_GND_120_o_Instruction1Buffer_3_equal_11_o_3_11 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => CU_InstructionRegister1_dout(2),
      I1 => CU_InstructionRegister1_dout(0),
      I2 => CU_InstructionRegister1_dout(1),
      O => CU_GND_120_o_Instruction1Buffer_3_equal_11_o_3_1
    );
  CU_SelInstR11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => CU_InstructionBufferSwitch_165,
      I1 => CU_SelInstRegisters_163,
      O => CU_SelInstR1
    );
  CU_SetUpPass_FSM_FFd1_In1 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => CU_hasConstant_164,
      I1 => CachUnit_InstructionBuffer_InternalFifo_R4_dout_6_Q,
      I2 => CU_SetUpPass_FSM_FFd1_169,
      O => CU_SetUpPass_FSM_FFd1_In1_171
    );
  CU_SetUpPass_FSM_FFd1_In3 : LUT6
    generic map(
      INIT => X"333B203A333B202A"
    )
    port map (
      I0 => CU_SetUpPass_FSM_FFd1_169,
      I1 => CU_CPUState_FSM_FFd1_168,
      I2 => CU_CPUState_FSM_FFd2_167,
      I3 => CU_CPUState_FSM_FFd3_166,
      I4 => CU_SetUpPass_FSM_FFd1_In1_171,
      I5 => CU_SetUpPass_FSM_FFd1_In2_172,
      O => CU_SetUpPass_FSM_FFd1_In
    );
  IPReadBus_6_IBUF : IBUF
    port map (
      I => IPReadBus(6),
      O => IPReadBus_6_IBUF_0
    );
  IPReadBus_3_IBUF : IBUF
    port map (
      I => IPReadBus(3),
      O => IPReadBus_3_IBUF_1
    );
  IPReadBus_2_IBUF : IBUF
    port map (
      I => IPReadBus(2),
      O => IPReadBus_2_IBUF_2
    );
  IPReadBus_1_IBUF : IBUF
    port map (
      I => IPReadBus(1),
      O => IPReadBus_1_IBUF_3
    );
  IPReadBus_0_IBUF : IBUF
    port map (
      I => IPReadBus(0),
      O => IPReadBus_0_IBUF_4
    );
  RST_IBUF : IBUF
    port map (
      I => RST,
      O => CachUnit_DataInBuffer_FifoRST
    );
  IPReady_IBUF : IBUF
    port map (
      I => IPReady,
      O => IPReady_IBUF_6
    );
  DPReady_IBUF : IBUF
    port map (
      I => DPReady,
      O => DPReady_IBUF_7
    );
  IPAdressBus_15_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(15),
      O => IPAdressBus(15)
    );
  IPAdressBus_14_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(14),
      O => IPAdressBus(14)
    );
  IPAdressBus_13_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(13),
      O => IPAdressBus(13)
    );
  IPAdressBus_12_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(12),
      O => IPAdressBus(12)
    );
  IPAdressBus_11_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(11),
      O => IPAdressBus(11)
    );
  IPAdressBus_10_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(10),
      O => IPAdressBus(10)
    );
  IPAdressBus_9_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(9),
      O => IPAdressBus(9)
    );
  IPAdressBus_8_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(8),
      O => IPAdressBus(8)
    );
  IPAdressBus_7_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(7),
      O => IPAdressBus(7)
    );
  IPAdressBus_6_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(6),
      O => IPAdressBus(6)
    );
  IPAdressBus_5_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(5),
      O => IPAdressBus(5)
    );
  IPAdressBus_4_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(4),
      O => IPAdressBus(4)
    );
  IPAdressBus_3_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(3),
      O => IPAdressBus(3)
    );
  IPAdressBus_2_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(2),
      O => IPAdressBus(2)
    );
  IPAdressBus_1_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(1),
      O => IPAdressBus(1)
    );
  IPAdressBus_0_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(0),
      O => IPAdressBus(0)
    );
  DPAdressBus_15_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(15)
    );
  DPAdressBus_14_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(14)
    );
  DPAdressBus_13_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(13)
    );
  DPAdressBus_12_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(12)
    );
  DPAdressBus_11_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(11)
    );
  DPAdressBus_10_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(10)
    );
  DPAdressBus_9_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(9)
    );
  DPAdressBus_8_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(8)
    );
  DPAdressBus_7_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(7)
    );
  DPAdressBus_6_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(6)
    );
  DPAdressBus_5_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(5)
    );
  DPAdressBus_4_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(4)
    );
  DPAdressBus_3_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(3)
    );
  DPAdressBus_2_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(2)
    );
  DPAdressBus_1_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(1)
    );
  DPAdressBus_0_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPAdressBus(0)
    );
  DPWriteBus_15_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(15)
    );
  DPWriteBus_14_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(14)
    );
  DPWriteBus_13_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(13)
    );
  DPWriteBus_12_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(12)
    );
  DPWriteBus_11_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(11)
    );
  DPWriteBus_10_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(10)
    );
  DPWriteBus_9_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(9)
    );
  DPWriteBus_8_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(8)
    );
  DPWriteBus_7_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(7)
    );
  DPWriteBus_6_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(6)
    );
  DPWriteBus_5_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(5)
    );
  DPWriteBus_4_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(4)
    );
  DPWriteBus_3_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(3)
    );
  DPWriteBus_2_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(2)
    );
  DPWriteBus_1_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(1)
    );
  DPWriteBus_0_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPWriteBus(0)
    );
  IPTrans_OBUF : OBUF
    port map (
      I => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In2,
      O => IPTrans
    );
  DPTrans_OBUF : OBUF
    port map (
      I => DPTrans_OBUF_31,
      O => DPTrans
    );
  DPReadWrite_OBUF : OBUF
    port map (
      I => CachUnit_DataOutBuffer_CurrentState_FSM_FFd3,
      O => DPReadWrite
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(1),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_1_rt_233
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(2),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_2_rt_234
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(3),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_3_rt_235
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(4),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_4_rt_236
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(5),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_5_rt_237
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(6),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_6_rt_238
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(7),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_7_rt_239
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(8),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_8_rt_240
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(9),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_9_rt_241
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(10),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_10_rt_242
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(11),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_11_rt_243
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(12),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_12_rt_244
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(13),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_13_rt_245
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(14),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_cy_14_rt_246
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Adress_dout(15),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_xor_15_rt_247
    );
  CU_CachDequeueInstruction : FDC
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CU_CachDequeueInstruction_rstpot_248,
      Q => CU_CachDequeueInstruction_36
    );
  CU_hasConstant : FDC
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CU_hasConstant_rstpot_249,
      Q => CU_hasConstant_164
    );
  CU_InstructionBufferSwitch : FDC
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CU_InstructionBufferSwitch_rstpot_250,
      Q => CU_InstructionBufferSwitch_165
    );
  CU_SelInstRegisters : FD
    port map (
      C => Clk_BUFGP_5,
      D => CU_SelInstRegisters_rstpot_251,
      Q => CU_SelInstRegisters_163
    );
  CU_CPUState_FSM_FFd2_In1 : LUT6
    generic map(
      INIT => X"6466ECEE64666466"
    )
    port map (
      I0 => CU_CPUState_FSM_FFd3_166,
      I1 => CU_CPUState_FSM_FFd2_167,
      I2 => CU_hasConstant_164,
      I3 => CachUnit_InstructionBuffer_InternalFifo_R4_dout_6_Q,
      I4 => CU_GND_120_o_Instruction1Buffer_3_equal_11_o_3_1,
      I5 => CU_InstructionRegister1_dout(3),
      O => CU_CPUState_FSM_FFd2_In
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In1 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_1_294,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2_293,
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I3 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I4 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      O => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In1_170
    );
  CU_SetUpPass_FSM_FFd1_In2 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => CU_InstructionRegister1_dout(3),
      I1 => CU_InstructionRegister1_dout(2),
      I2 => CU_InstructionRegister1_dout(0),
      I3 => CU_InstructionRegister1_dout(1),
      O => CU_SetUpPass_FSM_FFd1_In2_172
    );
  CU_CPUState_FSM_FFd3_In_SW0 : LUT6
    generic map(
      INIT => X"FFFC0000AAAAAAAB"
    )
    port map (
      I0 => CU_SetUpPass_FSM_FFd1_169,
      I1 => CU_InstructionRegister1_dout(0),
      I2 => CU_InstructionRegister1_dout(1),
      I3 => CU_InstructionRegister1_dout(2),
      I4 => CU_InstructionRegister1_dout(3),
      I5 => CU_CPUState_FSM_FFd3_166,
      O => N9
    );
  CU_CPUState_FSM_FFd3_In : LUT6
    generic map(
      INIT => X"CCCC0000CCCD0001"
    )
    port map (
      I0 => CU_CPUState_FSM_FFd1_168,
      I1 => CU_CPUState_FSM_FFd2_167,
      I2 => CU_CPUState_FSM_FFd3_166,
      I3 => CachInstructionBusy,
      I4 => N9,
      I5 => CachInstructionEmpty,
      O => CU_CPUState_FSM_FFd3_In_161
    );
  CU_CachDequeueInstruction_rstpot : LUT6
    generic map(
      INIT => X"EEEFEEEFEEEFEEEC"
    )
    port map (
      I0 => CU_CachDequeueInstruction_36,
      I1 => CU_CPUState_FSM_FFd1_168,
      I2 => CU_CPUState_FSM_FFd2_167,
      I3 => CU_CPUState_FSM_FFd3_166,
      I4 => CachInstructionBusy,
      I5 => CachInstructionEmpty,
      O => CU_CachDequeueInstruction_rstpot_248
    );
  CU_n0317_inv1_SW0 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => CachUnit_DataInBuffer_FifoRST,
      I1 => CU_CPUState_FSM_FFd1_168,
      O => N11
    );
  CU_SelInstRegisters_rstpot : LUT6
    generic map(
      INIT => X"8AAA8AAA8AAA8BAA"
    )
    port map (
      I0 => CU_SelInstRegisters_163,
      I1 => CU_CPUState_FSM_FFd2_167,
      I2 => CU_CPUState_FSM_FFd3_166,
      I3 => N11,
      I4 => CachInstructionBusy,
      I5 => CachInstructionEmpty,
      O => CU_SelInstRegisters_rstpot_251
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In21 : LUT3
    generic map(
      INIT => X"26"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      O => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In2
    );
  CachUnit_InstructionBuffer_InternalFifo_Reset_OR_DriverANDClockEnable1 : LUT4
    generic map(
      INIT => X"0515"
    )
    port map (
      I0 => CachUnit_DataInBuffer_FifoRST,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_1_294,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2_293,
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_2_295,
      O => CachUnit_InstructionBuffer_InternalFifo_Reset_OR_DriverANDClockEnable
    );
  CachUnit_InstructionBuffer_FifoRST1 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => CachUnit_DataInBuffer_FifoRST,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_1_259,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_1_258,
      O => CachUnit_InstructionBuffer_FifoRST
    );
  CachUnit_InstructionBuffer_InternalFifo_n0065_inv11 : LUT6
    generic map(
      INIT => X"0CAC0CAC0CAC0CA0"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_1_294,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_2_295,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2_293,
      I3 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I4 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I5 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      O => CachUnit_InstructionBuffer_InternalFifo_n0065_inv
    );
  CachUnit_InstructionBuffer_InternalFifo_n0078_inv11_cepot : LUT3
    generic map(
      INIT => X"15"
    )
    port map (
      I0 => CachUnit_DataInBuffer_FifoRST,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2_293,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      O => CachUnit_InstructionBuffer_InternalFifo_n0078_inv11_cepot_252
    );
  CU_InstructionBufferSwitch_rstpot : LUT5
    generic map(
      INIT => X"AA2EAA2A"
    )
    port map (
      I0 => CU_InstructionBufferSwitch_165,
      I1 => CU_CPUState_FSM_FFd3_166,
      I2 => CU_hasConstant_164,
      I3 => CU_CPUState_FSM_FFd2_167,
      I4 => CachUnit_InstructionBuffer_InternalFifo_R4_dout_6_Q,
      O => CU_InstructionBufferSwitch_rstpot_250
    );
  CachUnit_DataInBuffer_CurrentState_FSM_FFd3_In : LUT6
    generic map(
      INIT => X"FFC3FFC3FFC35541"
    )
    port map (
      I0 => CachUnit_DataInBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_DataInBuffer_CurrentState_FSM_FFd3_81,
      I2 => CachUnit_DataInBuffer_CurrentState_FSM_FFd2_82,
      I3 => DPReady_IBUF_7,
      I4 => CachUnit_DataInBuffer_InternalFifo_DataCounter(1),
      I5 => CachUnit_DataInBuffer_InternalFifo_DataCounter(0),
      O => CachUnit_DataInBuffer_CurrentState_FSM_FFd3_In_79
    );
  CU_hasConstant_rstpot : LUT4
    generic map(
      INIT => X"AEAA"
    )
    port map (
      I0 => CU_hasConstant_164,
      I1 => CachUnit_InstructionBuffer_InternalFifo_R4_dout_6_Q,
      I2 => CU_CPUState_FSM_FFd2_167,
      I3 => CU_CPUState_FSM_FFd3_166,
      O => CU_hasConstant_rstpot_249
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_In1 : LUT6
    generic map(
      INIT => X"000000FDFDFD0000"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_In
    );
  CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT_2_1 : LUT6
    generic map(
      INIT => X"04040000FF00FF00"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(2)
    );
  CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT_3_1 : LUT6
    generic map(
      INIT => X"40400000FF00FF00"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(3)
    );
  CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT_1_1 : LUT6
    generic map(
      INIT => X"10100000FF00FF00"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(1)
    );
  CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT_0_1 : LUT6
    generic map(
      INIT => X"01010000FF00FF00"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_GND_117_o_PWR_37_o_mux_13_OUT(0)
    );
  CachUnit_DataInBuffer_CurrentState_FSM_FFd2_In1 : LUT5
    generic map(
      INIT => X"00FDFD00"
    )
    port map (
      I0 => CachUnit_DataInBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_DataInBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_DataInBuffer_InternalFifo_DataCounter(0),
      I3 => CachUnit_DataInBuffer_CurrentState_FSM_FFd2_82,
      I4 => CachUnit_DataInBuffer_CurrentState_FSM_FFd3_81,
      O => CachUnit_DataInBuffer_CurrentState_FSM_FFd2_In
    );
  CachUnit_InstructionBuffer_InternalFifo_Result_1_1 : LUT4
    generic map(
      INIT => X"6696"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_Result(1)
    );
  CachUnit_InstructionBuffer_InternalFifo_Result_2_1 : LUT5
    generic map(
      INIT => X"6A6AA96A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_Result(2)
    );
  CachUnit_InstructionBuffer_InternalFifo_MuxSelect_0_dpot : LUT6
    generic map(
      INIT => X"2003000300030003"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(0),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I3 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxSelect_0_dpot_253
    );
  CU_CPUState_FSM_FFd1_In1 : LUT6
    generic map(
      INIT => X"0000000888888888"
    )
    port map (
      I0 => CU_CPUState_FSM_FFd3_166,
      I1 => CU_CPUState_FSM_FFd2_167,
      I2 => CU_InstructionRegister1_dout(1),
      I3 => CU_InstructionRegister1_dout(2),
      I4 => CU_InstructionRegister1_dout(0),
      I5 => CU_InstructionRegister1_dout(3),
      O => CU_CPUState_FSM_FFd1_In
    );
  CachUnit_InstructionBuffer_InternalFifo_MuxSelect_1_dpot : LUT6
    generic map(
      INIT => X"2300030003000300"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(1),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I3 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxSelect_1_dpot_254
    );
  CachUnit_InstructionBuffer_InternalFifo_MuxSelect_2_dpot : LUT6
    generic map(
      INIT => X"2030303030303030"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_InternalFifo_MuxSelect(2),
      I1 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(2),
      I2 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(1),
      I3 => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I5 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_InternalFifo_MuxSelect_2_dpot_255
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_1_258
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_1_259
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_0_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(0),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_0_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_0_dpot_277
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_1_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(1),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_1_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_1_dpot_278
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_2_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(2),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_2_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_2_dpot_279
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_3_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(3),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_3_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_3_dpot_280
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_4_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(4),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_4_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_4_dpot_281
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_5_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(5),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_5_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_5_dpot_282
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_6_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(6),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_6_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_6_dpot_283
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_7_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(7),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_7_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_7_dpot_284
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_8_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(8),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_8_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_8_dpot_285
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_9_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(9),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_9_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_9_dpot_286
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_10_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(10),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_10_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_10_dpot_287
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_11_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(11),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_11_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_11_dpot_288
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_12_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(12),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_12_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_12_dpot_289
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_13_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(13),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_13_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_13_dpot_290
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_14_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(14),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_14_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_14_dpot_291
    );
  CachUnit_InstructionBuffer_Reg_Inc_dout_15_dpot : LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_Reg_Inc_dout(15),
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_Reg_Inc_DataIn_15_GND_116_o_add_1_OUT_15_Q,
      O => CachUnit_InstructionBuffer_Reg_Inc_dout_15_dpot_292
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_0_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(0),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(0),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_0_dpot_260
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_1_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(1),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(1),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_1_dpot_261
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_2_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(2),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(2),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_2_dpot_262
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_3_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(3),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(3),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_3_dpot_263
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_4_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(4),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(4),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_4_dpot_264
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_5_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(5),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(5),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_5_dpot_265
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_6_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(6),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(6),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_6_dpot_266
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_7_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(7),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(7),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_7_dpot_267
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_8_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(8),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(8),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_8_dpot_268
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_9_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(9),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(9),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_9_dpot_269
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_10_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(10),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(10),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_10_dpot_270
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_11_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(11),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(11),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_11_dpot_271
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_12_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(12),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(12),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_12_dpot_272
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_13_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(13),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(13),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_13_dpot_273
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_14_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(14),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(14),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_14_dpot_274
    );
  CachUnit_InstructionBuffer_Reg_Adress_dout_15_dpot : LUT5
    generic map(
      INIT => X"5410FE10"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I1 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I2 => CachUnit_InstructionBuffer_Reg_Adress_dout(15),
      I3 => CachUnit_InstructionBuffer_Reg_Inc_dout(15),
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      O => CachUnit_InstructionBuffer_Reg_Adress_dout_15_dpot_275
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_2_293
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_1_294
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk_BUFGP_5,
      CLR => CachUnit_DataInBuffer_FifoRST,
      D => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_In,
      Q => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_2_295
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In3 : MUXF7
    port map (
      I0 => N13,
      I1 => CachUnit_DataOutBuffer_CurrentState_FSM_FFd6,
      S => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In1_170,
      O => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In3_F : LUT6
    generic map(
      INIT => X"1500155110001001"
    )
    port map (
      I0 => CachUnit_InstructionBuffer_IsFull,
      I1 => CU_CachDequeueInstruction_36,
      I2 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_76,
      I3 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd2_77,
      I4 => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_78,
      I5 => IPReady_IBUF_6,
      O => N13
    );
  Clk_BUFGP : BUFGP
    port map (
      I => Clk,
      O => Clk_BUFGP_5
    );
  CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_lut_0_INV_0 : INV
    port map (
      I => CachUnit_InstructionBuffer_Reg_Adress_dout(0),
      O => CachUnit_InstructionBuffer_Reg_Inc_Madd_DataIn_15_GND_116_o_add_1_OUT_lut_0_Q
    );
  CachUnit_InstructionBuffer_InternalFifo_Result_0_1_INV_0 : INV
    port map (
      I => CachUnit_InstructionBuffer_InternalFifo_DataCounter(0),
      O => CachUnit_InstructionBuffer_InternalFifo_Result(0)
    );
  CachUnit_DataInBuffer_InternalFifo_Result_0_1_INV_0 : INV
    port map (
      I => CachUnit_DataInBuffer_InternalFifo_DataCounter(0),
      O => CachUnit_DataInBuffer_InternalFifo_Result(0)
    );
  CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot_INV_0 : INV
    port map (
      I => CachUnit_InstructionBuffer_CurrentState_FSM_FFd1_2_295,
      O => CachUnit_InstructionBuffer_CurrentState_FSM_FFd3_In221_cepot
    );

end Structure;

