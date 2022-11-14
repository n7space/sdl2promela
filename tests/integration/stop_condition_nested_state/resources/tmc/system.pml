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
chan Actuator_reset_channel = [1] of {int};
chan Actuator_tick_channel = [1] of {int};
chan Controller_ok_channel = [1] of {int};
chan Controller_result_channel = [1] of {MyInteger};
MyInteger Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
chan Controller_test_channel = [1] of {MyTestInteger};
MyTestInteger Controller_test_signal_parameter;
bool Controller_test_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_reset()
{
    int dummy;
    Actuator_reset_channel!dummy;
}
inline Controller_0_RI_0_tick()
{
    int dummy;
    Actuator_tick_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_reset_channel) && empty(Actuator_tick_channel));
    }
}
inline Actuator_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Actuator_0_RI_0_ok()
{
    int dummy;
    Controller_ok_channel!dummy;
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
        (empty(Controller_ok_channel) && (empty(Controller_result_channel) && empty(Controller_test_channel)));
    }
}
inline Controller_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_reset() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_reset_channel);
        Actuator_lock?_;
Actuator_reset_loop:
        if
        ::  nempty(Actuator_reset_channel);
            Actuator_reset_channel?_;
            Actuator_0_PI_0_reset();
            goto Actuator_reset_loop;
        ::  empty(Actuator_reset_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_tick() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_tick_channel);
        Actuator_lock?_;
Actuator_tick_loop:
        if
        ::  nempty(Actuator_tick_channel);
            Actuator_tick_channel?_;
            Actuator_0_PI_0_tick();
            goto Actuator_tick_loop;
        ::  empty(Actuator_tick_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_ok() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_ok_channel);
        Controller_lock?_;
Controller_ok_loop:
        if
        ::  nempty(Controller_ok_channel);
            Controller_ok_channel?_;
            Controller_0_PI_0_ok();
            goto Controller_ok_loop;
        ::  empty(Controller_ok_channel);
            skip;
        fi;
        Controller_lock!1;
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
        inited = 1;
    }
}
#include "scl.pml"
