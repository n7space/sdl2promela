#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef MyArrayMessage {
#if asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyRealMessage {
#if asn1SccMyReal_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyReal_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_test_matrix_channel = [1] of {MyArrayMessage};
MyArray Actuator_test_matrix_signal_parameter;
MyArrayMessage Actuator_test_matrix_signal_parameter_message;
bool Actuator_test_matrix_channel_used = 0;
chan Actuator_test_scalar_channel = [1] of {MyRealMessage};
MyReal Actuator_test_scalar_signal_parameter;
MyRealMessage Actuator_test_scalar_signal_parameter_message;
bool Actuator_test_scalar_channel_used = 0;
chan Actuator_test_vector_channel = [1] of {MyArrayMessage};
MyArray Actuator_test_vector_signal_parameter;
MyArrayMessage Actuator_test_vector_signal_parameter_message;
bool Actuator_test_vector_channel_used = 0;
MyRealMessage actuator_result_Actuator_result_p1_message;
MyReal actuator_result_Actuator_result_p1_var;
chan Controller_result_channel = [1] of {MyRealMessage};
MyReal Controller_result_signal_parameter;
MyRealMessage Controller_result_signal_parameter_message;
bool Controller_result_channel_used = 0;
MyArrayMessage controller_test_matrix_Controller_test_matrix_p1_message;
MyArray controller_test_matrix_Controller_test_matrix_p1_var;
MyRealMessage controller_test_scalar_Controller_test_scalar_p1_message;
MyReal controller_test_scalar_Controller_test_scalar_p1_var;
MyArrayMessage controller_test_vector_Controller_test_vector_p1_message;
MyArray controller_test_vector_Controller_test_vector_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_test_matrix_unhandled_input(p1)
{
    printf("unhandled_input actuator test_matrix\n");
    skip;
}
inline Actuator_0_PI_0_test_scalar_unhandled_input(p1)
{
    printf("unhandled_input actuator test_scalar\n");
    skip;
}
inline Actuator_0_PI_0_test_vector_unhandled_input(p1)
{
    printf("unhandled_input actuator test_vector\n");
    skip;
}
inline Actuator_0_RI_0_result(actuator_result_Actuator_result_p1)
{
    MyReal_assign_value(actuator_result_Actuator_result_p1_var, actuator_result_Actuator_result_p1);
    c_code {
        {
        asn1SccMyReal actuator_result_Actuator_result_p1_c_var;
        BitStream actuator_result_Actuator_result_p1_stream;
        int actuator_result_Actuator_result_p1_rc;
        
        actuator_result_Actuator_result_p1_c_var = now.actuator_result_Actuator_result_p1_var;
        
        BitStream_Init(&actuator_result_Actuator_result_p1_stream,
            now.actuator_result_Actuator_result_p1_message.data,
            asn1SccMyReal_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyReal_Encode(&actuator_result_Actuator_result_p1_c_var,
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
        (empty(Actuator_test_matrix_channel) && (empty(Actuator_test_scalar_channel) && empty(Actuator_test_vector_channel)));
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
inline Controller_0_RI_0_test_matrix(controller_test_matrix_Controller_test_matrix_p1)
{
    MyArray_assign_value(controller_test_matrix_Controller_test_matrix_p1_var, controller_test_matrix_Controller_test_matrix_p1);
    c_code {
        {
        asn1SccMyArray controller_test_matrix_Controller_test_matrix_p1_c_var;
        BitStream controller_test_matrix_Controller_test_matrix_p1_stream;
        int controller_test_matrix_Controller_test_matrix_p1_rc;
        
        int i = 0;
        for(i = 0; i < 2; ++i)
        {
            controller_test_matrix_Controller_test_matrix_p1_c_var.arr[i] = now.controller_test_matrix_Controller_test_matrix_p1_var.data[i];
            
        }
        
        BitStream_Init(&controller_test_matrix_Controller_test_matrix_p1_stream,
            now.controller_test_matrix_Controller_test_matrix_p1_message.data,
            asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyArray_Encode(&controller_test_matrix_Controller_test_matrix_p1_c_var,
            &controller_test_matrix_Controller_test_matrix_p1_stream,
            &controller_test_matrix_Controller_test_matrix_p1_rc,
            0);
        }
    }
    Actuator_test_matrix_channel!controller_test_matrix_Controller_test_matrix_p1_message;
    printf("channel_send Actuator_test_matrix_channel: %d, %d\n", controller_test_matrix_Controller_test_matrix_p1_var.data[0], controller_test_matrix_Controller_test_matrix_p1_var.data[1]);
}
inline Controller_0_RI_0_test_scalar(controller_test_scalar_Controller_test_scalar_p1)
{
    MyReal_assign_value(controller_test_scalar_Controller_test_scalar_p1_var, controller_test_scalar_Controller_test_scalar_p1);
    c_code {
        {
        asn1SccMyReal controller_test_scalar_Controller_test_scalar_p1_c_var;
        BitStream controller_test_scalar_Controller_test_scalar_p1_stream;
        int controller_test_scalar_Controller_test_scalar_p1_rc;
        
        controller_test_scalar_Controller_test_scalar_p1_c_var = now.controller_test_scalar_Controller_test_scalar_p1_var;
        
        BitStream_Init(&controller_test_scalar_Controller_test_scalar_p1_stream,
            now.controller_test_scalar_Controller_test_scalar_p1_message.data,
            asn1SccMyReal_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyReal_Encode(&controller_test_scalar_Controller_test_scalar_p1_c_var,
            &controller_test_scalar_Controller_test_scalar_p1_stream,
            &controller_test_scalar_Controller_test_scalar_p1_rc,
            0);
        }
    }
    Actuator_test_scalar_channel!controller_test_scalar_Controller_test_scalar_p1_message;
    printf("channel_send Actuator_test_scalar_channel: %d\n", controller_test_scalar_Controller_test_scalar_p1_var);
}
inline Controller_0_RI_0_test_vector(controller_test_vector_Controller_test_vector_p1)
{
    MyArray_assign_value(controller_test_vector_Controller_test_vector_p1_var, controller_test_vector_Controller_test_vector_p1);
    c_code {
        {
        asn1SccMyArray controller_test_vector_Controller_test_vector_p1_c_var;
        BitStream controller_test_vector_Controller_test_vector_p1_stream;
        int controller_test_vector_Controller_test_vector_p1_rc;
        
        int i = 0;
        for(i = 0; i < 2; ++i)
        {
            controller_test_vector_Controller_test_vector_p1_c_var.arr[i] = now.controller_test_vector_Controller_test_vector_p1_var.data[i];
            
        }
        
        BitStream_Init(&controller_test_vector_Controller_test_vector_p1_stream,
            now.controller_test_vector_Controller_test_vector_p1_message.data,
            asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyArray_Encode(&controller_test_vector_Controller_test_vector_p1_c_var,
            &controller_test_vector_Controller_test_vector_p1_stream,
            &controller_test_vector_Controller_test_vector_p1_rc,
            0);
        }
    }
    Actuator_test_vector_channel!controller_test_vector_Controller_test_vector_p1_message;
    printf("channel_send Actuator_test_vector_channel: %d, %d\n", controller_test_vector_Controller_test_vector_p1_var.data[0], controller_test_vector_Controller_test_vector_p1_var.data[1]);
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
active proctype Actuator_test_matrix() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_matrix_channel);
        Actuator_lock?_;
Actuator_test_matrix_loop:
        if
        ::  nempty(Actuator_test_matrix_channel);
            Actuator_test_matrix_channel?Actuator_test_matrix_signal_parameter_message;
            c_code {
                {
                asn1SccMyArray Actuator_test_matrix_signal_parameter_c_var;
                BitStream Actuator_test_matrix_signal_parameter_stream;
                int Actuator_test_matrix_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_matrix_signal_parameter_stream,
                    now.Actuator_test_matrix_signal_parameter_message.data,
                    asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyArray_Decode(&Actuator_test_matrix_signal_parameter_c_var,
                    &Actuator_test_matrix_signal_parameter_stream,
                    &Actuator_test_matrix_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 2; ++i)
                {
                    now.Actuator_test_matrix_signal_parameter.data[i] = Actuator_test_matrix_signal_parameter_c_var.arr[i];
                    
                }
                }
            }
            printf("channel_recv Actuator_test_matrix_channel: %d, %d\n", Actuator_test_matrix_signal_parameter.data[0], Actuator_test_matrix_signal_parameter.data[1]);
            Actuator_test_matrix_channel_used = 1;
            Actuator_0_PI_0_test_matrix(Actuator_test_matrix_signal_parameter);
            goto Actuator_test_matrix_loop;
        ::  empty(Actuator_test_matrix_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_scalar() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_scalar_channel);
        Actuator_lock?_;
Actuator_test_scalar_loop:
        if
        ::  nempty(Actuator_test_scalar_channel);
            Actuator_test_scalar_channel?Actuator_test_scalar_signal_parameter_message;
            c_code {
                {
                asn1SccMyReal Actuator_test_scalar_signal_parameter_c_var;
                BitStream Actuator_test_scalar_signal_parameter_stream;
                int Actuator_test_scalar_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_scalar_signal_parameter_stream,
                    now.Actuator_test_scalar_signal_parameter_message.data,
                    asn1SccMyReal_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyReal_Decode(&Actuator_test_scalar_signal_parameter_c_var,
                    &Actuator_test_scalar_signal_parameter_stream,
                    &Actuator_test_scalar_signal_parameter_rc);
                now.Actuator_test_scalar_signal_parameter = Actuator_test_scalar_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuator_test_scalar_channel: %d\n", Actuator_test_scalar_signal_parameter);
            Actuator_test_scalar_channel_used = 1;
            Actuator_0_PI_0_test_scalar(Actuator_test_scalar_signal_parameter);
            goto Actuator_test_scalar_loop;
        ::  empty(Actuator_test_scalar_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_vector() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_vector_channel);
        Actuator_lock?_;
Actuator_test_vector_loop:
        if
        ::  nempty(Actuator_test_vector_channel);
            Actuator_test_vector_channel?Actuator_test_vector_signal_parameter_message;
            c_code {
                {
                asn1SccMyArray Actuator_test_vector_signal_parameter_c_var;
                BitStream Actuator_test_vector_signal_parameter_stream;
                int Actuator_test_vector_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_vector_signal_parameter_stream,
                    now.Actuator_test_vector_signal_parameter_message.data,
                    asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyArray_Decode(&Actuator_test_vector_signal_parameter_c_var,
                    &Actuator_test_vector_signal_parameter_stream,
                    &Actuator_test_vector_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 2; ++i)
                {
                    now.Actuator_test_vector_signal_parameter.data[i] = Actuator_test_vector_signal_parameter_c_var.arr[i];
                    
                }
                }
            }
            printf("channel_recv Actuator_test_vector_channel: %d, %d\n", Actuator_test_vector_signal_parameter.data[0], Actuator_test_vector_signal_parameter.data[1]);
            Actuator_test_vector_channel_used = 1;
            Actuator_0_PI_0_test_vector(Actuator_test_vector_signal_parameter);
            goto Actuator_test_vector_loop;
        ::  empty(Actuator_test_vector_channel);
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
                asn1SccMyReal Controller_result_signal_parameter_c_var;
                BitStream Controller_result_signal_parameter_stream;
                int Controller_result_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_signal_parameter_stream,
                    now.Controller_result_signal_parameter_message.data,
                    asn1SccMyReal_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyReal_Decode(&Controller_result_signal_parameter_c_var,
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
