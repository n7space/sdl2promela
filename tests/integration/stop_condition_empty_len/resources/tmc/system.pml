#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan Controller_pong_channel = [2] of {int};
chan Actuator_ping_channel = [2] of {int};
chan Actuator_test_channel = [2] of {int};
system_state global_state;
chan Controller_lock = [1] of {int};
chan Actuator_lock = [1] of {int};
inline Actuator_0_RI_0_pong()
{
    int dummy;
    Controller_pong_channel!dummy;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_pong_channel);
    }
}
inline Controller_0_RI_0_ping()
{
    int dummy;
    Actuator_ping_channel!dummy;
}
inline Controller_0_RI_0_test()
{
    int dummy;
    Actuator_test_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_ping_channel) && empty(Actuator_test_channel);
    }
}
active proctype Controller_pong() priority 2
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_pong_channel?_;
        Controller_lock?token;
        Controller_0_PI_0_pong();
        Controller_lock!token;
    }
    od;
}
active proctype Actuator_ping() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_ping_channel?_;
        Actuator_lock?token;
        Actuator_0_PI_0_ping();
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_channel?_;
        Actuator_lock?token;
        Actuator_0_PI_0_test();
        Actuator_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        Controller_lock!init_token;
        Actuator_0_init();
        Actuator_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
