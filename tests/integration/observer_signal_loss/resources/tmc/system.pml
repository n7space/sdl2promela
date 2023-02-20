#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "Uh_function_observer.pml"
#include "Uh_global_observer.pml"
#include "Uh_signal_observer.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    Uh_function_observer_Context uh_function_observer;
    Uh_global_observer_Context uh_global_observer;
    Uh_signal_observer_Context uh_signal_observer;
    AggregateTimerData timers;
}

int inited;
chan Actuator_ping_channel = [1] of {MyInteger};
MyInteger Actuator_ping_signal_parameter;
bool Actuator_ping_channel_used = 0;
chan Controller_pong_channel = [1] of {MyInteger};
MyInteger Controller_pong_signal_parameter;
bool Controller_pong_channel_used = 0;
chan Controller_test_channel = [1] of {MyTestInteger};
MyTestInteger Controller_test_signal_parameter;
bool Controller_test_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
chan Uh_function_observer_lock = [1] of {int};
chan Uh_global_observer_lock = [1] of {int};
chan Uh_signal_observer_lock = [1] of {int};
inline Controller_0_RI_0_ping(actuator_ping_p1)
{
    Actuator_ping_channel!actuator_ping_p1;
}
inline Actuator_0_PI_0_ping_unhandled_input(p1)
{
    printf("unhandled_input actuator ping\n");
    Uh_signal_observer_lock?_;
    Uh_signal_observer_0_PI_0_uh(p1);
    Uh_signal_observer_lock!1;
    Uh_global_observer_lock?_;
    Uh_global_observer_0_PI_0_uh();
    Uh_global_observer_lock!1;
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
inline Actuator_0_RI_0_pong(controller_pong_p1)
{
    Controller_pong_channel!controller_pong_p1;
}
inline Controller_0_PI_0_pong_unhandled_input(p1)
{
    printf("unhandled_input controller pong\n");
    Uh_function_observer_lock?_;
    Uh_function_observer_0_PI_0_uh();
    Uh_function_observer_lock!1;
    Uh_global_observer_lock?_;
    Uh_global_observer_0_PI_0_uh();
    Uh_global_observer_lock!1;
}
inline Environ_0_RI_0_test(controller_test_p1)
{
    Controller_test_channel!controller_test_p1;
}
inline Controller_0_PI_0_test_unhandled_input(p1)
{
    printf("unhandled_input controller test\n");
    Uh_function_observer_lock?_;
    Uh_function_observer_0_PI_0_uh();
    Uh_function_observer_lock!1;
    Uh_global_observer_lock?_;
    Uh_global_observer_0_PI_0_uh();
    Uh_global_observer_lock!1;
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
        Uh_function_observer_0_init();
        Uh_function_observer_lock!1;
        Uh_global_observer_0_init();
        Uh_global_observer_lock!1;
        Uh_signal_observer_0_init();
        Uh_signal_observer_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
