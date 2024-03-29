#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "Observer.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    Observer_Context observer;
    AggregateTimerData timers;
}

int inited;
chan Actuator_observer_ping_channel = [2] of {MyInteger};
chan Actuator_ping_channel = [2] of {MyInteger};
MyInteger Actuator_ping_signal_parameter;
bool Actuator_ping_channel_used = 0;
chan Controller_pong_channel = [4] of {MyInteger};
MyInteger Controller_pong_signal_parameter;
bool Controller_pong_channel_used = 0;
chan Controller_test_channel = [1] of {MyTestInteger};
MyTestInteger Controller_test_signal_parameter;
bool Controller_test_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
chan Observer_lock = [1] of {int};
inline Observer_0_RI_0_ping_in(observer_actuator_p1)
{
    Actuator_observer_ping_channel!observer_actuator_p1;
}
inline Actuator_0_PI_0_ping_unhandled_input(p1)
{
    printf("unhandled_input actuator ping\n");
    skip;
}
inline Actuator_0_RI_0_pong(actuator_pong_Actuator_pong_p1)
{
    Controller_pong_channel!actuator_pong_Actuator_pong_p1;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_observer_ping_channel) && empty(Actuator_ping_channel));
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_pong_unhandled_input(p1)
{
    printf("unhandled_input controller pong\n");
    skip;
}
inline Controller_0_PI_0_test_unhandled_input(p1)
{
    printf("unhandled_input controller test\n");
    skip;
}
inline Controller_0_RI_0_ping(controller_ping_Controller_ping_p1)
{
    Actuator_ping_channel!controller_ping_Controller_ping_p1;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_pong_channel) && empty(Controller_test_channel));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Environ_0_RI_0_test(environ_test_Environ_test_p1)
{
    Controller_test_channel!environ_test_Environ_test_p1;
}
active proctype Actuator_ping() priority 1
{
    inited;
    do
    ::  atomic {
        (nempty(Actuator_observer_ping_channel) || nempty(Actuator_ping_channel));
        Actuator_lock?_;
Actuator_ping_loop:
        if
        ::  nempty(Actuator_observer_ping_channel);
            Actuator_observer_ping_channel?Actuator_ping_signal_parameter;
            Actuator_ping_channel_used = 1;
            Actuator_0_PI_0_ping(Actuator_ping_signal_parameter);
            goto Actuator_ping_loop;
        ::  empty(Actuator_observer_ping_channel);
            skip;
        fi;
        if
        ::  nempty(Actuator_ping_channel);
            Actuator_ping_channel?Actuator_ping_signal_parameter;
            Observer_lock?_;
            Observer_0_PI_0_ping_in(Actuator_ping_signal_parameter);
            Observer_lock!1;
            goto Actuator_ping_loop;
        ::  empty(Actuator_ping_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_pong() priority 2
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
active proctype Controller_test() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_test_channel);
        Controller_lock?_;
Controller_test_loop:
        if
        ::  nempty(Controller_test_channel);
            Controller_test_channel?Controller_test_signal_parameter;
            Controller_test_channel_used = 1;
            Controller_0_PI_0_test(Controller_test_signal_parameter);
            goto Controller_test_loop;
        ::  empty(Controller_test_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Environ_test() priority 1
{
    inited;
    MyTestInteger value;
    do
    ::  atomic {
        MyTestInteger_generate_value(value);
        Environ_0_RI_0_test(value);
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
        Observer_0_init();
        Observer_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
