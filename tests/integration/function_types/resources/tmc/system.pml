#include "dataview.pml"
#include "controller.pml"
#include "down.pml"
#include "up.pml"
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

typedef MyResultIntegerMessage {
#if asn1SccMyResultInteger_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyResultInteger_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef MyTestIntegerMessage {
#if asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Controller_Context controller;
    Actuator_Context down;
    Actuator_Context up;
    AggregateTimerData timers;
}

int inited;
chan Controller_down_result_channel = [1] of {MyResultIntegerMessage};
MyResultInteger Controller_down_result_signal_parameter;
MyResultIntegerMessage Controller_down_result_signal_parameter_message;
bool Controller_down_result_channel_used = 0;
chan Controller_test_channel = [1] of {MyTestIntegerMessage};
MyTestInteger Controller_test_signal_parameter;
MyTestIntegerMessage Controller_test_signal_parameter_message;
bool Controller_test_channel_used = 0;
chan Controller_up_result_channel = [1] of {MyResultIntegerMessage};
MyResultInteger Controller_up_result_signal_parameter;
MyResultIntegerMessage Controller_up_result_signal_parameter_message;
bool Controller_up_result_channel_used = 0;
MyIntegerMessage controller_down_check_Controller_down_check_p1_message;
MyInteger controller_down_check_Controller_down_check_p1_var;
MyIntegerMessage controller_up_check_Controller_up_check_p1_message;
MyInteger controller_up_check_Controller_up_check_p1_var;
chan Down_check_channel = [1] of {MyIntegerMessage};
MyInteger Down_check_signal_parameter;
MyIntegerMessage Down_check_signal_parameter_message;
bool Down_check_channel_used = 0;
MyResultIntegerMessage down_result_Down_result_p1_message;
MyResultInteger down_result_Down_result_p1_var;
MyTestIntegerMessage environ_test_Environ_test_p1_message;
MyTestInteger environ_test_Environ_test_p1_var;
chan Up_check_channel = [1] of {MyIntegerMessage};
MyInteger Up_check_signal_parameter;
MyIntegerMessage Up_check_signal_parameter_message;
bool Up_check_channel_used = 0;
MyResultIntegerMessage up_result_Up_result_p1_message;
MyResultInteger up_result_Up_result_p1_var;
system_state global_state;
chan Controller_lock = [1] of {int};
chan Down_lock = [1] of {int};
chan Up_lock = [1] of {int};
inline Controller_0_PI_0_down_result_unhandled_input(p1)
{
    printf("unhandled_input controller down_result\n");
    skip;
}
inline Controller_0_PI_0_test_unhandled_input(p1)
{
    printf("unhandled_input controller test\n");
    skip;
}
inline Controller_0_PI_0_up_result_unhandled_input(p1)
{
    printf("unhandled_input controller up_result\n");
    skip;
}
inline Controller_0_RI_0_down_check(controller_down_check_Controller_down_check_p1)
{
    MyInteger_assign_value(controller_down_check_Controller_down_check_p1_var, controller_down_check_Controller_down_check_p1);
    c_code {
        {
        asn1SccMyInteger controller_down_check_Controller_down_check_p1_c_var;
        BitStream controller_down_check_Controller_down_check_p1_stream;
        int controller_down_check_Controller_down_check_p1_rc;
        
        controller_down_check_Controller_down_check_p1_c_var = now.controller_down_check_Controller_down_check_p1_var;
        
        BitStream_Init(&controller_down_check_Controller_down_check_p1_stream,
            now.controller_down_check_Controller_down_check_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&controller_down_check_Controller_down_check_p1_c_var,
            &controller_down_check_Controller_down_check_p1_stream,
            &controller_down_check_Controller_down_check_p1_rc,
            0);
        }
    }
    Down_check_channel!controller_down_check_Controller_down_check_p1_message;
    printf("channel_send Down_check_channel: %d\n", controller_down_check_Controller_down_check_p1_var);
}
inline Controller_0_RI_0_up_check(controller_up_check_Controller_up_check_p1)
{
    MyInteger_assign_value(controller_up_check_Controller_up_check_p1_var, controller_up_check_Controller_up_check_p1);
    c_code {
        {
        asn1SccMyInteger controller_up_check_Controller_up_check_p1_c_var;
        BitStream controller_up_check_Controller_up_check_p1_stream;
        int controller_up_check_Controller_up_check_p1_rc;
        
        controller_up_check_Controller_up_check_p1_c_var = now.controller_up_check_Controller_up_check_p1_var;
        
        BitStream_Init(&controller_up_check_Controller_up_check_p1_stream,
            now.controller_up_check_Controller_up_check_p1_message.data,
            asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyInteger_Encode(&controller_up_check_Controller_up_check_p1_c_var,
            &controller_up_check_Controller_up_check_p1_stream,
            &controller_up_check_Controller_up_check_p1_rc,
            0);
        }
    }
    Up_check_channel!controller_up_check_Controller_up_check_p1_message;
    printf("channel_send Up_check_channel: %d\n", controller_up_check_Controller_up_check_p1_var);
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_down_result_channel) && (empty(Controller_test_channel) && empty(Controller_up_result_channel)));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Down_0_PI_0_check_unhandled_input(p1)
{
    printf("unhandled_input down check\n");
    skip;
}
inline Down_0_RI_0_result(down_result_Down_result_p1)
{
    MyResultInteger_assign_value(down_result_Down_result_p1_var, down_result_Down_result_p1);
    c_code {
        {
        asn1SccMyResultInteger down_result_Down_result_p1_c_var;
        BitStream down_result_Down_result_p1_stream;
        int down_result_Down_result_p1_rc;
        
        down_result_Down_result_p1_c_var = now.down_result_Down_result_p1_var;
        
        BitStream_Init(&down_result_Down_result_p1_stream,
            now.down_result_Down_result_p1_message.data,
            asn1SccMyResultInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyResultInteger_Encode(&down_result_Down_result_p1_c_var,
            &down_result_Down_result_p1_stream,
            &down_result_Down_result_p1_rc,
            0);
        }
    }
    Controller_down_result_channel!down_result_Down_result_p1_message;
    printf("channel_send Controller_down_result_channel: %d\n", down_result_Down_result_p1_var);
}
inline Down_check_queue()
{
    atomic {
        empty(Down_check_channel);
    }
}
inline Down_0_RI_0_get_sender(Down_sender_arg)
{
    skip;
}
inline Environ_0_RI_0_test(environ_test_Environ_test_p1)
{
    MyTestInteger_assign_value(environ_test_Environ_test_p1_var, environ_test_Environ_test_p1);
    c_code {
        {
        asn1SccMyTestInteger environ_test_Environ_test_p1_c_var;
        BitStream environ_test_Environ_test_p1_stream;
        int environ_test_Environ_test_p1_rc;
        
        environ_test_Environ_test_p1_c_var = now.environ_test_Environ_test_p1_var;
        
        BitStream_Init(&environ_test_Environ_test_p1_stream,
            now.environ_test_Environ_test_p1_message.data,
            asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyTestInteger_Encode(&environ_test_Environ_test_p1_c_var,
            &environ_test_Environ_test_p1_stream,
            &environ_test_Environ_test_p1_rc,
            0);
        }
    }
    Controller_test_channel!environ_test_Environ_test_p1_message;
    printf("channel_send Controller_test_channel: %d\n", environ_test_Environ_test_p1_var);
}
inline Up_0_PI_0_check_unhandled_input(p1)
{
    printf("unhandled_input up check\n");
    skip;
}
inline Up_0_RI_0_result(up_result_Up_result_p1)
{
    MyResultInteger_assign_value(up_result_Up_result_p1_var, up_result_Up_result_p1);
    c_code {
        {
        asn1SccMyResultInteger up_result_Up_result_p1_c_var;
        BitStream up_result_Up_result_p1_stream;
        int up_result_Up_result_p1_rc;
        
        up_result_Up_result_p1_c_var = now.up_result_Up_result_p1_var;
        
        BitStream_Init(&up_result_Up_result_p1_stream,
            now.up_result_Up_result_p1_message.data,
            asn1SccMyResultInteger_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccMyResultInteger_Encode(&up_result_Up_result_p1_c_var,
            &up_result_Up_result_p1_stream,
            &up_result_Up_result_p1_rc,
            0);
        }
    }
    Controller_up_result_channel!up_result_Up_result_p1_message;
    printf("channel_send Controller_up_result_channel: %d\n", up_result_Up_result_p1_var);
}
inline Up_check_queue()
{
    atomic {
        empty(Up_check_channel);
    }
}
inline Up_0_RI_0_get_sender(Up_sender_arg)
{
    skip;
}
active proctype Controller_down_result() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_down_result_channel);
        Controller_lock?_;
Controller_down_result_loop:
        if
        ::  nempty(Controller_down_result_channel);
            Controller_down_result_channel?Controller_down_result_signal_parameter_message;
            c_code {
                {
                asn1SccMyResultInteger Controller_down_result_signal_parameter_c_var;
                BitStream Controller_down_result_signal_parameter_stream;
                int Controller_down_result_signal_parameter_rc;BitStream_AttachBuffer(&Controller_down_result_signal_parameter_stream,
                    now.Controller_down_result_signal_parameter_message.data,
                    asn1SccMyResultInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyResultInteger_Decode(&Controller_down_result_signal_parameter_c_var,
                    &Controller_down_result_signal_parameter_stream,
                    &Controller_down_result_signal_parameter_rc);
                now.Controller_down_result_signal_parameter = Controller_down_result_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_down_result_channel: %d\n", Controller_down_result_signal_parameter);
            Controller_down_result_channel_used = 1;
            Controller_0_PI_0_down_result(Controller_down_result_signal_parameter);
            goto Controller_down_result_loop;
        ::  empty(Controller_down_result_channel);
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
                asn1SccMyTestInteger Controller_test_signal_parameter_c_var;
                BitStream Controller_test_signal_parameter_stream;
                int Controller_test_signal_parameter_rc;BitStream_AttachBuffer(&Controller_test_signal_parameter_stream,
                    now.Controller_test_signal_parameter_message.data,
                    asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyTestInteger_Decode(&Controller_test_signal_parameter_c_var,
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
active proctype Controller_up_result() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_up_result_channel);
        Controller_lock?_;
Controller_up_result_loop:
        if
        ::  nempty(Controller_up_result_channel);
            Controller_up_result_channel?Controller_up_result_signal_parameter_message;
            c_code {
                {
                asn1SccMyResultInteger Controller_up_result_signal_parameter_c_var;
                BitStream Controller_up_result_signal_parameter_stream;
                int Controller_up_result_signal_parameter_rc;BitStream_AttachBuffer(&Controller_up_result_signal_parameter_stream,
                    now.Controller_up_result_signal_parameter_message.data,
                    asn1SccMyResultInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyResultInteger_Decode(&Controller_up_result_signal_parameter_c_var,
                    &Controller_up_result_signal_parameter_stream,
                    &Controller_up_result_signal_parameter_rc);
                now.Controller_up_result_signal_parameter = Controller_up_result_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_up_result_channel: %d\n", Controller_up_result_signal_parameter);
            Controller_up_result_channel_used = 1;
            Controller_0_PI_0_up_result(Controller_up_result_signal_parameter);
            goto Controller_up_result_loop;
        ::  empty(Controller_up_result_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Down_check() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Down_check_channel);
        Down_lock?_;
Down_check_loop:
        if
        ::  nempty(Down_check_channel);
            Down_check_channel?Down_check_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Down_check_signal_parameter_c_var;
                BitStream Down_check_signal_parameter_stream;
                int Down_check_signal_parameter_rc;BitStream_AttachBuffer(&Down_check_signal_parameter_stream,
                    now.Down_check_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Down_check_signal_parameter_c_var,
                    &Down_check_signal_parameter_stream,
                    &Down_check_signal_parameter_rc);
                now.Down_check_signal_parameter = Down_check_signal_parameter_c_var;
                }
            }
            printf("channel_recv Down_check_channel: %d\n", Down_check_signal_parameter);
            Down_check_channel_used = 1;
            Down_0_PI_0_check(Down_check_signal_parameter);
            goto Down_check_loop;
        ::  empty(Down_check_channel);
            skip;
        fi;
        Down_lock!1;
    }
    od;
}
active proctype Environ_test() priority 1
{
    inited;
    MyTestInteger value;
    do
    ::  atomic {
        MyTestInteger_generate_value(value);
        Environ_0_RI_0_test(value);
    }
    od;
}
active proctype Up_check() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Up_check_channel);
        Up_lock?_;
Up_check_loop:
        if
        ::  nempty(Up_check_channel);
            Up_check_channel?Up_check_signal_parameter_message;
            c_code {
                {
                asn1SccMyInteger Up_check_signal_parameter_c_var;
                BitStream Up_check_signal_parameter_stream;
                int Up_check_signal_parameter_rc;BitStream_AttachBuffer(&Up_check_signal_parameter_stream,
                    now.Up_check_signal_parameter_message.data,
                    asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccMyInteger_Decode(&Up_check_signal_parameter_c_var,
                    &Up_check_signal_parameter_stream,
                    &Up_check_signal_parameter_rc);
                now.Up_check_signal_parameter = Up_check_signal_parameter_c_var;
                }
            }
            printf("channel_recv Up_check_channel: %d\n", Up_check_signal_parameter);
            Up_check_channel_used = 1;
            Up_0_PI_0_check(Up_check_signal_parameter);
            goto Up_check_loop;
        ::  empty(Up_check_channel);
            skip;
        fi;
        Up_lock!1;
    }
    od;
}
init
{
    atomic {
        global_dataview_init();
        Controller_0_init();
        Controller_lock!1;
        Down_0_init();
        Down_lock!1;
        Up_0_init();
        Up_lock!1;
        inited = 1;
    }
}
#include "scl.pml"
