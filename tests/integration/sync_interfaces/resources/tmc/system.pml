#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_ping_channel = [1] of {int};
chan Controller_pong_channel = [1] of {int};
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_ping()
{
    Actuator_ping_channel!0;
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
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_pong()
{
    Controller_pong_channel!0;
}
inline Controller_0_PI_0_pong_unhandled_input()
{
    skip;
}
inline Controller_0_RI_0_test_protected(Controller_test_protected_result, Controller_test_protected_lhs, Controller_test_protected_rhs)
{
    Actuator_lock?_;
    Actuator_0_PI_0_test_protected(Controller_test_protected_result, Controller_test_protected_lhs, Controller_test_protected_rhs);
    Actuator_lock!1;
}
inline Controller_0_RI_0_test_unprotected(Controller_test_unprotected_result, Controller_test_unprotected_lhs, Controller_test_unprotected_rhs)
{
    Actuator_0_PI_0_test_unprotected(Controller_test_unprotected_result, Controller_test_unprotected_lhs, Controller_test_unprotected_rhs);
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_pong_channel);
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
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
        Actuator_0_init();
        Actuator_lock!1;
        Controller_0_init();
        Controller_lock!1;
        inited = 1;
    }
}
#include "scl.pml"