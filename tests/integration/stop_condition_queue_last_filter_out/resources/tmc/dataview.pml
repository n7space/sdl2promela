#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_ping_param MyInteger
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_test_param MyTestInteger
#define Controller_Context_ping_param MyInteger
#define MyInteger int
#define MyTestInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID int
#define Actuator_Event_msg_in_ping_p1 MyInteger
#define Controller_Event_msg_in_test_p1 MyTestInteger
#define Controller_Event_msg_out_ping_p1 MyInteger
#define Environ_Event_msg_out_test_p1 MyTestInteger
#define Observer_State_Kind int
#define Function_Event_actuator Actuator_Event
#define Function_Event_controller Controller_Event
#define Function_Event_environ Environ_Event
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
#define Actuator_States_special 0
#define Actuator_States_wait 1
#define Actuator_States_error 2
#define Controller_States_wait 0
#define Controller_States_testing 1
#define PID_env 0
#define PID_actuator 1
#define PID_controller 2
#define PID_environ 3
#define Actuator_Event_NONE 0
#define Actuator_Event_msg_in_NONE 0
#define Actuator_Event_msg_in_input_none_PRESENT 1
#define Actuator_Event_msg_in_ping_PRESENT 2
#define Actuator_Event_msg_in_PRESENT 1
#define Actuator_Event_msg_out_NONE 0
#define Actuator_Event_msg_out_pong_PRESENT 1
#define Actuator_Event_msg_out_PRESENT 2
#define Controller_Event_NONE 0
#define Controller_Event_msg_in_NONE 0
#define Controller_Event_msg_in_input_none_PRESENT 1
#define Controller_Event_msg_in_pong_PRESENT 2
#define Controller_Event_msg_in_test_PRESENT 3
#define Controller_Event_msg_in_PRESENT 1
#define Controller_Event_msg_out_NONE 0
#define Controller_Event_msg_out_ping_PRESENT 1
#define Controller_Event_msg_out_PRESENT 2
#define Environ_Event_NONE 0
#define Environ_Event_msg_out_NONE 0
#define Environ_Event_msg_out_test_PRESENT 1
#define Environ_Event_msg_out_PRESENT 1
#define Observer_State_Kind_regular_state 0
#define Observer_State_Kind_error_state 1
#define Observer_State_Kind_ignore_state 2
#define Observer_State_Kind_success_state 3
#define Function_Event_NONE 0
#define Function_Event_actuator_PRESENT 1
#define Function_Event_controller_PRESENT 2
#define Function_Event_environ_PRESENT 3
#define Observable_Event_NONE 0
#define Observable_Event_no_event_PRESENT 1
#define Observable_Event_system_startup_PRESENT 2
#define Observable_Event_input_event_PRESENT 3
#define Observable_Event_output_event_PRESENT 4
#define Observable_Event_unhandled_input_PRESENT 5
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_ping_param ping_param;
}

typedef Actuator_Event_msg_in_input_none {
    bit dummy;
}

typedef Actuator_Event_msg_in_ping {
    Actuator_Event_msg_in_ping_p1 p1;
}

typedef Actuator_Event_msg_out_pong {
    bit dummy;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_test_param test_param;
    Controller_Context_ping_param ping_param;
}

typedef Controller_Event_msg_in_input_none {
    bit dummy;
}

typedef Controller_Event_msg_in_pong {
    bit dummy;
}

typedef Controller_Event_msg_in_test {
    Controller_Event_msg_in_test_p1 p1;
}

typedef Controller_Event_msg_out_ping {
    Controller_Event_msg_out_ping_p1 p1;
}

typedef Environ_Event_msg_out_test {
    Environ_Event_msg_out_test_p1 p1;
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
}

typedef Actuator_Event_msg_out_data {
    Actuator_Event_msg_out_pong pong;
}

typedef Controller_Event_msg_in_data {
    Controller_Event_msg_in_input_none input_none;
    Controller_Event_msg_in_pong pong;
    Controller_Event_msg_in_test test;
}

typedef Controller_Event_msg_out_data {
    Controller_Event_msg_out_ping ping;
}

