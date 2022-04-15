#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_result_channel = [1] of {int};
chan actuator_check_channel = [1] of {MyInteger};
chan actuator_work_channel = [1] of {MyInteger};
chan actuator_nop_channel = [1] of {int};
chan actuator_enable_channel = [1] of {int};
chan actuator_disable_channel = [1] of {int};
system_state global_state;
chan controller_lock = [1] of {int};
chan actuator_lock = [1] of {int};
inline Actuator_0_RI_0_result()
{
    int dummy;
    controller_result_channel!dummy;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_result_channel);
    }
}
inline Controller_0_RI_0_check(actuator_check_p1)
{
    actuator_check_channel!actuator_check_p1;
}
inline Controller_0_RI_0_work(actuator_work_p1)
{
    actuator_work_channel!actuator_work_p1;
}
inline Controller_0_RI_0_nop()
{
    int dummy;
    actuator_nop_channel!dummy;
}
inline Controller_0_RI_0_enable()
{
    int dummy;
    actuator_enable_channel!dummy;
}
inline Controller_0_RI_0_disable()
{
    int dummy;
    actuator_disable_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_check_channel) && empty(actuator_work_channel) && empty(actuator_nop_channel) && empty(actuator_enable_channel) && empty(actuator_disable_channel);
    }
}
active proctype controller_result() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        controller_result_channel?_;
        controller_lock?token;
        Controller_0_PI_0_result();
        controller_lock!token;
    }
    od;
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
active proctype actuator_work() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        actuator_work_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_work(signal_parameter);
        actuator_lock!token;
    }
    od;
}
active proctype actuator_nop() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_nop_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_nop();
        actuator_lock!token;
    }
    od;
}
active proctype actuator_enable() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_enable_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_enable();
        actuator_lock!token;
    }
    od;
}
active proctype actuator_disable() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_disable_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_disable();
        actuator_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        controller_lock!init_token;
        Actuator_0_init();
        actuator_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
