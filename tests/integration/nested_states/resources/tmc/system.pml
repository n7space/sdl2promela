#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
}

int inited;
chan actuator_tick_channel = [1] of {int};
chan controller_result_channel = [1] of {MyStatus};
system_state global_state;
chan actuator_lock = [1] of {int};
chan controller_lock = [1] of {int};
inline Controller_0_RI_0_tick()
{
    int dummy;
    actuator_tick_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_tick_channel);
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
active proctype actuator_tick() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_tick_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_tick();
        actuator_lock!token;
    }
    od;
}
active proctype controller_result() priority 1
{
    inited;
    int token;
    MyStatus signal_parameter;
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
        Actuator_0_init();
        actuator_lock!init_token;
        Controller_0_init();
        controller_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