typedef Environ_Event_msg_out_data {
    Environ_Event_msg_out_test test;
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

typedef Environ_Event_msg_out {
    Environ_Event_msg_out_data data;
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

typedef Environ_Event_data {
    Environ_Event_msg_out msg_out;
}

typedef Actuator_Event {
    Actuator_Event_data data;
    int selection;
}

typedef Controller_Event {
    Controller_Event_data data;
    int selection;
}

typedef Environ_Event {
    Environ_Event_data data;
    int selection;
}

typedef Function_Event_data {
    Function_Event_actuator actuator;
    Function_Event_controller controller;
    Function_Event_environ environ;
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
inline Actuator_States_range_check(Actuator_States_value_check)
{
    assert((((Actuator_States_value_check == Actuator_States_special) || (Actuator_States_value_check == Actuator_States_wait)) || (Actuator_States_value_check == Actuator_States_error)));
}
inline Actuator_Context_state_assign_value(dst, src)
{
    Actuator_States_assign_value(dst, src);
}
inline Actuator_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_ping_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_ping_param_assign_value(dst.ping_param, src.ping_param);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
}
inline Controller_States_range_check(Controller_States_value_check)
{
    assert(((Controller_States_value_check == Controller_States_wait) || (Controller_States_value_check == Controller_States_testing)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    Controller_States_assign_value(dst, src);
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_test_param_assign_value(dst, src)
{
    MyTestInteger_assign_value(dst, src);
}
inline Controller_Context_ping_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_test_param_assign_value(dst.test_param, src.test_param);
    Controller_Context_ping_param_assign_value(dst.ping_param, src.ping_param);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyInteger_range_check(MyInteger_value_check)
{
    assert(((MyInteger_value_check >= 0) && (MyInteger_value_check <= 10000)));
}
inline MyTestInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyTestInteger_range_check(MyTestInteger_value_check)
{
    assert(((MyTestInteger_value_check >= 0) && (MyTestInteger_value_check <= 5)));
}
inline T_Int32_assign_value(dst, src)
{
    dst = src;
}
inline T_Int32_range_check(T_Int32_value_check)
{
    assert(((T_Int32_value_check >= -2147483648) && (T_Int32_value_check <= 2147483647)));
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt32_range_check(T_UInt32_value_check)
{
    assert(((T_UInt32_value_check >= 0) && (T_UInt32_value_check <= -1)));
}
inline T_Int8_assign_value(dst, src)
{
    dst = src;
}
inline T_Int8_range_check(T_Int8_value_check)
{
    assert(((T_Int8_value_check >= -128) && (T_Int8_value_check <= 127)));
}
inline T_UInt8_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt8_range_check(T_UInt8_value_check)
{
    assert(((T_UInt8_value_check >= 0) && (T_UInt8_value_check <= 255)));
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
inline PID_range_check(PID_value_check)
{
    assert(((((PID_value_check == PID_env) || (PID_value_check == PID_actuator)) || (PID_value_check == PID_controller)) || (PID_value_check == PID_environ)));
}
inline Actuator_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Actuator_Event_msg_in_ping_p1_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Event_msg_in_ping_assign_value(dst, src)
{
    Actuator_Event_msg_in_ping_p1_assign_value(dst.p1, src.p1);
}
inline Actuator_Event_msg_in_assign_value(dst, src)
{
    Actuator_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Actuator_Event_msg_in_ping_assign_value(dst.data.ping, src.data.ping);
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
inline Controller_Event_msg_in_test_p1_assign_value(dst, src)
{
    MyTestInteger_assign_value(dst, src);
}
inline Controller_Event_msg_in_test_assign_value(dst, src)
{
    Controller_Event_msg_in_test_p1_assign_value(dst.p1, src.p1);
}
inline Controller_Event_msg_in_assign_value(dst, src)
{
    Controller_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Controller_Event_msg_in_pong_assign_value(dst.data.pong, src.data.pong);
    Controller_Event_msg_in_test_assign_value(dst.data.test, src.data.test);
    dst.selection = src.selection;
}
inline Controller_Event_msg_out_ping_p1_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Event_msg_out_ping_assign_value(dst, src)
{
    Controller_Event_msg_out_ping_p1_assign_value(dst.p1, src.p1);
}
inline Controller_Event_msg_out_assign_value(dst, src)
{
    Controller_Event_msg_out_ping_assign_value(dst.data.ping, src.data.ping);
    dst.selection = src.selection;
}
inline Controller_Event_assign_value(dst, src)
{
    Controller_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Controller_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Environ_Event_msg_out_test_p1_assign_value(dst, src)
{
    MyTestInteger_assign_value(dst, src);
}
inline Environ_Event_msg_out_test_assign_value(dst, src)
{
    Environ_Event_msg_out_test_p1_assign_value(dst.p1, src.p1);
}
inline Environ_Event_msg_out_assign_value(dst, src)
{
    Environ_Event_msg_out_test_assign_value(dst.data.test, src.data.test);
    dst.selection = src.selection;
}
inline Environ_Event_assign_value(dst, src)
{
    Environ_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Observer_State_Kind_assign_value(dst, src)
{
    dst = src;
}
inline Observer_State_Kind_range_check(Observer_State_Kind_value_check)
{
    assert(((((Observer_State_Kind_value_check == Observer_State_Kind_regular_state) || (Observer_State_Kind_value_check == Observer_State_Kind_error_state)) || (Observer_State_Kind_value_check == Observer_State_Kind_ignore_state)) || (Observer_State_Kind_value_check == Observer_State_Kind_success_state)));
}
inline Function_Event_actuator_assign_value(dst, src)
{
    Actuator_Event_assign_value(dst, src);
}
inline Function_Event_controller_assign_value(dst, src)
{
    Controller_Event_assign_value(dst, src);
}
inline Function_Event_environ_assign_value(dst, src)
{
    Environ_Event_assign_value(dst, src);
}
inline Function_Event_assign_value(dst, src)
{
    Function_Event_actuator_assign_value(dst.data.actuator, src.data.actuator);
    Function_Event_controller_assign_value(dst.data.controller, src.data.controller);
    Function_Event_environ_assign_value(dst.data.environ, src.data.environ);
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
inline Named_Function_Event_id_range_check(Named_Function_Event_id_size_check)
{
    assert(((Named_Function_Event_id_size_check >= 1) && (Named_Function_Event_id_size_check <= 80)));
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
inline Events_Ty_range_check(Events_Ty_size_check)
{
    assert(((Events_Ty_size_check >= 0) && (Events_Ty_size_check <= 10)));
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
