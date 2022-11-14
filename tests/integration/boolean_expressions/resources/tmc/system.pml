#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
    AggregateTimerData timers;
}

int inited;
chan Actuator_check_binary_channel = [1] of {BinaryBooleanTestParam};
BinaryBooleanTestParam Actuator_check_binary_signal_parameter;
bool Actuator_check_binary_channel_used = 0;
chan Actuator_check_unary_channel = [1] of {UnaryBooleanTestParam};
UnaryBooleanTestParam Actuator_check_unary_signal_parameter;
bool Actuator_check_unary_channel_used = 0;
chan Controller_result_channel = [1] of {MyBooleanResult};
MyBooleanResult Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_check_binary(actuator_check_binary_p1)
{
    Actuator_check_binary_channel!actuator_check_binary_p1;
}
inline Controller_0_RI_0_check_unary(actuator_check_unary_p1)
{
    Actuator_check_unary_channel!actuator_check_unary_p1;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_check_binary_channel) && empty(Actuator_check_unary_channel));
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
active proctype Actuator_check_binary() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_check_binary_channel);
        Actuator_lock?_;
Actuator_check_binary_loop:
        if
        ::  nempty(Actuator_check_binary_channel);
            Actuator_check_binary_channel?Actuator_check_binary_signal_parameter;
            Actuator_check_binary_channel_used = 1;
            Actuator_0_PI_0_check_binary(Actuator_check_binary_signal_parameter);
            goto Actuator_check_binary_loop;
        ::  empty(Actuator_check_binary_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_check_unary() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_check_unary_channel);
        Actuator_lock?_;
Actuator_check_unary_loop:
        if
        ::  nempty(Actuator_check_unary_channel);
            Actuator_check_unary_channel?Actuator_check_unary_signal_parameter;
            Actuator_check_unary_channel_used = 1;
            Actuator_0_PI_0_check_unary(Actuator_check_unary_signal_parameter);
            goto Actuator_check_unary_loop;
        ::  empty(Actuator_check_unary_channel);
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
