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

typedef TestIntegerMessage {
#if asn1SccTestInteger_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccTestInteger_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_check_channel = [1] of {MyIntegerMessage};
MyInteger Actuator_check_signal_parameter;
MyIntegerMessage Actuator_check_signal_parameter_message;
bool Actuator_check_channel_used = 0;
MyIntegerMessage actuator_result_Actuator_result_p1_message;
MyInteger actuator_result_Actuator_result_p1_var;
chan Controller_result_channel = [1] of {MyIntegerMessage};
MyInteger Controller_result_signal_parameter;
MyIntegerMessage Controller_result_signal_parameter_message;
bool Controller_result_channel_used = 0;
chan Controller_test_channel = [1] of {TestIntegerMessage};
TestInteger Controller_test_signal_parameter;
TestIntegerMessage Controller_test_signal_parameter_message;
bool Controller_test_channel_used = 0;
MyIntegerMessage controller_check_Controller_check_p1_message;
MyInteger controller_check_Controller_check_p1_var;
TestIntegerMessage environ_test_Environ_test_p1_message;
TestInteger environ_test_Environ_test_p1_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_check_unhandled_input(p1)
{
    printf("unhandled_input actuator check\n");
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
        empty(Actuator_check_channel);
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
inline Controller_0_PI_0_test_unhandled_input(p1)
{
    printf("unhandled_input controller test\n");
    skip;
}
inline Controller_0_RI_0_check(controller_check_Controller_check_p1)
{
    MyInteger_assign_value(controller_check_Controller_check_p1_var, controller_check_Controller_check_p1);
    c_code {
        {
        asn1SccMyInteger controller_check_Controller_check_p1_c_var;
        BitStream controller_check_Controller_check_p1_stream;
        int controller_check_Controller_check_p1_rc;
        
        controller_check_Controller_check_p1_c_var = now.controller_check_Controller_check_p1_var;
        
        BitStream_Init(&controller_check_Controller_check_p1_stream,
            now.controller_check_Controller_check_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&controller_check_Controller_check_p1_c_var,
            &controller_check_Controller_check_p1_stream,
            &controller_check_Controller_check_p1_rc,
            0);
        }
    }
    Actuator_check_channel!controller_check_Controller_check_p1_message;
    printf("channel_send Actuator_check_channel: %d\n", controller_check_Controller_check_p1_var);
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_result_channel) && empty(Controller_test_channel));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Environ_0_RI_0_test(environ_test_Environ_test_p1)
{
    TestInteger_assign_value(environ_test_Environ_test_p1_var, environ_test_Environ_test_p1);
    c_code {
        {
        asn1SccTestInteger environ_test_Environ_test_p1_c_var;
        BitStream environ_test_Environ_test_p1_stream;
        int environ_test_Environ_test_p1_rc;
        
        environ_test_Environ_test_p1_c_var = now.environ_test_Environ_test_p1_var;
        
        BitStream_Init(&environ_test_Environ_test_p1_stream,
            now.environ_test_Environ_test_p1_message.data,
            asn1SccTestInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccTestInteger_Encode(&environ_test_Environ_test_p1_c_var,
            &environ_test_Environ_test_p1_stream,
            &environ_test_Environ_test_p1_rc,
            0);
        }
    }
    Controller_test_channel!environ_test_Environ_test_p1_message;
    printf("channel_send Controller_test_channel: %d\n", environ_test_Environ_test_p1_var);
}
active proctype Actuator_check() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_check_channel);
        Actuator_lock?_;
Actuator_check_loop:
        if
        ::  nempty(Actuator_check_channel);
            Actuator_check_channel?Actuator_check_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Actuator_check_signal_parameter_c_var;
                BitStream Actuator_check_signal_parameter_stream;
                int Actuator_check_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_check_signal_parameter_stream,
                    now.Actuator_check_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Actuator_check_signal_parameter_c_var,
                    &Actuator_check_signal_parameter_stream,
                    &Actuator_check_signal_parameter_rc);
                now.Actuator_check_signal_parameter = Actuator_check_signal_parameter_c_var;
                }
            }
            printf("channel_recv Actuator_check_channel: %d\n", Actuator_check_signal_parameter);
            Actuator_check_channel_used = 1;
            Actuator_0_PI_0_check(Actuator_check_signal_parameter);
            goto Actuator_check_loop;
        ::  empty(Actuator_check_channel);
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
active proctype Controller_test() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_test_channel);
        Controller_lock?_;
Controller_test_loop:
        if
        ::  nempty(Controller_test_channel);
            Controller_test_channel?Controller_test_signal_parameter_message;
            c_code {
                {
                asn1SccTestInteger Controller_test_signal_parameter_c_var;
                BitStream Controller_test_signal_parameter_stream;
                int Controller_test_signal_parameter_rc;BitStream_AttachBuffer(&Controller_test_signal_parameter_stream,
                    now.Controller_test_signal_parameter_message.data,
                    asn1SccTestInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccTestInteger_Decode(&Controller_test_signal_parameter_c_var,
                    &Controller_test_signal_parameter_stream,
                    &Controller_test_signal_parameter_rc);
                now.Controller_test_signal_parameter = Controller_test_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_test_channel: %d\n", Controller_test_signal_parameter);
            Controller_test_channel_used = 1;
            Controller_0_PI_0_test(Controller_test_signal_parameter);
            goto Controller_test_loop;
        ::  empty(Controller_test_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Environ_test() priority 1
{
    inited;
    TestInteger value;
    do
    ::  atomic {
        TestInteger_generate_value(value);
        Environ_0_RI_0_test(value);
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
