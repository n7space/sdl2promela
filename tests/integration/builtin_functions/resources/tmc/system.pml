#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan Controller_result_channel = [1] of {MyBoolean};
MyBoolean Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
chan Controller_result_int_channel = [1] of {MyInteger};
MyInteger Controller_result_int_signal_parameter;
bool Controller_result_int_channel_used = 0;
chan Controller_result_enum_channel = [1] of {MyEnum};
MyEnum Controller_result_enum_signal_parameter;
bool Controller_result_enum_channel_used = 0;
chan Actuator_test_present_channel = [1] of {MyUnion};
MyUnion Actuator_test_present_signal_parameter;
bool Actuator_test_present_channel_used = 0;
chan Actuator_test_length_channel = [1] of {MyArray};
MyArray Actuator_test_length_signal_parameter;
bool Actuator_test_length_channel_used = 0;
chan Actuator_test_exist_channel = [1] of {MyStruct};
MyStruct Actuator_test_exist_signal_parameter;
bool Actuator_test_exist_channel_used = 0;
chan Actuator_test_to_enum_channel = [1] of {MyUnion};
MyUnion Actuator_test_to_enum_signal_parameter;
bool Actuator_test_to_enum_channel_used = 0;
chan Actuator_test_to_selector_channel = [1] of {MyEnum};
MyEnum Actuator_test_to_selector_signal_parameter;
bool Actuator_test_to_selector_channel_used = 0;
chan Actuator_test_num_channel = [1] of {MyEnum};
MyEnum Actuator_test_num_signal_parameter;
bool Actuator_test_num_channel_used = 0;
chan Actuator_test_val_channel = [1] of {MyInteger};
MyInteger Actuator_test_val_signal_parameter;
bool Actuator_test_val_channel_used = 0;
chan Actuator_test_length_fixed_channel = [1] of {MyFixed};
MyFixed Actuator_test_length_fixed_signal_parameter;
bool Actuator_test_length_fixed_channel_used = 0;
chan Actuator_test_length_derived_fixed_channel = [1] of {MyDerivedFixed};
MyDerivedFixed Actuator_test_length_derived_fixed_signal_parameter;
bool Actuator_test_length_derived_fixed_channel_used = 0;
chan Actuator_test_derived_length_channel = [1] of {MyDerivedArray};
MyDerivedArray Actuator_test_derived_length_signal_parameter;
bool Actuator_test_derived_length_channel_used = 0;
system_state global_state;
chan Controller_lock = [1] of {int};
chan Actuator_lock = [1] of {int};
inline Actuator_0_RI_0_result(controller_result_p1)
{
    Controller_result_channel!controller_result_p1;
}
inline Actuator_0_RI_0_result_int(controller_result_int_p1)
{
    Controller_result_int_channel!controller_result_int_p1;
}
inline Actuator_0_RI_0_result_enum(controller_result_enum_p1)
{
    Controller_result_enum_channel!controller_result_enum_p1;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_channel) && (empty(Controller_result_int_channel) && empty(Controller_result_enum_channel)));
    }
}
inline Controller_0_RI_0_test_present(actuator_test_present_p1)
{
    Actuator_test_present_channel!actuator_test_present_p1;
}
inline Controller_0_RI_0_test_length(actuator_test_length_p1)
{
    Actuator_test_length_channel!actuator_test_length_p1;
}
inline Controller_0_RI_0_test_exist(actuator_test_exist_p1)
{
    Actuator_test_exist_channel!actuator_test_exist_p1;
}
inline Controller_0_RI_0_test_to_enum(actuator_test_to_enum_p1)
{
    Actuator_test_to_enum_channel!actuator_test_to_enum_p1;
}
inline Controller_0_RI_0_test_to_selector(actuator_test_to_selector_p1)
{
    Actuator_test_to_selector_channel!actuator_test_to_selector_p1;
}
inline Controller_0_RI_0_test_num(actuator_test_num_p1)
{
    Actuator_test_num_channel!actuator_test_num_p1;
}
inline Controller_0_RI_0_test_val(actuator_test_val_p1)
{
    Actuator_test_val_channel!actuator_test_val_p1;
}
inline Controller_0_RI_0_test_length_fixed(actuator_test_length_fixed_p1)
{
    Actuator_test_length_fixed_channel!actuator_test_length_fixed_p1;
}
inline Controller_0_RI_0_test_length_derived_fixed(actuator_test_length_derived_fixed_p1)
{
    Actuator_test_length_derived_fixed_channel!actuator_test_length_derived_fixed_p1;
}
inline Controller_0_RI_0_test_derived_length(actuator_test_derived_length_p1)
{
    Actuator_test_derived_length_channel!actuator_test_derived_length_p1;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_test_present_channel) && (empty(Actuator_test_length_channel) && (empty(Actuator_test_exist_channel) && (empty(Actuator_test_to_enum_channel) && (empty(Actuator_test_to_selector_channel) && (empty(Actuator_test_num_channel) && (empty(Actuator_test_val_channel) && (empty(Actuator_test_length_fixed_channel) && (empty(Actuator_test_length_derived_fixed_channel) && empty(Actuator_test_derived_length_channel))))))))));
    }
}
active proctype Controller_result() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_result_channel?Controller_result_signal_parameter;
        Controller_result_channel_used = 1;
        Controller_lock?token;
        Controller_0_PI_0_result(Controller_result_signal_parameter);
        Controller_lock!token;
    }
    od;
}
active proctype Controller_result_int() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_result_int_channel?Controller_result_int_signal_parameter;
        Controller_result_int_channel_used = 1;
        Controller_lock?token;
        Controller_0_PI_0_result_int(Controller_result_int_signal_parameter);
        Controller_lock!token;
    }
    od;
}
active proctype Controller_result_enum() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_result_enum_channel?Controller_result_enum_signal_parameter;
        Controller_result_enum_channel_used = 1;
        Controller_lock?token;
        Controller_0_PI_0_result_enum(Controller_result_enum_signal_parameter);
        Controller_lock!token;
    }
    od;
}
active proctype Actuator_test_present() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_present_channel?Actuator_test_present_signal_parameter;
        Actuator_test_present_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_present(Actuator_test_present_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_length() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_length_channel?Actuator_test_length_signal_parameter;
        Actuator_test_length_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_length(Actuator_test_length_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_exist() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_exist_channel?Actuator_test_exist_signal_parameter;
        Actuator_test_exist_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_exist(Actuator_test_exist_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_to_enum() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_to_enum_channel?Actuator_test_to_enum_signal_parameter;
        Actuator_test_to_enum_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_to_enum(Actuator_test_to_enum_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_to_selector() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_to_selector_channel?Actuator_test_to_selector_signal_parameter;
        Actuator_test_to_selector_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_to_selector(Actuator_test_to_selector_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_num() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_num_channel?Actuator_test_num_signal_parameter;
        Actuator_test_num_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_num(Actuator_test_num_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_val() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_val_channel?Actuator_test_val_signal_parameter;
        Actuator_test_val_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_val(Actuator_test_val_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_length_fixed() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_length_fixed_channel?Actuator_test_length_fixed_signal_parameter;
        Actuator_test_length_fixed_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_length_fixed(Actuator_test_length_fixed_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_length_derived_fixed() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_length_derived_fixed_channel?Actuator_test_length_derived_fixed_signal_parameter;
        Actuator_test_length_derived_fixed_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_length_derived_fixed(Actuator_test_length_derived_fixed_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Actuator_test_derived_length() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_test_derived_length_channel?Actuator_test_derived_length_signal_parameter;
        Actuator_test_derived_length_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_test_derived_length(Actuator_test_derived_length_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        Controller_lock!init_token;
        Actuator_0_init();
        Actuator_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
