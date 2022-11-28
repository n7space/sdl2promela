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
chan Actuator_test_excluded_state_channel = [1] of {int};
chan Actuator_test_simple_state_channel = [1] of {MyInteger};
MyInteger Actuator_test_simple_state_signal_parameter;
bool Actuator_test_simple_state_channel_used = 0;
chan Actuator_test_star_channel = [1] of {int};
chan Actuator_test_state_list_channel = [1] of {MyInteger};
MyInteger Actuator_test_state_list_signal_parameter;
bool Actuator_test_state_list_channel_used = 0;
chan Actuator_test_state_list2_channel = [1] of {int};
chan Controller_result_channel = [1] of {int};
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_test_excluded_state()
{
    int dummy;
    Actuator_test_excluded_state_channel!dummy;
}
inline Actuator_0_PI_0_test_excluded_state_unhandled_input()
{
    skip;
}
inline Controller_0_RI_0_test_simple_state(actuator_test_simple_state_p1)
{
    Actuator_test_simple_state_channel!actuator_test_simple_state_p1;
}
inline Actuator_0_PI_0_test_simple_state_unhandled_input(p1)
{
    skip;
}
inline Controller_0_RI_0_test_star()
{
    int dummy;
    Actuator_test_star_channel!dummy;
}
inline Actuator_0_PI_0_test_star_unhandled_input()
{
    skip;
}
inline Controller_0_RI_0_test_state_list(actuator_test_state_list_p1)
{
    Actuator_test_state_list_channel!actuator_test_state_list_p1;
}
inline Actuator_0_PI_0_test_state_list_unhandled_input(p1)
{
    skip;
}
inline Controller_0_RI_0_test_state_list2()
{
    int dummy;
    Actuator_test_state_list2_channel!dummy;
}
inline Actuator_0_PI_0_test_state_list2_unhandled_input()
{
    skip;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_test_excluded_state_channel) && (empty(Actuator_test_simple_state_channel) && (empty(Actuator_test_star_channel) && (empty(Actuator_test_state_list_channel) && empty(Actuator_test_state_list2_channel)))));
    }
}
inline Actuator_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_result()
{
    int dummy;
    Controller_result_channel!dummy;
}
inline Controller_0_PI_0_result_unhandled_input()
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
active proctype Actuator_test_excluded_state() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_excluded_state_channel);
        Actuator_lock?_;
Actuator_test_excluded_state_loop:
        if
        ::  nempty(Actuator_test_excluded_state_channel);
            Actuator_test_excluded_state_channel?_;
            Actuator_0_PI_0_test_excluded_state();
            goto Actuator_test_excluded_state_loop;
        ::  empty(Actuator_test_excluded_state_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_simple_state() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_simple_state_channel);
        Actuator_lock?_;
Actuator_test_simple_state_loop:
        if
        ::  nempty(Actuator_test_simple_state_channel);
            Actuator_test_simple_state_channel?Actuator_test_simple_state_signal_parameter;
            Actuator_test_simple_state_channel_used = 1;
            Actuator_0_PI_0_test_simple_state(Actuator_test_simple_state_signal_parameter);
            goto Actuator_test_simple_state_loop;
        ::  empty(Actuator_test_simple_state_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_star() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_star_channel);
        Actuator_lock?_;
Actuator_test_star_loop:
        if
        ::  nempty(Actuator_test_star_channel);
            Actuator_test_star_channel?_;
            Actuator_0_PI_0_test_star();
            goto Actuator_test_star_loop;
        ::  empty(Actuator_test_star_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_state_list() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_state_list_channel);
        Actuator_lock?_;
Actuator_test_state_list_loop:
        if
        ::  nempty(Actuator_test_state_list_channel);
            Actuator_test_state_list_channel?Actuator_test_state_list_signal_parameter;
            Actuator_test_state_list_channel_used = 1;
            Actuator_0_PI_0_test_state_list(Actuator_test_state_list_signal_parameter);
            goto Actuator_test_state_list_loop;
        ::  empty(Actuator_test_state_list_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_state_list2() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_state_list2_channel);
        Actuator_lock?_;
Actuator_test_state_list2_loop:
        if
        ::  nempty(Actuator_test_state_list2_channel);
            Actuator_test_state_list2_channel?_;
            Actuator_0_PI_0_test_state_list2();
            goto Actuator_test_state_list2_loop;
        ::  empty(Actuator_test_state_list2_channel);
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
            Controller_result_channel?_;
            Controller_0_PI_0_result();
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
