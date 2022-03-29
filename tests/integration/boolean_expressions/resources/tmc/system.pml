#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_result_channel = [1] of {MyBooleanResult};
chan actuator_check_binary_channel = [1] of {BinaryBooleanTestParam};
chan actuator_check_unary_channel = [1] of {UnaryBooleanTestParam};
system_state global_state;
chan controller_lock = [1] of {int};
chan actuator_lock = [1] of {int};
inline Actuator_0_RI_0_result(controller_result_p1)
{
    controller_result_channel!controller_result_p1;
}
inline Controller_0_RI_0_check_binary(actuator_check_binary_p1)
{
    actuator_check_binary_channel!actuator_check_binary_p1;
}
inline Controller_0_RI_0_check_unary(actuator_check_unary_p1)
{
    actuator_check_unary_channel!actuator_check_unary_p1;
}
active proctype controller_result() priority 1
{
    inited;
    int token;
    MyBooleanResult signal_parameter;
    do
    ::  atomic {
        controller_result_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_result(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype actuator_check_binary() priority 1
{
    inited;
    int token;
    BinaryBooleanTestParam signal_parameter;
    do
    ::  atomic {
        actuator_check_binary_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_check_binary(signal_parameter);
        actuator_lock!token;
    }
    od;
}
active proctype actuator_check_unary() priority 1
{
    inited;
    int token;
    UnaryBooleanTestParam signal_parameter;
    do
    ::  atomic {
        actuator_check_unary_channel?signal_parameter;
        actuator_lock?token;
        Actuator_0_PI_0_check_unary(signal_parameter);
        actuator_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        controller_lock!init_token;
        Actuator_0_init();
        actuator_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
