#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_parallel_0_left_0_state Actuator_States
#define Actuator_Context_parallel_0_right_0_state Actuator_States
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define MyInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID int
#define Observer_State_Kind int
#define Function_Event_actuator Actuator_Event
#define Function_Event_controller Controller_Event
#define Named_Function_Event_event Function_Event
#define Interface_Event_source PID
#define Interface_Event_dest PID
#define Interface_Event_event Function_Event
#define Observable_Event_input_event Interface_Event
#define Observable_Event_output_event Interface_Event
#define Observable_Event_unhandled_input Interface_Event
#define Events_Ty_elem Observable_Event
#define System_State_actuator_queue Events_Ty
#define System_State_controller_queue Events_Ty
#define System_State_actuator Actuator_Context
#define System_State_controller Controller_Context
#define Actuator_States_parallel_0_left_0_two 0
#define Actuator_States_parallel_0_left_0_one 1
#define Actuator_States_parallel_0_right_0_blue 2
#define Actuator_States_parallel_0_right 3
#define Actuator_States_parallel_0_right_0_green 4
#define Actuator_States_parallel 5
#define Actuator_States_parallel_0_right_0_red 6
#define Actuator_States_parallel_0_left_0_three 7
#define Actuator_States_state_0_end 8
#define Actuator_States_parallel_0_left 9
#define Controller_States_down 0
#define Controller_States_up 1
#define PID_env 0
#define PID_actuator 1
#define PID_controller 2
#define Actuator_Event_NONE 0
#define Actuator_Event_msg_in_NONE 0
#define Actuator_Event_msg_in_input_none_PRESENT 1
#define Actuator_Event_msg_in_ping_PRESENT 2
#define Actuator_Event_msg_in_tick_PRESENT 3
#define Actuator_Event_msg_in_PRESENT 1
#define Actuator_Event_msg_out_NONE 0
#define Actuator_Event_msg_out_pong_PRESENT 1
#define Actuator_Event_msg_out_PRESENT 2
#define Controller_Event_NONE 0
#define Controller_Event_msg_in_NONE 0
#define Controller_Event_msg_in_input_none_PRESENT 1
#define Controller_Event_msg_in_pong_PRESENT 2
#define Controller_Event_msg_in_PRESENT 1
#define Controller_Event_msg_out_NONE 0
#define Controller_Event_msg_out_ping_PRESENT 1
#define Controller_Event_msg_out_tick_PRESENT 2
#define Controller_Event_msg_out_PRESENT 2
#define Observer_State_Kind_regular_state 0
#define Observer_State_Kind_error_state 1
#define Observer_State_Kind_ignore_state 2
#define Observer_State_Kind_success_state 3
#define Function_Event_NONE 0
#define Function_Event_actuator_PRESENT 1
#define Function_Event_controller_PRESENT 2
#define Observable_Event_NONE 0
#define Observable_Event_no_event_PRESENT 1
#define Observable_Event_system_startup_PRESENT 2
#define Observable_Event_input_event_PRESENT 3
#define Observable_Event_output_event_PRESENT 4
#define Observable_Event_unhandled_input_PRESENT 5
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_parallel_0_left_0_state parallel_0_left_0_state;
    Actuator_Context_parallel_0_right_0_state parallel_0_right_0_state;
}

typedef Actuator_Event_msg_in_input_none {
    bit dummy;
}

typedef Actuator_Event_msg_in_ping {
    bit dummy;
}

typedef Actuator_Event_msg_in_tick {
    bit dummy;
}

typedef Actuator_Event_msg_out_pong {
    bit dummy;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
}

typedef Controller_Event_msg_in_input_none {
    bit dummy;
}

typedef Controller_Event_msg_in_pong {
    bit dummy;
}

typedef Controller_Event_msg_out_ping {
    bit dummy;
}

typedef Controller_Event_msg_out_tick {
    bit dummy;
}

typedef Named_Function_Event_id {
    byte data[80];
    int length;
}

typedef Observable_Event_no_event {
    bit dummy;
}

typedef Observable_Event_system_startup {
    bit dummy;
}

typedef T_Null_Record {
    bit dummy;
}

typedef Actuator_Event_msg_in_data {
    Actuator_Event_msg_in_input_none input_none;
    Actuator_Event_msg_in_ping ping;
    Actuator_Event_msg_in_tick tick;
}

