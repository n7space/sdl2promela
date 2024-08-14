#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef ResultStatusMessage {
#if asn1SccResultStatus_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccResultStatus_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_reset_channel = [1] of {int};
chan Actuator_tick_channel = [1] of {int};
chan Actuator_tick_left_channel = [1] of {int};
chan Actuator_tick_right_channel = [1] of {int};
ResultStatusMessage actuator_result_Actuator_result_p1_message;
ResultStatus actuator_result_Actuator_result_p1_var;
chan Controller_result_channel = [1] of {ResultStatusMessage};
ResultStatus Controller_result_signal_parameter;
ResultStatusMessage Controller_result_signal_parameter_message;
bool Controller_result_channel_used = 0;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_reset_unhandled_input()
{
    printf("unhandled_input actuator reset\n");
    skip;
}
inline Actuator_0_PI_0_tick_unhandled_input()
{
    printf("unhandled_input actuator tick\n");
    skip;
}
inline Actuator_0_PI_0_tick_left_unhandled_input()
{
    printf("unhandled_input actuator tick_left\n");
    skip;
}
inline Actuator_0_PI_0_tick_right_unhandled_input()
{
    printf("unhandled_input actuator tick_right\n");
    skip;
}
inline Actuator_0_RI_0_result(actuator_result_Actuator_result_p1)
{
    ResultStatus_assign_value(actuator_result_Actuator_result_p1_var, actuator_result_Actuator_result_p1);
    c_code {
        {
        asn1SccResultStatus actuator_result_Actuator_result_p1_c_var;
        BitStream actuator_result_Actuator_result_p1_stream;
        int actuator_result_Actuator_result_p1_rc;
        
        actuator_result_Actuator_result_p1_c_var = now.actuator_result_Actuator_result_p1_var;
        
        BitStream_Init(&actuator_result_Actuator_result_p1_stream,
            now.actuator_result_Actuator_result_p1_message.data,
            asn1SccResultStatus_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccResultStatus_Encode(&actuator_result_Actuator_result_p1_c_var,
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
        (empty(Actuator_reset_channel) && (empty(Actuator_tick_channel) && (empty(Actuator_tick_left_channel) && empty(Actuator_tick_right_channel))));
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
inline Controller_0_RI_0_reset()
{
    Actuator_reset_channel!0;
    printf("channel_send Actuator_reset_channel: 1\n");
}
inline Controller_0_RI_0_tick()
{
    Actuator_tick_channel!0;
    printf("channel_send Actuator_tick_channel: 1\n");
}
inline Controller_0_RI_0_tick_left()
{
    Actuator_tick_left_channel!0;
    printf("channel_send Actuator_tick_left_channel: 1\n");
}
inline Controller_0_RI_0_tick_right()
{
    Actuator_tick_right_channel!0;
    printf("channel_send Actuator_tick_right_channel: 1\n");
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
active proctype Actuator_reset() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_reset_channel);
        Actuator_lock?_;
Actuator_reset_loop:
        if
        ::  nempty(Actuator_reset_channel);
            Actuator_reset_channel?_;
            printf("channel_recv Actuator_reset_channel: 1\n");
            Actuator_0_PI_0_reset();
            goto Actuator_reset_loop;
        ::  empty(Actuator_reset_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_tick() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_tick_channel);
        Actuator_lock?_;
Actuator_tick_loop:
        if
        ::  nempty(Actuator_tick_channel);
            Actuator_tick_channel?_;
            printf("channel_recv Actuator_tick_channel: 1\n");
            Actuator_0_PI_0_tick();
            goto Actuator_tick_loop;
        ::  empty(Actuator_tick_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_tick_left() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_tick_left_channel);
        Actuator_lock?_;
Actuator_tick_left_loop:
        if
        ::  nempty(Actuator_tick_left_channel);
            Actuator_tick_left_channel?_;
            printf("channel_recv Actuator_tick_left_channel: 1\n");
            Actuator_0_PI_0_tick_left();
            goto Actuator_tick_left_loop;
        ::  empty(Actuator_tick_left_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Actuator_tick_right() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_tick_right_channel);
        Actuator_lock?_;
Actuator_tick_right_loop:
        if
        ::  nempty(Actuator_tick_right_channel);
            Actuator_tick_right_channel?_;
            printf("channel_recv Actuator_tick_right_channel: 1\n");
            Actuator_0_PI_0_tick_right();
            goto Actuator_tick_right_loop;
        ::  empty(Actuator_tick_right_channel);
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
                asn1SccResultStatus Controller_result_signal_parameter_c_var;
                BitStream Controller_result_signal_parameter_stream;
                int Controller_result_signal_parameter_rc;BitStream_AttachBuffer(&Controller_result_signal_parameter_stream,
                    now.Controller_result_signal_parameter_message.data,
                    asn1SccResultStatus_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccResultStatus_Decode(&Controller_result_signal_parameter_c_var,
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
