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
chan Actuator_tick_channel = [1] of {int};
chan Controller_result_channel = [1] of {MyStatus};
MyStatus Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_tick()
{
    int dummy;
    Actuator_tick_channel!dummy;
}
inline Actuator_0_PI_0_tick_unhandled_input()
{
    skip;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_tick_channel);
    }
}
inline Actuator_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_result(controller_result_p1)
{
    Controller_result_channel!controller_result_p1;
}
inline Controller_0_PI_0_result_unhandled_input(p1)
{
    skip;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_result_channel);
    }
}
inline Controller_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_tick() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_tick_channel);
        Actuator_lock?_;
Actuator_tick_loop:
        if
        ::  nempty(Actuator_tick_channel);
            Actuator_tick_channel?_;
            Actuator_0_PI_0_tick();
            goto Actuator_tick_loop;
        ::  empty(Actuator_tick_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_result() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_channel);
        Controller_lock?_;
Controller_result_loop:
        if
        ::  nempty(Controller_result_channel);
            Controller_result_channel?Controller_result_signal_parameter;
            Controller_result_channel_used = 1;
            Controller_0_PI_0_result(Controller_result_signal_parameter);
            goto Controller_result_loop;
        ::  empty(Controller_result_channel);
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
