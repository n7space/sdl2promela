#include "dataview.pml"
#include "actuator.pml"
#include "controller.pml"
#include "env_inlines.pml"
#include "message_sizes.pml"
c_decl {
    \#include "dataview-uniq.h"
}
typedef ALPHA_MEMORY_BASEMessage {
#if asn1SccALPHA_MEMORY_BASE_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccALPHA_MEMORY_BASE_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef ALPHA_MEMORY_IDENTIFIERMessage {
#if asn1SccALPHA_MEMORY_IDENTIFIER_REQUIRED_BYTES_FOR_ENCODING == 0
    byte data[1];
#else
    byte data[asn1SccALPHA_MEMORY_IDENTIFIER_REQUIRED_BYTES_FOR_ENCODING];
#endif
}

typedef system_state {
    Actuator_Context actuator;
    Controller_Context controller;
    AggregateTimerData timers;
}

int inited;
chan Actuator_determine_memory_id_channel = [1] of {ALPHA_MEMORY_BASEMessage};
ALPHA_MEMORY_BASE Actuator_determine_memory_id_signal_parameter;
ALPHA_MEMORY_BASEMessage Actuator_determine_memory_id_signal_parameter_message;
bool Actuator_determine_memory_id_channel_used = 0;
ALPHA_MEMORY_IDENTIFIERMessage actuator_memory_id_is_Actuator_memory_id_is_mem_id_message;
ALPHA_MEMORY_IDENTIFIER actuator_memory_id_is_Actuator_memory_id_is_mem_id_var;
chan Controller_do_test_channel = [1] of {int};
chan Controller_memory_id_is_channel = [1] of {ALPHA_MEMORY_IDENTIFIERMessage};
ALPHA_MEMORY_IDENTIFIER Controller_memory_id_is_signal_parameter;
ALPHA_MEMORY_IDENTIFIERMessage Controller_memory_id_is_signal_parameter_message;
bool Controller_memory_id_is_channel_used = 0;
ALPHA_MEMORY_BASEMessage controller_determine_memory_id_Controller_determine_memory_id_mem_base_message;
ALPHA_MEMORY_BASE controller_determine_memory_id_Controller_determine_memory_id_mem_base_var;
system_state global_state;
chan Actuator_lock = [1] of {int};
chan Controller_lock = [1] of {int};
inline Actuator_0_PI_0_determine_memory_id_unhandled_input(mem_base)
{
    printf("unhandled_input actuator determine_memory_id\n");
    skip;
}
inline Actuator_0_RI_0_memory_id_is(actuator_memory_id_is_Actuator_memory_id_is_mem_id)
{
    ALPHA_MEMORY_IDENTIFIER_assign_value(actuator_memory_id_is_Actuator_memory_id_is_mem_id_var, actuator_memory_id_is_Actuator_memory_id_is_mem_id);
    c_code {
        {
        asn1SccALPHA_MEMORY_IDENTIFIER actuator_memory_id_is_Actuator_memory_id_is_mem_id_c_var;
        BitStream actuator_memory_id_is_Actuator_memory_id_is_mem_id_stream;
        int actuator_memory_id_is_Actuator_memory_id_is_mem_id_rc;
        
        actuator_memory_id_is_Actuator_memory_id_is_mem_id_c_var = now.actuator_memory_id_is_Actuator_memory_id_is_mem_id_var;
        
        BitStream_Init(&actuator_memory_id_is_Actuator_memory_id_is_mem_id_stream,
            now.actuator_memory_id_is_Actuator_memory_id_is_mem_id_message.data,
            asn1SccALPHA_MEMORY_IDENTIFIER_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccALPHA_MEMORY_IDENTIFIER_Encode(&actuator_memory_id_is_Actuator_memory_id_is_mem_id_c_var,
            &actuator_memory_id_is_Actuator_memory_id_is_mem_id_stream,
            &actuator_memory_id_is_Actuator_memory_id_is_mem_id_rc,
            0);
        }
    }
    Controller_memory_id_is_channel!actuator_memory_id_is_Actuator_memory_id_is_mem_id_message;
    printf("channel_send Controller_memory_id_is_channel: %d\n", actuator_memory_id_is_Actuator_memory_id_is_mem_id_var);
}
inline Actuator_check_queue()
{
    atomic {
        empty(Actuator_determine_memory_id_channel);
    }
}
inline Actuator_0_RI_0_get_sender(Actuator_sender_arg)
{
    skip;
}
inline Controller_0_PI_0_do_test_unhandled_input()
{
    printf("unhandled_input controller do_test\n");
    skip;
}
inline Controller_0_PI_0_memory_id_is_unhandled_input(mem_id)
{
    printf("unhandled_input controller memory_id_is\n");
    skip;
}
inline Controller_0_RI_0_determine_memory_id(controller_determine_memory_id_Controller_determine_memory_id_mem_base)
{
    ALPHA_MEMORY_BASE_assign_value(controller_determine_memory_id_Controller_determine_memory_id_mem_base_var, controller_determine_memory_id_Controller_determine_memory_id_mem_base);
    c_code {
        {
        asn1SccALPHA_MEMORY_BASE controller_determine_memory_id_Controller_determine_memory_id_mem_base_c_var;
        BitStream controller_determine_memory_id_Controller_determine_memory_id_mem_base_stream;
        int controller_determine_memory_id_Controller_determine_memory_id_mem_base_rc;
        
        if(now.controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.selection == ALPHA_MEMORY_BASE_ram_memory_PRESENT)
        {
            
            controller_determine_memory_id_Controller_determine_memory_id_mem_base_c_var.kind = ALPHA_MEMORY_BASE_ram_memory_PRESENT;
        }
        else if(now.controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.selection == ALPHA_MEMORY_BASE_db_memory_PRESENT)
        {
            controller_determine_memory_id_Controller_determine_memory_id_mem_base_c_var.u.db_memory = now.controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.data.db_memory;
            
            controller_determine_memory_id_Controller_determine_memory_id_mem_base_c_var.kind = ALPHA_MEMORY_BASE_db_memory_PRESENT;
        }
        else if(now.controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.selection == ALPHA_MEMORY_BASE_spare_memory_PRESENT)
        {
            controller_determine_memory_id_Controller_determine_memory_id_mem_base_c_var.u.spare_memory = now.controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.data.spare_memory;
            
            controller_determine_memory_id_Controller_determine_memory_id_mem_base_c_var.kind = ALPHA_MEMORY_BASE_spare_memory_PRESENT;
        }
        
        BitStream_Init(&controller_determine_memory_id_Controller_determine_memory_id_mem_base_stream,
            now.controller_determine_memory_id_Controller_determine_memory_id_mem_base_message.data,
            asn1SccALPHA_MEMORY_BASE_REQUIRED_BYTES_FOR_ENCODING);
        asn1SccALPHA_MEMORY_BASE_Encode(&controller_determine_memory_id_Controller_determine_memory_id_mem_base_c_var,
            &controller_determine_memory_id_Controller_determine_memory_id_mem_base_stream,
            &controller_determine_memory_id_Controller_determine_memory_id_mem_base_rc,
            0);
        }
    }
    Actuator_determine_memory_id_channel!controller_determine_memory_id_Controller_determine_memory_id_mem_base_message;
    printf("channel_send Actuator_determine_memory_id_channel: %d, %d, %d\n", controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.data.db_memory, controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.data.spare_memory, controller_determine_memory_id_Controller_determine_memory_id_mem_base_var.selection);
}
inline Controller_check_queue()
{
    atomic {
        (empty(Controller_do_test_channel) && empty(Controller_memory_id_is_channel));
    }
}
inline Controller_0_RI_0_get_sender(Controller_sender_arg)
{
    skip;
}
inline Environ_0_RI_0_do_test()
{
    Controller_do_test_channel!0;
    printf("channel_send Controller_do_test_channel: 1\n");
}
active proctype Actuator_determine_memory_id() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Actuator_determine_memory_id_channel);
        Actuator_lock?_;
