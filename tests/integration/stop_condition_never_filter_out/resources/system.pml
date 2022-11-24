#include "dataview.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
}

int inited;
chan egse_tm_channel = [1] of {MyInteger};
chan controller_tc_channel = [1] of {MyInteger};
system_state global_state;
chan controller_lock = [1] of {int};
inline Controller_0_RI_0_tm(egse_tm_p1)
{
    egse_tm_channel!egse_tm_p1;
}
inline Egse_0_RI_0_tc(controller_tc_p1)
{
    controller_tc_channel!controller_tc_p1;
}
inline Controller_0_PI_0_tc_unhandled_input(input_param)
{
    skip;
}
active proctype egse_tm() priority 1
{
    inited;
    MyInteger signal_parameter;
    do
    ::  atomic {
        egse_tm_channel?signal_parameter;
    }
    od;
}
active proctype egse_tc()
{
    inited;
    MyInteger value;
    do
    ::  atomic {
        MyInteger_generate_value(value);
        Egse_0_RI_0_tc(value);
    }
    od;
}
active proctype controller_tc() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        controller_tc_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_tc(signal_parameter);
        controller_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        controller_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
