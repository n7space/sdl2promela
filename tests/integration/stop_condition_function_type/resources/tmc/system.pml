#include "dataview.pml"
#include "controller.pml"
#include "actuatorinst.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuatorinst;
}

int inited;
chan Controller_pong_channel = [1] of {MyInteger};
MyInteger Controller_pong_signal_parameter;
bool Controller_pong_channel_used = 0;
chan Actuatorinst_ping_channel = [1] of {MyInteger};
MyInteger Actuatorinst_ping_signal_parameter;
bool Actuatorinst_ping_channel_used = 0;
system_state global_state;
chan Actuatorinst_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuatorinst_0_RI_0_pong(controller_pong_p1)
{
    Controller_pong_channel!controller_pong_p1;
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_pong_channel);
    }
}
inline Controller_0_RI_0_ping(actuatorinst_ping_p1)
{
    Actuatorinst_ping_channel!actuatorinst_ping_p1;
}
inline Actuatorinst_check_queue()
{
    atomic {
        empty(Actuatorinst_ping_channel);
    }
}
active proctype Controller_pong() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_pong_channel?Controller_pong_signal_parameter;
        Controller_pong_channel_used = 1;
        Controller_lock?token;
        Controller_0_PI_0_pong(Controller_pong_signal_parameter);
        Controller_lock!token;
    }
    od;
}
active proctype Actuatorinst_ping() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuatorinst_ping_channel?Actuatorinst_ping_signal_parameter;
        Actuatorinst_ping_channel_used = 1;
        Actuatorinst_lock?token;
        Actuatorinst_0_PI_0_ping(Actuatorinst_ping_signal_parameter);
        Actuatorinst_lock!token;
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Actuatorinst_0_init();
        Actuatorinst_lock!init_token;
        Controller_0_init();
        Controller_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
