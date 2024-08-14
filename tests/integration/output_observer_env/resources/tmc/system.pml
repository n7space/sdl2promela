#include "dataview.pml"
#include "controller.pml"
#include "Observer.pml"
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
    Controller_Context controller;
    Observer_Context observer;
    AggregateTimerData timers;
}

int inited;
MyIntegerMessage observer_controller_p1_message;
MyInteger observer_controller_p1_var;
chan Controller_observer_ping_channel = [1] of {MyIntegerMessage};
chan Controller_ping_channel = [1] of {MyIntegerMessage};
MyInteger Controller_ping_signal_parameter;
MyIntegerMessage Controller_ping_signal_parameter_message;
bool Controller_ping_channel_used = 0;
MyIntegerMessage controller_pong_Controller_pong_p1_message;
MyInteger controller_pong_Controller_pong_p1_var;
chan Environ_pong_channel = [1] of {MyIntegerMessage};
MyInteger Environ_pong_signal_parameter;
MyIntegerMessage Environ_pong_signal_parameter_message;
bool Environ_pong_channel_used = 0;
MyIntegerMessage environ_ping_Environ_ping_p1_message;
MyInteger environ_ping_Environ_ping_p1_var;
system_state global_state;
chan Controller_lock = [1] of {int};
chan Observer_lock = [1] of {int};
inline Observer_0_RI_0_ping_in(observer_controller_p1)
{
    MyInteger_assign_value(observer_controller_p1_var, observer_controller_p1);
    c_code {
        {
        asn1SccMyInteger observer_controller_p1_c_var;
        BitStream observer_controller_p1_stream;
        int observer_controller_p1_rc;
        
        observer_controller_p1_c_var = now.observer_controller_p1_var;
        
        BitStream_Init(&observer_controller_p1_stream,
            now.observer_controller_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&observer_controller_p1_c_var,
            &observer_controller_p1_stream,
            &observer_controller_p1_rc,
            0);
        }
    }
    Controller_observer_ping_channel!observer_controller_p1_message;
    printf("channel_send Controller_observer_ping_channel: %d\n", observer_controller_p1_var);
}
inline Controller_0_PI_0_ping_unhandled_input(p1)
{
    printf("unhandled_input controller ping\n");
    skip;
}
inline Controller_0_RI_0_pong(controller_pong_Controller_pong_p1)
{
    MyInteger_assign_value(controller_pong_Controller_pong_p1_var, controller_pong_Controller_pong_p1);
    c_code {
        {
        asn1SccMyInteger controller_pong_Controller_pong_p1_c_var;
        BitStream controller_pong_Controller_pong_p1_stream;
        int controller_pong_Controller_pong_p1_rc;
        
        controller_pong_Controller_pong_p1_c_var = now.controller_pong_Controller_pong_p1_var;
        
        BitStream_Init(&controller_pong_Controller_pong_p1_stream,
            now.controller_pong_Controller_pong_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&controller_pong_Controller_pong_p1_c_var,
            &controller_pong_Controller_pong_p1_stream,
            &controller_pong_Controller_pong_p1_rc,
            0);
        }
    }
    Environ_pong_channel!controller_pong_Controller_pong_p1_message;
    printf("channel_send Environ_pong_channel: %d\n", controller_pong_Controller_pong_p1_var);
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_observer_ping_channel) && empty(Controller_ping_channel));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Environ_0_RI_0_ping(environ_ping_Environ_ping_p1)
{
    MyInteger_assign_value(environ_ping_Environ_ping_p1_var, environ_ping_Environ_ping_p1);
    c_code {
        {
        asn1SccMyInteger environ_ping_Environ_ping_p1_c_var;
        BitStream environ_ping_Environ_ping_p1_stream;
        int environ_ping_Environ_ping_p1_rc;
        
        environ_ping_Environ_ping_p1_c_var = now.environ_ping_Environ_ping_p1_var;
        
        BitStream_Init(&environ_ping_Environ_ping_p1_stream,
            now.environ_ping_Environ_ping_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&environ_ping_Environ_ping_p1_c_var,
            &environ_ping_Environ_ping_p1_stream,
            &environ_ping_Environ_ping_p1_rc,
            0);
        }
    }
    Controller_ping_channel!environ_ping_Environ_ping_p1_message;
    printf("channel_send Controller_ping_channel: %d\n", environ_ping_Environ_ping_p1_var);
}
active proctype Controller_ping() priority 1
{
    inited;
    do
    ::  atomic {
        (nempty(Controller_observer_ping_channel) || nempty(Controller_ping_channel));
        Controller_lock?_;
Controller_ping_loop:
        if
        ::  nempty(Controller_observer_ping_channel);
            Controller_observer_ping_channel?Controller_ping_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Controller_ping_signal_parameter_c_var;
                BitStream Controller_ping_signal_parameter_stream;
                int Controller_ping_signal_parameter_rc;BitStream_AttachBuffer(&Controller_ping_signal_parameter_stream,
                    now.Controller_ping_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Controller_ping_signal_parameter_c_var,
                    &Controller_ping_signal_parameter_stream,
                    &Controller_ping_signal_parameter_rc);
                now.Controller_ping_signal_parameter = Controller_ping_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_observer_ping_channel: %d\n", Controller_ping_signal_parameter);
            Controller_ping_channel_used = 1;
            Controller_0_PI_0_ping(Controller_ping_signal_parameter);
            goto Controller_ping_loop;
        ::  empty(Controller_observer_ping_channel);
            skip;
        fi;
        if
        ::  nempty(Controller_ping_channel);
            Controller_ping_channel?Controller_ping_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Controller_ping_signal_parameter_c_var;
                BitStream Controller_ping_signal_parameter_stream;
                int Controller_ping_signal_parameter_rc;BitStream_AttachBuffer(&Controller_ping_signal_parameter_stream,
                    now.Controller_ping_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Controller_ping_signal_parameter_c_var,
                    &Controller_ping_signal_parameter_stream,
                    &Controller_ping_signal_parameter_rc);
                now.Controller_ping_signal_parameter = Controller_ping_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_ping_channel: %d\n", Controller_ping_signal_parameter);
            Observer_lock?_;
            Observer_0_PI_0_ping_in(Controller_ping_signal_parameter);
            Observer_lock!1;
            goto Controller_ping_loop;
        ::  empty(Controller_ping_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Environ_pong() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Environ_pong_channel);
Environ_pong_loop:
        if
        ::  nempty(Environ_pong_channel);
            Environ_pong_channel?Environ_pong_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Environ_pong_signal_parameter_c_var;
                BitStream Environ_pong_signal_parameter_stream;
                int Environ_pong_signal_parameter_rc;BitStream_AttachBuffer(&Environ_pong_signal_parameter_stream,
                    now.Environ_pong_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Environ_pong_signal_parameter_c_var,
                    &Environ_pong_signal_parameter_stream,
                    &Environ_pong_signal_parameter_rc);
                now.Environ_pong_signal_parameter = Environ_pong_signal_parameter_c_var;
                }
            }
            printf("channel_recv Environ_pong_channel: %d\n", Environ_pong_signal_parameter);
            Environ_pong_channel_used = 1;
            goto Environ_pong_loop;
        ::  empty(Environ_pong_channel);
            skip;
        fi;
    }
    od;
}
active proctype Environ_ping() priority 1
{
    inited;
    MyInteger value;
    do
    ::  atomic {
        MyInteger_generate_value(value);
        Environ_0_RI_0_ping(value);
    }
    od;
}
init
{
    atomic {
        global_dataview_init();
        Controller_0_init();
        Controller_lock!1;
        Observer_0_init();
        Observer_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
