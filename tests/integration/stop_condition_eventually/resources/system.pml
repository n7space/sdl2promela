#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_calculate_channel = [1] of {Level};
chan controller_finished_channel = [1] of {ResponseStatus};
chan actuator_tick_channel = [1] of {int};
chan actuator_restart_channel = [1] of {Level};
system_state global_state;
chan controller_lock = [1] of {int};
chan actuator_lock = [1] of {int};
inline Env_0_RI_0_calculate(controller_calculate_p1)
{
    controller_calculate_channel!controller_calculate_p1;
}
inline Actuator_0_RI_0_finished(controller_finished_p1)
{
    controller_finished_channel!controller_finished_p1;
}
inline Controller_0_RI_0_tick()
{
    int dummy;
    actuator_tick_channel!dummy;
}
inline Controller_0_RI_0_restart(actuator_restart_p1)
{
    actuator_restart_channel!actuator_restart_p1;
}
inline Actuator_0_PI_0_restart_unhandled_input(input_param)
{
    skip;
}
inline Actuator_0_PI_0_tick_unhandled_input()
{
    skip;
}
inline Controller_0_PI_0_calculate_unhandled_input(input_param)
{
    skip;
}
inline Controller_0_PI_0_finished_unhandled_input(input_param)
{
    skip;
}
active proctype env_calculate()
{
    inited;
    Level value;
    do
    ::  atomic {
        Level_generate_value(value);
        Env_0_RI_0_calculate(value);
    }
    od;
}
active proctype controller_calculate() priority 1
{
    inited;
    int token;
    Level signal_parameter;
    do
    ::  atomic {
        controller_calculate_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_calculate(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype controller_finished() priority 1
{
    inited;
    int token;
    ResponseStatus signal_parameter;
    do
    ::  atomic {
        controller_finished_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_finished(signal_parameter);
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
active proctype actuator_restart() priority 1
{
    inited;
    int token;
    Level signal_parameter;
    do
    ::  atomic {
        actuator_restart_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_restart(signal_parameter);
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
