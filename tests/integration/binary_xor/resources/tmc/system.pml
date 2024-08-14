#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef MyCommandMessage {
#if asn1SccMyCommand_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyCommand_REQUIRED_BYTES_FOR_ENCODING];
#endif
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
chan Actuator_calculate_channel = [1] of {MyCommandMessage};
MyCommand Actuator_calculate_signal_parameter;
MyCommandMessage Actuator_calculate_signal_parameter_message;
bool Actuator_calculate_channel_used = 0;
MyIntegerMessage actuator_result_Actuator_result_p1_message;
MyInteger actuator_result_Actuator_result_p1_var;
chan Controller_result_channel = [1] of {MyIntegerMessage};
MyInteger Controller_result_signal_parameter;
MyIntegerMessage Controller_result_signal_parameter_message;
bool Controller_result_channel_used = 0;
MyCommandMessage controller_calculate_Controller_calculate_p1_message;
MyCommand controller_calculate_Controller_calculate_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_calculate_unhandled_input(p1)
{
    printf("unhandled_input actuator calculate\n");
    skip;
}
inline Actuator_0_RI_0_result(actuator_result_Actuator_result_p1)
{
    MyInteger_assign_value(actuator_result_Actuator_result_p1_var, actuator_result_Actuator_result_p1);
    c_code {
        {
        asn1SccMyInteger actuator_result_Actuator_result_p1_c_var;
        BitStream actuator_result_Actuator_result_p1_stream;
        int actuator_result_Actuator_result_p1_rc;
        
        actuator_result_Actuator_result_p1_c_var = now.actuator_result_Actuator_result_p1_var;
        
        BitStream_Init(&actuator_result_Actuator_result_p1_stream,
            now.actuator_result_Actuator_result_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&actuator_result_Actuator_result_p1_c_var,
            &actuator_result_Actuator_result_p1_stream,
            &actuator_result_Actuator_result_p1_rc,
            0);
        }
    }
    Controller_result_channel!actuator_result_Actuator_result_p1_message;
    printf("channel_send Controller_result_channel: %d\n", actuator_result_Actuator_result_p1_var);
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_calculate_channel);
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_result_unhandled_input(p1)
{
    printf("unhandled_input controller result\n");
    skip;
}
inline Controller_0_RI_0_calculate(controller_calculate_Controller_calculate_p1)
{
    MyCommand_assign_value(controller_calculate_Controller_calculate_p1_var, controller_calculate_Controller_calculate_p1);
    c_code {
        {
        asn1SccMyCommand controller_calculate_Controller_calculate_p1_c_var;
        BitStream controller_calculate_Controller_calculate_p1_stream;
        int controller_calculate_Controller_calculate_p1_rc;
        
        controller_calculate_Controller_calculate_p1_c_var.lhs = now.controller_calculate_Controller_calculate_p1_var.lhs;
        controller_calculate_Controller_calculate_p1_c_var.rhs = now.controller_calculate_Controller_calculate_p1_var.rhs;
        
        BitStream_Init(&controller_calculate_Controller_calculate_p1_stream,
            now.controller_calculate_Controller_calculate_p1_message.data,
            asn1SccMyCommand_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyCommand_Encode(&controller_calculate_Controller_calculate_p1_c_var,
            &controller_calculate_Controller_calculate_p1_stream,
            &controller_calculate_Controller_calculate_p1_rc,
            0);
        }
    }
    Actuator_calculate_channel!controller_calculate_Controller_calculate_p1_message;
    printf("channel_send Actuator_calculate_channel: %d, %d\n", controller_calculate_Controller_calculate_p1_var.lhs, controller_calculate_Controller_calculate_p1_var.rhs);
}
inline Controller_check_queue()
{
    atomic {
        empty(Controller_result_channel);
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_calculate() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_calculate_channel);
        Actuator_lock?_;
Actuator_calculate_loop:
        if
        ::  nempty(Actuator_calculate_channel);
            Actuator_calculate_channel?Actuator_calculate_signal_parameter_message;
            c_code {
                {
                asn1SccMyCommand Actuator_calculate_signal_parameter_c_var;
                BitStream Actuator_calculate_signal_parameter_stream;
                int Actuator_calculate_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_calculate_signal_parameter_stream,
                    now.Actuator_calculate_signal_parameter_message.data,
                    asn1SccMyCommand_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyCommand_Decode(&Actuator_calculate_signal_parameter_c_var,
                    &Actuator_calculate_signal_parameter_stream,
                    &Actuator_calculate_signal_parameter_rc);
                now.Actuator_calculate_signal_parameter.lhs = Actuator_calculate_signal_parameter_c_var.lhs;
                now.Actuator_calculate_signal_parameter.rhs = Actuator_calculate_signal_parameter_c_var.rhs;
                }
            }
            printf("channel_recv Actuator_calculate_channel: %d, %d\n", Actuator_calculate_signal_parameter.lhs, Actuator_calculate_signal_parameter.rhs);
            Actuator_calculate_channel_used = 1;
            Actuator_0_PI_0_calculate(Actuator_calculate_signal_parameter);
            goto Actuator_calculate_loop;
        ::  empty(Actuator_calculate_channel);
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
            Controller_result_channel?Controller_result_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Controller_result_signal_parameter_c_var;
                BitStream Controller_result_signal_parameter_stream;
                int Controller_result_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_signal_parameter_stream,
                    now.Controller_result_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Controller_result_signal_parameter_c_var,
                    &Controller_result_signal_parameter_stream,
                    &Controller_result_signal_parameter_rc);
                now.Controller_result_signal_parameter = Controller_result_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_result_channel: %d\n", Controller_result_signal_parameter);
            Controller_result_channel_used = 1;
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
