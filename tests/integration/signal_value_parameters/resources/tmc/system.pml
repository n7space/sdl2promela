#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_pong_channel = [1] of {MyInteger};
chan controller_pong_enum_channel = [1] of {MyParam};
chan actuator_ping_channel = [1] of {MyInteger};
chan actuator_ping_enum_channel = [1] of {MyParam};
system_state global_state;
chan actuator_lock = [1] of {int};
chan controller_lock = [1] of {int};
inline Actuator_0_RI_0_pong(controller_pong_p1)
{
    controller_pong_channel!controller_pong_p1;
}
inline Actuator_0_RI_0_pong_enum(controller_pong_enum_p1)
{
    controller_pong_enum_channel!controller_pong_enum_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_pong_channel) && empty(controller_pong_enum_channel);
    }
}
inline Controller_0_RI_0_ping(actuator_ping_p1)
{
    actuator_ping_channel!actuator_ping_p1;
}
inline Controller_0_RI_0_ping_enum(actuator_ping_enum_p1)
{
    actuator_ping_enum_channel!actuator_ping_enum_p1;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_ping_channel) && empty(actuator_ping_enum_channel);
    }
}
active proctype controller_pong() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        controller_pong_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_pong(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype controller_pong_enum() priority 1
{
    inited;
    int token;
    MyParam signal_parameter;
    do
    ::  atomic {
        controller_pong_enum_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_pong_enum(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype actuator_ping() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        actuator_ping_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_ping(signal_parameter);
        actuator_lock!token;
    }
    od;
}
active proctype actuator_ping_enum() priority 1
{
    inited;
    int token;
    MyParam signal_parameter;
    do
    ::  atomic {
        actuator_ping_enum_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_ping_enum(signal_parameter);
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