Actuator_determine_memory_id_loop:
        if
        ::  nempty(Actuator_determine_memory_id_channel);
            Actuator_determine_memory_id_channel?Actuator_determine_memory_id_signal_parameter_message;
            c_code {
                {
                asn1SccALPHA_MEMORY_BASE Actuator_determine_memory_id_signal_parameter_c_var;
                BitStream Actuator_determine_memory_id_signal_parameter_stream;
                int Actuator_determine_memory_id_signal_parameter_rc;BitStream_AttachBuffer(&Actuator_determine_memory_id_signal_parameter_stream,
                    now.Actuator_determine_memory_id_signal_parameter_message.data,
                    asn1SccALPHA_MEMORY_BASE_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccALPHA_MEMORY_BASE_Decode(&Actuator_determine_memory_id_signal_parameter_c_var,
                    &Actuator_determine_memory_id_signal_parameter_stream,
                    &Actuator_determine_memory_id_signal_parameter_rc);
                if(Actuator_determine_memory_id_signal_parameter_c_var.kind == ALPHA_MEMORY_BASE_ram_memory_PRESENT)
                {
                    
                    now.Actuator_determine_memory_id_signal_parameter.selection = ALPHA_MEMORY_BASE_ram_memory_PRESENT;
                }
                 else if(Actuator_determine_memory_id_signal_parameter_c_var.kind == ALPHA_MEMORY_BASE_db_memory_PRESENT)
                {
                    now.Actuator_determine_memory_id_signal_parameter.data.db_memory = Actuator_determine_memory_id_signal_parameter_c_var.u.db_memory;
                    
                    now.Actuator_determine_memory_id_signal_parameter.selection = ALPHA_MEMORY_BASE_db_memory_PRESENT;
                }
                 else if(Actuator_determine_memory_id_signal_parameter_c_var.kind == ALPHA_MEMORY_BASE_spare_memory_PRESENT)
                {
                    now.Actuator_determine_memory_id_signal_parameter.data.spare_memory = Actuator_determine_memory_id_signal_parameter_c_var.u.spare_memory;
                    
                    now.Actuator_determine_memory_id_signal_parameter.selection = ALPHA_MEMORY_BASE_spare_memory_PRESENT;
                }
                }
            }
            printf("channel_recv Actuator_determine_memory_id_channel: %d, %d, %d\n", Actuator_determine_memory_id_signal_parameter.data.db_memory, Actuator_determine_memory_id_signal_parameter.data.spare_memory, Actuator_determine_memory_id_signal_parameter.selection);
            Actuator_determine_memory_id_channel_used = 1;
            Actuator_0_PI_0_determine_memory_id(Actuator_determine_memory_id_signal_parameter);
            goto Actuator_determine_memory_id_loop;
        ::  empty(Actuator_determine_memory_id_channel);
            skip;
        fi;
        Actuator_lock!1;
    }
    od;
}
active proctype Controller_do_test() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_do_test_channel);
        Controller_lock?_;
