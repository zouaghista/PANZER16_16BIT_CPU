/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/CPU/RTL/PANZER16/AHBReadTestModule.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static int sp_WriteMemory(char *t1, char *t2)
{
    char t9[8];
    char t10[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    int t22;
    char *t23;
    unsigned int t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    int t29;
    int t30;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 848);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(66, ng0);

LAB5:    xsi_set_current_line(67, ng0);
    t5 = (t1 + 3912);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t1 + 3272);
    t11 = (t1 + 3272);
    t12 = (t11 + 72U);
    t13 = *((char **)t12);
    t14 = (t1 + 3272);
    t15 = (t14 + 64U);
    t16 = *((char **)t15);
    t17 = (t1 + 3752);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    xsi_vlog_generic_convert_array_indices(t9, t10, t13, t16, 2, 1, t19, 10, 2);
    t20 = (t9 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t10 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    t26 = (t22 && t25);
    if (t26 == 1)
        goto LAB6;

LAB7:
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB6:    t27 = *((unsigned int *)t9);
    t28 = *((unsigned int *)t10);
    t29 = (t27 - t28);
    t30 = (t29 + 1);
    xsi_vlogvar_assign_value(t8, t7, 0, *((unsigned int *)t10), t30);
    goto LAB7;

}

static int sp_ReadMemory(char *t1, char *t2)
{
    char t8[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 1280);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(73, ng0);

LAB5:    xsi_set_current_line(74, ng0);
    t5 = (t1 + 3272);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t1 + 3272);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 3272);
    t13 = (t12 + 64U);
    t14 = *((char **)t13);
    t15 = (t1 + 4072);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    xsi_vlog_generic_get_array_select_value(t8, 16, t7, t11, t14, 2, 1, t17, 10, 2);
    t18 = (t1 + 4232);
    xsi_vlogvar_assign_value(t18, t8, 0, 0, 16);

LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
}

static void Initial_34_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(34, ng0);

LAB2:    xsi_set_current_line(35, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3112);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2952);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);

LAB1:    return;
}

static void Always_39_1(char *t0)
{
    char t11[8];
    char t28[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    int t36;
    int t37;
    int t38;
    int t39;
    int t40;

LAB0:    t1 = (t0 + 5400U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 5720);
    *((int *)t2) = 1;
    t3 = (t0 + 5432);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB5:    xsi_set_current_line(40, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3112);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(41, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(59, ng0);

LAB34:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3592);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB21:    goto LAB2;

LAB6:    xsi_set_current_line(41, ng0);

LAB9:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 3592);
    t5 = (t4 + 56U);
    t12 = *((char **)t5);
    memset(t11, 0, 8);
    t13 = (t12 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t12);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t13) == 0)
        goto LAB10;

LAB12:    t19 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t19) = 1;

LAB13:    t20 = (t11 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t11);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB14;

LAB15:
LAB16:    goto LAB8;

LAB10:    *((unsigned int *)t11) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(42, ng0);

LAB17:    xsi_set_current_line(43, ng0);
    t26 = (t0 + 2232U);
    t27 = *((char **)t26);
    t26 = (t0 + 3432);
    xsi_vlogvar_assign_value(t26, t27, 0, 0, 16);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3592);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 5736);
    *((int *)t2) = 1;
    t3 = (t0 + 5432);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB18:    goto LAB16;

LAB19:    xsi_set_current_line(48, ng0);

LAB22:    xsi_set_current_line(49, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t0 + 3112);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2392U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB26;

LAB24:    if (*((unsigned int *)t2) == 0)
        goto LAB23;

LAB25:    t4 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t4) = 1;

LAB26:    t5 = (t11 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (~(t14));
    t16 = *((unsigned int *)t11);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(54, ng0);

LAB31:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2552U);
    t3 = *((char **)t2);
    t2 = (t0 + 3272);
    t4 = (t0 + 3272);
    t5 = (t4 + 72U);
    t12 = *((char **)t5);
    t13 = (t0 + 3272);
    t19 = (t13 + 64U);
    t20 = *((char **)t19);
    t26 = (t0 + 3432);
    t27 = (t26 + 56U);
    t29 = *((char **)t27);
    xsi_vlog_generic_convert_array_indices(t11, t28, t12, t20, 2, 1, t29, 16, 2);
    t30 = (t11 + 4);
    t6 = *((unsigned int *)t30);
    t36 = (!(t6));
    t31 = (t28 + 4);
    t7 = *((unsigned int *)t31);
    t37 = (!(t7));
    t38 = (t36 && t37);
    if (t38 == 1)
        goto LAB32;

LAB33:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2232U);
    t3 = *((char **)t2);
    t2 = (t0 + 3432);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);

LAB29:    goto LAB21;

LAB23:    *((unsigned int *)t11) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(50, ng0);

LAB30:    xsi_set_current_line(51, ng0);
    t12 = (t0 + 3272);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = (t0 + 3272);
    t26 = (t20 + 72U);
    t27 = *((char **)t26);
    t29 = (t0 + 3272);
    t30 = (t29 + 64U);
    t31 = *((char **)t30);
    t32 = (t0 + 3432);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    xsi_vlog_generic_get_array_select_value(t28, 16, t19, t27, t31, 2, 1, t34, 16, 2);
    t35 = (t0 + 2952);
    xsi_vlogvar_assign_value(t35, t28, 0, 0, 16);
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2232U);
    t3 = *((char **)t2);
    t2 = (t0 + 3432);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);
    goto LAB29;

LAB32:    t8 = *((unsigned int *)t11);
    t9 = *((unsigned int *)t28);
    t39 = (t8 - t9);
    t40 = (t39 + 1);
    xsi_vlogvar_assign_value(t2, t3, 0, *((unsigned int *)t28), t40);
    goto LAB33;

}


extern void work_m_00000000002894891063_3116714847_init()
{
	static char *pe[] = {(void *)Initial_34_0,(void *)Always_39_1};
	static char *se[] = {(void *)sp_WriteMemory,(void *)sp_ReadMemory};
	xsi_register_didat("work_m_00000000002894891063_3116714847", "isim/InstManagerV2TestBench_isim_beh.exe.sim/work/m_00000000002894891063_3116714847.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
