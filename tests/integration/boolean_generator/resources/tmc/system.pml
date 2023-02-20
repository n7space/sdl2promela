#include "dataview.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Controller_readvalue_channel = [1] of {MyBool};
MyBool Controller_readvalue_signal_parameter;
bool Controller_readvalue_channel_used = 0;
system_state global_state;
chan Controller_lock = [1] of {int};
inline Environment_0_RI_0_readValue(controller_readValue_p1)
{
    Controller_readvalue_channel!controller_readValue_p1;
}
inline Controller_0_PI_0_readValue_unhandled_input(p1)
{
    printf("unhandled_input controller readValue\n");
    skip;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_readvalue_channel);
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Controller_readValue() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_readvalue_channel);
        Controller_lock?_;
Controller_readvalue_loop:
        if
        ::  nempty(Controller_readvalue_channel);
            Controller_readvalue_channel?Controller_readvalue_signal_parameter;
            Controller_readvalue_channel_used = 1;
            Controller_0_PI_0_readValue(Controller_readvalue_signal_parameter);
            goto Controller_readvalue_loop;
        ::  empty(Controller_readvalue_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Environment_readValue() priority 1
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
        global_dataview_init();
        Controller_0_init();
        Controller_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
