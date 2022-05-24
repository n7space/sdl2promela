#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_result_channel = [1] of {MyInteger};
chan controller_test_channel = [1] of {MyTestInteger};
chan controller_ok_channel = [1] of {int};
chan actuator_tick_channel = [1] of {int};
chan actuator_reset_channel = [1] of {int};
system_state global_state;
chan actuator_lock = [1] of {int};
chan controller_lock = [1] of {int};
inline Actuator_0_RI_0_result(controller_result_p1)
{
    controller_result_channel!controller_result_p1;
}
inline Env_0_RI_0_test(controller_test_p1)
{
    controller_test_channel!controller_test_p1;
}
inline Actuator_0_RI_0_ok()
{
    int dummy;
    controller_ok_channel!dummy;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_result_channel) && empty(controller_test_channel) && empty(controller_ok_channel);
    }
}
inline Controller_0_RI_0_tick()
{
    int dummy;
    actuator_tick_channel!dummy;
}
inline Controller_0_RI_0_reset()
{
    int dummy;
    actuator_reset_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_tick_channel) && empty(actuator_reset_channel);
    }
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
active proctype controller_test() priority 1
{
    inited;
    int token;
    MyTestInteger signal_parameter;
    do
    ::  atomic {
        controller_test_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_test(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype controller_ok() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        controller_ok_channel?_;
        controller_lock?token;
        Controller_0_PI_0_ok();
        controller_lock!token;
    }
    od;
}
active proctype env_test()
{
    inited;
    MyTestInteger value;
    do
    ::  atomic {
        MyTestInteger_generate_value(value);
        Env_0_RI_0_test(value);
    }
    od;
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
active proctype actuator_reset() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_reset_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_reset();
        actuator_lock!token;
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
