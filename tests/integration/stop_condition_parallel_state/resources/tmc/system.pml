#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
}

int inited;
chan actuator_ping_channel = [1] of {int};
chan actuator_dummy_channel = [1] of {int};
chan controller_pong_channel = [1] of {int};
system_state global_state;
chan actuator_lock = [1] of {int};
chan controller_lock = [1] of {int};
inline Controller_0_RI_0_ping()
{
    int dummy;
    actuator_ping_channel!dummy;
}
inline Controller_0_RI_0_dummy()
{
    int dummy;
    actuator_dummy_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_ping_channel) && empty(actuator_dummy_channel);
    }
}
inline Actuator_0_RI_0_pong()
{
    int dummy;
    controller_pong_channel!dummy;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_pong_channel);
    }
}
active proctype actuator_ping() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_ping_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_ping();
        actuator_lock!token;
    }
    od;
}
active proctype actuator_dummy() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_dummy_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_dummy();
        actuator_lock!token;
    }
    od;
}
active proctype controller_pong() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        controller_pong_channel?_;
        controller_lock?token;
        Controller_0_PI_0_pong();
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
