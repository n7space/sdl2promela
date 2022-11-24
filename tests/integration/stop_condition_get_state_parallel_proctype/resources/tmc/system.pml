#include "dataview.pml"
#include "actuator.pml"
#include "inst.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context inst;
    Actuator_Context actuator;
    AggregateTimerData timers;
}

int inited;
chan Actuator_ping_channel = [1] of {int};
chan Inst_dummy_channel = [1] of {int};
chan Inst_pong_channel = [1] of {int};
system_state global_state;
chan Inst_lock = [1] of {int};
chan Actuator_lock = [1] of {int};
inline Inst_0_RI_0_ping()
{
    int dummy;
    Actuator_ping_channel!dummy;
}
inline Actuator_0_PI_0_ping_unhandled_input()
{
    skip;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_ping_channel);
    }
}
inline Actuator_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_dummy()
{
    int dummy;
    Inst_dummy_channel!dummy;
}
inline Inst_0_PI_0_dummy_unhandled_input()
{
    skip;
}
inline Actuator_0_RI_0_pong()
{
    int dummy;
    Inst_pong_channel!dummy;
}
inline Inst_0_PI_0_pong_unhandled_input()
{
    skip;
}
inline Inst_check_queue()
{
    atomic {
        (empty(Inst_dummy_channel) && empty(Inst_pong_channel));
    }
}
inline Inst_0_get_sender(Inst_sender_arg)
{
    skip;
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
active proctype Inst_dummy() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Inst_dummy_channel);
        Inst_lock?_;
Inst_dummy_loop:
        if
        ::  nempty(Inst_dummy_channel);
            Inst_dummy_channel?_;
            Inst_0_PI_0_dummy();
            goto Inst_dummy_loop;
        ::  empty(Inst_dummy_channel);
            skip;
        fi;
        Inst_lock!1;
    }
    od;
}
active proctype Inst_pong() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Inst_pong_channel);
        Inst_lock?_;
Inst_pong_loop:
        if
        ::  nempty(Inst_pong_channel);
            Inst_pong_channel?_;
            Inst_0_PI_0_pong();
            goto Inst_pong_loop;
        ::  empty(Inst_pong_channel);
            skip;
        fi;
        Inst_lock!1;
    }
    od;
}
init
{
    atomic {
        global_dataview_init();
        Inst_0_init();
        Inst_lock!1;
        Actuator_0_init();
        Actuator_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
