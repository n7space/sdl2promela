#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
    AggregateTimerData timers;
}

int inited;
chan Actuator_dummy_channel = [1] of {int};
chan Actuator_ping_channel = [1] of {int};
chan Controller_pong_channel = [1] of {int};
system_state global_state;
chan Controller_lock = [1] of {int};
chan Actuator_lock = [1] of {int};
inline Controller_0_RI_0_dummy()
{
    int dummy;
    Actuator_dummy_channel!dummy;
}
inline Controller_0_RI_0_ping()
{
    int dummy;
    Actuator_ping_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_dummy_channel) && empty(Actuator_ping_channel));
    }
}
inline Actuator_0_get_sender(Actuator_sender_arg)
{
    skip;
}
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
inline Controller_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_dummy() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_dummy_channel);
        Actuator_lock?_;
Actuator_dummy_loop:
        if
        ::  nempty(Actuator_dummy_channel);
            Actuator_dummy_channel?_;
            Actuator_0_PI_0_dummy();
            goto Actuator_dummy_loop;
        ::  empty(Actuator_dummy_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_ping() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_ping_channel);
        Actuator_lock?_;
Actuator_ping_loop:
        if
        ::  nempty(Actuator_ping_channel);
            Actuator_ping_channel?_;
            Actuator_0_PI_0_ping();
            goto Actuator_ping_loop;
        ::  empty(Actuator_ping_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_pong() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_pong_channel);
        Controller_lock?_;
Controller_pong_loop:
        if
        ::  nempty(Controller_pong_channel);
            Controller_pong_channel?_;
            Controller_0_PI_0_pong();
            goto Controller_pong_loop;
        ::  empty(Controller_pong_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
init
{
    atomic {
        global_dataview_init();
        Controller_0_init();
        Controller_lock!1;
        Actuator_0_init();
        Actuator_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