Controller_do_test_loop:
        if
        ::  nempty(Controller_do_test_channel);
            Controller_do_test_channel?_;
            printf("channel_recv Controller_do_test_channel: 1\n");
            Controller_0_PI_0_do_test();
            goto Controller_do_test_loop;
        ::  empty(Controller_do_test_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Controller_memory_id_is() priority 1
{
    inited;
    do
    ::  atomic {
        nempty(Controller_memory_id_is_channel);
        Controller_lock?_;
Controller_memory_id_is_loop:
        if
        ::  nempty(Controller_memory_id_is_channel);
            Controller_memory_id_is_channel?Controller_memory_id_is_signal_parameter_message;
            c_code {
                {
                asn1SccALPHA_MEMORY_IDENTIFIER Controller_memory_id_is_signal_parameter_c_var;
                BitStream Controller_memory_id_is_signal_parameter_stream;
                int Controller_memory_id_is_signal_parameter_rc;BitStream_AttachBuffer(&Controller_memory_id_is_signal_parameter_stream,
                    now.Controller_memory_id_is_signal_parameter_message.data,
                    asn1SccALPHA_MEMORY_IDENTIFIER_REQUIRED_BYTES_FOR_ENCODING);
                asn1SccALPHA_MEMORY_IDENTIFIER_Decode(&Controller_memory_id_is_signal_parameter_c_var,
                    &Controller_memory_id_is_signal_parameter_stream,
                    &Controller_memory_id_is_signal_parameter_rc);
                now.Controller_memory_id_is_signal_parameter = Controller_memory_id_is_signal_parameter_c_var;
                }
            }
            printf("channel_recv Controller_memory_id_is_channel: %d\n", Controller_memory_id_is_signal_parameter);
            Controller_memory_id_is_channel_used = 1;
            Controller_0_PI_0_memory_id_is(Controller_memory_id_is_signal_parameter);
            goto Controller_memory_id_is_loop;
        ::  empty(Controller_memory_id_is_channel);
            skip;
        fi;
        Controller_lock!1;
    }
    od;
}
active proctype Environ_do_test() priority 1
{
    inited;
    do
    ::  atomic {
        Environ_0_RI_0_do_test();
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
