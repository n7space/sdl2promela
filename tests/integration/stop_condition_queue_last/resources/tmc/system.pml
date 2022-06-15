#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
}

int inited;
chan Actuator_test_integer_channel = [1] of {MyInteger};
MyInteger Actuator_test_integer_signal_parameter;
bool Actuator_test_integer_channel_used = 0;
chan Actuator_test_sequence_channel = [1] of {MySequenceDataType};
MySequenceDataType Actuator_test_sequence_signal_parameter;
bool Actuator_test_sequence_channel_used = 0;
chan Actuator_test_choice_channel = [1] of {MyChoiceDataType};
MyChoiceDataType Actuator_test_choice_signal_parameter;
bool Actuator_test_choice_channel_used = 0;
chan Actuator_test_array_channel = [1] of {MyArrayDataType};
MyArrayDataType Actuator_test_array_signal_parameter;
bool Actuator_test_array_channel_used = 0;
chan Actuator_test_optional_channel = [1] of {MySequenceWithOptionalsDataType};
MySequenceWithOptionalsDataType Actuator_test_optional_signal_parameter;
bool Actuator_test_optional_channel_used = 0;
chan Controller_result_channel = [1] of {int};
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_test_integer(actuator_test_integer_p1)
{
    Actuator_test_integer_channel!actuator_test_integer_p1;
}
inline Controller_0_RI_0_test_sequence(actuator_test_sequence_p1)
{
    Actuator_test_sequence_channel!actuator_test_sequence_p1;
}
inline Controller_0_RI_0_test_choice(actuator_test_choice_p1)
{
    Actuator_test_choice_channel!actuator_test_choice_p1;
}
inline Controller_0_RI_0_test_array(actuator_test_array_p1)
{
    Actuator_test_array_channel!actuator_test_array_p1;
}
inline Controller_0_RI_0_test_optional(actuator_test_optional_p1)
{
    Actuator_test_optional_channel!actuator_test_optional_p1;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_test_integer_channel) && (empty(Actuator_test_sequence_channel) && (empty(Actuator_test_choice_channel) && (empty(Actuator_test_array_channel) && empty(Actuator_test_optional_channel)))));
    }
}
inline Actuator_0_RI_0_result()
{
    int dummy;
    Controller_result_channel!dummy;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_result_channel);
    }
}
active proctype Actuator_test_integer() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_integer_channel?Actuator_test_integer_signal_parameter;
        Actuator_test_integer_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_integer(Actuator_test_integer_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_sequence() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_sequence_channel?Actuator_test_sequence_signal_parameter;
        Actuator_test_sequence_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_sequence(Actuator_test_sequence_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_choice() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_choice_channel?Actuator_test_choice_signal_parameter;
        Actuator_test_choice_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_choice(Actuator_test_choice_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_array() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_array_channel?Actuator_test_array_signal_parameter;
        Actuator_test_array_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_array(Actuator_test_array_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_optional() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_optional_channel?Actuator_test_optional_signal_parameter;
        Actuator_test_optional_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_optional(Actuator_test_optional_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Controller_result() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_result_channel?_;
        Controller_lock?token;
        Controller_0_PI_0_result();
        Controller_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Actuator_0_init();
        Actuator_lock!init_token;
        Controller_0_init();
        Controller_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
