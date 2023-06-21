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
chan Actuator_dummy_channel = [1] of {int};
chan Controller_from_proc_channel = [1] of {MyInteger};
MyInteger Controller_from_proc_signal_parameter;
bool Controller_from_proc_channel_used = 0;
chan Controller_from_trans_channel = [1] of {MyInteger};
MyInteger Controller_from_trans_signal_parameter;
bool Controller_from_trans_channel_used = 0;
chan Controller_test_channel = [1] of {int};
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_dummy_unhandled_input()
{
    printf("unhandled_input actuator dummy\n");
    skip;
}
inline Actuator_0_RI_0_from_proc(actuator_from_proc_Actuator_from_proc_p1)
{
    Controller_from_proc_channel!actuator_from_proc_Actuator_from_proc_p1;
}
inline Actuator_0_RI_0_from_trans(actuator_from_trans_Actuator_from_trans_p1)
{
    Controller_from_trans_channel!actuator_from_trans_Actuator_from_trans_p1;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_dummy_channel);
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_from_proc_unhandled_input(p1)
{
    printf("unhandled_input controller from_proc\n");
    skip;
}
inline Controller_0_PI_0_from_trans_unhandled_input(p1)
{
    printf("unhandled_input controller from_trans\n");
    skip;
}
inline Controller_0_PI_0_test_unhandled_input()
{
    printf("unhandled_input controller test\n");
    skip;
}
inline Controller_0_RI_0_check_sync()
{
    Actuator_lock?_;
    Actuator_0_PI_0_check_sync();
    Actuator_lock!1;
}
inline Controller_0_RI_0_dummy()
{
    Actuator_dummy_channel!0;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_from_proc_channel) && (empty(Controller_from_trans_channel) && empty(Controller_test_channel)));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Environ_0_RI_0_test()
{
    Controller_test_channel!0;
}
active proctype Actuator_dummy() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_dummy_channel);
        Actuator_lock?_;
Actuator_dummy_loop:
        if
        ::  nempty(Actuator_dummy_channel);
            Actuator_dummy_channel?_;
            Actuator_0_PI_0_dummy();
            goto Actuator_dummy_loop;
        ::  empty(Actuator_dummy_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_from_proc() priority 2
{
    inited;
    do
    ::  atomic {
        nempty(Controller_from_proc_channel);
        Controller_lock?_;
Controller_from_proc_loop:
        if
        ::  nempty(Controller_from_proc_channel);
            Controller_from_proc_channel?Controller_from_proc_signal_parameter;
            Controller_from_proc_channel_used = 1;
            Controller_0_PI_0_from_proc(Controller_from_proc_signal_parameter);
            goto Controller_from_proc_loop;
        ::  empty(Controller_from_proc_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_from_trans() priority 2
{
    inited;
    do
    ::  atomic {
        nempty(Controller_from_trans_channel);
        Controller_lock?_;
Controller_from_trans_loop:
        if
        ::  nempty(Controller_from_trans_channel);
            Controller_from_trans_channel?Controller_from_trans_signal_parameter;
            Controller_from_trans_channel_used = 1;
            Controller_0_PI_0_from_trans(Controller_from_trans_signal_parameter);
            goto Controller_from_trans_loop;
        ::  empty(Controller_from_trans_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_test() priority 2
{
    inited;
    do
    ::  atomic {
        nempty(Controller_test_channel);
        Controller_lock?_;
Controller_test_loop:
        if
        ::  nempty(Controller_test_channel);
            Controller_test_channel?_;
            Controller_0_PI_0_test();
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
    do
    ::  atomic {
        Environ_0_RI_0_test();
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
