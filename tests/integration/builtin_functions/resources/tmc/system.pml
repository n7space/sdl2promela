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
chan Actuator_test_derived_length_channel = [1] of {MyDerivedArray};
MyDerivedArray Actuator_test_derived_length_signal_parameter;
bool Actuator_test_derived_length_channel_used = 0;
chan Actuator_test_exist_channel = [1] of {MyStruct};
MyStruct Actuator_test_exist_signal_parameter;
bool Actuator_test_exist_channel_used = 0;
chan Actuator_test_length_channel = [1] of {MyArray};
MyArray Actuator_test_length_signal_parameter;
bool Actuator_test_length_channel_used = 0;
chan Actuator_test_length_derived_fixed_channel = [1] of {MyDerivedFixed};
MyDerivedFixed Actuator_test_length_derived_fixed_signal_parameter;
bool Actuator_test_length_derived_fixed_channel_used = 0;
chan Actuator_test_length_fixed_channel = [1] of {MyFixed};
MyFixed Actuator_test_length_fixed_signal_parameter;
bool Actuator_test_length_fixed_channel_used = 0;
chan Actuator_test_num_channel = [1] of {MyEnum};
MyEnum Actuator_test_num_signal_parameter;
bool Actuator_test_num_channel_used = 0;
chan Actuator_test_present_channel = [1] of {MyUnion};
MyUnion Actuator_test_present_signal_parameter;
bool Actuator_test_present_channel_used = 0;
chan Actuator_test_to_enum_channel = [1] of {MyUnion};
MyUnion Actuator_test_to_enum_signal_parameter;
bool Actuator_test_to_enum_channel_used = 0;
chan Actuator_test_to_selector_channel = [1] of {MyEnum};
MyEnum Actuator_test_to_selector_signal_parameter;
bool Actuator_test_to_selector_channel_used = 0;
chan Actuator_test_val_channel = [1] of {MyInteger};
MyInteger Actuator_test_val_signal_parameter;
bool Actuator_test_val_channel_used = 0;
chan Controller_result_channel = [1] of {MyBoolean};
MyBoolean Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
chan Controller_result_enum_channel = [1] of {MyEnum};
MyEnum Controller_result_enum_signal_parameter;
bool Controller_result_enum_channel_used = 0;
chan Controller_result_int_channel = [1] of {MyInteger};
MyInteger Controller_result_int_signal_parameter;
bool Controller_result_int_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_test_derived_length(actuator_test_derived_length_p1)
{
    Actuator_test_derived_length_channel!actuator_test_derived_length_p1;
}
inline Actuator_0_PI_0_test_derived_length_unhandled_input(p1)
{
    printf("unhandled_input actuator test_derived_length\n");
    skip;
}
inline Controller_0_RI_0_test_exist(actuator_test_exist_p1)
{
    Actuator_test_exist_channel!actuator_test_exist_p1;
}
inline Actuator_0_PI_0_test_exist_unhandled_input(p1)
{
    printf("unhandled_input actuator test_exist\n");
    skip;
}
inline Controller_0_RI_0_test_length(actuator_test_length_p1)
{
    Actuator_test_length_channel!actuator_test_length_p1;
}
inline Actuator_0_PI_0_test_length_unhandled_input(p1)
{
    printf("unhandled_input actuator test_length\n");
    skip;
}
inline Controller_0_RI_0_test_length_derived_fixed(actuator_test_length_derived_fixed_p1)
{
    Actuator_test_length_derived_fixed_channel!actuator_test_length_derived_fixed_p1;
}
inline Actuator_0_PI_0_test_length_derived_fixed_unhandled_input(p1)
{
    printf("unhandled_input actuator test_length_derived_fixed\n");
    skip;
}
inline Controller_0_RI_0_test_length_fixed(actuator_test_length_fixed_p1)
{
    Actuator_test_length_fixed_channel!actuator_test_length_fixed_p1;
}
inline Actuator_0_PI_0_test_length_fixed_unhandled_input(p1)
{
    printf("unhandled_input actuator test_length_fixed\n");
    skip;
}
inline Controller_0_RI_0_test_num(actuator_test_num_p1)
{
    Actuator_test_num_channel!actuator_test_num_p1;
}
inline Actuator_0_PI_0_test_num_unhandled_input(p1)
{
    printf("unhandled_input actuator test_num\n");
    skip;
}
inline Controller_0_RI_0_test_present(actuator_test_present_p1)
{
    Actuator_test_present_channel!actuator_test_present_p1;
}
inline Actuator_0_PI_0_test_present_unhandled_input(p1)
{
    printf("unhandled_input actuator test_present\n");
    skip;
}
inline Controller_0_RI_0_test_to_enum(actuator_test_to_enum_p1)
{
    Actuator_test_to_enum_channel!actuator_test_to_enum_p1;
}
inline Actuator_0_PI_0_test_to_enum_unhandled_input(p1)
{
    printf("unhandled_input actuator test_to_enum\n");
    skip;
}
inline Controller_0_RI_0_test_to_selector(actuator_test_to_selector_p1)
{
    Actuator_test_to_selector_channel!actuator_test_to_selector_p1;
}
inline Actuator_0_PI_0_test_to_selector_unhandled_input(p1)
{
    printf("unhandled_input actuator test_to_selector\n");
    skip;
}
inline Controller_0_RI_0_test_val(actuator_test_val_p1)
{
    Actuator_test_val_channel!actuator_test_val_p1;
}
inline Actuator_0_PI_0_test_val_unhandled_input(p1)
{
    printf("unhandled_input actuator test_val\n");
    skip;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_test_derived_length_channel) && (empty(Actuator_test_exist_channel) && (empty(Actuator_test_length_channel) && (empty(Actuator_test_length_derived_fixed_channel) && (empty(Actuator_test_length_fixed_channel) && (empty(Actuator_test_num_channel) && (empty(Actuator_test_present_channel) && (empty(Actuator_test_to_enum_channel) && (empty(Actuator_test_to_selector_channel) && empty(Actuator_test_val_channel))))))))));
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_result(controller_result_p1)
{
    Controller_result_channel!controller_result_p1;
}
inline Controller_0_PI_0_result_unhandled_input(p1)
{
    printf("unhandled_input controller result\n");
    skip;
}
inline Actuator_0_RI_0_result_enum(controller_result_enum_p1)
{
    Controller_result_enum_channel!controller_result_enum_p1;
}
inline Controller_0_PI_0_result_enum_unhandled_input(p1)
{
    printf("unhandled_input controller result_enum\n");
    skip;
}
inline Actuator_0_RI_0_result_int(controller_result_int_p1)
{
    Controller_result_int_channel!controller_result_int_p1;
}
inline Controller_0_PI_0_result_int_unhandled_input(p1)
{
    printf("unhandled_input controller result_int\n");
    skip;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_channel) && (empty(Controller_result_enum_channel) && empty(Controller_result_int_channel)));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_test_derived_length() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_derived_length_channel);
        Actuator_lock?_;
