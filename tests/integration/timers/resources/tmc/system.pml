#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
}

int inited;
chan timer_manager_channel = [1] of {int, bool};
bool timer_manager_data[1];
chan Actuator_ping_channel = [1] of {int};
chan Controller_pong_channel = [1] of {int};
system_state global_state;
chan Controller_lock = [1] of {int};
chan Actuator_lock = [1] of {int};
inline Actuator_0_watchdog_set()
{
    timer_manager_channel!0, true;
}
inline Actuator_0_watchdog_reset()
{
    timer_manager_channel!0, false;
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
    int timer_id;
    bool timer_enabled;
    do
    ::  atomic {
        nempty(timer_manager_channel);
        timer_manager_channel?timer_id,timer_enabled;
        timer_manager_data[timer_id] = timer_enabled;
    }
    ::  atomic {
        empty(timer_manager_channel);
        if
        ::  timer_manager_data[0];
            Actuator_0_PI_0_watchdog();
        ::  else;
            skip;
        fi;
    }
    od;
}
active proctype Actuator_ping() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_ping_channel?_;
        Actuator_lock?token;
        Actuator_0_PI_0_ping();
        Actuator_lock!token;
    }
    od;
}
active proctype Controller_pong() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_pong_channel?_;
        Controller_lock?token;
        Controller_0_PI_0_pong();
        Controller_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        Controller_lock!init_token;
        Actuator_0_init();
        Actuator_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
