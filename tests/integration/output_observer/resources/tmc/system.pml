#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "Observer.pml"
#include "env_inlines.pml"
typedef system_state {
    Observer_Context observer;
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan Actuator_observer_ping_channel = [1] of {MyInteger};
chan Controller_pong_channel = [1] of {MyInteger};
MyInteger Controller_pong_signal_parameter;
bool Controller_pong_channel_used = 0;
chan Actuator_ping_channel = [1] of {MyInteger};
MyInteger Actuator_ping_signal_parameter;
bool Actuator_ping_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
chan Observer_lock = [1] of {int};
inline Observer_0_RI_0_ping_in(observer_actuator_p1)
{
    Actuator_observer_ping_channel!observer_actuator_p1;
}
inline Actuator_0_RI_0_pong(controller_pong_p1)
{
    Controller_pong_channel!controller_pong_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_pong_channel);
    }
}
inline Controller_0_RI_0_ping(actuator_ping_p1)
{
    Actuator_ping_channel!actuator_ping_p1;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_observer_ping_channel) && empty(Actuator_ping_channel));
    }
}
active proctype Controller_pong() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_pong_channel);
        Controller_lock?_;
        if
        ::  nempty(Controller_pong_channel);
            Controller_pong_channel?Controller_pong_signal_parameter;
            Controller_0_PI_0_pong(Controller_pong_signal_parameter);
        ::  empty(Controller_pong_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Actuator_ping() priority 1
{
    inited;
    do
    ::  atomic {
        (nempty(Actuator_ping_channel) || nempty(Actuator_observer_ping_channel));
        Actuator_lock?_;
        if
        ::  nempty(Actuator_ping_channel);
            Actuator_ping_channel?Actuator_ping_signal_parameter;
            Observer_lock?_;
            Observer_0_PI_0_ping_in(Actuator_ping_signal_parameter);
            Observer_lock!1;
        ::  empty(Actuator_ping_channel);
            skip;
        fi;
        if
        ::  nempty(Actuator_observer_ping_channel);
            Actuator_observer_ping_channel?Actuator_ping_signal_parameter;
            Actuator_0_PI_0_ping(Actuator_ping_signal_parameter);
        ::  empty(Actuator_observer_ping_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
init
{
    atomic {
        Actuator_0_init();
        Actuator_lock!1;
        Controller_0_init();
        Controller_lock!1;
        Observer_0_init();
        Observer_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
