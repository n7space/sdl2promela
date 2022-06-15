#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan Controller_pong_channel = [1] of {int};
chan Controller_test_channel = [1] of {MyTestInteger};
MyTestInteger Controller_test_signal_parameter;
bool Controller_test_channel_used = 0;
chan Actuator_ping_channel = [1] of {MyInteger};
MyInteger Actuator_ping_signal_parameter;
bool Actuator_ping_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_RI_0_pong()
{
    int dummy;
    Controller_pong_channel!dummy;
}
inline Environ_0_RI_0_test(controller_test_p1)
{
    Controller_test_channel!controller_test_p1;
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_pong_channel) && empty(Controller_test_channel));
    }
}
inline Controller_0_RI_0_ping(actuator_ping_p1)
{
    Actuator_ping_channel!actuator_ping_p1;
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_ping_channel);
    }
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
active proctype Controller_test() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Controller_test_channel?Controller_test_signal_parameter;
        Controller_test_channel_used = 1;
        Controller_lock?token;
        Controller_0_PI_0_test(Controller_test_signal_parameter);
        Controller_lock!token;
    }
    od;
}
active proctype Actuator_ping() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        Actuator_ping_channel?Actuator_ping_signal_parameter;
        Actuator_ping_channel_used = 1;
        Actuator_lock?token;
        Actuator_0_PI_0_ping(Actuator_ping_signal_parameter);
        Actuator_lock!token;
    }
    od;
}
active proctype Environ_test()
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
init
{
    atomic {
        int init_token = 1;
        Actuator_0_init();
        Actuator_lock!init_token;
        Controller_0_init();
        Controller_lock!init_token;
        inited = 1;
    }
}
#include "scl.pml"
