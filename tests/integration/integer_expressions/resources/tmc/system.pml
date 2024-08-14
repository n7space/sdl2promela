#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef BinaryIntegerTestParamMessage {
#if asn1SccBinaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccBinaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyIntegerResultMessage {
#if asn1SccMyIntegerResult_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyIntegerResult_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef UnaryIntegerTestParamMessage {
#if asn1SccUnaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccUnaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_check_binary_channel = [1] of {BinaryIntegerTestParamMessage};
BinaryIntegerTestParam Actuator_check_binary_signal_parameter;
BinaryIntegerTestParamMessage Actuator_check_binary_signal_parameter_message;
bool Actuator_check_binary_channel_used = 0;
chan Actuator_check_unary_channel = [1] of {UnaryIntegerTestParamMessage};
UnaryIntegerTestParam Actuator_check_unary_signal_parameter;
UnaryIntegerTestParamMessage Actuator_check_unary_signal_parameter_message;
bool Actuator_check_unary_channel_used = 0;
MyIntegerResultMessage actuator_result_Actuator_result_p1_message;
MyIntegerResult actuator_result_Actuator_result_p1_var;
chan Controller_result_channel = [1] of {MyIntegerResultMessage};
MyIntegerResult Controller_result_signal_parameter;
MyIntegerResultMessage Controller_result_signal_parameter_message;
bool Controller_result_channel_used = 0;
BinaryIntegerTestParamMessage controller_check_binary_Controller_check_binary_p1_message;
BinaryIntegerTestParam controller_check_binary_Controller_check_binary_p1_var;
UnaryIntegerTestParamMessage controller_check_unary_Controller_check_unary_p1_message;
UnaryIntegerTestParam controller_check_unary_Controller_check_unary_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_check_binary_unhandled_input(p1)
{
    printf("unhandled_input actuator check_binary\n");
    skip;
}
inline Actuator_0_PI_0_check_unary_unhandled_input(p1)
{
    printf("unhandled_input actuator check_unary\n");
    skip;
}
inline Actuator_0_RI_0_result(actuator_result_Actuator_result_p1)
{
    MyIntegerResult_assign_value(actuator_result_Actuator_result_p1_var, actuator_result_Actuator_result_p1);
    c_code {
        {
        asn1SccMyIntegerResult actuator_result_Actuator_result_p1_c_var;
        BitStream actuator_result_Actuator_result_p1_stream;
        int actuator_result_Actuator_result_p1_rc;
        
        actuator_result_Actuator_result_p1_c_var = now.actuator_result_Actuator_result_p1_var;
        
        BitStream_Init(&actuator_result_Actuator_result_p1_stream,
            now.actuator_result_Actuator_result_p1_message.data,
            asn1SccMyIntegerResult_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyIntegerResult_Encode(&actuator_result_Actuator_result_p1_c_var,
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
        (empty(Actuator_check_binary_channel) && empty(Actuator_check_unary_channel));
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
inline Controller_0_RI_0_check_binary(controller_check_binary_Controller_check_binary_p1)
{
    BinaryIntegerTestParam_assign_value(controller_check_binary_Controller_check_binary_p1_var, controller_check_binary_Controller_check_binary_p1);
    c_code {
        {
        asn1SccBinaryIntegerTestParam controller_check_binary_Controller_check_binary_p1_c_var;
        BitStream controller_check_binary_Controller_check_binary_p1_stream;
        int controller_check_binary_Controller_check_binary_p1_rc;
        
        controller_check_binary_Controller_check_binary_p1_c_var.oper = now.controller_check_binary_Controller_check_binary_p1_var.oper;
        controller_check_binary_Controller_check_binary_p1_c_var.left = now.controller_check_binary_Controller_check_binary_p1_var.left;
        controller_check_binary_Controller_check_binary_p1_c_var.right = now.controller_check_binary_Controller_check_binary_p1_var.right;
        
        BitStream_Init(&controller_check_binary_Controller_check_binary_p1_stream,
            now.controller_check_binary_Controller_check_binary_p1_message.data,
            asn1SccBinaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccBinaryIntegerTestParam_Encode(&controller_check_binary_Controller_check_binary_p1_c_var,
            &controller_check_binary_Controller_check_binary_p1_stream,
            &controller_check_binary_Controller_check_binary_p1_rc,
            0);
        }
    }
    Actuator_check_binary_channel!controller_check_binary_Controller_check_binary_p1_message;
    printf("channel_send Actuator_check_binary_channel: %d, %d, %d\n", controller_check_binary_Controller_check_binary_p1_var.oper, controller_check_binary_Controller_check_binary_p1_var.left, controller_check_binary_Controller_check_binary_p1_var.right);
}
inline Controller_0_RI_0_check_unary(controller_check_unary_Controller_check_unary_p1)
{
    UnaryIntegerTestParam_assign_value(controller_check_unary_Controller_check_unary_p1_var, controller_check_unary_Controller_check_unary_p1);
    c_code {
        {
        asn1SccUnaryIntegerTestParam controller_check_unary_Controller_check_unary_p1_c_var;
        BitStream controller_check_unary_Controller_check_unary_p1_stream;
        int controller_check_unary_Controller_check_unary_p1_rc;
        
        controller_check_unary_Controller_check_unary_p1_c_var.expr = now.controller_check_unary_Controller_check_unary_p1_var.expr;
        
        BitStream_Init(&controller_check_unary_Controller_check_unary_p1_stream,
            now.controller_check_unary_Controller_check_unary_p1_message.data,
            asn1SccUnaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccUnaryIntegerTestParam_Encode(&controller_check_unary_Controller_check_unary_p1_c_var,
            &controller_check_unary_Controller_check_unary_p1_stream,
            &controller_check_unary_Controller_check_unary_p1_rc,
            0);
        }
    }
    Actuator_check_unary_channel!controller_check_unary_Controller_check_unary_p1_message;
    printf("channel_send Actuator_check_unary_channel: %d\n", controller_check_unary_Controller_check_unary_p1_var.expr);
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
active proctype Actuator_check_binary() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_check_binary_channel);
        Actuator_lock?_;
Actuator_check_binary_loop:
        if
        ::  nempty(Actuator_check_binary_channel);
            Actuator_check_binary_channel?Actuator_check_binary_signal_parameter_message;
            c_code {
                {
                asn1SccBinaryIntegerTestParam Actuator_check_binary_signal_parameter_c_var;
                BitStream Actuator_check_binary_signal_parameter_stream;
                int Actuator_check_binary_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_check_binary_signal_parameter_stream,
                    now.Actuator_check_binary_signal_parameter_message.data,
                    asn1SccBinaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccBinaryIntegerTestParam_Decode(&Actuator_check_binary_signal_parameter_c_var,
                    &Actuator_check_binary_signal_parameter_stream,
                    &Actuator_check_binary_signal_parameter_rc);
                now.Actuator_check_binary_signal_parameter.oper = Actuator_check_binary_signal_parameter_c_var.oper;
                now.Actuator_check_binary_signal_parameter.left = Actuator_check_binary_signal_parameter_c_var.left;
                now.Actuator_check_binary_signal_parameter.right = Actuator_check_binary_signal_parameter_c_var.right;
                }
            }
            printf("channel_recv Actuator_check_binary_channel: %d, %d, %d\n", Actuator_check_binary_signal_parameter.oper, Actuator_check_binary_signal_parameter.left, Actuator_check_binary_signal_parameter.right);
            Actuator_check_binary_channel_used = 1;
            Actuator_0_PI_0_check_binary(Actuator_check_binary_signal_parameter);
            goto Actuator_check_binary_loop;
        ::  empty(Actuator_check_binary_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_check_unary() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_check_unary_channel);
        Actuator_lock?_;
Actuator_check_unary_loop:
        if
        ::  nempty(Actuator_check_unary_channel);
            Actuator_check_unary_channel?Actuator_check_unary_signal_parameter_message;
            c_code {
                {
                asn1SccUnaryIntegerTestParam Actuator_check_unary_signal_parameter_c_var;
                BitStream Actuator_check_unary_signal_parameter_stream;
                int Actuator_check_unary_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_check_unary_signal_parameter_stream,
                    now.Actuator_check_unary_signal_parameter_message.data,
                    asn1SccUnaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccUnaryIntegerTestParam_Decode(&Actuator_check_unary_signal_parameter_c_var,
                    &Actuator_check_unary_signal_parameter_stream,
                    &Actuator_check_unary_signal_parameter_rc);
                now.Actuator_check_unary_signal_parameter.expr = Actuator_check_unary_signal_parameter_c_var.expr;
                }
            }
            printf("channel_recv Actuator_check_unary_channel: %d\n", Actuator_check_unary_signal_parameter.expr);
            Actuator_check_unary_channel_used = 1;
            Actuator_0_PI_0_check_unary(Actuator_check_unary_signal_parameter);
            goto Actuator_check_unary_loop;
        ::  empty(Actuator_check_unary_channel);
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
                asn1SccMyIntegerResult Controller_result_signal_parameter_c_var;
                BitStream Controller_result_signal_parameter_stream;
                int Controller_result_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_signal_parameter_stream,
                    now.Controller_result_signal_parameter_message.data,
                    asn1SccMyIntegerResult_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyIntegerResult_Decode(&Controller_result_signal_parameter_c_var,
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
