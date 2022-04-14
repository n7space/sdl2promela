#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Worker_Context actuator;
    Controller_Context controller;
}

int inited;
chan actuator_check_channel = [1] of {MyInteger};
chan controller_result_channel = [1] of {MyInteger};
system_state global_state;
chan controller_lock = [1] of {int};
chan actuator_lock = [1] of {int};
inline Controller_0_RI_0_check(actuator_check_p1)
{
    actuator_check_channel!actuator_check_p1;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_check_channel);
    }
}
inline Actuator_0_RI_0_result(controller_result_p1)
{
    controller_result_channel!controller_result_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_result_channel);
    }
}
active proctype actuator_check() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        actuator_check_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_check(signal_parameter);
        actuator_lock!token;
    }
    od;
}
active proctype controller_result() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        controller_result_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_result(signal_parameter);
        controller_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        actuator_ctxt_init();
        Controller_0_init();
        controller_lock!init_token;
        Actuator_0_init();
        actuator_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
