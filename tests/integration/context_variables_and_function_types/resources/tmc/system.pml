#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Worker_Context actuator;
    Controller_Context controller;
}

int inited;
chan Actuator_check_channel = [1] of {MyInteger};
MyInteger Actuator_check_signal_parameter;
bool Actuator_check_channel_used = 0;
chan Controller_result_channel = [1] of {MyInteger};
MyInteger Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Controller_0_RI_0_check(actuator_check_p1)
{
    Actuator_check_channel!actuator_check_p1;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_check_channel);
    }
}
inline Actuator_0_RI_0_result(controller_result_p1)
{
    Controller_result_channel!controller_result_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_result_channel);
    }
}
active proctype Actuator_check() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_check_channel);
        Actuator_lock?_;
Actuator_check_loop:
        if
        ::  nempty(Actuator_check_channel);
            Actuator_check_channel?Actuator_check_signal_parameter;
            Actuator_0_PI_0_check(Actuator_check_signal_parameter);
            goto Actuator_check_loop;
        ::  empty(Actuator_check_channel);
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
            Controller_0_PI_0_result(Controller_result_signal_parameter);
            goto Controller_result_loop;
        ::  empty(Controller_result_channel);
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
