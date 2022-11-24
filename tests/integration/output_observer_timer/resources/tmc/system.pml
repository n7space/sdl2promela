#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "Observer.pml"
#include "env_inlines.pml"
typedef system_state {
    Observer_Context observer;
    Controller_Context controller;
    Actuator_Context actuator;
    AggregateTimerData timers;
}

int inited;
chan Actuator_observer_actuator_trigger_channel = [1] of {int};
chan Actuator_ping_channel = [1] of {int};
chan Actuator_trigger_channel = [1] of {int};
chan Controller_pong_channel = [1] of {int};
system_state global_state;
chan Controller_lock = [1] of {int};
chan Actuator_lock = [1] of {int};
chan Observer_lock = [1] of {int};
inline Actuator_0_trigger_set(actuator_trigger_interval)
{
    global_state.timers.actuator.trigger.interval = actuator_trigger_interval;
    global_state.timers.actuator.trigger.timer_enabled = true;
    printf("set_timer actuator trigger %d\n", actuator_trigger_interval);
}
inline Actuator_0_trigger_reset()
{
    global_state.timers.actuator.trigger.timer_enabled = false;
    printf("reset_timer actuator trigger\n");
}
inline Observer_0_RI_0_trigger_out()
{
    Actuator_observer_actuator_trigger_channel!1;
}
inline Controller_0_RI_0_ping()
{
    int dummy;
    Actuator_ping_channel!dummy;
}
inline Actuator_0_PI_0_ping_unhandled_input()
{
    skip;
}
inline Actuator_0_PI_0_trigger_unhandled_input()
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
inline Actuator_0_RI_0_pong()
{
    int dummy;
    Controller_pong_channel!dummy;
}
inline Controller_0_PI_0_pong_unhandled_input()
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
active proctype timer_manager_proc() priority 1
{
    inited;
    do
    ::  atomic {
        true;
        if
        ::  global_state.timers.actuator.trigger.timer_enabled;
            Actuator_trigger_channel!0;
            global_state.timers.actuator.trigger.timer_enabled = false;
        ::  else;
            skip;
        fi;
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
active proctype Actuator_trigger() priority 1
{
    inited;
    do
    ::  atomic {
        (nempty(Actuator_observer_actuator_trigger_channel) || nempty(Actuator_trigger_channel));
        Actuator_lock?_;
Actuator_trigger_loop:
        if
        ::  nempty(Actuator_observer_actuator_trigger_channel);
            Actuator_observer_actuator_trigger_channel?_;
            Actuator_0_PI_0_trigger();
            goto Actuator_trigger_loop;
        ::  empty(Actuator_observer_actuator_trigger_channel);
            skip;
        fi;
        if
        ::  nempty(Actuator_trigger_channel);
            Actuator_trigger_channel?_;
            Observer_lock?_;
            Observer_0_PI_0_trigger_out();
            Observer_lock!1;
            goto Actuator_trigger_loop;
        ::  empty(Actuator_trigger_channel);
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
        Observer_0_init();
        Observer_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
