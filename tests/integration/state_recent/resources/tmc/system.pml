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

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_disable_channel = [1] of {int};
chan Actuator_ping_channel = [1] of {MyIntegerMessage};
MyInteger Actuator_ping_signal_parameter;
MyIntegerMessage Actuator_ping_signal_parameter_message;
bool Actuator_ping_channel_used = 0;
MyIntegerMessage actuator_pong_Actuator_pong_p1_message;
MyInteger actuator_pong_Actuator_pong_p1_var;
chan Controller_pong_channel = [1] of {MyIntegerMessage};
MyInteger Controller_pong_signal_parameter;
MyIntegerMessage Controller_pong_signal_parameter_message;
bool Controller_pong_channel_used = 0;
MyIntegerMessage controller_ping_Controller_ping_p1_message;
MyInteger controller_ping_Controller_ping_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_disable_unhandled_input()
{
    printf("unhandled_input actuator disable\n");
    skip;
}
inline Actuator_0_PI_0_ping_unhandled_input(p1)
{
    printf("unhandled_input actuator ping\n");
    skip;
}
inline Actuator_0_RI_0_pong(actuator_pong_Actuator_pong_p1)
{
    MyInteger_assign_value(actuator_pong_Actuator_pong_p1_var, actuator_pong_Actuator_pong_p1);
    c_code {
        {
        asn1SccMyInteger actuator_pong_Actuator_pong_p1_c_var;
        BitStream actuator_pong_Actuator_pong_p1_stream;
        int actuator_pong_Actuator_pong_p1_rc;
        
        actuator_pong_Actuator_pong_p1_c_var = now.actuator_pong_Actuator_pong_p1_var;
        
        BitStream_Init(&actuator_pong_Actuator_pong_p1_stream,
            now.actuator_pong_Actuator_pong_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&actuator_pong_Actuator_pong_p1_c_var,
            &actuator_pong_Actuator_pong_p1_stream,
            &actuator_pong_Actuator_pong_p1_rc,
            0);
        }
    }
    Controller_pong_channel!actuator_pong_Actuator_pong_p1_message;
    printf("channel_send Controller_pong_channel: %d\n", actuator_pong_Actuator_pong_p1_var);
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_disable_channel) && empty(Actuator_ping_channel));
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_pong_unhandled_input(p1)
{
    printf("unhandled_input controller pong\n");
    skip;
}
inline Controller_0_RI_0_disable()
{
    Actuator_disable_channel!0;
    printf("channel_send Actuator_disable_channel: 1\n");
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
        empty(Controller_pong_channel);
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_disable() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_disable_channel);
        Actuator_lock?_;
Actuator_disable_loop:
        if
        ::  nempty(Actuator_disable_channel);
            Actuator_disable_channel?_;
            printf("channel_recv Actuator_disable_channel: 1\n");
            Actuator_0_PI_0_disable();
            goto Actuator_disable_loop;
        ::  empty(Actuator_disable_channel);
            skip;
        fi;
        Actuator_lock!1;
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
            Controller_pong_channel?Controller_pong_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Controller_pong_signal_parameter_c_var;
                BitStream Controller_pong_signal_parameter_stream;
                int Controller_pong_signal_parameter_rc;BitStream_AttachBuffer(&Controller_pong_signal_parameter_stream,
                    now.Controller_pong_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Controller_pong_signal_parameter_c_var,
                    &Controller_pong_signal_parameter_stream,
                    &Controller_pong_signal_parameter_rc);
                now.Controller_pong_signal_parameter = Controller_pong_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_pong_channel: %d\n", Controller_pong_signal_parameter);
            Controller_pong_channel_used = 1;
            Controller_0_PI_0_pong(Controller_pong_signal_parameter);
            goto Controller_pong_loop;
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
        global_dataview_init();
        Actuator_0_init();
        Actuator_lock!1;
        Controller_0_init();
        Controller_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
