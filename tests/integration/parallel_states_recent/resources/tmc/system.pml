#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_result_channel = [1] of {ResultStatus};
chan actuator_tick_channel = [1] of {int};
chan actuator_tick_left_channel = [1] of {int};
chan actuator_tick_right_channel = [1] of {int};
chan actuator_reset_channel = [1] of {int};
system_state global_state;
chan controller_lock = [1] of {int};
chan actuator_lock = [1] of {int};
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
inline Controller_0_RI_0_tick()
{
    int dummy;
    actuator_tick_channel!dummy;
}
inline Controller_0_RI_0_tick_left()
{
    int dummy;
    actuator_tick_left_channel!dummy;
}
inline Controller_0_RI_0_tick_right()
{
    int dummy;
    actuator_tick_right_channel!dummy;
}
inline Controller_0_RI_0_reset()
{
    int dummy;
    actuator_reset_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_tick_channel) && empty(actuator_tick_left_channel) && empty(actuator_tick_right_channel) && empty(actuator_reset_channel);
    }
}
active proctype controller_result() priority 1
{
    inited;
    int token;
    ResultStatus signal_parameter;
    do
    ::  atomic {
        controller_result_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_result(signal_parameter);
        controller_lock!token;
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
active proctype actuator_tick_left() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_tick_left_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_tick_left();
        actuator_lock!token;
    }
    od;
}
active proctype actuator_tick_right() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_tick_right_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_tick_right();
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
        Controller_0_init();
        controller_lock!init_token;
        Actuator_0_init();
        actuator_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