Actuator_test_derived_length_loop:
        if
        ::  nempty(Actuator_test_derived_length_channel);
            Actuator_test_derived_length_channel?Actuator_test_derived_length_signal_parameter;
            Actuator_test_derived_length_channel_used = 1;
            Actuator_0_PI_0_test_derived_length(Actuator_test_derived_length_signal_parameter);
            goto Actuator_test_derived_length_loop;
        ::  empty(Actuator_test_derived_length_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_exist() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_exist_channel);
        Actuator_lock?_;
Actuator_test_exist_loop:
        if
        ::  nempty(Actuator_test_exist_channel);
            Actuator_test_exist_channel?Actuator_test_exist_signal_parameter;
            Actuator_test_exist_channel_used = 1;
            Actuator_0_PI_0_test_exist(Actuator_test_exist_signal_parameter);
            goto Actuator_test_exist_loop;
        ::  empty(Actuator_test_exist_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_length() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_length_channel);
        Actuator_lock?_;
Actuator_test_length_loop:
        if
        ::  nempty(Actuator_test_length_channel);
            Actuator_test_length_channel?Actuator_test_length_signal_parameter;
            Actuator_test_length_channel_used = 1;
            Actuator_0_PI_0_test_length(Actuator_test_length_signal_parameter);
            goto Actuator_test_length_loop;
        ::  empty(Actuator_test_length_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_length_derived_fixed() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_length_derived_fixed_channel);
        Actuator_lock?_;
