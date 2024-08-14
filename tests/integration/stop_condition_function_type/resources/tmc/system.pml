#include "dataview.pml"
#include "actuatorinst.pml"
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
    Actuator_Context actuatorinst;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuatorinst_ping_channel = [1] of {MyIntegerMessage};
MyInteger Actuatorinst_ping_signal_parameter;
MyIntegerMessage Actuatorinst_ping_signal_parameter_message;
bool Actuatorinst_ping_channel_used = 0;
MyIntegerMessage actuatorinst_pong_Actuatorinst_pong_p1_message;
MyInteger actuatorinst_pong_Actuatorinst_pong_p1_var;
chan Controller_pong_channel = [1] of {MyIntegerMessage};
MyInteger Controller_pong_signal_parameter;
MyIntegerMessage Controller_pong_signal_parameter_message;
bool Controller_pong_channel_used = 0;
MyIntegerMessage controller_ping_Controller_ping_p1_message;
MyInteger controller_ping_Controller_ping_p1_var;
system_state global_state;
chan Actuatorinst_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuatorinst_0_PI_0_ping_unhandled_input(p1)
{
    printf("unhandled_input actuatorinst ping\n");
    skip;
}
inline Actuatorinst_0_RI_0_pong(actuatorinst_pong_Actuatorinst_pong_p1)
{
    MyInteger_assign_value(actuatorinst_pong_Actuatorinst_pong_p1_var, actuatorinst_pong_Actuatorinst_pong_p1);
    c_code {
        {
        asn1SccMyInteger actuatorinst_pong_Actuatorinst_pong_p1_c_var;
        BitStream actuatorinst_pong_Actuatorinst_pong_p1_stream;
        int actuatorinst_pong_Actuatorinst_pong_p1_rc;
        
        actuatorinst_pong_Actuatorinst_pong_p1_c_var = now.actuatorinst_pong_Actuatorinst_pong_p1_var;
        
        BitStream_Init(&actuatorinst_pong_Actuatorinst_pong_p1_stream,
            now.actuatorinst_pong_Actuatorinst_pong_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&actuatorinst_pong_Actuatorinst_pong_p1_c_var,
            &actuatorinst_pong_Actuatorinst_pong_p1_stream,
            &actuatorinst_pong_Actuatorinst_pong_p1_rc,
            0);
        }
    }
    Controller_pong_channel!actuatorinst_pong_Actuatorinst_pong_p1_message;
    printf("channel_send Controller_pong_channel: %d\n", actuatorinst_pong_Actuatorinst_pong_p1_var);
}
inline Actuatorinst_check_queue()
{
    atomic {
        empty(Actuatorinst_ping_channel);
    }
}
inline Actuatorinst_0_RI_0_get_sender(Actuatorinst_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_pong_unhandled_input(p1)
{
    printf("unhandled_input controller pong\n");
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
    Actuatorinst_ping_channel!controller_ping_Controller_ping_p1_message;
    printf("channel_send Actuatorinst_ping_channel: %d\n", controller_ping_Controller_ping_p1_var);
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
active proctype Actuatorinst_ping() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuatorinst_ping_channel);
        Actuatorinst_lock?_;
Actuatorinst_ping_loop:
        if
        ::  nempty(Actuatorinst_ping_channel);
            Actuatorinst_ping_channel?Actuatorinst_ping_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Actuatorinst_ping_signal_parameter_c_var;
                BitStream Actuatorinst_ping_signal_parameter_stream;
                int Actuatorinst_ping_signal_parameter_rc;BitStream_AttachBuffer(&Actuatorinst_ping_signal_parameter_stream,
                    now.Actuatorinst_ping_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Actuatorinst_ping_signal_parameter_c_var,
                    &Actuatorinst_ping_signal_parameter_stream,
                    &Actuatorinst_ping_signal_parameter_rc);
                now.Actuatorinst_ping_signal_parameter = Actuatorinst_ping_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuatorinst_ping_channel: %d\n", Actuatorinst_ping_signal_parameter);
            Actuatorinst_ping_channel_used = 1;
            Actuatorinst_0_PI_0_ping(Actuatorinst_ping_signal_parameter);
            goto Actuatorinst_ping_loop;
        ::  empty(Actuatorinst_ping_channel);
            skip;
        fi;
        Actuatorinst_lock!1;
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
        Actuatorinst_0_init();
        Actuatorinst_lock!1;
        Controller_0_init();
        Controller_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
