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
chan Actuator_test_array_channel = [1] of {MyArrayDataType};
MyArrayDataType Actuator_test_array_signal_parameter;
bool Actuator_test_array_channel_used = 0;
chan Actuator_test_choice_channel = [1] of {MyChoiceDataType};
MyChoiceDataType Actuator_test_choice_signal_parameter;
bool Actuator_test_choice_channel_used = 0;
chan Actuator_test_integer_channel = [1] of {MyInteger};
MyInteger Actuator_test_integer_signal_parameter;
bool Actuator_test_integer_channel_used = 0;
chan Actuator_test_optional_channel = [1] of {MySequenceWithOptionalsDataType};
MySequenceWithOptionalsDataType Actuator_test_optional_signal_parameter;
bool Actuator_test_optional_channel_used = 0;
chan Actuator_test_sequence_channel = [1] of {MySequenceDataType};
MySequenceDataType Actuator_test_sequence_signal_parameter;
bool Actuator_test_sequence_channel_used = 0;
chan Controller_result_channel = [1] of {int};
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_test_array_unhandled_input(p1)
{
    printf("unhandled_input actuator test_array\n");
    skip;
}
inline Actuator_0_PI_0_test_choice_unhandled_input(p1)
{
    printf("unhandled_input actuator test_choice\n");
    skip;
}
inline Actuator_0_PI_0_test_integer_unhandled_input(p1)
{
    printf("unhandled_input actuator test_integer\n");
    skip;
}
inline Actuator_0_PI_0_test_optional_unhandled_input(p1)
{
    printf("unhandled_input actuator test_optional\n");
    skip;
}
inline Actuator_0_PI_0_test_sequence_unhandled_input(p1)
{
    printf("unhandled_input actuator test_sequence\n");
    skip;
}
inline Actuator_0_RI_0_result()
{
    Controller_result_channel!0;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_test_array_channel) && (empty(Actuator_test_choice_channel) && (empty(Actuator_test_integer_channel) && (empty(Actuator_test_optional_channel) && empty(Actuator_test_sequence_channel)))));
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_result_unhandled_input()
{
    printf("unhandled_input controller result\n");
    skip;
}
inline Controller_0_RI_0_test_array(controller_test_array_Controller_test_array_p1)
{
    Actuator_test_array_channel!controller_test_array_Controller_test_array_p1;
}
inline Controller_0_RI_0_test_choice(controller_test_choice_Controller_test_choice_p1)
{
    Actuator_test_choice_channel!controller_test_choice_Controller_test_choice_p1;
}
inline Controller_0_RI_0_test_integer(controller_test_integer_Controller_test_integer_p1)
{
    Actuator_test_integer_channel!controller_test_integer_Controller_test_integer_p1;
}
inline Controller_0_RI_0_test_optional(controller_test_optional_Controller_test_optional_p1)
{
    Actuator_test_optional_channel!controller_test_optional_Controller_test_optional_p1;
}
inline Controller_0_RI_0_test_sequence(controller_test_sequence_Controller_test_sequence_p1)
{
    Actuator_test_sequence_channel!controller_test_sequence_Controller_test_sequence_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_result_channel);
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_test_array() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_array_channel);
        Actuator_lock?_;
Actuator_test_array_loop:
        if
        ::  nempty(Actuator_test_array_channel);
            Actuator_test_array_channel?Actuator_test_array_signal_parameter;
            Actuator_test_array_channel_used = 1;
            Actuator_0_PI_0_test_array(Actuator_test_array_signal_parameter);
            goto Actuator_test_array_loop;
        ::  empty(Actuator_test_array_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_choice() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_choice_channel);
        Actuator_lock?_;
Actuator_test_choice_loop:
        if
        ::  nempty(Actuator_test_choice_channel);
            Actuator_test_choice_channel?Actuator_test_choice_signal_parameter;
            Actuator_test_choice_channel_used = 1;
            Actuator_0_PI_0_test_choice(Actuator_test_choice_signal_parameter);
            goto Actuator_test_choice_loop;
        ::  empty(Actuator_test_choice_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_integer() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_integer_channel);
        Actuator_lock?_;
Actuator_test_integer_loop:
        if
        ::  nempty(Actuator_test_integer_channel);
            Actuator_test_integer_channel?Actuator_test_integer_signal_parameter;
            Actuator_test_integer_channel_used = 1;
            Actuator_0_PI_0_test_integer(Actuator_test_integer_signal_parameter);
            goto Actuator_test_integer_loop;
        ::  empty(Actuator_test_integer_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_optional() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_optional_channel);
        Actuator_lock?_;
Actuator_test_optional_loop:
        if
        ::  nempty(Actuator_test_optional_channel);
            Actuator_test_optional_channel?Actuator_test_optional_signal_parameter;
            Actuator_test_optional_channel_used = 1;
            Actuator_0_PI_0_test_optional(Actuator_test_optional_signal_parameter);
            goto Actuator_test_optional_loop;
        ::  empty(Actuator_test_optional_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_sequence() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_sequence_channel);
        Actuator_lock?_;
Actuator_test_sequence_loop:
        if
        ::  nempty(Actuator_test_sequence_channel);
            Actuator_test_sequence_channel?Actuator_test_sequence_signal_parameter;
            Actuator_test_sequence_channel_used = 1;
            Actuator_0_PI_0_test_sequence(Actuator_test_sequence_signal_parameter);
            goto Actuator_test_sequence_loop;
        ::  empty(Actuator_test_sequence_channel);
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
