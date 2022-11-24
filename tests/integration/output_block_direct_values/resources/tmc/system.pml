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
chan Actuator_give_me_array_channel = [1] of {int};
chan Actuator_give_me_data_channel = [1] of {int};
chan Actuator_give_me_nested_channel = [1] of {int};
chan Actuator_give_me_values_channel = [1] of {int};
chan Controller_result_array_channel = [1] of {MyArray};
MyArray Controller_result_array_signal_parameter;
bool Controller_result_array_channel_used = 0;
chan Controller_result_data_channel = [1] of {MyData};
MyData Controller_result_data_signal_parameter;
bool Controller_result_data_channel_used = 0;
chan Controller_result_nested_channel = [1] of {MyNested};
MyNested Controller_result_nested_signal_parameter;
bool Controller_result_nested_channel_used = 0;
chan Controller_result_values_channel = [1] of {MyValues};
MyValues Controller_result_values_signal_parameter;
bool Controller_result_values_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_give_me_array()
{
    int dummy;
    Actuator_give_me_array_channel!dummy;
}
inline Actuator_0_PI_0_give_me_array_unhandled_input()
{
    skip;
}
inline Controller_0_RI_0_give_me_data()
{
    int dummy;
    Actuator_give_me_data_channel!dummy;
}
inline Actuator_0_PI_0_give_me_data_unhandled_input()
{
    skip;
}
inline Controller_0_RI_0_give_me_nested()
{
    int dummy;
    Actuator_give_me_nested_channel!dummy;
}
inline Actuator_0_PI_0_give_me_nested_unhandled_input()
{
    skip;
}
inline Controller_0_RI_0_give_me_values()
{
    int dummy;
    Actuator_give_me_values_channel!dummy;
}
inline Actuator_0_PI_0_give_me_values_unhandled_input()
{
    skip;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_give_me_array_channel) && (empty(Actuator_give_me_data_channel) && (empty(Actuator_give_me_nested_channel) && empty(Actuator_give_me_values_channel))));
    }
}
inline Actuator_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_result_array(controller_result_array_p1)
{
    Controller_result_array_channel!controller_result_array_p1;
}
inline Controller_0_PI_0_result_array_unhandled_input(p1)
{
    skip;
}
inline Actuator_0_RI_0_result_data(controller_result_data_p1)
{
    Controller_result_data_channel!controller_result_data_p1;
}
inline Controller_0_PI_0_result_data_unhandled_input(p1)
{
    skip;
}
inline Actuator_0_RI_0_result_nested(controller_result_nested_p1)
{
    Controller_result_nested_channel!controller_result_nested_p1;
}
inline Controller_0_PI_0_result_nested_unhandled_input(p1)
{
    skip;
}
inline Actuator_0_RI_0_result_values(controller_result_values_p1)
{
    Controller_result_values_channel!controller_result_values_p1;
}
inline Controller_0_PI_0_result_values_unhandled_input(p1)
{
    skip;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_array_channel) && (empty(Controller_result_data_channel) && (empty(Controller_result_nested_channel) && empty(Controller_result_values_channel))));
    }
}
inline Controller_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_give_me_array() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_array_channel);
        Actuator_lock?_;
Actuator_give_me_array_loop:
        if
        ::  nempty(Actuator_give_me_array_channel);
            Actuator_give_me_array_channel?_;
            Actuator_0_PI_0_give_me_array();
            goto Actuator_give_me_array_loop;
        ::  empty(Actuator_give_me_array_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_give_me_data() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_data_channel);
        Actuator_lock?_;
Actuator_give_me_data_loop:
        if
        ::  nempty(Actuator_give_me_data_channel);
            Actuator_give_me_data_channel?_;
            Actuator_0_PI_0_give_me_data();
            goto Actuator_give_me_data_loop;
        ::  empty(Actuator_give_me_data_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_give_me_nested() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_nested_channel);
        Actuator_lock?_;
Actuator_give_me_nested_loop:
        if
        ::  nempty(Actuator_give_me_nested_channel);
            Actuator_give_me_nested_channel?_;
            Actuator_0_PI_0_give_me_nested();
            goto Actuator_give_me_nested_loop;
        ::  empty(Actuator_give_me_nested_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_give_me_values() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_values_channel);
        Actuator_lock?_;
Actuator_give_me_values_loop:
        if
        ::  nempty(Actuator_give_me_values_channel);
            Actuator_give_me_values_channel?_;
            Actuator_0_PI_0_give_me_values();
            goto Actuator_give_me_values_loop;
        ::  empty(Actuator_give_me_values_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_result_array() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_array_channel);
        Controller_lock?_;
Controller_result_array_loop:
        if
        ::  nempty(Controller_result_array_channel);
            Controller_result_array_channel?Controller_result_array_signal_parameter;
            Controller_result_array_channel_used = 1;
            Controller_0_PI_0_result_array(Controller_result_array_signal_parameter);
            goto Controller_result_array_loop;
        ::  empty(Controller_result_array_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_data() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_data_channel);
        Controller_lock?_;
Controller_result_data_loop:
        if
        ::  nempty(Controller_result_data_channel);
            Controller_result_data_channel?Controller_result_data_signal_parameter;
            Controller_result_data_channel_used = 1;
            Controller_0_PI_0_result_data(Controller_result_data_signal_parameter);
            goto Controller_result_data_loop;
        ::  empty(Controller_result_data_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_nested() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_nested_channel);
        Controller_lock?_;
Controller_result_nested_loop:
        if
        ::  nempty(Controller_result_nested_channel);
            Controller_result_nested_channel?Controller_result_nested_signal_parameter;
            Controller_result_nested_channel_used = 1;
            Controller_0_PI_0_result_nested(Controller_result_nested_signal_parameter);
            goto Controller_result_nested_loop;
        ::  empty(Controller_result_nested_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_values() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_values_channel);
        Controller_lock?_;
Controller_result_values_loop:
        if
        ::  nempty(Controller_result_values_channel);
            Controller_result_values_channel?Controller_result_values_signal_parameter;
            Controller_result_values_channel_used = 1;
            Controller_0_PI_0_result_values(Controller_result_values_signal_parameter);
            goto Controller_result_values_loop;
        ::  empty(Controller_result_values_channel);
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