Actuator_test_length_derived_fixed_loop:
        if
        ::  nempty(Actuator_test_length_derived_fixed_channel);
            Actuator_test_length_derived_fixed_channel?Actuator_test_length_derived_fixed_signal_parameter;
            Actuator_test_length_derived_fixed_channel_used = 1;
            Actuator_0_PI_0_test_length_derived_fixed(Actuator_test_length_derived_fixed_signal_parameter);
            goto Actuator_test_length_derived_fixed_loop;
        ::  empty(Actuator_test_length_derived_fixed_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_length_fixed() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_length_fixed_channel);
        Actuator_lock?_;
Actuator_test_length_fixed_loop:
        if
        ::  nempty(Actuator_test_length_fixed_channel);
            Actuator_test_length_fixed_channel?Actuator_test_length_fixed_signal_parameter;
            Actuator_test_length_fixed_channel_used = 1;
            Actuator_0_PI_0_test_length_fixed(Actuator_test_length_fixed_signal_parameter);
            goto Actuator_test_length_fixed_loop;
        ::  empty(Actuator_test_length_fixed_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_num() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_num_channel);
        Actuator_lock?_;
Actuator_test_num_loop:
        if
        ::  nempty(Actuator_test_num_channel);
            Actuator_test_num_channel?Actuator_test_num_signal_parameter;
            Actuator_test_num_channel_used = 1;
            Actuator_0_PI_0_test_num(Actuator_test_num_signal_parameter);
            goto Actuator_test_num_loop;
        ::  empty(Actuator_test_num_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_present() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_present_channel);
        Actuator_lock?_;
Actuator_test_present_loop:
        if
        ::  nempty(Actuator_test_present_channel);
            Actuator_test_present_channel?Actuator_test_present_signal_parameter;
            Actuator_test_present_channel_used = 1;
            Actuator_0_PI_0_test_present(Actuator_test_present_signal_parameter);
            goto Actuator_test_present_loop;
        ::  empty(Actuator_test_present_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_to_enum() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_to_enum_channel);
        Actuator_lock?_;
Actuator_test_to_enum_loop:
        if
        ::  nempty(Actuator_test_to_enum_channel);
            Actuator_test_to_enum_channel?Actuator_test_to_enum_signal_parameter;
            Actuator_test_to_enum_channel_used = 1;
            Actuator_0_PI_0_test_to_enum(Actuator_test_to_enum_signal_parameter);
            goto Actuator_test_to_enum_loop;
        ::  empty(Actuator_test_to_enum_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_to_selector() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_to_selector_channel);
        Actuator_lock?_;
Actuator_test_to_selector_loop:
        if
        ::  nempty(Actuator_test_to_selector_channel);
            Actuator_test_to_selector_channel?Actuator_test_to_selector_signal_parameter;
            Actuator_test_to_selector_channel_used = 1;
            Actuator_0_PI_0_test_to_selector(Actuator_test_to_selector_signal_parameter);
            goto Actuator_test_to_selector_loop;
        ::  empty(Actuator_test_to_selector_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_val() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_val_channel);
        Actuator_lock?_;
Actuator_test_val_loop:
        if
        ::  nempty(Actuator_test_val_channel);
            Actuator_test_val_channel?Actuator_test_val_signal_parameter;
            Actuator_test_val_channel_used = 1;
            Actuator_0_PI_0_test_val(Actuator_test_val_signal_parameter);
            goto Actuator_test_val_loop;
        ::  empty(Actuator_test_val_channel);
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
active proctype Controller_result_enum() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_enum_channel);
        Controller_lock?_;
Controller_result_enum_loop:
        if
        ::  nempty(Controller_result_enum_channel);
            Controller_result_enum_channel?Controller_result_enum_signal_parameter;
            Controller_result_enum_channel_used = 1;
            Controller_0_PI_0_result_enum(Controller_result_enum_signal_parameter);
            goto Controller_result_enum_loop;
        ::  empty(Controller_result_enum_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_int() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_int_channel);
        Controller_lock?_;
Controller_result_int_loop:
        if
        ::  nempty(Controller_result_int_channel);
            Controller_result_int_channel?Controller_result_int_signal_parameter;
            Controller_result_int_channel_used = 1;
            Controller_0_PI_0_result_int(Controller_result_int_signal_parameter);
            goto Controller_result_int_loop;
        ::  empty(Controller_result_int_channel);
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
