#include "dataview.pml"
#include "up.pml"
#include "controller.pml"
#include "down.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context up;
    Controller_Context controller;
    Actuator_Context down;
}

int inited;
chan up_check_channel = [1] of {MyInteger};
chan controller_test_channel = [1] of {MyTestInteger};
chan controller_up_result_channel = [1] of {MyResultInteger};
chan controller_down_result_channel = [1] of {MyResultInteger};
chan down_check_channel = [1] of {MyInteger};
system_state global_state;
chan controller_lock = [1] of {int};
chan down_lock = [1] of {int};
chan up_lock = [1] of {int};
inline Controller_0_RI_0_up_check(up_check_p1)
{
    up_check_channel!up_check_p1;
}
inline Up_check_queue()
{
    atomic {
        empty(up_check_channel);
    }
}
inline Env_0_RI_0_test(controller_test_p1)
{
    controller_test_channel!controller_test_p1;
}
inline Up_0_RI_0_result(controller_up_result_p1)
{
    controller_up_result_channel!controller_up_result_p1;
}
inline Down_0_RI_0_result(controller_down_result_p1)
{
    controller_down_result_channel!controller_down_result_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_test_channel) && empty(controller_up_result_channel) && empty(controller_down_result_channel);
    }
}
inline Controller_0_RI_0_down_check(down_check_p1)
{
    down_check_channel!down_check_p1;
}
inline Down_check_queue()
{
    atomic {
        empty(down_check_channel);
    }
}
active proctype up_check() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        up_check_channel?signal_parameter;
        up_lock?token;
        Up_0_PI_0_check(signal_parameter);
        up_lock!token;
    }
    od;
}
active proctype controller_test() priority 1
{
    inited;
    int token;
    MyTestInteger signal_parameter;
    do
    ::  atomic {
        controller_test_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_test(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype controller_up_result() priority 1
{
    inited;
    int token;
    MyResultInteger signal_parameter;
    do
    ::  atomic {
        controller_up_result_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_up_result(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype controller_down_result() priority 1
{
    inited;
    int token;
    MyResultInteger signal_parameter;
    do
    ::  atomic {
        controller_down_result_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_down_result(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype env_test()
{
    inited;
    MyTestInteger value;
    do
    ::  atomic {
        MyTestInteger_generate_value(value);
        Env_0_RI_0_test(value);
    }
    od;
}
active proctype down_check() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        down_check_channel?signal_parameter;
        down_lock?token;
        Down_0_PI_0_check(signal_parameter);
        down_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        controller_lock!init_token;
        Down_0_init();
        down_lock!init_token;
        Up_0_init();
        up_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
