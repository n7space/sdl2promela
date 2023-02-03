#include "dataview.pml"
#include "controller.pml"
#include "down.pml"
#include "up.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context down;
    Actuator_Context up;
    AggregateTimerData timers;
}

int inited;
chan Controller_down_result_channel = [1] of {MyResultInteger};
MyResultInteger Controller_down_result_signal_parameter;
bool Controller_down_result_channel_used = 0;
chan Controller_test_channel = [1] of {MyTestInteger};
MyTestInteger Controller_test_signal_parameter;
bool Controller_test_channel_used = 0;
chan Controller_up_result_channel = [1] of {MyResultInteger};
MyResultInteger Controller_up_result_signal_parameter;
bool Controller_up_result_channel_used = 0;
chan Down_check_channel = [1] of {MyInteger};
MyInteger Down_check_signal_parameter;
bool Down_check_channel_used = 0;
chan Up_check_channel = [1] of {MyInteger};
MyInteger Up_check_signal_parameter;
bool Up_check_channel_used = 0;
system_state global_state;
chan Controller_lock = [1] of {int};
chan Down_lock = [1] of {int};
chan Up_lock = [1] of {int};
inline Down_0_RI_0_result(controller_down_result_p1)
{
    Controller_down_result_channel!controller_down_result_p1;
}
inline Controller_0_PI_0_down_result_unhandled_input(p1)
{
    printf("unhandled_input controller down_result\n");
    skip;
}
inline Environ_0_RI_0_test(controller_test_p1)
{
    Controller_test_channel!controller_test_p1;
}
inline Controller_0_PI_0_test_unhandled_input(p1)
{
    printf("unhandled_input controller test\n");
    skip;
}
inline Up_0_RI_0_result(controller_up_result_p1)
{
    Controller_up_result_channel!controller_up_result_p1;
}
inline Controller_0_PI_0_up_result_unhandled_input(p1)
{
    printf("unhandled_input controller up_result\n");
    skip;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_down_result_channel) && (empty(Controller_test_channel) && empty(Controller_up_result_channel)));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Controller_0_RI_0_down_check(down_check_p1)
{
    Down_check_channel!down_check_p1;
}
inline Down_0_PI_0_check_unhandled_input(p1)
{
    printf("unhandled_input down check\n");
    skip;
}
inline Down_check_queue()
{
    atomic {
        empty(Down_check_channel);
    }
}
inline Down_0_RI_0_get_sender(Down_sender_arg)
{
    skip;
}
inline Controller_0_RI_0_up_check(up_check_p1)
{
    Up_check_channel!up_check_p1;
}
inline Up_0_PI_0_check_unhandled_input(p1)
{
    printf("unhandled_input up check\n");
    skip;
}
inline Up_check_queue()
{
    atomic {
        empty(Up_check_channel);
    }
}
inline Up_0_RI_0_get_sender(Up_sender_arg)
{
    skip;
}
active proctype Controller_down_result() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_down_result_channel);
        Controller_lock?_;
Controller_down_result_loop:
        if
        ::  nempty(Controller_down_result_channel);
            Controller_down_result_channel?Controller_down_result_signal_parameter;
            Controller_down_result_channel_used = 1;
            Controller_0_PI_0_down_result(Controller_down_result_signal_parameter);
            goto Controller_down_result_loop;
        ::  empty(Controller_down_result_channel);
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
active proctype Controller_up_result() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_up_result_channel);
        Controller_lock?_;
Controller_up_result_loop:
        if
        ::  nempty(Controller_up_result_channel);
            Controller_up_result_channel?Controller_up_result_signal_parameter;
            Controller_up_result_channel_used = 1;
            Controller_0_PI_0_up_result(Controller_up_result_signal_parameter);
            goto Controller_up_result_loop;
        ::  empty(Controller_up_result_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Down_check() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Down_check_channel);
        Down_lock?_;
Down_check_loop:
        if
        ::  nempty(Down_check_channel);
            Down_check_channel?Down_check_signal_parameter;
            Down_check_channel_used = 1;
            Down_0_PI_0_check(Down_check_signal_parameter);
            goto Down_check_loop;
        ::  empty(Down_check_channel);
            skip;
        fi;
        Down_lock!1;
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
active proctype Up_check() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Up_check_channel);
        Up_lock?_;
Up_check_loop:
        if
        ::  nempty(Up_check_channel);
            Up_check_channel?Up_check_signal_parameter;
            Up_check_channel_used = 1;
            Up_0_PI_0_check(Up_check_signal_parameter);
            goto Up_check_loop;
        ::  empty(Up_check_channel);
            skip;
        fi;
        Up_lock!1;
    }
    od;
}
init
{
    atomic {
        global_dataview_init();
        Controller_0_init();
        Controller_lock!1;
        Down_0_init();
        Down_lock!1;
        Up_0_init();
        Up_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
