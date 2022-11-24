#include "dataview.pml"
#include "actuatorinst.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuatorinst;
    AggregateTimerData timers;
}

int inited;
chan Actuatorinst_ping_channel = [1] of {MyInteger};
MyInteger Actuatorinst_ping_signal_parameter;
bool Actuatorinst_ping_channel_used = 0;
chan Controller_pong_channel = [1] of {MyInteger};
MyInteger Controller_pong_signal_parameter;
bool Controller_pong_channel_used = 0;
system_state global_state;
chan Actuatorinst_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_ping(actuatorinst_ping_p1)
{
    Actuatorinst_ping_channel!actuatorinst_ping_p1;
}
inline Actuatorinst_0_PI_0_ping_unhandled_input(p1)
{
    skip;
}
inline Actuatorinst_check_queue()
{
    atomic {
        empty(Actuatorinst_ping_channel);
    }
}
inline Actuatorinst_0_get_sender(Actuatorinst_sender_arg)
{
    skip;
}
inline Actuatorinst_0_RI_0_pong(controller_pong_p1)
{
    Controller_pong_channel!controller_pong_p1;
}
inline Controller_0_PI_0_pong_unhandled_input(p1)
{
    skip;
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
active proctype Actuatorinst_ping() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuatorinst_ping_channel);
        Actuatorinst_lock?_;
Actuatorinst_ping_loop:
        if
        ::  nempty(Actuatorinst_ping_channel);
            Actuatorinst_ping_channel?Actuatorinst_ping_signal_parameter;
            Actuatorinst_ping_channel_used = 1;
            Actuatorinst_0_PI_0_ping(Actuatorinst_ping_signal_parameter);
            goto Actuatorinst_ping_loop;
        ::  empty(Actuatorinst_ping_channel);
            skip;
        fi;
        Actuatorinst_lock!1;
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
        Actuatorinst_0_init();
        Actuatorinst_lock!1;
        Controller_0_init();
        Controller_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
