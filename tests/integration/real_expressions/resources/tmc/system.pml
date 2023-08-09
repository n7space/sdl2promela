#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_test_matrix_channel = [1] of {MyArray};
MyArray Actuator_test_matrix_signal_parameter;
bool Actuator_test_matrix_channel_used = 0;
chan Actuator_test_scalar_channel = [1] of {MyReal};
MyReal Actuator_test_scalar_signal_parameter;
bool Actuator_test_scalar_channel_used = 0;
chan Actuator_test_vector_channel = [1] of {MyArray};
MyArray Actuator_test_vector_signal_parameter;
bool Actuator_test_vector_channel_used = 0;
chan Controller_result_channel = [1] of {MyReal};
MyReal Controller_result_signal_parameter;
bool Controller_result_channel_used = 0;
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
    Controller_result_channel!actuator_result_Actuator_result_p1;
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
    Actuator_test_matrix_channel!controller_test_matrix_Controller_test_matrix_p1;
}
inline Controller_0_RI_0_test_scalar(controller_test_scalar_Controller_test_scalar_p1)
{
    Actuator_test_scalar_channel!controller_test_scalar_Controller_test_scalar_p1;
}
inline Controller_0_RI_0_test_vector(controller_test_vector_Controller_test_vector_p1)
{
    Actuator_test_vector_channel!controller_test_vector_Controller_test_vector_p1;
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
            Actuator_test_matrix_channel?Actuator_test_matrix_signal_parameter;
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
            Actuator_test_scalar_channel?Actuator_test_scalar_signal_parameter;
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
            Actuator_test_vector_channel?Actuator_test_vector_signal_parameter;
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
            Controller_result_channel?Controller_result_signal_parameter;
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