typedef Actuator_Event_msg_out_data {
    Actuator_Event_msg_out_pong pong;
}

typedef Controller_Event_msg_in_data {
    Controller_Event_msg_in_input_none input_none;
    Controller_Event_msg_in_pong pong;
}

typedef Controller_Event_msg_out_data {
    Controller_Event_msg_out_ping ping;
    Controller_Event_msg_out_tick tick;
}

typedef Actuator_Event_msg_in {
    Actuator_Event_msg_in_data data;
    int selection;
}

typedef Actuator_Event_msg_out {
    Actuator_Event_msg_out_data data;
    int selection;
}

typedef Controller_Event_msg_in {
    Controller_Event_msg_in_data data;
    int selection;
}

typedef Controller_Event_msg_out {
    Controller_Event_msg_out_data data;
    int selection;
}

typedef Actuator_Event_data {
    Actuator_Event_msg_in msg_in;
    Actuator_Event_msg_out msg_out;
}

typedef Controller_Event_data {
    Controller_Event_msg_in msg_in;
    Controller_Event_msg_out msg_out;
}

typedef Actuator_Event {
    Actuator_Event_data data;
    int selection;
}

typedef Controller_Event {
    Controller_Event_data data;
    int selection;
}

typedef Function_Event_data {
    Function_Event_actuator actuator;
    Function_Event_controller controller;
}

typedef Function_Event {
    Function_Event_data data;
    int selection;
}

typedef Interface_Event {
    Interface_Event_source source;
    Interface_Event_dest dest;
    Interface_Event_event event;
}

typedef Named_Function_Event {
    Named_Function_Event_id id;
    Named_Function_Event_event event;
}

typedef Observable_Event_data {
    Observable_Event_no_event no_event;
    Observable_Event_system_startup system_startup;
    Observable_Event_input_event input_event;
    Observable_Event_output_event output_event;
    Observable_Event_unhandled_input unhandled_input;
}

typedef Observable_Event {
    Observable_Event_data data;
    int selection;
}

typedef Events_Ty {
    Events_Ty_elem data[10];
    int length;
}

typedef System_State {
    System_State_actuator_queue actuator_queue;
    System_State_controller_queue controller_queue;
    System_State_actuator actuator;
    System_State_controller controller;
}

