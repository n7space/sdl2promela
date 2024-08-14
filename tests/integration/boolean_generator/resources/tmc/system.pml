#include "dataview.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef MyBoolMessage {
#if asn1SccMyBool_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyBool_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Controller_readvalue_channel = [1] of {MyBoolMessage};
MyBool Controller_readvalue_signal_parameter;
MyBoolMessage Controller_readvalue_signal_parameter_message;
bool Controller_readvalue_channel_used = 0;
MyBoolMessage environment_readValue_Environment_readValue_p1_message;
MyBool environment_readValue_Environment_readValue_p1_var;
system_state global_state;
chan Controller_lock = [1] of {int};
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
inline Environment_0_RI_0_readValue(environment_readValue_Environment_readValue_p1)
{
    MyBool_assign_value(environment_readValue_Environment_readValue_p1_var, environment_readValue_Environment_readValue_p1);
    c_code {
        {
        asn1SccMyBool environment_readValue_Environment_readValue_p1_c_var;
        BitStream environment_readValue_Environment_readValue_p1_stream;
        int environment_readValue_Environment_readValue_p1_rc;
        
        environment_readValue_Environment_readValue_p1_c_var = now.environment_readValue_Environment_readValue_p1_var;
        
        BitStream_Init(&environment_readValue_Environment_readValue_p1_stream,
            now.environment_readValue_Environment_readValue_p1_message.data,
            asn1SccMyBool_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyBool_Encode(&environment_readValue_Environment_readValue_p1_c_var,
            &environment_readValue_Environment_readValue_p1_stream,
            &environment_readValue_Environment_readValue_p1_rc,
            0);
        }
    }
    Controller_readvalue_channel!environment_readValue_Environment_readValue_p1_message;
    printf("channel_send Controller_readvalue_channel: %d\n", environment_readValue_Environment_readValue_p1_var);
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
            Controller_readvalue_channel?Controller_readvalue_signal_parameter_message;
            c_code {
                {
                asn1SccMyBool Controller_readvalue_signal_parameter_c_var;
                BitStream Controller_readvalue_signal_parameter_stream;
                int Controller_readvalue_signal_parameter_rc;BitStream_AttachBuffer(&Controller_readvalue_signal_parameter_stream,
                    now.Controller_readvalue_signal_parameter_message.data,
                    asn1SccMyBool_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyBool_Decode(&Controller_readvalue_signal_parameter_c_var,
                    &Controller_readvalue_signal_parameter_stream,
                    &Controller_readvalue_signal_parameter_rc);
                now.Controller_readvalue_signal_parameter = Controller_readvalue_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_readvalue_channel: %d\n", Controller_readvalue_signal_parameter);
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
