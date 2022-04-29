#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_result_channel = [1] of {int};
chan actuator_test_simple_state_channel = [1] of {MyInteger};
chan actuator_test_state_list_channel = [1] of {MyInteger};
chan actuator_test_star_channel = [1] of {int};
chan actuator_test_excluded_state_channel = [1] of {int};
chan actuator_test_state_list2_channel = [1] of {int};
system_state global_state;
chan actuator_lock = [1] of {int};
chan controller_lock = [1] of {int};
inline Actuator_0_RI_0_result()
{
    int dummy;
    controller_result_channel!dummy;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_result_channel);
    }
}
inline Controller_0_RI_0_test_simple_state(actuator_test_simple_state_p1)
{
    actuator_test_simple_state_channel!actuator_test_simple_state_p1;
}
inline Controller_0_RI_0_test_state_list(actuator_test_state_list_p1)
{
    actuator_test_state_list_channel!actuator_test_state_list_p1;
}
inline Controller_0_RI_0_test_star()
{
    int dummy;
    actuator_test_star_channel!dummy;
}
inline Controller_0_RI_0_test_excluded_state()
{
    int dummy;
    actuator_test_excluded_state_channel!dummy;
}
inline Controller_0_RI_0_test_state_list2()
{
    int dummy;
    actuator_test_state_list2_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(actuator_test_simple_state_channel) && empty(actuator_test_state_list_channel) && empty(actuator_test_star_channel) && empty(actuator_test_excluded_state_channel) && empty(actuator_test_state_list2_channel);
    }
}
active proctype controller_result() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        controller_result_channel?_;
        controller_lock?token;
        Controller_0_PI_0_result();
        controller_lock!token;
    }
    od;
}
active proctype actuator_test_simple_state() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        actuator_test_simple_state_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_test_simple_state(signal_parameter);
        actuator_lock!token;
    }
    od;
}
active proctype actuator_test_state_list() priority 1
{
    inited;
    int token;
    MyInteger signal_parameter;
    do
    ::  atomic {
        actuator_test_state_list_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_test_state_list(signal_parameter);
        actuator_lock!token;
    }
    od;
}
active proctype actuator_test_star() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_test_star_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_test_star();
        actuator_lock!token;
    }
    od;
}
active proctype actuator_test_excluded_state() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_test_excluded_state_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_test_excluded_state();
        actuator_lock!token;
    }
    od;
}
active proctype actuator_test_state_list2() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        actuator_test_state_list2_channel?_;
        actuator_lock?token;
        Actuator_0_PI_0_test_state_list2();
        actuator_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Actuator_0_init();
        actuator_lock!init_token;
        Controller_0_init();
        controller_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
