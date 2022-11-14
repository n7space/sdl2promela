#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "Change_observer.pml"
#include "Zero_observer.pml"
#include "env_inlines.pml"
typedef system_state {
    Change_observer_Context change_observer;
    Zero_observer_Context zero_observer;
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_change_observer_f1_channel = [1] of {MyInteger};
chan Actuator_zero_observer_f1_channel = [1] of {MyInteger};
chan Actuator_change_observer_f2_channel = [1] of {MyInteger};
chan Actuator_zero_observer_f2_channel = [1] of {MyInteger};
chan Actuator_f1_channel = [1] of {MyInteger};
MyInteger Actuator_f1_signal_parameter;
bool Actuator_f1_channel_used = 0;
chan Actuator_f2_channel = [1] of {MyInteger};
MyInteger Actuator_f2_signal_parameter;
bool Actuator_f2_channel_used = 0;
chan Controller_result_channel = [1] of {MyInteger};
MyInteger Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
chan Controller_test_channel = [1] of {MyTestInteger};
MyTestInteger Controller_test_signal_parameter;
bool Controller_test_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
chan Change_observer_lock = [1] of {int};
chan Zero_observer_lock = [1] of {int};
inline Change_observer_0_RI_0_f1_in(change_observer_actuator_p1)
{
    Actuator_change_observer_f1_channel!change_observer_actuator_p1;
}
inline Zero_observer_0_RI_0_f1_in(zero_observer_actuator_p1)
{
    Actuator_zero_observer_f1_channel!zero_observer_actuator_p1;
}
inline Change_observer_0_RI_0_f2_in(change_observer_actuator_p1)
{
    Actuator_change_observer_f2_channel!change_observer_actuator_p1;
}
inline Zero_observer_0_RI_0_f2_in(zero_observer_actuator_p1)
{
    Actuator_zero_observer_f2_channel!zero_observer_actuator_p1;
}
inline Controller_0_RI_0_f1(actuator_f1_p1)
{
    Actuator_f1_channel!actuator_f1_p1;
}
inline Controller_0_RI_0_f2(actuator_f2_p1)
{
    Actuator_f2_channel!actuator_f2_p1;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_change_observer_f1_channel) && (empty(Actuator_f1_channel) && (empty(Actuator_zero_observer_f1_channel) && (empty(Actuator_change_observer_f2_channel) && (empty(Actuator_f2_channel) && empty(Actuator_zero_observer_f2_channel))))));
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
inline Environ_0_RI_0_test(controller_test_p1)
{
    Controller_test_channel!controller_test_p1;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_channel) && empty(Controller_test_channel));
    }
}
inline Controller_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_f1() priority 1
{
    inited;
    do
    ::  atomic {
        (nempty(Actuator_change_observer_f1_channel) || (nempty(Actuator_f1_channel) || nempty(Actuator_zero_observer_f1_channel)));
        Actuator_lock?_;
Actuator_f1_loop:
        if
        ::  nempty(Actuator_change_observer_f1_channel);
            Actuator_change_observer_f1_channel?Actuator_f1_signal_parameter;
            Actuator_f1_channel_used = 1;
            Actuator_0_PI_0_f1(Actuator_f1_signal_parameter);
            goto Actuator_f1_loop;
        ::  empty(Actuator_change_observer_f1_channel);
            skip;
        fi;
        if
        ::  nempty(Actuator_zero_observer_f1_channel);
            Actuator_zero_observer_f1_channel?Actuator_f1_signal_parameter;
            Change_observer_lock?_;
            Change_observer_0_PI_0_f1_in(Actuator_f1_signal_parameter);
            Change_observer_lock!1;
            goto Actuator_f1_loop;
        ::  empty(Actuator_zero_observer_f1_channel);
            skip;
        fi;
        if
        ::  nempty(Actuator_f1_channel);
            Actuator_f1_channel?Actuator_f1_signal_parameter;
            Zero_observer_lock?_;
            Zero_observer_0_PI_0_f1_in(Actuator_f1_signal_parameter);
            Zero_observer_lock!1;
            goto Actuator_f1_loop;
        ::  empty(Actuator_f1_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_f2() priority 1
{
    inited;
    do
    ::  atomic {
        (nempty(Actuator_change_observer_f2_channel) || (nempty(Actuator_f2_channel) || nempty(Actuator_zero_observer_f2_channel)));
        Actuator_lock?_;
Actuator_f2_loop:
        if
        ::  nempty(Actuator_change_observer_f2_channel);
            Actuator_change_observer_f2_channel?Actuator_f2_signal_parameter;
            Actuator_f2_channel_used = 1;
            Actuator_0_PI_0_f2(Actuator_f2_signal_parameter);
            goto Actuator_f2_loop;
        ::  empty(Actuator_change_observer_f2_channel);
            skip;
        fi;
        if
        ::  nempty(Actuator_zero_observer_f2_channel);
            Actuator_zero_observer_f2_channel?Actuator_f2_signal_parameter;
            Change_observer_lock?_;
            Change_observer_0_PI_0_f2_in(Actuator_f2_signal_parameter);
            Change_observer_lock!1;
            goto Actuator_f2_loop;
        ::  empty(Actuator_zero_observer_f2_channel);
            skip;
        fi;
        if
        ::  nempty(Actuator_f2_channel);
            Actuator_f2_channel?Actuator_f2_signal_parameter;
            Zero_observer_lock?_;
            Zero_observer_0_PI_0_f2_in(Actuator_f2_signal_parameter);
            Zero_observer_lock!1;
            goto Actuator_f2_loop;
        ::  empty(Actuator_f2_channel);
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
        Change_observer_0_init();
        Change_observer_lock!1;
        Zero_observer_0_init();
        Zero_observer_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
