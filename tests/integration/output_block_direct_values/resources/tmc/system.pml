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

typedef MyDataMessage {
#if asn1SccMyData_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyData_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyNestedMessage {
#if asn1SccMyNested_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyNested_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyValuesMessage {
#if asn1SccMyValues_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyValues_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_give_me_array_channel = [1] of {int};
chan Actuator_give_me_data_channel = [1] of {int};
chan Actuator_give_me_nested_channel = [1] of {int};
chan Actuator_give_me_values_channel = [1] of {int};
MyArrayMessage actuator_result_array_Actuator_result_array_p1_message;
MyArray actuator_result_array_Actuator_result_array_p1_var;
MyDataMessage actuator_result_data_Actuator_result_data_p1_message;
MyData actuator_result_data_Actuator_result_data_p1_var;
MyNestedMessage actuator_result_nested_Actuator_result_nested_p1_message;
MyNested actuator_result_nested_Actuator_result_nested_p1_var;
MyValuesMessage actuator_result_values_Actuator_result_values_p1_message;
MyValues actuator_result_values_Actuator_result_values_p1_var;
chan Controller_result_array_channel = [1] of {MyArrayMessage};
MyArray Controller_result_array_signal_parameter;
MyArrayMessage Controller_result_array_signal_parameter_message;
bool Controller_result_array_channel_used = 0;
chan Controller_result_data_channel = [1] of {MyDataMessage};
MyData Controller_result_data_signal_parameter;
MyDataMessage Controller_result_data_signal_parameter_message;
bool Controller_result_data_channel_used = 0;
chan Controller_result_nested_channel = [1] of {MyNestedMessage};
MyNested Controller_result_nested_signal_parameter;
MyNestedMessage Controller_result_nested_signal_parameter_message;
bool Controller_result_nested_channel_used = 0;
chan Controller_result_values_channel = [1] of {MyValuesMessage};
MyValues Controller_result_values_signal_parameter;
MyValuesMessage Controller_result_values_signal_parameter_message;
bool Controller_result_values_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_give_me_array_unhandled_input()
{
    printf("unhandled_input actuator give_me_array\n");
    skip;
}
inline Actuator_0_PI_0_give_me_data_unhandled_input()
{
    printf("unhandled_input actuator give_me_data\n");
    skip;
}
inline Actuator_0_PI_0_give_me_nested_unhandled_input()
{
    printf("unhandled_input actuator give_me_nested\n");
    skip;
}
inline Actuator_0_PI_0_give_me_values_unhandled_input()
{
    printf("unhandled_input actuator give_me_values\n");
    skip;
}
inline Actuator_0_RI_0_result_array(actuator_result_array_Actuator_result_array_p1)
{
    MyArray_assign_value(actuator_result_array_Actuator_result_array_p1_var, actuator_result_array_Actuator_result_array_p1);
    c_code {
        {
        asn1SccMyArray actuator_result_array_Actuator_result_array_p1_c_var;
        BitStream actuator_result_array_Actuator_result_array_p1_stream;
        int actuator_result_array_Actuator_result_array_p1_rc;
        
        int i = 0;
        for(i = 0; i < 2; ++i)
        {
            actuator_result_array_Actuator_result_array_p1_c_var.arr[i] = now.actuator_result_array_Actuator_result_array_p1_var.data[i];
            
        }
        
        BitStream_Init(&actuator_result_array_Actuator_result_array_p1_stream,
            now.actuator_result_array_Actuator_result_array_p1_message.data,
            asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyArray_Encode(&actuator_result_array_Actuator_result_array_p1_c_var,
            &actuator_result_array_Actuator_result_array_p1_stream,
            &actuator_result_array_Actuator_result_array_p1_rc,
            0);
        }
    }
    Controller_result_array_channel!actuator_result_array_Actuator_result_array_p1_message;
    printf("channel_send Controller_result_array_channel: %d, %d\n", actuator_result_array_Actuator_result_array_p1_var.data[0], actuator_result_array_Actuator_result_array_p1_var.data[1]);
}
inline Actuator_0_RI_0_result_data(actuator_result_data_Actuator_result_data_p1)
{
    MyData_assign_value(actuator_result_data_Actuator_result_data_p1_var, actuator_result_data_Actuator_result_data_p1);
    c_code {
        {
        asn1SccMyData actuator_result_data_Actuator_result_data_p1_c_var;
        BitStream actuator_result_data_Actuator_result_data_p1_stream;
        int actuator_result_data_Actuator_result_data_p1_rc;
        
        actuator_result_data_Actuator_result_data_p1_c_var.first = now.actuator_result_data_Actuator_result_data_p1_var.first;
        actuator_result_data_Actuator_result_data_p1_c_var.second = now.actuator_result_data_Actuator_result_data_p1_var.second;
        
        BitStream_Init(&actuator_result_data_Actuator_result_data_p1_stream,
            now.actuator_result_data_Actuator_result_data_p1_message.data,
            asn1SccMyData_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyData_Encode(&actuator_result_data_Actuator_result_data_p1_c_var,
            &actuator_result_data_Actuator_result_data_p1_stream,
            &actuator_result_data_Actuator_result_data_p1_rc,
            0);
        }
    }
    Controller_result_data_channel!actuator_result_data_Actuator_result_data_p1_message;
    printf("channel_send Controller_result_data_channel: %d, %d\n", actuator_result_data_Actuator_result_data_p1_var.first, actuator_result_data_Actuator_result_data_p1_var.second);
}
inline Actuator_0_RI_0_result_nested(actuator_result_nested_Actuator_result_nested_p1)
{
    MyNested_assign_value(actuator_result_nested_Actuator_result_nested_p1_var, actuator_result_nested_Actuator_result_nested_p1);
    c_code {
        {
        asn1SccMyNested actuator_result_nested_Actuator_result_nested_p1_c_var;
        BitStream actuator_result_nested_Actuator_result_nested_p1_stream;
        int actuator_result_nested_Actuator_result_nested_p1_rc;
        
        actuator_result_nested_Actuator_result_nested_p1_c_var.black = now.actuator_result_nested_Actuator_result_nested_p1_var.black;
        actuator_result_nested_Actuator_result_nested_p1_c_var.red.first = now.actuator_result_nested_Actuator_result_nested_p1_var.red.first;
        actuator_result_nested_Actuator_result_nested_p1_c_var.red.second = now.actuator_result_nested_Actuator_result_nested_p1_var.red.second;
        
        BitStream_Init(&actuator_result_nested_Actuator_result_nested_p1_stream,
            now.actuator_result_nested_Actuator_result_nested_p1_message.data,
            asn1SccMyNested_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyNested_Encode(&actuator_result_nested_Actuator_result_nested_p1_c_var,
            &actuator_result_nested_Actuator_result_nested_p1_stream,
            &actuator_result_nested_Actuator_result_nested_p1_rc,
            0);
        }
    }
    Controller_result_nested_channel!actuator_result_nested_Actuator_result_nested_p1_message;
    printf("channel_send Controller_result_nested_channel: %d, %d, %d\n", actuator_result_nested_Actuator_result_nested_p1_var.black, actuator_result_nested_Actuator_result_nested_p1_var.red.first, actuator_result_nested_Actuator_result_nested_p1_var.red.second);
}
inline Actuator_0_RI_0_result_values(actuator_result_values_Actuator_result_values_p1)
{
    MyValues_assign_value(actuator_result_values_Actuator_result_values_p1_var, actuator_result_values_Actuator_result_values_p1);
    c_code {
        {
        asn1SccMyValues actuator_result_values_Actuator_result_values_p1_c_var;
        BitStream actuator_result_values_Actuator_result_values_p1_stream;
        int actuator_result_values_Actuator_result_values_p1_rc;
        
        if(now.actuator_result_values_Actuator_result_values_p1_var.selection == MyValues_left_PRESENT)
        {
            actuator_result_values_Actuator_result_values_p1_c_var.u.left = now.actuator_result_values_Actuator_result_values_p1_var.data.left;
            
            actuator_result_values_Actuator_result_values_p1_c_var.kind = MyValues_left_PRESENT;
        }
        else if(now.actuator_result_values_Actuator_result_values_p1_var.selection == MyValues_right_PRESENT)
        {
            actuator_result_values_Actuator_result_values_p1_c_var.u.right = now.actuator_result_values_Actuator_result_values_p1_var.data.right;
            
            actuator_result_values_Actuator_result_values_p1_c_var.kind = MyValues_right_PRESENT;
        }
        
        BitStream_Init(&actuator_result_values_Actuator_result_values_p1_stream,
            now.actuator_result_values_Actuator_result_values_p1_message.data,
            asn1SccMyValues_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyValues_Encode(&actuator_result_values_Actuator_result_values_p1_c_var,
            &actuator_result_values_Actuator_result_values_p1_stream,
            &actuator_result_values_Actuator_result_values_p1_rc,
            0);
        }
    }
    Controller_result_values_channel!actuator_result_values_Actuator_result_values_p1_message;
    printf("channel_send Controller_result_values_channel: %d, %d, %d\n", actuator_result_values_Actuator_result_values_p1_var.data.left, actuator_result_values_Actuator_result_values_p1_var.data.right, actuator_result_values_Actuator_result_values_p1_var.selection);
}
inline Actuator_check_queue()
{
    atomic {
        (empty(Actuator_give_me_array_channel) && (empty(Actuator_give_me_data_channel) && (empty(Actuator_give_me_nested_channel) && empty(Actuator_give_me_values_channel))));
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_result_array_unhandled_input(p1)
{
    printf("unhandled_input controller result_array\n");
    skip;
}
inline Controller_0_PI_0_result_data_unhandled_input(p1)
{
    printf("unhandled_input controller result_data\n");
    skip;
}
inline Controller_0_PI_0_result_nested_unhandled_input(p1)
{
    printf("unhandled_input controller result_nested\n");
    skip;
}
inline Controller_0_PI_0_result_values_unhandled_input(p1)
{
    printf("unhandled_input controller result_values\n");
    skip;
}
inline Controller_0_RI_0_give_me_array()
{
    Actuator_give_me_array_channel!0;
    printf("channel_send Actuator_give_me_array_channel: 1\n");
}
inline Controller_0_RI_0_give_me_data()
{
    Actuator_give_me_data_channel!0;
    printf("channel_send Actuator_give_me_data_channel: 1\n");
}
inline Controller_0_RI_0_give_me_nested()
{
    Actuator_give_me_nested_channel!0;
    printf("channel_send Actuator_give_me_nested_channel: 1\n");
}
inline Controller_0_RI_0_give_me_values()
{
    Actuator_give_me_values_channel!0;
    printf("channel_send Actuator_give_me_values_channel: 1\n");
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_array_channel) && (empty(Controller_result_data_channel) && (empty(Controller_result_nested_channel) && empty(Controller_result_values_channel))));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
active proctype Actuator_give_me_array() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_array_channel);
        Actuator_lock?_;
Actuator_give_me_array_loop:
        if
        ::  nempty(Actuator_give_me_array_channel);
            Actuator_give_me_array_channel?_;
            printf("channel_recv Actuator_give_me_array_channel: 1\n");
            Actuator_0_PI_0_give_me_array();
            goto Actuator_give_me_array_loop;
        ::  empty(Actuator_give_me_array_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_give_me_data() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_data_channel);
        Actuator_lock?_;
Actuator_give_me_data_loop:
        if
        ::  nempty(Actuator_give_me_data_channel);
            Actuator_give_me_data_channel?_;
            printf("channel_recv Actuator_give_me_data_channel: 1\n");
            Actuator_0_PI_0_give_me_data();
            goto Actuator_give_me_data_loop;
        ::  empty(Actuator_give_me_data_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_give_me_nested() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_nested_channel);
        Actuator_lock?_;
Actuator_give_me_nested_loop:
        if
        ::  nempty(Actuator_give_me_nested_channel);
            Actuator_give_me_nested_channel?_;
            printf("channel_recv Actuator_give_me_nested_channel: 1\n");
            Actuator_0_PI_0_give_me_nested();
            goto Actuator_give_me_nested_loop;
        ::  empty(Actuator_give_me_nested_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_give_me_values() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_give_me_values_channel);
        Actuator_lock?_;
Actuator_give_me_values_loop:
        if
        ::  nempty(Actuator_give_me_values_channel);
            Actuator_give_me_values_channel?_;
            printf("channel_recv Actuator_give_me_values_channel: 1\n");
            Actuator_0_PI_0_give_me_values();
            goto Actuator_give_me_values_loop;
        ::  empty(Actuator_give_me_values_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_result_array() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_array_channel);
        Controller_lock?_;
Controller_result_array_loop:
        if
        ::  nempty(Controller_result_array_channel);
            Controller_result_array_channel?Controller_result_array_signal_parameter_message;
            c_code {
                {
                asn1SccMyArray Controller_result_array_signal_parameter_c_var;
                BitStream Controller_result_array_signal_parameter_stream;
                int Controller_result_array_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_array_signal_parameter_stream,
                    now.Controller_result_array_signal_parameter_message.data,
                    asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyArray_Decode(&Controller_result_array_signal_parameter_c_var,
                    &Controller_result_array_signal_parameter_stream,
                    &Controller_result_array_signal_parameter_rc);
                int i = 0;
                for(i = 0; i < 2; ++i)
                {
                    now.Controller_result_array_signal_parameter.data[i] = Controller_result_array_signal_parameter_c_var.arr[i];
                    
                }
                }
            }
            printf("channel_recv Controller_result_array_channel: %d, %d\n", Controller_result_array_signal_parameter.data[0], Controller_result_array_signal_parameter.data[1]);
            Controller_result_array_channel_used = 1;
            Controller_0_PI_0_result_array(Controller_result_array_signal_parameter);
            goto Controller_result_array_loop;
        ::  empty(Controller_result_array_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_data() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_data_channel);
        Controller_lock?_;
Controller_result_data_loop:
        if
        ::  nempty(Controller_result_data_channel);
            Controller_result_data_channel?Controller_result_data_signal_parameter_message;
            c_code {
                {
                asn1SccMyData Controller_result_data_signal_parameter_c_var;
                BitStream Controller_result_data_signal_parameter_stream;
                int Controller_result_data_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_data_signal_parameter_stream,
                    now.Controller_result_data_signal_parameter_message.data,
                    asn1SccMyData_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyData_Decode(&Controller_result_data_signal_parameter_c_var,
                    &Controller_result_data_signal_parameter_stream,
                    &Controller_result_data_signal_parameter_rc);
                now.Controller_result_data_signal_parameter.first = Controller_result_data_signal_parameter_c_var.first;
                now.Controller_result_data_signal_parameter.second = Controller_result_data_signal_parameter_c_var.second;
                }
            }
            printf("channel_recv Controller_result_data_channel: %d, %d\n", Controller_result_data_signal_parameter.first, Controller_result_data_signal_parameter.second);
            Controller_result_data_channel_used = 1;
            Controller_0_PI_0_result_data(Controller_result_data_signal_parameter);
            goto Controller_result_data_loop;
        ::  empty(Controller_result_data_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_nested() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_nested_channel);
        Controller_lock?_;
Controller_result_nested_loop:
        if
        ::  nempty(Controller_result_nested_channel);
            Controller_result_nested_channel?Controller_result_nested_signal_parameter_message;
            c_code {
                {
                asn1SccMyNested Controller_result_nested_signal_parameter_c_var;
                BitStream Controller_result_nested_signal_parameter_stream;
                int Controller_result_nested_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_nested_signal_parameter_stream,
                    now.Controller_result_nested_signal_parameter_message.data,
                    asn1SccMyNested_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyNested_Decode(&Controller_result_nested_signal_parameter_c_var,
                    &Controller_result_nested_signal_parameter_stream,
                    &Controller_result_nested_signal_parameter_rc);
                now.Controller_result_nested_signal_parameter.black = Controller_result_nested_signal_parameter_c_var.black;
                now.Controller_result_nested_signal_parameter.red.first = Controller_result_nested_signal_parameter_c_var.red.first;
                now.Controller_result_nested_signal_parameter.red.second = Controller_result_nested_signal_parameter_c_var.red.second;
                }
            }
            printf("channel_recv Controller_result_nested_channel: %d, %d, %d\n", Controller_result_nested_signal_parameter.black, Controller_result_nested_signal_parameter.red.first, Controller_result_nested_signal_parameter.red.second);
            Controller_result_nested_channel_used = 1;
            Controller_0_PI_0_result_nested(Controller_result_nested_signal_parameter);
            goto Controller_result_nested_loop;
        ::  empty(Controller_result_nested_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_result_values() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_result_values_channel);
        Controller_lock?_;
Controller_result_values_loop:
        if
        ::  nempty(Controller_result_values_channel);
            Controller_result_values_channel?Controller_result_values_signal_parameter_message;
            c_code {
                {
                asn1SccMyValues Controller_result_values_signal_parameter_c_var;
                BitStream Controller_result_values_signal_parameter_stream;
                int Controller_result_values_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_values_signal_parameter_stream,
                    now.Controller_result_values_signal_parameter_message.data,
                    asn1SccMyValues_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyValues_Decode(&Controller_result_values_signal_parameter_c_var,
                    &Controller_result_values_signal_parameter_stream,
                    &Controller_result_values_signal_parameter_rc);
                if(Controller_result_values_signal_parameter_c_var.kind == MyValues_left_PRESENT)
                {
                    now.Controller_result_values_signal_parameter.data.left = Controller_result_values_signal_parameter_c_var.u.left;
                    
                    now.Controller_result_values_signal_parameter.selection = MyValues_left_PRESENT;
                }
                 else if(Controller_result_values_signal_parameter_c_var.kind == MyValues_right_PRESENT)
                {
                    now.Controller_result_values_signal_parameter.data.right = Controller_result_values_signal_parameter_c_var.u.right;
                    
                    now.Controller_result_values_signal_parameter.selection = MyValues_right_PRESENT;
                }
                }
            }
            printf("channel_recv Controller_result_values_channel: %d, %d, %d\n", Controller_result_values_signal_parameter.data.left, Controller_result_values_signal_parameter.data.right, Controller_result_values_signal_parameter.selection);
            Controller_result_values_channel_used = 1;
            Controller_0_PI_0_result_values(Controller_result_values_signal_parameter);
            goto Controller_result_values_loop;
        ::  empty(Controller_result_values_channel);
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
