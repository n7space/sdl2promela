#include "dataview.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
}

int inited;
chan controller_readValue_channel = [1] of {MyBool};
system_state global_state;
chan controller_lock = [1] of {int};
inline Environment_0_RI_0_readValue(controller_readValue_p1)
{
    controller_readValue_channel!controller_readValue_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(controller_readValue_channel);
    }
}
active proctype controller_readValue() priority 1
{
    inited;
    int token;
    MyBool signal_parameter;
    do
    ::  atomic {
        controller_readValue_channel?signal_parameter;
        controller_lock?token;
        Controller_0_PI_0_readValue(signal_parameter);
        controller_lock!token;
    }
    od;
}
active proctype environment_readValue()
{
    inited;
    MyBool value;
    do
    ::  atomic {
        MyBool_generate_value(value);
        Environment_0_RI_0_readValue(value);
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        controller_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