Observable_Event nothing;
inline Actuator_States_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_state_assign_value(dst, src)
{
    Actuator_States_assign_value(dst, src);
}
inline Actuator_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_parallel_0_left_0_state_assign_value(dst, src)
{
    Actuator_States_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_right_0_state_assign_value(dst, src)
{
    Actuator_States_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_parallel_0_left_0_state_assign_value(dst.parallel_0_left_0_state, src.parallel_0_left_0_state);
    Actuator_Context_parallel_0_right_0_state_assign_value(dst.parallel_0_right_0_state, src.parallel_0_right_0_state);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_state_assign_value(dst, src)
{
    Controller_States_assign_value(dst, src);
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline T_Int32_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
}
inline T_Int8_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt8_assign_value(dst, src)
{
    dst = src;
}
inline T_Boolean_assign_value(dst, src)
{
    dst = src;
}
inline T_Null_Record_assign_value(dst, src)
{
    skip;
}
inline PID_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Actuator_Event_msg_in_ping_assign_value(dst, src)
{
    skip;
}
inline Actuator_Event_msg_in_tick_assign_value(dst, src)
{
    skip;
}
inline Actuator_Event_msg_in_assign_value(dst, src)
{
    Actuator_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Actuator_Event_msg_in_ping_assign_value(dst.data.ping, src.data.ping);
    Actuator_Event_msg_in_tick_assign_value(dst.data.tick, src.data.tick);
    dst.selection = src.selection;
}
inline Actuator_Event_msg_out_pong_assign_value(dst, src)
{
    skip;
}
inline Actuator_Event_msg_out_assign_value(dst, src)
{
    Actuator_Event_msg_out_pong_assign_value(dst.data.pong, src.data.pong);
    dst.selection = src.selection;
}
inline Actuator_Event_assign_value(dst, src)
{
    Actuator_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Actuator_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Controller_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Controller_Event_msg_in_pong_assign_value(dst, src)
{
    skip;
}
inline Controller_Event_msg_in_assign_value(dst, src)
{
    Controller_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Controller_Event_msg_in_pong_assign_value(dst.data.pong, src.data.pong);
    dst.selection = src.selection;
}
inline Controller_Event_msg_out_ping_assign_value(dst, src)
{
    skip;
}
inline Controller_Event_msg_out_tick_assign_value(dst, src)
{
    skip;
}
inline Controller_Event_msg_out_assign_value(dst, src)
{
    Controller_Event_msg_out_ping_assign_value(dst.data.ping, src.data.ping);
    Controller_Event_msg_out_tick_assign_value(dst.data.tick, src.data.tick);
    dst.selection = src.selection;
}
inline Controller_Event_assign_value(dst, src)
{
    Controller_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Controller_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Observer_State_Kind_assign_value(dst, src)
{
    dst = src;
}
inline Function_Event_actuator_assign_value(dst, src)
{
    Actuator_Event_assign_value(dst, src);
}
inline Function_Event_controller_assign_value(dst, src)
{
    Controller_Event_assign_value(dst, src);
}
inline Function_Event_assign_value(dst, src)
{
    Function_Event_actuator_assign_value(dst.data.actuator, src.data.actuator);
    Function_Event_controller_assign_value(dst.data.controller, src.data.controller);
    dst.selection = src.selection;
}
inline Named_Function_Event_id_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 79)
    {
        dst.data[i] = src.data[i];
    }
    dst.length = src.length;
}
inline Named_Function_Event_event_assign_value(dst, src)
{
    Function_Event_assign_value(dst, src);
}
inline Named_Function_Event_assign_value(dst, src)
{
    Named_Function_Event_id_assign_value(dst.id, src.id);
    Named_Function_Event_event_assign_value(dst.event, src.event);
}
inline Interface_Event_source_assign_value(dst, src)
{
    PID_assign_value(dst, src);
}
inline Interface_Event_dest_assign_value(dst, src)
{
    PID_assign_value(dst, src);
}
inline Interface_Event_event_assign_value(dst, src)
{
    Function_Event_assign_value(dst, src);
}
inline Interface_Event_assign_value(dst, src)
{
    Interface_Event_source_assign_value(dst.source, src.source);
    Interface_Event_dest_assign_value(dst.dest, src.dest);
    Interface_Event_event_assign_value(dst.event, src.event);
}
inline Observable_Event_no_event_assign_value(dst, src)
{
    skip;
}
inline Observable_Event_system_startup_assign_value(dst, src)
{
    skip;
}
inline Observable_Event_input_event_assign_value(dst, src)
{
    Interface_Event_assign_value(dst, src);
}
inline Observable_Event_output_event_assign_value(dst, src)
{
    Interface_Event_assign_value(dst, src);
}
inline Observable_Event_unhandled_input_assign_value(dst, src)
{
    Interface_Event_assign_value(dst, src);
}
inline Observable_Event_assign_value(dst, src)
{
    Observable_Event_no_event_assign_value(dst.data.no_event, src.data.no_event);
    Observable_Event_system_startup_assign_value(dst.data.system_startup, src.data.system_startup);
    Observable_Event_input_event_assign_value(dst.data.input_event, src.data.input_event);
    Observable_Event_output_event_assign_value(dst.data.output_event, src.data.output_event);
    Observable_Event_unhandled_input_assign_value(dst.data.unhandled_input, src.data.unhandled_input);
    dst.selection = src.selection;
}
inline Events_Ty_elem_assign_value(dst, src)
{
    Observable_Event_assign_value(dst, src);
}
inline Events_Ty_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 9)
    {
        Events_Ty_elem_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline System_State_actuator_queue_assign_value(dst, src)
{
    Events_Ty_assign_value(dst, src);
}
inline System_State_controller_queue_assign_value(dst, src)
{
    Events_Ty_assign_value(dst, src);
}
inline System_State_actuator_assign_value(dst, src)
{
    Actuator_Context_assign_value(dst, src);
}
inline System_State_controller_assign_value(dst, src)
{
    Controller_Context_assign_value(dst, src);
}
inline System_State_assign_value(dst, src)
{
    System_State_actuator_queue_assign_value(dst.actuator_queue, src.actuator_queue);
    System_State_controller_queue_assign_value(dst.controller_queue, src.controller_queue);
    System_State_actuator_assign_value(dst.actuator, src.actuator);
    System_State_controller_assign_value(dst.controller, src.controller);
}
inline nothing_init()
{
    d_step {
        nothing.selection = Observable_Event_no_event_PRESENT;
    }
}
