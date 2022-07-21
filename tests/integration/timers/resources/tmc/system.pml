#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
}

int inited;
bool timer_manager_data[1];
chan Actuator_ping_channel = [1] of {int};
chan Controller_pong_channel = [1] of {int};
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_watchdog_set()
{
    timer_manager_data[0] = true;
}
inline Actuator_0_watchdog_reset()
{
    timer_manager_data[0] = false;
}
inline Controller_0_RI_0_ping()
{
    int dummy;
    Actuator_ping_channel!dummy;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_ping_channel);
    }
}
inline Actuator_0_RI_0_pong()
{
    int dummy;
    Controller_pong_channel!dummy;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_pong_channel);
    }
}
active proctype timer_manager_proc() priority 1
{
    inited;
    do
    ::  atomic {
        true;
        if
        ::  timer_manager_data[0];
            Actuator_0_PI_0_watchdog();
            timer_manager_data[0] = false;
        ::  else;
            skip;
        fi;
    }
    od;
}
active proctype Actuator_ping() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_ping_channel);
        Actuator_lock?_;
        if
        ::  nempty(Actuator_ping_channel);
            Actuator_ping_channel?_;
            Actuator_0_PI_0_ping();
        ::  empty(Actuator_ping_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_pong() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_pong_channel);
        Controller_lock?_;
        if
        ::  nempty(Controller_pong_channel);
            Controller_pong_channel?_;
            Controller_0_PI_0_pong();
        ::  empty(Controller_pong_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
init
{
    atomic {
        Actuator_0_init();
        Actuator_lock!1;
        Controller_0_init();
        Controller_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
