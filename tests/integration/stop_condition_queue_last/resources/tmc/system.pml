#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef MyArrayDataTypeMessage {
#if asn1SccMyArrayDataType_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyArrayDataType_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyChoiceDataTypeMessage {
#if asn1SccMyChoiceDataType_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyChoiceDataType_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyIntegerMessage {
#if asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MySequenceDataTypeMessage {
#if asn1SccMySequenceDataType_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMySequenceDataType_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MySequenceWithOptionalsDataTypeMessage {
#if asn1SccMySequenceWithOptionalsDataType_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMySequenceWithOptionalsDataType_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_test_array_channel = [1] of {MyArrayDataTypeMessage};
MyArrayDataType Actuator_test_array_signal_parameter;
MyArrayDataTypeMessage Actuator_test_array_signal_parameter_message;
bool Actuator_test_array_channel_used = 0;
chan Actuator_test_choice_channel = [1] of {MyChoiceDataTypeMessage};
MyChoiceDataType Actuator_test_choice_signal_parameter;
MyChoiceDataTypeMessage Actuator_test_choice_signal_parameter_message;
bool Actuator_test_choice_channel_used = 0;
chan Actuator_test_integer_channel = [1] of {MyIntegerMessage};
MyInteger Actuator_test_integer_signal_parameter;
MyIntegerMessage Actuator_test_integer_signal_parameter_message;
bool Actuator_test_integer_channel_used = 0;
chan Actuator_test_optional_channel = [1] of {MySequenceWithOptionalsDataTypeMessage};
MySequenceWithOptionalsDataType Actuator_test_optional_signal_parameter;
MySequenceWithOptionalsDataTypeMessage Actuator_test_optional_signal_parameter_message;
bool Actuator_test_optional_channel_used = 0;
chan Actuator_test_sequence_channel = [1] of {MySequenceDataTypeMessage};
MySequenceDataType Actuator_test_sequence_signal_parameter;
MySequenceDataTypeMessage Actuator_test_sequence_signal_parameter_message;
bool Actuator_test_sequence_channel_used = 0;
chan Controller_result_channel = [1] of {int};
MyArrayDataTypeMessage controller_test_array_Controller_test_array_p1_message;
MyArrayDataType controller_test_array_Controller_test_array_p1_var;
MyChoiceDataTypeMessage controller_test_choice_Controller_test_choice_p1_message;
MyChoiceDataType controller_test_choice_Controller_test_choice_p1_var;
MyIntegerMessage controller_test_integer_Controller_test_integer_p1_message;
MyInteger controller_test_integer_Controller_test_integer_p1_var;
MySequenceWithOptionalsDataTypeMessage controller_test_optional_Controller_test_optional_p1_message;
MySequenceWithOptionalsDataType controller_test_optional_Controller_test_optional_p1_var;
MySequenceDataTypeMessage controller_test_sequence_Controller_test_sequence_p1_message;
MySequenceDataType controller_test_sequence_Controller_test_sequence_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_test_array_unhandled_input(p1)
{
    printf("unhandled_input actuator test_array\n");
    skip;
}
inline Actuator_0_PI_0_test_choice_unhandled_input(p1)
{
    printf("unhandled_input actuator test_choice\n");
    skip;
}
inline Actuator_0_PI_0_test_integer_unhandled_input(p1)
{
    printf("unhandled_input actuator test_integer\n");
    skip;
}
inline Actuator_0_PI_0_test_optional_unhandled_input(p1)
{
    printf("unhandled_input actuator test_optional\n");
    skip;
}
inline Actuator_0_PI_0_test_sequence_unhandled_input(p1)
{
    printf("unhandled_input actuator test_sequence\n");
    skip;
}
inline Actuator_0_RI_0_result()
{
    Controller_result_channel!0;
    printf("channel_send Controller_result_channel: 1\n");
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_test_array_channel) && (empty(Actuator_test_choice_channel) && (empty(Actuator_test_integer_channel) && (empty(Actuator_test_optional_channel) && empty(Actuator_test_sequence_channel)))));
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_result_unhandled_input()
{
    printf("unhandled_input controller result\n");
    skip;
}
inline Controller_0_RI_0_test_array(controller_test_array_Controller_test_array_p1)
{
    MyArrayDataType_assign_value(controller_test_array_Controller_test_array_p1_var, controller_test_array_Controller_test_array_p1);
    c_code {
        {
        asn1SccMyArrayDataType controller_test_array_Controller_test_array_p1_c_var;
        BitStream controller_test_array_Controller_test_array_p1_stream;
        int controller_test_array_Controller_test_array_p1_rc;
        
        int i = 0;
        for(i = 0; i < 3; ++i)
        {
            controller_test_array_Controller_test_array_p1_c_var.arr[i] = now.controller_test_array_Controller_test_array_p1_var.data[i];
            
        }
        controller_test_array_Controller_test_array_p1_c_var.nCount = now.controller_test_array_Controller_test_array_p1_var.length;
        
        BitStream_Init(&controller_test_array_Controller_test_array_p1_stream,
            now.controller_test_array_Controller_test_array_p1_message.data,
            asn1SccMyArrayDataType_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyArrayDataType_Encode(&controller_test_array_Controller_test_array_p1_c_var,
            &controller_test_array_Controller_test_array_p1_stream,
            &controller_test_array_Controller_test_array_p1_rc,
            0);
        }
    }
    Actuator_test_array_channel!controller_test_array_Controller_test_array_p1_message;
    printf("channel_send Actuator_test_array_channel: %d, %d, %d, %d\n", controller_test_array_Controller_test_array_p1_var.length, controller_test_array_Controller_test_array_p1_var.data[0], controller_test_array_Controller_test_array_p1_var.data[1], controller_test_array_Controller_test_array_p1_var.data[2]);
}
inline Controller_0_RI_0_test_choice(controller_test_choice_Controller_test_choice_p1)
{
    MyChoiceDataType_assign_value(controller_test_choice_Controller_test_choice_p1_var, controller_test_choice_Controller_test_choice_p1);
    c_code {
        {
        asn1SccMyChoiceDataType controller_test_choice_Controller_test_choice_p1_c_var;
        BitStream controller_test_choice_Controller_test_choice_p1_stream;
        int controller_test_choice_Controller_test_choice_p1_rc;
        
        if(now.controller_test_choice_Controller_test_choice_p1_var.selection == MyChoiceDataType_first_PRESENT)
        {
            controller_test_choice_Controller_test_choice_p1_c_var.u.first = now.controller_test_choice_Controller_test_choice_p1_var.data.first;
            
            controller_test_choice_Controller_test_choice_p1_c_var.kind = MyChoiceDataType_first_PRESENT;
        }
        else if(now.controller_test_choice_Controller_test_choice_p1_var.selection == MyChoiceDataType_second_PRESENT)
        {
            controller_test_choice_Controller_test_choice_p1_c_var.u.second = now.controller_test_choice_Controller_test_choice_p1_var.data.second;
            
            controller_test_choice_Controller_test_choice_p1_c_var.kind = MyChoiceDataType_second_PRESENT;
        }
        
        BitStream_Init(&controller_test_choice_Controller_test_choice_p1_stream,
            now.controller_test_choice_Controller_test_choice_p1_message.data,
            asn1SccMyChoiceDataType_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyChoiceDataType_Encode(&controller_test_choice_Controller_test_choice_p1_c_var,
            &controller_test_choice_Controller_test_choice_p1_stream,
            &controller_test_choice_Controller_test_choice_p1_rc,
            0);
        }
    }
    Actuator_test_choice_channel!controller_test_choice_Controller_test_choice_p1_message;
    printf("channel_send Actuator_test_choice_channel: %d, %d, %d\n", controller_test_choice_Controller_test_choice_p1_var.data.first, controller_test_choice_Controller_test_choice_p1_var.data.second, controller_test_choice_Controller_test_choice_p1_var.selection);
}
inline Controller_0_RI_0_test_integer(controller_test_integer_Controller_test_integer_p1)
{
    MyInteger_assign_value(controller_test_integer_Controller_test_integer_p1_var, controller_test_integer_Controller_test_integer_p1);
    c_code {
        {
        asn1SccMyInteger controller_test_integer_Controller_test_integer_p1_c_var;
        BitStream controller_test_integer_Controller_test_integer_p1_stream;
        int controller_test_integer_Controller_test_integer_p1_rc;
        
        controller_test_integer_Controller_test_integer_p1_c_var = now.controller_test_integer_Controller_test_integer_p1_var;
        
        BitStream_Init(&controller_test_integer_Controller_test_integer_p1_stream,
            now.controller_test_integer_Controller_test_integer_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&controller_test_integer_Controller_test_integer_p1_c_var,
            &controller_test_integer_Controller_test_integer_p1_stream,
            &controller_test_integer_Controller_test_integer_p1_rc,
            0);
        }
    }
    Actuator_test_integer_channel!controller_test_integer_Controller_test_integer_p1_message;
    printf("channel_send Actuator_test_integer_channel: %d\n", controller_test_integer_Controller_test_integer_p1_var);
}
inline Controller_0_RI_0_test_optional(controller_test_optional_Controller_test_optional_p1)
{
    MySequenceWithOptionalsDataType_assign_value(controller_test_optional_Controller_test_optional_p1_var, controller_test_optional_Controller_test_optional_p1);
    c_code {
        {
        asn1SccMySequenceWithOptionalsDataType controller_test_optional_Controller_test_optional_p1_c_var;
        BitStream controller_test_optional_Controller_test_optional_p1_stream;
        int controller_test_optional_Controller_test_optional_p1_rc;
        
        controller_test_optional_Controller_test_optional_p1_c_var.a = now.controller_test_optional_Controller_test_optional_p1_var.a;
        controller_test_optional_Controller_test_optional_p1_c_var.b = now.controller_test_optional_Controller_test_optional_p1_var.b;
        controller_test_optional_Controller_test_optional_p1_c_var.c = now.controller_test_optional_Controller_test_optional_p1_var.c;
        controller_test_optional_Controller_test_optional_p1_c_var.exist.b = now.controller_test_optional_Controller_test_optional_p1_var.exist.b;
        controller_test_optional_Controller_test_optional_p1_c_var.exist.c = now.controller_test_optional_Controller_test_optional_p1_var.exist.c;
        
        BitStream_Init(&controller_test_optional_Controller_test_optional_p1_stream,
            now.controller_test_optional_Controller_test_optional_p1_message.data,
            asn1SccMySequenceWithOptionalsDataType_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMySequenceWithOptionalsDataType_Encode(&controller_test_optional_Controller_test_optional_p1_c_var,
            &controller_test_optional_Controller_test_optional_p1_stream,
            &controller_test_optional_Controller_test_optional_p1_rc,
            0);
        }
    }
    Actuator_test_optional_channel!controller_test_optional_Controller_test_optional_p1_message;
    printf("channel_send Actuator_test_optional_channel: %d, %d, %d, %d, %d\n", controller_test_optional_Controller_test_optional_p1_var.a, controller_test_optional_Controller_test_optional_p1_var.b, controller_test_optional_Controller_test_optional_p1_var.c, controller_test_optional_Controller_test_optional_p1_var.exist.b, controller_test_optional_Controller_test_optional_p1_var.exist.c);
}
inline Controller_0_RI_0_test_sequence(controller_test_sequence_Controller_test_sequence_p1)
{
    MySequenceDataType_assign_value(controller_test_sequence_Controller_test_sequence_p1_var, controller_test_sequence_Controller_test_sequence_p1);
    c_code {
        {
        asn1SccMySequenceDataType controller_test_sequence_Controller_test_sequence_p1_c_var;
        BitStream controller_test_sequence_Controller_test_sequence_p1_stream;
        int controller_test_sequence_Controller_test_sequence_p1_rc;
        
        controller_test_sequence_Controller_test_sequence_p1_c_var.x = now.controller_test_sequence_Controller_test_sequence_p1_var.x;
        int i = 0;
        for(i = 0; i < 4; ++i)
        {
            controller_test_sequence_Controller_test_sequence_p1_c_var.y.arr[i] = now.controller_test_sequence_Controller_test_sequence_p1_var.y.data[i];
            
        }
        controller_test_sequence_Controller_test_sequence_p1_c_var.y.nCount = now.controller_test_sequence_Controller_test_sequence_p1_var.y.length;
        
        BitStream_Init(&controller_test_sequence_Controller_test_sequence_p1_stream,
            now.controller_test_sequence_Controller_test_sequence_p1_message.data,
            asn1SccMySequenceDataType_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMySequenceDataType_Encode(&controller_test_sequence_Controller_test_sequence_p1_c_var,
            &controller_test_sequence_Controller_test_sequence_p1_stream,
            &controller_test_sequence_Controller_test_sequence_p1_rc,
            0);
        }
    }
    Actuator_test_sequence_channel!controller_test_sequence_Controller_test_sequence_p1_message;
    printf("channel_send Actuator_test_sequence_channel: %d, %d, %d, %d, %d, %d\n", controller_test_sequence_Controller_test_sequence_p1_var.x, controller_test_sequence_Controller_test_sequence_p1_var.y.length, controller_test_sequence_Controller_test_sequence_p1_var.y.data[0], controller_test_sequence_Controller_test_sequence_p1_var.y.data[1], controller_test_sequence_Controller_test_sequence_p1_var.y.data[2], controller_test_sequence_Controller_test_sequence_p1_var.y.data[3]);
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
active proctype Actuator_test_array() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_array_channel);
        Actuator_lock?_;
Actuator_test_array_loop:
        if
        ::  nempty(Actuator_test_array_channel);
            Actuator_test_array_channel?Actuator_test_array_signal_parameter_message;
            c_code {
                {
                asn1SccMyArrayDataType Actuator_test_array_signal_parameter_c_var;
                BitStream Actuator_test_array_signal_parameter_stream;
                int Actuator_test_array_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_array_signal_parameter_stream,
                    now.Actuator_test_array_signal_parameter_message.data,
                    asn1SccMyArrayDataType_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyArrayDataType_Decode(&Actuator_test_array_signal_parameter_c_var,
                    &Actuator_test_array_signal_parameter_stream,
                    &Actuator_test_array_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 3; ++i)
                {
                    now.Actuator_test_array_signal_parameter.data[i] = Actuator_test_array_signal_parameter_c_var.arr[i];
                    
                }
                now.Actuator_test_array_signal_parameter.length = Actuator_test_array_signal_parameter_c_var.nCount;
                }
            }
            printf("channel_recv Actuator_test_array_channel: %d, %d, %d, %d\n", Actuator_test_array_signal_parameter.length, Actuator_test_array_signal_parameter.data[0], Actuator_test_array_signal_parameter.data[1], Actuator_test_array_signal_parameter.data[2]);
            Actuator_test_array_channel_used = 1;
            Actuator_0_PI_0_test_array(Actuator_test_array_signal_parameter);
            goto Actuator_test_array_loop;
        ::  empty(Actuator_test_array_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_choice() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_choice_channel);
        Actuator_lock?_;
Actuator_test_choice_loop:
        if
        ::  nempty(Actuator_test_choice_channel);
            Actuator_test_choice_channel?Actuator_test_choice_signal_parameter_message;
            c_code {
                {
                asn1SccMyChoiceDataType Actuator_test_choice_signal_parameter_c_var;
                BitStream Actuator_test_choice_signal_parameter_stream;
                int Actuator_test_choice_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_choice_signal_parameter_stream,
                    now.Actuator_test_choice_signal_parameter_message.data,
                    asn1SccMyChoiceDataType_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyChoiceDataType_Decode(&Actuator_test_choice_signal_parameter_c_var,
                    &Actuator_test_choice_signal_parameter_stream,
                    &Actuator_test_choice_signal_parameter_rc);
                if(Actuator_test_choice_signal_parameter_c_var.kind == MyChoiceDataType_first_PRESENT)
                {
                    now.Actuator_test_choice_signal_parameter.data.first = Actuator_test_choice_signal_parameter_c_var.u.first;
                    
                    now.Actuator_test_choice_signal_parameter.selection = MyChoiceDataType_first_PRESENT;
                }
                 else if(Actuator_test_choice_signal_parameter_c_var.kind == MyChoiceDataType_second_PRESENT)
                {
                    now.Actuator_test_choice_signal_parameter.data.second = Actuator_test_choice_signal_parameter_c_var.u.second;
                    
                    now.Actuator_test_choice_signal_parameter.selection = MyChoiceDataType_second_PRESENT;
                }
                }
            }
            printf("channel_recv Actuator_test_choice_channel: %d, %d, %d\n", Actuator_test_choice_signal_parameter.data.first, Actuator_test_choice_signal_parameter.data.second, Actuator_test_choice_signal_parameter.selection);
            Actuator_test_choice_channel_used = 1;
            Actuator_0_PI_0_test_choice(Actuator_test_choice_signal_parameter);
            goto Actuator_test_choice_loop;
        ::  empty(Actuator_test_choice_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_integer() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_integer_channel);
        Actuator_lock?_;
Actuator_test_integer_loop:
        if
        ::  nempty(Actuator_test_integer_channel);
            Actuator_test_integer_channel?Actuator_test_integer_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Actuator_test_integer_signal_parameter_c_var;
                BitStream Actuator_test_integer_signal_parameter_stream;
                int Actuator_test_integer_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_integer_signal_parameter_stream,
                    now.Actuator_test_integer_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Actuator_test_integer_signal_parameter_c_var,
                    &Actuator_test_integer_signal_parameter_stream,
                    &Actuator_test_integer_signal_parameter_rc);
                now.Actuator_test_integer_signal_parameter = Actuator_test_integer_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuator_test_integer_channel: %d\n", Actuator_test_integer_signal_parameter);
            Actuator_test_integer_channel_used = 1;
            Actuator_0_PI_0_test_integer(Actuator_test_integer_signal_parameter);
            goto Actuator_test_integer_loop;
        ::  empty(Actuator_test_integer_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_optional() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_optional_channel);
        Actuator_lock?_;
Actuator_test_optional_loop:
        if
        ::  nempty(Actuator_test_optional_channel);
            Actuator_test_optional_channel?Actuator_test_optional_signal_parameter_message;
            c_code {
                {
                asn1SccMySequenceWithOptionalsDataType Actuator_test_optional_signal_parameter_c_var;
                BitStream Actuator_test_optional_signal_parameter_stream;
                int Actuator_test_optional_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_optional_signal_parameter_stream,
                    now.Actuator_test_optional_signal_parameter_message.data,
                    asn1SccMySequenceWithOptionalsDataType_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMySequenceWithOptionalsDataType_Decode(&Actuator_test_optional_signal_parameter_c_var,
                    &Actuator_test_optional_signal_parameter_stream,
                    &Actuator_test_optional_signal_parameter_rc);
                now.Actuator_test_optional_signal_parameter.a = Actuator_test_optional_signal_parameter_c_var.a;
                now.Actuator_test_optional_signal_parameter.b = Actuator_test_optional_signal_parameter_c_var.b;
                now.Actuator_test_optional_signal_parameter.c = Actuator_test_optional_signal_parameter_c_var.c;
                now.Actuator_test_optional_signal_parameter.exist.b = Actuator_test_optional_signal_parameter_c_var.exist.b;
                now.Actuator_test_optional_signal_parameter.exist.c = Actuator_test_optional_signal_parameter_c_var.exist.c;
                }
            }
            printf("channel_recv Actuator_test_optional_channel: %d, %d, %d, %d, %d\n", Actuator_test_optional_signal_parameter.a, Actuator_test_optional_signal_parameter.b, Actuator_test_optional_signal_parameter.c, Actuator_test_optional_signal_parameter.exist.b, Actuator_test_optional_signal_parameter.exist.c);
            Actuator_test_optional_channel_used = 1;
            Actuator_0_PI_0_test_optional(Actuator_test_optional_signal_parameter);
            goto Actuator_test_optional_loop;
        ::  empty(Actuator_test_optional_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_sequence() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_sequence_channel);
        Actuator_lock?_;
Actuator_test_sequence_loop:
        if
        ::  nempty(Actuator_test_sequence_channel);
            Actuator_test_sequence_channel?Actuator_test_sequence_signal_parameter_message;
            c_code {
                {
                asn1SccMySequenceDataType Actuator_test_sequence_signal_parameter_c_var;
                BitStream Actuator_test_sequence_signal_parameter_stream;
                int Actuator_test_sequence_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_sequence_signal_parameter_stream,
                    now.Actuator_test_sequence_signal_parameter_message.data,
                    asn1SccMySequenceDataType_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMySequenceDataType_Decode(&Actuator_test_sequence_signal_parameter_c_var,
                    &Actuator_test_sequence_signal_parameter_stream,
                    &Actuator_test_sequence_signal_parameter_rc);
                now.Actuator_test_sequence_signal_parameter.x = Actuator_test_sequence_signal_parameter_c_var.x;
                int i = 0;
                for(i = 0; i < 4; ++i)
                {
                    now.Actuator_test_sequence_signal_parameter.y.data[i] = Actuator_test_sequence_signal_parameter_c_var.y.arr[i];
                    
                }
                now.Actuator_test_sequence_signal_parameter.y.length = Actuator_test_sequence_signal_parameter_c_var.y.nCount;
                }
            }
            printf("channel_recv Actuator_test_sequence_channel: %d, %d, %d, %d, %d, %d\n", Actuator_test_sequence_signal_parameter.x, Actuator_test_sequence_signal_parameter.y.length, Actuator_test_sequence_signal_parameter.y.data[0], Actuator_test_sequence_signal_parameter.y.data[1], Actuator_test_sequence_signal_parameter.y.data[2], Actuator_test_sequence_signal_parameter.y.data[3]);
            Actuator_test_sequence_channel_used = 1;
            Actuator_0_PI_0_test_sequence(Actuator_test_sequence_signal_parameter);
            goto Actuator_test_sequence_loop;
        ::  empty(Actuator_test_sequence_channel);
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
            Controller_result_channel?_;
            printf("channel_recv Controller_result_channel: 1\n");
            Controller_0_PI_0_result();
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
