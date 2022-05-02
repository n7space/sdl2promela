#define Inputobserver_States int
#define Inputobserver_Context_state Inputobserver_States
#define Inputobserver_Context_init_done bool
#define Inputobserver_Context_received_action T_Boolean
#define Inputobserver_Context_received_trigger T_Boolean
#define Inputobserver_Mmi_Event_Msg_In_Selection int
#define Inputobserver_Mmi_Event_Msg_Out_Selection int
#define Inputobserver_Mmi_Event_Selection int
#define Inputobserver_Model_Event_Msg_In_Selection int
#define Inputobserver_Model_Event_Msg_Out_Selection int
#define Inputobserver_Model_Event_Selection int
#define Inputobserver_Function_Event_Selection int
#define Inputobserver_Observable_Event_Selection int

#define MyInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID int
#define Mmi_Event_msg_in_action_y MyInteger
#define Mmi_Event_msg_out_trigger_z MyInteger
#define Model_Event_msg_in_trigger_z MyInteger
#define Model_Event_msg_out_action_y MyInteger
#define Observer_State_Kind int
#define Function_Event_mmi Mmi_Event
#define Function_Event_model Model_Event
#define Named_Function_Event_event Function_Event
#define Interface_Event_source PID
#define Interface_Event_dest PID
#define Interface_Event_event Function_Event
#define Observable_Event_input_event Interface_Event
#define Observable_Event_output_event Interface_Event
#define Observable_Event_unhandled_input Interface_Event
#define Events_Ty_elem Observable_Event
#define System_State_model_queue Events_Ty
#define System_State_model Model_Context
#define Inputobserver_States_waitfortrigger 0
#define Inputobserver_States_done 1
#define Inputobserver_States_waitforaction 2
#define Inputobserver_Mmi_Event_Msg_In_Selection_action_present 1
#define Inputobserver_Mmi_Event_Msg_Out_Selection_trigger_present 1
#define Inputobserver_Mmi_Event_Selection_msg_in_present 1
#define Inputobserver_Mmi_Event_Selection_msg_out_present 2
#define Inputobserver_Model_Event_Msg_In_Selection_input_none_present 1
#define Inputobserver_Model_Event_Msg_In_Selection_trigger_present 2
#define Inputobserver_Model_Event_Msg_Out_Selection_action_present 1
#define Inputobserver_Model_Event_Selection_msg_in_present 1
#define Inputobserver_Model_Event_Selection_msg_out_present 2
#define Inputobserver_Function_Event_Selection_mmi_present 1
#define Inputobserver_Function_Event_Selection_model_present 2
#define Inputobserver_Observable_Event_Selection_no_event_present 1
#define Inputobserver_Observable_Event_Selection_system_startup_present 2
#define Inputobserver_Observable_Event_Selection_input_event_present 3
#define Inputobserver_Observable_Event_Selection_output_event_present 4
#define Inputobserver_Observable_Event_Selection_unhandled_input_present 5

#define Observer_State_Kind_regular_state 0
#define Observer_State_Kind_error_state 1
#define Observer_State_Kind_ignore_state 2
#define Observer_State_Kind_success_state 3

typedef Inputobserver_Context {
    Inputobserver_Context_state state;
    Inputobserver_Context_init_done init_done;
    Inputobserver_Context_received_action received_action;
    Inputobserver_Context_received_trigger received_trigger;
}

inline Inputobserver_States_assign_value(dst, src)
{
    dst = src;
}
inline Inputobserver_Context_state_assign_value(dst, src)
{
    Inputobserver_States_assign_value(dst, src);
}
inline Inputobserver_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Inputobserver_Context_received_action_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Inputobserver_Context_received_trigger_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}

inline MyInteger_assign_value(dst, src)
{
    dst = src;
}

inline T_Boolean_assign_value(dst, src)
{
    dst = src;
}


#include "InputObserver.pml"

typedef system_state {
    Inputobserver_Context inputobserver;
}

system_state global_state;

init
{
    MyInteger signal_parameter;
    signal_parameter = 0;
    InputObserver_0_init()
    assert (!global_state.inputobserver.received_trigger);
    assert (!global_state.inputobserver.received_action);
    InputObserver_0_PI_0_trigger_in(signal_parameter);
    InputObserver_0_PI_0_action_in(signal_parameter);
    assert (global_state.inputobserver.received_trigger);
    assert (global_state.inputobserver.received_action);
}
