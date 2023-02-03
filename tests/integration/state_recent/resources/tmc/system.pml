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
chan Actuator_disable_channel = [1] of {int};
chan Actuator_ping_channel = [1] of {MyInteger};
MyInteger Actuator_ping_signal_parameter;
bool Actuator_ping_channel_used = 0;
chan Controller_pong_channel = [1] of {MyInteger};
MyInteger Controller_pong_signal_parameter;
bool Controller_pong_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_disable()
{
    Actuator_disable_channel!0;
}
inline Actuator_0_PI_0_disable_unhandled_input()
{
    printf("unhandled_input actuator disable\n");
    skip;
}
inline Controller_0_RI_0_ping(actuator_ping_p1)
{
    Actuator_ping_channel!actuator_ping_p1;
}
inline Actuator_0_PI_0_ping_unhandled_input(p1)
{
    printf("unhandled_input actuator ping\n");
    skip;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_disable_channel) && empty(Actuator_ping_channel));
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_pong(controller_pong_p1)
{
    Controller_pong_channel!controller_pong_p1;
}
inline Controller_0_PI_0_pong_unhandled_input(p1)
{
    printf("unhandled_input controller pong\n");
    skip;
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
active proctype Actuator_disable() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_disable_channel);
        Actuator_lock?_;
Actuator_disable_loop:
        if
        ::  nempty(Actuator_disable_channel);
            Actuator_disable_channel?_;
            Actuator_0_PI_0_disable();
            goto Actuator_disable_loop;
        ::  empty(Actuator_disable_channel);
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
            Actuator_ping_channel?Actuator_ping_signal_parameter;
            Actuator_ping_channel_used = 1;
            Actuator_0_PI_0_ping(Actuator_ping_signal_parameter);
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
            Controller_pong_channel?Controller_pong_signal_parameter;
            Controller_pong_channel_used = 1;
            Controller_0_PI_0_pong(Controller_pong_signal_parameter);
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
