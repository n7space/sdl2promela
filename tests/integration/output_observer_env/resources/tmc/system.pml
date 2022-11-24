#include "dataview.pml"
#include "controller.pml"
#include "Observer.pml"
#include "env_inlines.pml"
typedef system_state {
    Observer_Context observer;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Controller_observer_ping_channel = [1] of {MyInteger};
chan Controller_ping_channel = [1] of {MyInteger};
MyInteger Controller_ping_signal_parameter;
bool Controller_ping_channel_used = 0;
chan Environ_pong_channel = [1] of {MyInteger};
MyInteger Environ_pong_signal_parameter;
bool Environ_pong_channel_used = 0;
system_state global_state;
chan Controller_lock = [1] of {int};
chan Observer_lock = [1] of {int};
inline Observer_0_RI_0_ping_in(observer_controller_p1)
{
    Controller_observer_ping_channel!observer_controller_p1;
}
inline Environ_0_RI_0_ping(controller_ping_p1)
{
    Controller_ping_channel!controller_ping_p1;
}
inline Controller_0_PI_0_ping_unhandled_input(p1)
{
    skip;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_observer_ping_channel) && empty(Controller_ping_channel));
    }
}
inline Controller_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Controller_0_RI_0_pong(environ_pong_p1)
{
    Environ_pong_channel!environ_pong_p1;
}
active proctype Controller_ping() priority 1
{
    inited;
    do
    ::  atomic {
        (nempty(Controller_observer_ping_channel) || nempty(Controller_ping_channel));
        Controller_lock?_;
Controller_ping_loop:
        if
        ::  nempty(Controller_observer_ping_channel);
            Controller_observer_ping_channel?Controller_ping_signal_parameter;
            Controller_ping_channel_used = 1;
            Controller_0_PI_0_ping(Controller_ping_signal_parameter);
            goto Controller_ping_loop;
        ::  empty(Controller_observer_ping_channel);
            skip;
        fi;
        if
        ::  nempty(Controller_ping_channel);
            Controller_ping_channel?Controller_ping_signal_parameter;
            Observer_lock?_;
            Observer_0_PI_0_ping_in(Controller_ping_signal_parameter);
            Observer_lock!1;
            goto Controller_ping_loop;
        ::  empty(Controller_ping_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Environ_pong() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Environ_pong_channel);
Environ_pong_loop:
        if
        ::  nempty(Environ_pong_channel);
            Environ_pong_channel?Environ_pong_signal_parameter;
            Environ_pong_channel_used = 1;
            goto Environ_pong_loop;
        ::  empty(Environ_pong_channel);
            skip;
        fi;
    }
    od;
}
active proctype Environ_ping() priority 1
{
    inited;
    MyInteger value;
    do
    ::  atomic {
        MyInteger_generate_value(value);
        Environ_0_RI_0_ping(value);
    }
    od;
}
init
{
    atomic {
        global_dataview_init();
        Controller_0_init();
        Controller_lock!1;
        Observer_0_init();
        Observer_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
