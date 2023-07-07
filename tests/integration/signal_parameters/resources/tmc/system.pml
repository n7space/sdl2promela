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
chan Actuator_check_channel = [1] of {MyInteger};
MyInteger Actuator_check_signal_parameter;
bool Actuator_check_channel_used = 0;
chan Controller_result_channel = [1] of {MyInteger};
MyInteger Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
chan Controller_test_channel = [1] of {TestInteger};
TestInteger Controller_test_signal_parameter;
bool Controller_test_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_check_unhandled_input(p1)
{
    printf("unhandled_input actuator check\n");
    skip;
}
inline Actuator_0_RI_0_result(actuator_result_Actuator_result_p1)
{
    Controller_result_channel!actuator_result_Actuator_result_p1;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_check_channel);
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_result_unhandled_input(p1)
{
    printf("unhandled_input controller result\n");
    skip;
}
inline Controller_0_PI_0_test_unhandled_input(p1)
{
    printf("unhandled_input controller test\n");
    skip;
}
inline Controller_0_RI_0_check(controller_check_Controller_check_p1)
{
    Actuator_check_channel!controller_check_Controller_check_p1;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_channel) && empty(Controller_test_channel));
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
active proctype Actuator_check() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_check_channel);
        Actuator_lock?_;
Actuator_check_loop:
        if
        ::  nempty(Actuator_check_channel);
            Actuator_check_channel?Actuator_check_signal_parameter;
            Actuator_check_channel_used = 1;
            Actuator_0_PI_0_check(Actuator_check_signal_parameter);
            goto Actuator_check_loop;
        ::  empty(Actuator_check_channel);
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
    TestInteger value;
    do
    ::  atomic {
        TestInteger_generate_value(value);
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
        inited = 1;
    }
}
#include "scl.pml"
