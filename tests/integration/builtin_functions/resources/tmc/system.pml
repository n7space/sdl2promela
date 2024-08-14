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

typedef MyBooleanMessage {
#if asn1SccMyBoolean_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyBoolean_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyDerivedArrayMessage {
#if asn1SccMyDerivedArray_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyDerivedArray_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyDerivedFixedMessage {
#if asn1SccMyDerivedFixed_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyDerivedFixed_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyEnumMessage {
#if asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyFixedMessage {
#if asn1SccMyFixed_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyFixed_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyIntegerMessage {
#if asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyStructMessage {
#if asn1SccMyStruct_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyStruct_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyUnionMessage {
#if asn1SccMyUnion_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyUnion_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_test_derived_length_channel = [1] of {MyDerivedArrayMessage};
MyDerivedArray Actuator_test_derived_length_signal_parameter;
MyDerivedArrayMessage Actuator_test_derived_length_signal_parameter_message;
bool Actuator_test_derived_length_channel_used = 0;
chan Actuator_test_exist_channel = [1] of {MyStructMessage};
MyStruct Actuator_test_exist_signal_parameter;
MyStructMessage Actuator_test_exist_signal_parameter_message;
bool Actuator_test_exist_channel_used = 0;
chan Actuator_test_length_channel = [1] of {MyArrayMessage};
MyArray Actuator_test_length_signal_parameter;
MyArrayMessage Actuator_test_length_signal_parameter_message;
bool Actuator_test_length_channel_used = 0;
chan Actuator_test_length_derived_fixed_channel = [1] of {MyDerivedFixedMessage};
MyDerivedFixed Actuator_test_length_derived_fixed_signal_parameter;
MyDerivedFixedMessage Actuator_test_length_derived_fixed_signal_parameter_message;
bool Actuator_test_length_derived_fixed_channel_used = 0;
chan Actuator_test_length_fixed_channel = [1] of {MyFixedMessage};
MyFixed Actuator_test_length_fixed_signal_parameter;
MyFixedMessage Actuator_test_length_fixed_signal_parameter_message;
bool Actuator_test_length_fixed_channel_used = 0;
chan Actuator_test_num_channel = [1] of {MyEnumMessage};
MyEnum Actuator_test_num_signal_parameter;
MyEnumMessage Actuator_test_num_signal_parameter_message;
bool Actuator_test_num_channel_used = 0;
chan Actuator_test_present_channel = [1] of {MyUnionMessage};
MyUnion Actuator_test_present_signal_parameter;
MyUnionMessage Actuator_test_present_signal_parameter_message;
bool Actuator_test_present_channel_used = 0;
chan Actuator_test_to_enum_channel = [1] of {MyUnionMessage};
MyUnion Actuator_test_to_enum_signal_parameter;
MyUnionMessage Actuator_test_to_enum_signal_parameter_message;
bool Actuator_test_to_enum_channel_used = 0;
chan Actuator_test_to_selector_channel = [1] of {MyEnumMessage};
MyEnum Actuator_test_to_selector_signal_parameter;
MyEnumMessage Actuator_test_to_selector_signal_parameter_message;
bool Actuator_test_to_selector_channel_used = 0;
chan Actuator_test_val_channel = [1] of {MyIntegerMessage};
MyInteger Actuator_test_val_signal_parameter;
MyIntegerMessage Actuator_test_val_signal_parameter_message;
bool Actuator_test_val_channel_used = 0;
MyBooleanMessage actuator_result_Actuator_result_p1_message;
MyBoolean actuator_result_Actuator_result_p1_var;
MyEnumMessage actuator_result_enum_Actuator_result_enum_p1_message;
MyEnum actuator_result_enum_Actuator_result_enum_p1_var;
MyIntegerMessage actuator_result_int_Actuator_result_int_p1_message;
MyInteger actuator_result_int_Actuator_result_int_p1_var;
chan Controller_result_channel = [1] of {MyBooleanMessage};
MyBoolean Controller_result_signal_parameter;
MyBooleanMessage Controller_result_signal_parameter_message;
bool Controller_result_channel_used = 0;
chan Controller_result_enum_channel = [1] of {MyEnumMessage};
MyEnum Controller_result_enum_signal_parameter;
MyEnumMessage Controller_result_enum_signal_parameter_message;
bool Controller_result_enum_channel_used = 0;
chan Controller_result_int_channel = [1] of {MyIntegerMessage};
MyInteger Controller_result_int_signal_parameter;
MyIntegerMessage Controller_result_int_signal_parameter_message;
bool Controller_result_int_channel_used = 0;
MyDerivedArrayMessage controller_test_derived_length_Controller_test_derived_length_p1_message;
MyDerivedArray controller_test_derived_length_Controller_test_derived_length_p1_var;
MyStructMessage controller_test_exist_Controller_test_exist_p1_message;
MyStruct controller_test_exist_Controller_test_exist_p1_var;
MyArrayMessage controller_test_length_Controller_test_length_p1_message;
MyArray controller_test_length_Controller_test_length_p1_var;
MyDerivedFixedMessage controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_message;
MyDerivedFixed controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_var;
MyFixedMessage controller_test_length_fixed_Controller_test_length_fixed_p1_message;
MyFixed controller_test_length_fixed_Controller_test_length_fixed_p1_var;
MyEnumMessage controller_test_num_Controller_test_num_p1_message;
MyEnum controller_test_num_Controller_test_num_p1_var;
MyUnionMessage controller_test_present_Controller_test_present_p1_message;
MyUnion controller_test_present_Controller_test_present_p1_var;
MyUnionMessage controller_test_to_enum_Controller_test_to_enum_p1_message;
MyUnion controller_test_to_enum_Controller_test_to_enum_p1_var;
MyEnumMessage controller_test_to_selector_Controller_test_to_selector_p1_message;
MyEnum controller_test_to_selector_Controller_test_to_selector_p1_var;
MyIntegerMessage controller_test_val_Controller_test_val_p1_message;
MyInteger controller_test_val_Controller_test_val_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_test_derived_length_unhandled_input(p1)
{
    printf("unhandled_input actuator test_derived_length\n");
    skip;
}
inline Actuator_0_PI_0_test_exist_unhandled_input(p1)
{
    printf("unhandled_input actuator test_exist\n");
    skip;
}
inline Actuator_0_PI_0_test_length_unhandled_input(p1)
{
    printf("unhandled_input actuator test_length\n");
    skip;
}
inline Actuator_0_PI_0_test_length_derived_fixed_unhandled_input(p1)
{
    printf("unhandled_input actuator test_length_derived_fixed\n");
    skip;
}
inline Actuator_0_PI_0_test_length_fixed_unhandled_input(p1)
{
    printf("unhandled_input actuator test_length_fixed\n");
    skip;
}
inline Actuator_0_PI_0_test_num_unhandled_input(p1)
{
    printf("unhandled_input actuator test_num\n");
    skip;
}
inline Actuator_0_PI_0_test_present_unhandled_input(p1)
{
    printf("unhandled_input actuator test_present\n");
    skip;
}
inline Actuator_0_PI_0_test_to_enum_unhandled_input(p1)
{
    printf("unhandled_input actuator test_to_enum\n");
    skip;
}
inline Actuator_0_PI_0_test_to_selector_unhandled_input(p1)
{
    printf("unhandled_input actuator test_to_selector\n");
    skip;
}
inline Actuator_0_PI_0_test_val_unhandled_input(p1)
{
    printf("unhandled_input actuator test_val\n");
    skip;
}
inline Actuator_0_RI_0_result(actuator_result_Actuator_result_p1)
{
    MyBoolean_assign_value(actuator_result_Actuator_result_p1_var, actuator_result_Actuator_result_p1);
    c_code {
        {
        asn1SccMyBoolean actuator_result_Actuator_result_p1_c_var;
        BitStream actuator_result_Actuator_result_p1_stream;
        int actuator_result_Actuator_result_p1_rc;
        
        actuator_result_Actuator_result_p1_c_var = now.actuator_result_Actuator_result_p1_var;
        
        BitStream_Init(&actuator_result_Actuator_result_p1_stream,
            now.actuator_result_Actuator_result_p1_message.data,
            asn1SccMyBoolean_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyBoolean_Encode(&actuator_result_Actuator_result_p1_c_var,
            &actuator_result_Actuator_result_p1_stream,
            &actuator_result_Actuator_result_p1_rc,
            0);
        }
    }
    Controller_result_channel!actuator_result_Actuator_result_p1_message;
    printf("channel_send Controller_result_channel: %d\n", actuator_result_Actuator_result_p1_var);
}
inline Actuator_0_RI_0_result_enum(actuator_result_enum_Actuator_result_enum_p1)
{
    MyEnum_assign_value(actuator_result_enum_Actuator_result_enum_p1_var, actuator_result_enum_Actuator_result_enum_p1);
    c_code {
        {
        asn1SccMyEnum actuator_result_enum_Actuator_result_enum_p1_c_var;
        BitStream actuator_result_enum_Actuator_result_enum_p1_stream;
        int actuator_result_enum_Actuator_result_enum_p1_rc;
        
        actuator_result_enum_Actuator_result_enum_p1_c_var = now.actuator_result_enum_Actuator_result_enum_p1_var;
        
        BitStream_Init(&actuator_result_enum_Actuator_result_enum_p1_stream,
            now.actuator_result_enum_Actuator_result_enum_p1_message.data,
            asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyEnum_Encode(&actuator_result_enum_Actuator_result_enum_p1_c_var,
            &actuator_result_enum_Actuator_result_enum_p1_stream,
            &actuator_result_enum_Actuator_result_enum_p1_rc,
            0);
        }
    }
    Controller_result_enum_channel!actuator_result_enum_Actuator_result_enum_p1_message;
    printf("channel_send Controller_result_enum_channel: %d\n", actuator_result_enum_Actuator_result_enum_p1_var);
}
inline Actuator_0_RI_0_result_int(actuator_result_int_Actuator_result_int_p1)
{
    MyInteger_assign_value(actuator_result_int_Actuator_result_int_p1_var, actuator_result_int_Actuator_result_int_p1);
    c_code {
        {
        asn1SccMyInteger actuator_result_int_Actuator_result_int_p1_c_var;
        BitStream actuator_result_int_Actuator_result_int_p1_stream;
        int actuator_result_int_Actuator_result_int_p1_rc;
        
        actuator_result_int_Actuator_result_int_p1_c_var = now.actuator_result_int_Actuator_result_int_p1_var;
        
        BitStream_Init(&actuator_result_int_Actuator_result_int_p1_stream,
            now.actuator_result_int_Actuator_result_int_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&actuator_result_int_Actuator_result_int_p1_c_var,
            &actuator_result_int_Actuator_result_int_p1_stream,
            &actuator_result_int_Actuator_result_int_p1_rc,
            0);
        }
    }
    Controller_result_int_channel!actuator_result_int_Actuator_result_int_p1_message;
    printf("channel_send Controller_result_int_channel: %d\n", actuator_result_int_Actuator_result_int_p1_var);
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_test_derived_length_channel) && (empty(Actuator_test_exist_channel) && (empty(Actuator_test_length_channel) && (empty(Actuator_test_length_derived_fixed_channel) && (empty(Actuator_test_length_fixed_channel) && (empty(Actuator_test_num_channel) && (empty(Actuator_test_present_channel) && (empty(Actuator_test_to_enum_channel) && (empty(Actuator_test_to_selector_channel) && empty(Actuator_test_val_channel))))))))));
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
inline Controller_0_PI_0_result_enum_unhandled_input(p1)
{
    printf("unhandled_input controller result_enum\n");
    skip;
}
inline Controller_0_PI_0_result_int_unhandled_input(p1)
{
    printf("unhandled_input controller result_int\n");
    skip;
}
inline Controller_0_RI_0_test_derived_length(controller_test_derived_length_Controller_test_derived_length_p1)
{
    MyDerivedArray_assign_value(controller_test_derived_length_Controller_test_derived_length_p1_var, controller_test_derived_length_Controller_test_derived_length_p1);
    c_code {
        {
        asn1SccMyDerivedArray controller_test_derived_length_Controller_test_derived_length_p1_c_var;
        BitStream controller_test_derived_length_Controller_test_derived_length_p1_stream;
        int controller_test_derived_length_Controller_test_derived_length_p1_rc;
        
        int i = 0;
        for(i = 0; i < 3; ++i)
        {
            controller_test_derived_length_Controller_test_derived_length_p1_c_var.arr[i] = now.controller_test_derived_length_Controller_test_derived_length_p1_var.data[i];
            
        }
        controller_test_derived_length_Controller_test_derived_length_p1_c_var.nCount = now.controller_test_derived_length_Controller_test_derived_length_p1_var.length;
        
        BitStream_Init(&controller_test_derived_length_Controller_test_derived_length_p1_stream,
            now.controller_test_derived_length_Controller_test_derived_length_p1_message.data,
            asn1SccMyDerivedArray_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyDerivedArray_Encode(&controller_test_derived_length_Controller_test_derived_length_p1_c_var,
            &controller_test_derived_length_Controller_test_derived_length_p1_stream,
            &controller_test_derived_length_Controller_test_derived_length_p1_rc,
            0);
        }
    }
    Actuator_test_derived_length_channel!controller_test_derived_length_Controller_test_derived_length_p1_message;
    printf("channel_send Actuator_test_derived_length_channel: %d, %d, %d, %d\n", controller_test_derived_length_Controller_test_derived_length_p1_var.length, controller_test_derived_length_Controller_test_derived_length_p1_var.data[0], controller_test_derived_length_Controller_test_derived_length_p1_var.data[1], controller_test_derived_length_Controller_test_derived_length_p1_var.data[2]);
}
inline Controller_0_RI_0_test_exist(controller_test_exist_Controller_test_exist_p1)
{
    MyStruct_assign_value(controller_test_exist_Controller_test_exist_p1_var, controller_test_exist_Controller_test_exist_p1);
    c_code {
        {
        asn1SccMyStruct controller_test_exist_Controller_test_exist_p1_c_var;
        BitStream controller_test_exist_Controller_test_exist_p1_stream;
        int controller_test_exist_Controller_test_exist_p1_rc;
        
        controller_test_exist_Controller_test_exist_p1_c_var.mass = now.controller_test_exist_Controller_test_exist_p1_var.mass;
        controller_test_exist_Controller_test_exist_p1_c_var.charge = now.controller_test_exist_Controller_test_exist_p1_var.charge;
        controller_test_exist_Controller_test_exist_p1_c_var.exist.charge = now.controller_test_exist_Controller_test_exist_p1_var.exist.charge;
        
        BitStream_Init(&controller_test_exist_Controller_test_exist_p1_stream,
            now.controller_test_exist_Controller_test_exist_p1_message.data,
            asn1SccMyStruct_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyStruct_Encode(&controller_test_exist_Controller_test_exist_p1_c_var,
            &controller_test_exist_Controller_test_exist_p1_stream,
            &controller_test_exist_Controller_test_exist_p1_rc,
            0);
        }
    }
    Actuator_test_exist_channel!controller_test_exist_Controller_test_exist_p1_message;
    printf("channel_send Actuator_test_exist_channel: %d, %d, %d\n", controller_test_exist_Controller_test_exist_p1_var.mass, controller_test_exist_Controller_test_exist_p1_var.charge, controller_test_exist_Controller_test_exist_p1_var.exist.charge);
}
inline Controller_0_RI_0_test_length(controller_test_length_Controller_test_length_p1)
{
    MyArray_assign_value(controller_test_length_Controller_test_length_p1_var, controller_test_length_Controller_test_length_p1);
    c_code {
        {
        asn1SccMyArray controller_test_length_Controller_test_length_p1_c_var;
        BitStream controller_test_length_Controller_test_length_p1_stream;
        int controller_test_length_Controller_test_length_p1_rc;
        
        int i = 0;
        for(i = 0; i < 6; ++i)
        {
            controller_test_length_Controller_test_length_p1_c_var.arr[i] = now.controller_test_length_Controller_test_length_p1_var.data[i];
            
        }
        controller_test_length_Controller_test_length_p1_c_var.nCount = now.controller_test_length_Controller_test_length_p1_var.length;
        
        BitStream_Init(&controller_test_length_Controller_test_length_p1_stream,
            now.controller_test_length_Controller_test_length_p1_message.data,
            asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyArray_Encode(&controller_test_length_Controller_test_length_p1_c_var,
            &controller_test_length_Controller_test_length_p1_stream,
            &controller_test_length_Controller_test_length_p1_rc,
            0);
        }
    }
    Actuator_test_length_channel!controller_test_length_Controller_test_length_p1_message;
    printf("channel_send Actuator_test_length_channel: %d, %d, %d, %d, %d, %d, %d\n", controller_test_length_Controller_test_length_p1_var.length, controller_test_length_Controller_test_length_p1_var.data[0], controller_test_length_Controller_test_length_p1_var.data[1], controller_test_length_Controller_test_length_p1_var.data[2], controller_test_length_Controller_test_length_p1_var.data[3], controller_test_length_Controller_test_length_p1_var.data[4], controller_test_length_Controller_test_length_p1_var.data[5]);
}
inline Controller_0_RI_0_test_length_derived_fixed(controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1)
{
    MyDerivedFixed_assign_value(controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_var, controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1);
    c_code {
        {
        asn1SccMyDerivedFixed controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_c_var;
        BitStream controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_stream;
        int controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_rc;
        
        int i = 0;
        for(i = 0; i < 2; ++i)
        {
            controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_c_var.arr[i] = now.controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_var.data[i];
            
        }
        
        BitStream_Init(&controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_stream,
            now.controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_message.data,
            asn1SccMyDerivedFixed_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyDerivedFixed_Encode(&controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_c_var,
            &controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_stream,
            &controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_rc,
            0);
        }
    }
    Actuator_test_length_derived_fixed_channel!controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_message;
    printf("channel_send Actuator_test_length_derived_fixed_channel: %d, %d\n", controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_var.data[0], controller_test_length_derived_fixed_Controller_test_length_derived_fixed_p1_var.data[1]);
}
inline Controller_0_RI_0_test_length_fixed(controller_test_length_fixed_Controller_test_length_fixed_p1)
{
    MyFixed_assign_value(controller_test_length_fixed_Controller_test_length_fixed_p1_var, controller_test_length_fixed_Controller_test_length_fixed_p1);
    c_code {
        {
        asn1SccMyFixed controller_test_length_fixed_Controller_test_length_fixed_p1_c_var;
        BitStream controller_test_length_fixed_Controller_test_length_fixed_p1_stream;
        int controller_test_length_fixed_Controller_test_length_fixed_p1_rc;
        
        int i = 0;
        for(i = 0; i < 2; ++i)
        {
            controller_test_length_fixed_Controller_test_length_fixed_p1_c_var.arr[i] = now.controller_test_length_fixed_Controller_test_length_fixed_p1_var.data[i];
            
        }
        
        BitStream_Init(&controller_test_length_fixed_Controller_test_length_fixed_p1_stream,
            now.controller_test_length_fixed_Controller_test_length_fixed_p1_message.data,
            asn1SccMyFixed_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyFixed_Encode(&controller_test_length_fixed_Controller_test_length_fixed_p1_c_var,
            &controller_test_length_fixed_Controller_test_length_fixed_p1_stream,
            &controller_test_length_fixed_Controller_test_length_fixed_p1_rc,
            0);
        }
    }
    Actuator_test_length_fixed_channel!controller_test_length_fixed_Controller_test_length_fixed_p1_message;
    printf("channel_send Actuator_test_length_fixed_channel: %d, %d\n", controller_test_length_fixed_Controller_test_length_fixed_p1_var.data[0], controller_test_length_fixed_Controller_test_length_fixed_p1_var.data[1]);
}
inline Controller_0_RI_0_test_num(controller_test_num_Controller_test_num_p1)
{
    MyEnum_assign_value(controller_test_num_Controller_test_num_p1_var, controller_test_num_Controller_test_num_p1);
    c_code {
        {
        asn1SccMyEnum controller_test_num_Controller_test_num_p1_c_var;
        BitStream controller_test_num_Controller_test_num_p1_stream;
        int controller_test_num_Controller_test_num_p1_rc;
        
        controller_test_num_Controller_test_num_p1_c_var = now.controller_test_num_Controller_test_num_p1_var;
        
        BitStream_Init(&controller_test_num_Controller_test_num_p1_stream,
            now.controller_test_num_Controller_test_num_p1_message.data,
            asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyEnum_Encode(&controller_test_num_Controller_test_num_p1_c_var,
            &controller_test_num_Controller_test_num_p1_stream,
            &controller_test_num_Controller_test_num_p1_rc,
            0);
        }
    }
    Actuator_test_num_channel!controller_test_num_Controller_test_num_p1_message;
    printf("channel_send Actuator_test_num_channel: %d\n", controller_test_num_Controller_test_num_p1_var);
}
inline Controller_0_RI_0_test_present(controller_test_present_Controller_test_present_p1)
{
    MyUnion_assign_value(controller_test_present_Controller_test_present_p1_var, controller_test_present_Controller_test_present_p1);
    c_code {
        {
        asn1SccMyUnion controller_test_present_Controller_test_present_p1_c_var;
        BitStream controller_test_present_Controller_test_present_p1_stream;
        int controller_test_present_Controller_test_present_p1_rc;
        
        if(now.controller_test_present_Controller_test_present_p1_var.selection == MyUnion_speed_PRESENT)
        {
            controller_test_present_Controller_test_present_p1_c_var.u.speed = now.controller_test_present_Controller_test_present_p1_var.data.speed;
            
            controller_test_present_Controller_test_present_p1_c_var.kind = MyUnion_speed_PRESENT;
        }
        else if(now.controller_test_present_Controller_test_present_p1_var.selection == MyUnion_accel_PRESENT)
        {
            controller_test_present_Controller_test_present_p1_c_var.u.accel = now.controller_test_present_Controller_test_present_p1_var.data.accel;
            
            controller_test_present_Controller_test_present_p1_c_var.kind = MyUnion_accel_PRESENT;
        }
        
        BitStream_Init(&controller_test_present_Controller_test_present_p1_stream,
            now.controller_test_present_Controller_test_present_p1_message.data,
            asn1SccMyUnion_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyUnion_Encode(&controller_test_present_Controller_test_present_p1_c_var,
            &controller_test_present_Controller_test_present_p1_stream,
            &controller_test_present_Controller_test_present_p1_rc,
            0);
        }
    }
    Actuator_test_present_channel!controller_test_present_Controller_test_present_p1_message;
    printf("channel_send Actuator_test_present_channel: %d, %d, %d\n", controller_test_present_Controller_test_present_p1_var.data.speed, controller_test_present_Controller_test_present_p1_var.data.accel, controller_test_present_Controller_test_present_p1_var.selection);
}
inline Controller_0_RI_0_test_to_enum(controller_test_to_enum_Controller_test_to_enum_p1)
{
    MyUnion_assign_value(controller_test_to_enum_Controller_test_to_enum_p1_var, controller_test_to_enum_Controller_test_to_enum_p1);
    c_code {
        {
        asn1SccMyUnion controller_test_to_enum_Controller_test_to_enum_p1_c_var;
        BitStream controller_test_to_enum_Controller_test_to_enum_p1_stream;
        int controller_test_to_enum_Controller_test_to_enum_p1_rc;
        
        if(now.controller_test_to_enum_Controller_test_to_enum_p1_var.selection == MyUnion_speed_PRESENT)
        {
            controller_test_to_enum_Controller_test_to_enum_p1_c_var.u.speed = now.controller_test_to_enum_Controller_test_to_enum_p1_var.data.speed;
            
            controller_test_to_enum_Controller_test_to_enum_p1_c_var.kind = MyUnion_speed_PRESENT;
        }
        else if(now.controller_test_to_enum_Controller_test_to_enum_p1_var.selection == MyUnion_accel_PRESENT)
        {
            controller_test_to_enum_Controller_test_to_enum_p1_c_var.u.accel = now.controller_test_to_enum_Controller_test_to_enum_p1_var.data.accel;
            
            controller_test_to_enum_Controller_test_to_enum_p1_c_var.kind = MyUnion_accel_PRESENT;
        }
        
        BitStream_Init(&controller_test_to_enum_Controller_test_to_enum_p1_stream,
            now.controller_test_to_enum_Controller_test_to_enum_p1_message.data,
            asn1SccMyUnion_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyUnion_Encode(&controller_test_to_enum_Controller_test_to_enum_p1_c_var,
            &controller_test_to_enum_Controller_test_to_enum_p1_stream,
            &controller_test_to_enum_Controller_test_to_enum_p1_rc,
            0);
        }
    }
    Actuator_test_to_enum_channel!controller_test_to_enum_Controller_test_to_enum_p1_message;
    printf("channel_send Actuator_test_to_enum_channel: %d, %d, %d\n", controller_test_to_enum_Controller_test_to_enum_p1_var.data.speed, controller_test_to_enum_Controller_test_to_enum_p1_var.data.accel, controller_test_to_enum_Controller_test_to_enum_p1_var.selection);
}
inline Controller_0_RI_0_test_to_selector(controller_test_to_selector_Controller_test_to_selector_p1)
{
    MyEnum_assign_value(controller_test_to_selector_Controller_test_to_selector_p1_var, controller_test_to_selector_Controller_test_to_selector_p1);
    c_code {
        {
        asn1SccMyEnum controller_test_to_selector_Controller_test_to_selector_p1_c_var;
        BitStream controller_test_to_selector_Controller_test_to_selector_p1_stream;
        int controller_test_to_selector_Controller_test_to_selector_p1_rc;
        
        controller_test_to_selector_Controller_test_to_selector_p1_c_var = now.controller_test_to_selector_Controller_test_to_selector_p1_var;
        
        BitStream_Init(&controller_test_to_selector_Controller_test_to_selector_p1_stream,
            now.controller_test_to_selector_Controller_test_to_selector_p1_message.data,
            asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyEnum_Encode(&controller_test_to_selector_Controller_test_to_selector_p1_c_var,
            &controller_test_to_selector_Controller_test_to_selector_p1_stream,
            &controller_test_to_selector_Controller_test_to_selector_p1_rc,
            0);
        }
    }
    Actuator_test_to_selector_channel!controller_test_to_selector_Controller_test_to_selector_p1_message;
    printf("channel_send Actuator_test_to_selector_channel: %d\n", controller_test_to_selector_Controller_test_to_selector_p1_var);
}
inline Controller_0_RI_0_test_val(controller_test_val_Controller_test_val_p1)
{
    MyInteger_assign_value(controller_test_val_Controller_test_val_p1_var, controller_test_val_Controller_test_val_p1);
    c_code {
        {
        asn1SccMyInteger controller_test_val_Controller_test_val_p1_c_var;
        BitStream controller_test_val_Controller_test_val_p1_stream;
        int controller_test_val_Controller_test_val_p1_rc;
        
        controller_test_val_Controller_test_val_p1_c_var = now.controller_test_val_Controller_test_val_p1_var;
        
        BitStream_Init(&controller_test_val_Controller_test_val_p1_stream,
            now.controller_test_val_Controller_test_val_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&controller_test_val_Controller_test_val_p1_c_var,
            &controller_test_val_Controller_test_val_p1_stream,
            &controller_test_val_Controller_test_val_p1_rc,
            0);
        }
    }
    Actuator_test_val_channel!controller_test_val_Controller_test_val_p1_message;
    printf("channel_send Actuator_test_val_channel: %d\n", controller_test_val_Controller_test_val_p1_var);
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_channel) && (empty(Controller_result_enum_channel) && empty(Controller_result_int_channel)));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_test_derived_length() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_derived_length_channel);
        Actuator_lock?_;
Actuator_test_derived_length_loop:
        if
        ::  nempty(Actuator_test_derived_length_channel);
            Actuator_test_derived_length_channel?Actuator_test_derived_length_signal_parameter_message;
            c_code {
                {
                asn1SccMyDerivedArray Actuator_test_derived_length_signal_parameter_c_var;
                BitStream Actuator_test_derived_length_signal_parameter_stream;
                int Actuator_test_derived_length_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_derived_length_signal_parameter_stream,
                    now.Actuator_test_derived_length_signal_parameter_message.data,
                    asn1SccMyDerivedArray_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyDerivedArray_Decode(&Actuator_test_derived_length_signal_parameter_c_var,
                    &Actuator_test_derived_length_signal_parameter_stream,
                    &Actuator_test_derived_length_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 3; ++i)
                {
                    now.Actuator_test_derived_length_signal_parameter.data[i] = Actuator_test_derived_length_signal_parameter_c_var.arr[i];
                    
                }
                now.Actuator_test_derived_length_signal_parameter.length = Actuator_test_derived_length_signal_parameter_c_var.nCount;
                }
            }
            printf("channel_recv Actuator_test_derived_length_channel: %d, %d, %d, %d\n", Actuator_test_derived_length_signal_parameter.length, Actuator_test_derived_length_signal_parameter.data[0], Actuator_test_derived_length_signal_parameter.data[1], Actuator_test_derived_length_signal_parameter.data[2]);
            Actuator_test_derived_length_channel_used = 1;
            Actuator_0_PI_0_test_derived_length(Actuator_test_derived_length_signal_parameter);
            goto Actuator_test_derived_length_loop;
        ::  empty(Actuator_test_derived_length_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_exist() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_exist_channel);
        Actuator_lock?_;
Actuator_test_exist_loop:
        if
        ::  nempty(Actuator_test_exist_channel);
            Actuator_test_exist_channel?Actuator_test_exist_signal_parameter_message;
            c_code {
                {
                asn1SccMyStruct Actuator_test_exist_signal_parameter_c_var;
                BitStream Actuator_test_exist_signal_parameter_stream;
                int Actuator_test_exist_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_exist_signal_parameter_stream,
                    now.Actuator_test_exist_signal_parameter_message.data,
                    asn1SccMyStruct_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyStruct_Decode(&Actuator_test_exist_signal_parameter_c_var,
                    &Actuator_test_exist_signal_parameter_stream,
                    &Actuator_test_exist_signal_parameter_rc);
                now.Actuator_test_exist_signal_parameter.mass = Actuator_test_exist_signal_parameter_c_var.mass;
                now.Actuator_test_exist_signal_parameter.charge = Actuator_test_exist_signal_parameter_c_var.charge;
                now.Actuator_test_exist_signal_parameter.exist.charge = Actuator_test_exist_signal_parameter_c_var.exist.charge;
                }
            }
            printf("channel_recv Actuator_test_exist_channel: %d, %d, %d\n", Actuator_test_exist_signal_parameter.mass, Actuator_test_exist_signal_parameter.charge, Actuator_test_exist_signal_parameter.exist.charge);
            Actuator_test_exist_channel_used = 1;
            Actuator_0_PI_0_test_exist(Actuator_test_exist_signal_parameter);
            goto Actuator_test_exist_loop;
        ::  empty(Actuator_test_exist_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_length() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_length_channel);
        Actuator_lock?_;
Actuator_test_length_loop:
        if
        ::  nempty(Actuator_test_length_channel);
            Actuator_test_length_channel?Actuator_test_length_signal_parameter_message;
            c_code {
                {
                asn1SccMyArray Actuator_test_length_signal_parameter_c_var;
                BitStream Actuator_test_length_signal_parameter_stream;
                int Actuator_test_length_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_length_signal_parameter_stream,
                    now.Actuator_test_length_signal_parameter_message.data,
                    asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyArray_Decode(&Actuator_test_length_signal_parameter_c_var,
                    &Actuator_test_length_signal_parameter_stream,
                    &Actuator_test_length_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 6; ++i)
                {
                    now.Actuator_test_length_signal_parameter.data[i] = Actuator_test_length_signal_parameter_c_var.arr[i];
                    
                }
                now.Actuator_test_length_signal_parameter.length = Actuator_test_length_signal_parameter_c_var.nCount;
                }
            }
            printf("channel_recv Actuator_test_length_channel: %d, %d, %d, %d, %d, %d, %d\n", Actuator_test_length_signal_parameter.length, Actuator_test_length_signal_parameter.data[0], Actuator_test_length_signal_parameter.data[1], Actuator_test_length_signal_parameter.data[2], Actuator_test_length_signal_parameter.data[3], Actuator_test_length_signal_parameter.data[4], Actuator_test_length_signal_parameter.data[5]);
            Actuator_test_length_channel_used = 1;
            Actuator_0_PI_0_test_length(Actuator_test_length_signal_parameter);
            goto Actuator_test_length_loop;
        ::  empty(Actuator_test_length_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_length_derived_fixed() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_length_derived_fixed_channel);
        Actuator_lock?_;
Actuator_test_length_derived_fixed_loop:
        if
        ::  nempty(Actuator_test_length_derived_fixed_channel);
            Actuator_test_length_derived_fixed_channel?Actuator_test_length_derived_fixed_signal_parameter_message;
            c_code {
                {
                asn1SccMyDerivedFixed Actuator_test_length_derived_fixed_signal_parameter_c_var;
                BitStream Actuator_test_length_derived_fixed_signal_parameter_stream;
                int Actuator_test_length_derived_fixed_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_length_derived_fixed_signal_parameter_stream,
                    now.Actuator_test_length_derived_fixed_signal_parameter_message.data,
                    asn1SccMyDerivedFixed_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyDerivedFixed_Decode(&Actuator_test_length_derived_fixed_signal_parameter_c_var,
                    &Actuator_test_length_derived_fixed_signal_parameter_stream,
                    &Actuator_test_length_derived_fixed_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 2; ++i)
                {
                    now.Actuator_test_length_derived_fixed_signal_parameter.data[i] = Actuator_test_length_derived_fixed_signal_parameter_c_var.arr[i];
                    
                }
                }
            }
            printf("channel_recv Actuator_test_length_derived_fixed_channel: %d, %d\n", Actuator_test_length_derived_fixed_signal_parameter.data[0], Actuator_test_length_derived_fixed_signal_parameter.data[1]);
            Actuator_test_length_derived_fixed_channel_used = 1;
            Actuator_0_PI_0_test_length_derived_fixed(Actuator_test_length_derived_fixed_signal_parameter);
            goto Actuator_test_length_derived_fixed_loop;
        ::  empty(Actuator_test_length_derived_fixed_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_length_fixed() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_length_fixed_channel);
        Actuator_lock?_;
Actuator_test_length_fixed_loop:
        if
        ::  nempty(Actuator_test_length_fixed_channel);
            Actuator_test_length_fixed_channel?Actuator_test_length_fixed_signal_parameter_message;
            c_code {
                {
                asn1SccMyFixed Actuator_test_length_fixed_signal_parameter_c_var;
                BitStream Actuator_test_length_fixed_signal_parameter_stream;
                int Actuator_test_length_fixed_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_length_fixed_signal_parameter_stream,
                    now.Actuator_test_length_fixed_signal_parameter_message.data,
                    asn1SccMyFixed_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyFixed_Decode(&Actuator_test_length_fixed_signal_parameter_c_var,
                    &Actuator_test_length_fixed_signal_parameter_stream,
                    &Actuator_test_length_fixed_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 2; ++i)
                {
                    now.Actuator_test_length_fixed_signal_parameter.data[i] = Actuator_test_length_fixed_signal_parameter_c_var.arr[i];
                    
                }
                }
            }
            printf("channel_recv Actuator_test_length_fixed_channel: %d, %d\n", Actuator_test_length_fixed_signal_parameter.data[0], Actuator_test_length_fixed_signal_parameter.data[1]);
            Actuator_test_length_fixed_channel_used = 1;
            Actuator_0_PI_0_test_length_fixed(Actuator_test_length_fixed_signal_parameter);
            goto Actuator_test_length_fixed_loop;
        ::  empty(Actuator_test_length_fixed_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_num() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_num_channel);
        Actuator_lock?_;
Actuator_test_num_loop:
        if
        ::  nempty(Actuator_test_num_channel);
            Actuator_test_num_channel?Actuator_test_num_signal_parameter_message;
            c_code {
                {
                asn1SccMyEnum Actuator_test_num_signal_parameter_c_var;
                BitStream Actuator_test_num_signal_parameter_stream;
                int Actuator_test_num_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_num_signal_parameter_stream,
                    now.Actuator_test_num_signal_parameter_message.data,
                    asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyEnum_Decode(&Actuator_test_num_signal_parameter_c_var,
                    &Actuator_test_num_signal_parameter_stream,
                    &Actuator_test_num_signal_parameter_rc);
                now.Actuator_test_num_signal_parameter = Actuator_test_num_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuator_test_num_channel: %d\n", Actuator_test_num_signal_parameter);
            Actuator_test_num_channel_used = 1;
            Actuator_0_PI_0_test_num(Actuator_test_num_signal_parameter);
            goto Actuator_test_num_loop;
        ::  empty(Actuator_test_num_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_present() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_present_channel);
        Actuator_lock?_;
Actuator_test_present_loop:
        if
        ::  nempty(Actuator_test_present_channel);
            Actuator_test_present_channel?Actuator_test_present_signal_parameter_message;
            c_code {
                {
                asn1SccMyUnion Actuator_test_present_signal_parameter_c_var;
                BitStream Actuator_test_present_signal_parameter_stream;
                int Actuator_test_present_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_present_signal_parameter_stream,
                    now.Actuator_test_present_signal_parameter_message.data,
                    asn1SccMyUnion_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyUnion_Decode(&Actuator_test_present_signal_parameter_c_var,
                    &Actuator_test_present_signal_parameter_stream,
                    &Actuator_test_present_signal_parameter_rc);
                if(Actuator_test_present_signal_parameter_c_var.kind == MyUnion_speed_PRESENT)
                {
                    now.Actuator_test_present_signal_parameter.data.speed = Actuator_test_present_signal_parameter_c_var.u.speed;
                    
                    now.Actuator_test_present_signal_parameter.selection = MyUnion_speed_PRESENT;
                }
                 else if(Actuator_test_present_signal_parameter_c_var.kind == MyUnion_accel_PRESENT)
                {
                    now.Actuator_test_present_signal_parameter.data.accel = Actuator_test_present_signal_parameter_c_var.u.accel;
                    
                    now.Actuator_test_present_signal_parameter.selection = MyUnion_accel_PRESENT;
                }
                }
            }
            printf("channel_recv Actuator_test_present_channel: %d, %d, %d\n", Actuator_test_present_signal_parameter.data.speed, Actuator_test_present_signal_parameter.data.accel, Actuator_test_present_signal_parameter.selection);
            Actuator_test_present_channel_used = 1;
            Actuator_0_PI_0_test_present(Actuator_test_present_signal_parameter);
            goto Actuator_test_present_loop;
        ::  empty(Actuator_test_present_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_to_enum() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_to_enum_channel);
        Actuator_lock?_;
Actuator_test_to_enum_loop:
        if
        ::  nempty(Actuator_test_to_enum_channel);
            Actuator_test_to_enum_channel?Actuator_test_to_enum_signal_parameter_message;
            c_code {
                {
                asn1SccMyUnion Actuator_test_to_enum_signal_parameter_c_var;
                BitStream Actuator_test_to_enum_signal_parameter_stream;
                int Actuator_test_to_enum_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_to_enum_signal_parameter_stream,
                    now.Actuator_test_to_enum_signal_parameter_message.data,
                    asn1SccMyUnion_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyUnion_Decode(&Actuator_test_to_enum_signal_parameter_c_var,
                    &Actuator_test_to_enum_signal_parameter_stream,
                    &Actuator_test_to_enum_signal_parameter_rc);
                if(Actuator_test_to_enum_signal_parameter_c_var.kind == MyUnion_speed_PRESENT)
                {
                    now.Actuator_test_to_enum_signal_parameter.data.speed = Actuator_test_to_enum_signal_parameter_c_var.u.speed;
                    
                    now.Actuator_test_to_enum_signal_parameter.selection = MyUnion_speed_PRESENT;
                }
                 else if(Actuator_test_to_enum_signal_parameter_c_var.kind == MyUnion_accel_PRESENT)
                {
                    now.Actuator_test_to_enum_signal_parameter.data.accel = Actuator_test_to_enum_signal_parameter_c_var.u.accel;
                    
                    now.Actuator_test_to_enum_signal_parameter.selection = MyUnion_accel_PRESENT;
                }
                }
            }
            printf("channel_recv Actuator_test_to_enum_channel: %d, %d, %d\n", Actuator_test_to_enum_signal_parameter.data.speed, Actuator_test_to_enum_signal_parameter.data.accel, Actuator_test_to_enum_signal_parameter.selection);
            Actuator_test_to_enum_channel_used = 1;
            Actuator_0_PI_0_test_to_enum(Actuator_test_to_enum_signal_parameter);
            goto Actuator_test_to_enum_loop;
        ::  empty(Actuator_test_to_enum_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_to_selector() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_to_selector_channel);
        Actuator_lock?_;
Actuator_test_to_selector_loop:
        if
        ::  nempty(Actuator_test_to_selector_channel);
            Actuator_test_to_selector_channel?Actuator_test_to_selector_signal_parameter_message;
            c_code {
                {
                asn1SccMyEnum Actuator_test_to_selector_signal_parameter_c_var;
                BitStream Actuator_test_to_selector_signal_parameter_stream;
                int Actuator_test_to_selector_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_to_selector_signal_parameter_stream,
                    now.Actuator_test_to_selector_signal_parameter_message.data,
                    asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyEnum_Decode(&Actuator_test_to_selector_signal_parameter_c_var,
                    &Actuator_test_to_selector_signal_parameter_stream,
                    &Actuator_test_to_selector_signal_parameter_rc);
                now.Actuator_test_to_selector_signal_parameter = Actuator_test_to_selector_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuator_test_to_selector_channel: %d\n", Actuator_test_to_selector_signal_parameter);
            Actuator_test_to_selector_channel_used = 1;
            Actuator_0_PI_0_test_to_selector(Actuator_test_to_selector_signal_parameter);
            goto Actuator_test_to_selector_loop;
        ::  empty(Actuator_test_to_selector_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_test_val() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_test_val_channel);
        Actuator_lock?_;
Actuator_test_val_loop:
        if
        ::  nempty(Actuator_test_val_channel);
            Actuator_test_val_channel?Actuator_test_val_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Actuator_test_val_signal_parameter_c_var;
                BitStream Actuator_test_val_signal_parameter_stream;
                int Actuator_test_val_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_test_val_signal_parameter_stream,
                    now.Actuator_test_val_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Actuator_test_val_signal_parameter_c_var,
                    &Actuator_test_val_signal_parameter_stream,
                    &Actuator_test_val_signal_parameter_rc);
                now.Actuator_test_val_signal_parameter = Actuator_test_val_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuator_test_val_channel: %d\n", Actuator_test_val_signal_parameter);
            Actuator_test_val_channel_used = 1;
            Actuator_0_PI_0_test_val(Actuator_test_val_signal_parameter);
            goto Actuator_test_val_loop;
        ::  empty(Actuator_test_val_channel);
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
                asn1SccMyBoolean Controller_result_signal_parameter_c_var;
                BitStream Controller_result_signal_parameter_stream;
                int Controller_result_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_signal_parameter_stream,
                    now.Controller_result_signal_parameter_message.data,
                    asn1SccMyBoolean_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyBoolean_Decode(&Controller_result_signal_parameter_c_var,
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
active proctype Controller_result_enum() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_enum_channel);
        Controller_lock?_;
Controller_result_enum_loop:
        if
        ::  nempty(Controller_result_enum_channel);
            Controller_result_enum_channel?Controller_result_enum_signal_parameter_message;
            c_code {
                {
                asn1SccMyEnum Controller_result_enum_signal_parameter_c_var;
                BitStream Controller_result_enum_signal_parameter_stream;
                int Controller_result_enum_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_enum_signal_parameter_stream,
                    now.Controller_result_enum_signal_parameter_message.data,
                    asn1SccMyEnum_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyEnum_Decode(&Controller_result_enum_signal_parameter_c_var,
                    &Controller_result_enum_signal_parameter_stream,
                    &Controller_result_enum_signal_parameter_rc);
                now.Controller_result_enum_signal_parameter = Controller_result_enum_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_result_enum_channel: %d\n", Controller_result_enum_signal_parameter);
            Controller_result_enum_channel_used = 1;
            Controller_0_PI_0_result_enum(Controller_result_enum_signal_parameter);
            goto Controller_result_enum_loop;
        ::  empty(Controller_result_enum_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_int() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_int_channel);
        Controller_lock?_;
Controller_result_int_loop:
        if
        ::  nempty(Controller_result_int_channel);
            Controller_result_int_channel?Controller_result_int_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Controller_result_int_signal_parameter_c_var;
                BitStream Controller_result_int_signal_parameter_stream;
                int Controller_result_int_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_int_signal_parameter_stream,
                    now.Controller_result_int_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Controller_result_int_signal_parameter_c_var,
                    &Controller_result_int_signal_parameter_stream,
                    &Controller_result_int_signal_parameter_rc);
                now.Controller_result_int_signal_parameter = Controller_result_int_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_result_int_channel: %d\n", Controller_result_int_signal_parameter);
            Controller_result_int_channel_used = 1;
            Controller_0_PI_0_result_int(Controller_result_int_signal_parameter);
            goto Controller_result_int_loop;
        ::  empty(Controller_result_int_channel);
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
