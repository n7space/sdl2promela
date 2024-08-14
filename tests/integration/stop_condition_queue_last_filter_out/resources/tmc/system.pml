#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef MyIntegerMessage {
#if asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyTestIntegerMessage {
#if asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_ping_channel = [1] of {MyIntegerMessage};
MyInteger Actuator_ping_signal_parameter;
MyIntegerMessage Actuator_ping_signal_parameter_message;
bool Actuator_ping_channel_used = 0;
chan Controller_pong_channel = [1] of {int};
chan Controller_test_channel = [1] of {MyTestIntegerMessage};
MyTestInteger Controller_test_signal_parameter;
MyTestIntegerMessage Controller_test_signal_parameter_message;
bool Controller_test_channel_used = 0;
MyIntegerMessage controller_ping_Controller_ping_p1_message;
MyInteger controller_ping_Controller_ping_p1_var;
MyTestIntegerMessage environ_test_Environ_test_p1_message;
MyTestInteger environ_test_Environ_test_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_ping_unhandled_input(p1)
{
    printf("unhandled_input actuator ping\n");
    skip;
}
inline Actuator_0_RI_0_pong()
{
    Controller_pong_channel!0;
    printf("channel_send Controller_pong_channel: 1\n");
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_ping_channel);
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_pong_unhandled_input()
{
    printf("unhandled_input controller pong\n");
    skip;
}
inline Controller_0_PI_0_test_unhandled_input(p1)
{
    printf("unhandled_input controller test\n");
    skip;
}
inline Controller_0_RI_0_ping(controller_ping_Controller_ping_p1)
{
    MyInteger_assign_value(controller_ping_Controller_ping_p1_var, controller_ping_Controller_ping_p1);
    c_code {
        {
        asn1SccMyInteger controller_ping_Controller_ping_p1_c_var;
        BitStream controller_ping_Controller_ping_p1_stream;
        int controller_ping_Controller_ping_p1_rc;
        
        controller_ping_Controller_ping_p1_c_var = now.controller_ping_Controller_ping_p1_var;
        
        BitStream_Init(&controller_ping_Controller_ping_p1_stream,
            now.controller_ping_Controller_ping_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&controller_ping_Controller_ping_p1_c_var,
            &controller_ping_Controller_ping_p1_stream,
            &controller_ping_Controller_ping_p1_rc,
            0);
        }
    }
    Actuator_ping_channel!controller_ping_Controller_ping_p1_message;
    printf("channel_send Actuator_ping_channel: %d\n", controller_ping_Controller_ping_p1_var);
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_pong_channel) && empty(Controller_test_channel));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Environ_0_RI_0_test(environ_test_Environ_test_p1)
{
    MyTestInteger_assign_value(environ_test_Environ_test_p1_var, environ_test_Environ_test_p1);
    c_code {
        {
        asn1SccMyTestInteger environ_test_Environ_test_p1_c_var;
        BitStream environ_test_Environ_test_p1_stream;
        int environ_test_Environ_test_p1_rc;
        
        environ_test_Environ_test_p1_c_var = now.environ_test_Environ_test_p1_var;
        
        BitStream_Init(&environ_test_Environ_test_p1_stream,
            now.environ_test_Environ_test_p1_message.data,
            asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyTestInteger_Encode(&environ_test_Environ_test_p1_c_var,
            &environ_test_Environ_test_p1_stream,
            &environ_test_Environ_test_p1_rc,
            0);
        }
    }
    Controller_test_channel!environ_test_Environ_test_p1_message;
    printf("channel_send Controller_test_channel: %d\n", environ_test_Environ_test_p1_var);
}
active proctype Actuator_ping() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_ping_channel);
        Actuator_lock?_;
Actuator_ping_loop:
        if
        ::  nempty(Actuator_ping_channel);
            Actuator_ping_channel?Actuator_ping_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Actuator_ping_signal_parameter_c_var;
                BitStream Actuator_ping_signal_parameter_stream;
                int Actuator_ping_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_ping_signal_parameter_stream,
                    now.Actuator_ping_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Actuator_ping_signal_parameter_c_var,
                    &Actuator_ping_signal_parameter_stream,
                    &Actuator_ping_signal_parameter_rc);
                now.Actuator_ping_signal_parameter = Actuator_ping_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuator_ping_channel: %d\n", Actuator_ping_signal_parameter);
            Actuator_ping_channel_used = 1;
            Actuator_0_PI_0_ping(Actuator_ping_signal_parameter);
            goto Actuator_ping_loop;
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
Controller_pong_loop:
        if
        ::  nempty(Controller_pong_channel);
            Controller_pong_channel?_;
            printf("channel_recv Controller_pong_channel: 1\n");
            Controller_0_PI_0_pong();
            goto Controller_pong_loop;
        ::  empty(Controller_pong_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_test() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_test_channel);
        Controller_lock?_;
Controller_test_loop:
        if
        ::  nempty(Controller_test_channel);
            Controller_test_channel?Controller_test_signal_parameter_message;
            c_code {
                {
                asn1SccMyTestInteger Controller_test_signal_parameter_c_var;
                BitStream Controller_test_signal_parameter_stream;
                int Controller_test_signal_parameter_rc;BitStream_AttachBuffer(&Controller_test_signal_parameter_stream,
                    now.Controller_test_signal_parameter_message.data,
                    asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyTestInteger_Decode(&Controller_test_signal_parameter_c_var,
                    &Controller_test_signal_parameter_stream,
                    &Controller_test_signal_parameter_rc);
                now.Controller_test_signal_parameter = Controller_test_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_test_channel: %d\n", Controller_test_signal_parameter);
            Controller_test_channel_used = 1;
            Controller_0_PI_0_test(Controller_test_signal_parameter);
            goto Controller_test_loop;
        ::  empty(Controller_test_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Environ_test() priority 1
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
        global_dataview_init();
        Actuator_0_init();
        Actuator_lock!1;
        Controller_0_init();
        Controller_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
