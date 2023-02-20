#define Observer_States int
#define Observer_Context_state int
#define Observer_Context_init_done bool
#define Observer_Context_sender int
#define Observer_Context_offspring int
#define Observer_Myunion_Selection int
#define Observer_Actuator_Event_Msg_In_Selection int
#define Observer_Actuator_Event_Msg_Out_Selection int
#define Observer_Actuator_Event_Selection int
#define Observer_Controller_Event_Msg_In_Selection int
#define Observer_Controller_Event_Msg_Out_Selection int
#define Observer_Controller_Event_Selection int
#define Observer_Function_Event_Selection int
#define Observer_Observable_Event_Selection int
#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_param int
#define Actuator_Context_seq_first int
#define Actuator_Context_seq_second int
#define Actuator_Context_arr_elem int
#define Actuator_Context_alt_left int
#define Actuator_Context_alt_right_first int
#define Actuator_Context_alt_right_second int
#define Actuator_Myunion_Selection int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_apollo int
#define Controller_Myunion_Selection int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define MyInteger int
#define MySeq_first int
#define MySeq_second int
#define MyArray_elem int
#define MyUnion_left int
#define MyUnion_right_first int
#define MyUnion_right_second int
#define PID_Range int
#define PID int
#define TimerData_timer_enabled bool
#define TimerData_interval int
#define Observer_States_error 0
#define Observer_States_idle 1
#define Observer_Context_state_error 0
#define Observer_Context_state_idle 1
#define Observer_Context_sender_actuator 0
#define Observer_Context_sender_controller 1
#define Observer_Context_sender_env 2
#define Observer_Context_offspring_actuator 0
#define Observer_Context_offspring_controller 1
#define Observer_Context_offspring_env 2
#define Observer_Myunion_Selection_left_present 1
#define Observer_Myunion_Selection_right_present 2
#define Observer_Actuator_Event_Msg_In_Selection_input_none_present 1
#define Observer_Actuator_Event_Msg_In_Selection_ping_present 2
#define Observer_Actuator_Event_Msg_Out_Selection_pong_present 1
#define Observer_Actuator_Event_Selection_msg_in_present 1
#define Observer_Actuator_Event_Selection_msg_out_present 2
#define Observer_Controller_Event_Msg_In_Selection_input_none_present 1
#define Observer_Controller_Event_Msg_In_Selection_pong_present 2
#define Observer_Controller_Event_Msg_Out_Selection_ping_present 1
#define Observer_Controller_Event_Selection_msg_in_present 1
#define Observer_Controller_Event_Selection_msg_out_present 2
#define Observer_Function_Event_Selection_actuator_present 1
#define Observer_Function_Event_Selection_controller_present 2
#define Observer_Observable_Event_Selection_no_event_present 1
#define Observer_Observable_Event_Selection_system_startup_present 2
#define Observer_Observable_Event_Selection_input_event_present 3
#define Observer_Observable_Event_Selection_output_event_present 4
#define Observer_Observable_Event_Selection_unhandled_input_present 5
#define Actuator_States_wait 0
#define Actuator_Context_state_wait 0
#define Actuator_Context_sender_actuator 0
#define Actuator_Context_sender_controller 1
#define Actuator_Context_sender_env 2
#define Actuator_Context_offspring_actuator 0
#define Actuator_Context_offspring_controller 1
#define Actuator_Context_offspring_env 2
#define Actuator_Context_alt_NONE 0
#define Actuator_Context_alt_left_PRESENT 1
#define Actuator_context_alt_selection_left_PRESENT 1
#define Actuator_Context_alt_right_PRESENT 2
#define Actuator_context_alt_selection_right_PRESENT 2
#define Actuator_Myunion_Selection_left_present 1
#define Actuator_Myunion_Selection_right_present 2
#define Controller_States_wait 0
#define Controller_Context_state_wait 0
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Myunion_Selection_left_present 1
#define Controller_Myunion_Selection_right_present 2
#define MyUnion_NONE 0
#define MyUnion_left_PRESENT 1
#define Myunion_selection_left_PRESENT 1
#define MyUnion_right_PRESENT 2
#define Myunion_selection_right_PRESENT 2
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context_alt_right {
    Actuator_Context_alt_right_first first;
    Actuator_Context_alt_right_second second;
}

typedef Actuator_Context_arr {
    Actuator_Context_arr_elem data[2];
}

typedef Actuator_Context_seq {
    Actuator_Context_seq_first first;
    Actuator_Context_seq_second second;
}

typedef AggregateTimerData_actuator {
    bit dummy;
}

typedef AggregateTimerData_controller {
    bit dummy;
}

typedef AggregateTimerData_dummy_entry {
    bit dummy;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_apollo apollo;
}

typedef MyArray {
    MyArray_elem data[2];
}

typedef MySeq {
    MySeq_first first;
    MySeq_second second;
}

typedef MyUnion_right {
    MyUnion_right_first first;
    MyUnion_right_second second;
}

typedef Observer_Context {
    Observer_Context_state state;
    Observer_Context_init_done init_done;
    Observer_Context_sender sender;
    Observer_Context_offspring offspring;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef Actuator_Context_alt_data {
    Actuator_Context_alt_left left;
    Actuator_Context_alt_right right;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef MyUnion_data {
    MyUnion_left left;
    MyUnion_right right;
}

typedef Actuator_Context_alt {
    Actuator_Context_alt_data data;
    int selection;
}

typedef MyUnion {
    MyUnion_data data;
    int selection;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_param param;
    Actuator_Context_seq seq;
    Actuator_Context_arr arr;
    Actuator_Context_alt alt;
}

inline Observer_States_assign_value(dst, src)
{
    dst = src;
    Observer_States_range_check(dst);
}
inline Observer_States_range_check(Observer_States_vc)
{
    assert(((Observer_States_vc == Observer_States_error) || (Observer_States_vc == Observer_States_idle)));
}
inline Observer_Context_state_assign_value(dst, src)
{
    dst = src;
    Observer_Context_state_range_check(dst);
}
inline Observer_Context_state_range_check(Observer_Context_state_vc)
{
    assert(((Observer_Context_state_vc == Observer_Context_state_error) || (Observer_Context_state_vc == Observer_Context_state_idle)));
}
inline Observer_Context_init_done_assign_value(dst, src)
{
    dst = src;
    Observer_Context_init_done_range_check(dst);
}
inline Observer_Context_init_done_range_check(Observer_Context_init_done_vc)
{
    assert(true);
}
inline Observer_Context_sender_assign_value(dst, src)
{
    dst = src;
    Observer_Context_sender_range_check(dst);
}
inline Observer_Context_sender_range_check(Observer_Context_sender_vc)
{
    assert((((Observer_Context_sender_vc == Observer_Context_sender_actuator) || (Observer_Context_sender_vc == Observer_Context_sender_controller)) || (Observer_Context_sender_vc == Observer_Context_sender_env)));
}
inline Observer_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Observer_Context_offspring_range_check(dst);
}
inline Observer_Context_offspring_range_check(Observer_Context_offspring_vc)
{
    assert((((Observer_Context_offspring_vc == Observer_Context_offspring_actuator) || (Observer_Context_offspring_vc == Observer_Context_offspring_controller)) || (Observer_Context_offspring_vc == Observer_Context_offspring_env)));
}
inline Observer_Context_assign_value(dst, src)
{
    Observer_Context_state_assign_value(dst.state, src.state);
    Observer_Context_init_done_assign_value(dst.init_done, src.init_done);
    Observer_Context_sender_assign_value(dst.sender, src.sender);
    Observer_Context_offspring_assign_value(dst.offspring, src.offspring);
}
inline Observer_Myunion_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Myunion_Selection_range_check(dst);
}
inline Observer_Myunion_Selection_range_check(Observer_Myunion_Selection_vc)
{
    assert(((Observer_Myunion_Selection_vc == Observer_Myunion_Selection_left_present) || (Observer_Myunion_Selection_vc == Observer_Myunion_Selection_right_present)));
}
inline Observer_Actuator_Event_Msg_In_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Actuator_Event_Msg_In_Selection_range_check(dst);
}
inline Observer_Actuator_Event_Msg_In_Selection_range_check(Observer_Actuator_Event_Msg_In_Selection_vc)
{
    assert(((Observer_Actuator_Event_Msg_In_Selection_vc == Observer_Actuator_Event_Msg_In_Selection_input_none_present) || (Observer_Actuator_Event_Msg_In_Selection_vc == Observer_Actuator_Event_Msg_In_Selection_ping_present)));
}
inline Observer_Actuator_Event_Msg_Out_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Actuator_Event_Msg_Out_Selection_range_check(dst);
}
inline Observer_Actuator_Event_Msg_Out_Selection_range_check(Observer_Actuator_Event_Msg_Out_Selection_vc)
{
    assert((Observer_Actuator_Event_Msg_Out_Selection_vc == Observer_Actuator_Event_Msg_Out_Selection_pong_present));
}
inline Observer_Actuator_Event_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Actuator_Event_Selection_range_check(dst);
}
inline Observer_Actuator_Event_Selection_range_check(Observer_Actuator_Event_Selection_vc)
{
    assert(((Observer_Actuator_Event_Selection_vc == Observer_Actuator_Event_Selection_msg_in_present) || (Observer_Actuator_Event_Selection_vc == Observer_Actuator_Event_Selection_msg_out_present)));
}
inline Observer_Controller_Event_Msg_In_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Controller_Event_Msg_In_Selection_range_check(dst);
}
inline Observer_Controller_Event_Msg_In_Selection_range_check(Observer_Controller_Event_Msg_In_Selection_vc)
{
    assert(((Observer_Controller_Event_Msg_In_Selection_vc == Observer_Controller_Event_Msg_In_Selection_input_none_present) || (Observer_Controller_Event_Msg_In_Selection_vc == Observer_Controller_Event_Msg_In_Selection_pong_present)));
}
inline Observer_Controller_Event_Msg_Out_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Controller_Event_Msg_Out_Selection_range_check(dst);
}
inline Observer_Controller_Event_Msg_Out_Selection_range_check(Observer_Controller_Event_Msg_Out_Selection_vc)
{
    assert((Observer_Controller_Event_Msg_Out_Selection_vc == Observer_Controller_Event_Msg_Out_Selection_ping_present));
}
inline Observer_Controller_Event_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Controller_Event_Selection_range_check(dst);
}
inline Observer_Controller_Event_Selection_range_check(Observer_Controller_Event_Selection_vc)
{
    assert(((Observer_Controller_Event_Selection_vc == Observer_Controller_Event_Selection_msg_in_present) || (Observer_Controller_Event_Selection_vc == Observer_Controller_Event_Selection_msg_out_present)));
}
inline Observer_Function_Event_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Function_Event_Selection_range_check(dst);
}
inline Observer_Function_Event_Selection_range_check(Observer_Function_Event_Selection_vc)
{
    assert(((Observer_Function_Event_Selection_vc == Observer_Function_Event_Selection_actuator_present) || (Observer_Function_Event_Selection_vc == Observer_Function_Event_Selection_controller_present)));
}
inline Observer_Observable_Event_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Observable_Event_Selection_range_check(dst);
}
inline Observer_Observable_Event_Selection_range_check(Observer_Observable_Event_Selection_vc)
{
    assert((((((Observer_Observable_Event_Selection_vc == Observer_Observable_Event_Selection_no_event_present) || (Observer_Observable_Event_Selection_vc == Observer_Observable_Event_Selection_system_startup_present)) || (Observer_Observable_Event_Selection_vc == Observer_Observable_Event_Selection_input_event_present)) || (Observer_Observable_Event_Selection_vc == Observer_Observable_Event_Selection_output_event_present)) || (Observer_Observable_Event_Selection_vc == Observer_Observable_Event_Selection_unhandled_input_present)));
}
inline Actuator_States_assign_value(dst, src)
{
    dst = src;
    Actuator_States_range_check(dst);
}
inline Actuator_States_range_check(Actuator_States_vc)
{
    assert((Actuator_States_vc == Actuator_States_wait));
}
inline Actuator_Context_state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_state_range_check(dst);
}
inline Actuator_Context_state_range_check(Actuator_Context_state_vc)
{
    assert((Actuator_Context_state_vc == Actuator_Context_state_wait));
}
inline Actuator_Context_init_done_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_init_done_range_check(dst);
}
inline Actuator_Context_init_done_range_check(Actuator_Context_init_done_vc)
{
    assert(true);
}
inline Actuator_Context_sender_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_sender_range_check(dst);
}
inline Actuator_Context_sender_range_check(Actuator_Context_sender_vc)
{
    assert((((Actuator_Context_sender_vc == Actuator_Context_sender_actuator) || (Actuator_Context_sender_vc == Actuator_Context_sender_controller)) || (Actuator_Context_sender_vc == Actuator_Context_sender_env)));
}
inline Actuator_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_offspring_range_check(dst);
}
inline Actuator_Context_offspring_range_check(Actuator_Context_offspring_vc)
{
    assert((((Actuator_Context_offspring_vc == Actuator_Context_offspring_actuator) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_controller)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_env)));
}
inline Actuator_Context_param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_param_range_check(dst);
}
inline Actuator_Context_param_range_check(Actuator_Context_param_vc)
{
    assert(((Actuator_Context_param_vc >= 0) && (Actuator_Context_param_vc <= 10000)));
}
inline Actuator_Context_seq_first_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_seq_first_range_check(dst);
}
inline Actuator_Context_seq_first_range_check(Actuator_Context_seq_first_vc)
{
    assert(((Actuator_Context_seq_first_vc >= 0) && (Actuator_Context_seq_first_vc <= 10000)));
}
inline Actuator_Context_seq_second_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_seq_second_range_check(dst);
}
inline Actuator_Context_seq_second_range_check(Actuator_Context_seq_second_vc)
{
    assert(((Actuator_Context_seq_second_vc >= 0) && (Actuator_Context_seq_second_vc <= 10000)));
}
inline Actuator_Context_seq_assign_value(dst, src)
{
    Actuator_Context_seq_first_assign_value(dst.first, src.first);
    Actuator_Context_seq_second_assign_value(dst.second, src.second);
}
inline Actuator_Context_arr_elem_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_arr_elem_range_check(dst);
}
inline Actuator_Context_arr_elem_range_check(Actuator_Context_arr_elem_vc)
{
    assert(((Actuator_Context_arr_elem_vc >= 0) && (Actuator_Context_arr_elem_vc <= 10000)));
}
inline Actuator_Context_arr_elem_init_value(dst)
{
    Actuator_Context_arr_elem_assign_value(dst, 0);
}
inline Actuator_Context_arr_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. 1)
    {
        Actuator_Context_arr_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
}
inline Actuator_Context_alt_left_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_alt_left_range_check(dst);
}
inline Actuator_Context_alt_left_range_check(Actuator_Context_alt_left_vc)
{
    assert(((Actuator_Context_alt_left_vc >= 0) && (Actuator_Context_alt_left_vc <= 10000)));
}
inline Actuator_Context_alt_right_first_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_alt_right_first_range_check(dst);
}
inline Actuator_Context_alt_right_first_range_check(Actuator_Context_alt_right_first_vc)
{
    assert(((Actuator_Context_alt_right_first_vc >= 0) && (Actuator_Context_alt_right_first_vc <= 10000)));
}
inline Actuator_Context_alt_right_second_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_alt_right_second_range_check(dst);
}
inline Actuator_Context_alt_right_second_range_check(Actuator_Context_alt_right_second_vc)
{
    assert(((Actuator_Context_alt_right_second_vc >= 0) && (Actuator_Context_alt_right_second_vc <= 10000)));
}
inline Actuator_Context_alt_right_assign_value(dst, src)
{
    Actuator_Context_alt_right_first_assign_value(dst.first, src.first);
    Actuator_Context_alt_right_second_assign_value(dst.second, src.second);
}
inline Actuator_Context_alt_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context_alt_left_PRESENT);
        Actuator_Context_alt_left_assign_value(dst.data.left, src.data.left);
    ::  (dst.selection == Actuator_Context_alt_right_PRESENT);
        Actuator_Context_alt_right_assign_value(dst.data.right, src.data.right);
    ::  else;
        skip;
    fi;
}
inline Actuator_context_alt_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_param_assign_value(dst.param, src.param);
    Actuator_Context_seq_assign_value(dst.seq, src.seq);
    Actuator_Context_arr_assign_value(dst.arr, src.arr);
    Actuator_Context_alt_assign_value(dst.alt, src.alt);
}
inline Actuator_Myunion_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Myunion_Selection_range_check(dst);
}
inline Actuator_Myunion_Selection_range_check(Actuator_Myunion_Selection_vc)
{
    assert(((Actuator_Myunion_Selection_vc == Actuator_Myunion_Selection_left_present) || (Actuator_Myunion_Selection_vc == Actuator_Myunion_Selection_right_present)));
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((Controller_States_vc == Controller_States_wait));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert((Controller_Context_state_vc == Controller_Context_state_wait));
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
    Controller_Context_init_done_range_check(dst);
}
inline Controller_Context_init_done_range_check(Controller_Context_init_done_vc)
{
    assert(true);
}
inline Controller_Context_sender_assign_value(dst, src)
{
    dst = src;
    Controller_Context_sender_range_check(dst);
}
inline Controller_Context_sender_range_check(Controller_Context_sender_vc)
{
    assert((((Controller_Context_sender_vc == Controller_Context_sender_actuator) || (Controller_Context_sender_vc == Controller_Context_sender_controller)) || (Controller_Context_sender_vc == Controller_Context_sender_env)));
}
inline Controller_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context_offspring_range_check(dst);
}
inline Controller_Context_offspring_range_check(Controller_Context_offspring_vc)
{
    assert((((Controller_Context_offspring_vc == Controller_Context_offspring_actuator) || (Controller_Context_offspring_vc == Controller_Context_offspring_controller)) || (Controller_Context_offspring_vc == Controller_Context_offspring_env)));
}
inline Controller_Context_apollo_assign_value(dst, src)
{
    dst = src;
    Controller_Context_apollo_range_check(dst);
}
inline Controller_Context_apollo_range_check(Controller_Context_apollo_vc)
{
    assert(((Controller_Context_apollo_vc >= 0) && (Controller_Context_apollo_vc <= 10000)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_apollo_assign_value(dst.apollo, src.apollo);
}
inline Controller_Myunion_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Myunion_Selection_range_check(dst);
}
inline Controller_Myunion_Selection_range_check(Controller_Myunion_Selection_vc)
{
    assert(((Controller_Myunion_Selection_vc == Controller_Myunion_Selection_left_present) || (Controller_Myunion_Selection_vc == Controller_Myunion_Selection_right_present)));
}
inline T_Int32_assign_value(dst, src)
{
    dst = src;
    T_Int32_range_check(dst);
}
inline T_Int32_range_check(T_Int32_vc)
{
    assert(((T_Int32_vc >= -2147483648) && (T_Int32_vc <= 2147483647)));
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
    T_UInt32_range_check(dst);
}
inline T_UInt32_range_check(T_UInt32_vc)
{
    assert(((T_UInt32_vc >= 0) && (T_UInt32_vc <= -1)));
}
inline T_Int8_assign_value(dst, src)
{
    dst = src;
    T_Int8_range_check(dst);
}
inline T_Int8_range_check(T_Int8_vc)
{
    assert(((T_Int8_vc >= -128) && (T_Int8_vc <= 127)));
}
inline T_UInt8_assign_value(dst, src)
{
    dst = src;
    T_UInt8_range_check(dst);
}
inline T_UInt8_range_check(T_UInt8_vc)
{
    assert(((T_UInt8_vc >= 0) && (T_UInt8_vc <= 255)));
}
inline T_Boolean_assign_value(dst, src)
{
    dst = src;
    T_Boolean_range_check(dst);
}
inline T_Boolean_range_check(T_Boolean_vc)
{
    assert(true);
}
inline T_Null_Record_assign_value(dst, src)
{
    skip;
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
    MyInteger_range_check(dst);
}
inline MyInteger_range_check(MyInteger_vc)
{
    assert(((MyInteger_vc >= 0) && (MyInteger_vc <= 10000)));
}
inline MySeq_first_assign_value(dst, src)
{
    dst = src;
    MySeq_first_range_check(dst);
}
inline MySeq_first_range_check(MySeq_first_vc)
{
    assert(((MySeq_first_vc >= 0) && (MySeq_first_vc <= 10000)));
}
inline MySeq_second_assign_value(dst, src)
{
    dst = src;
    MySeq_second_range_check(dst);
}
inline MySeq_second_range_check(MySeq_second_vc)
{
    assert(((MySeq_second_vc >= 0) && (MySeq_second_vc <= 10000)));
}
inline MySeq_assign_value(dst, src)
{
    MySeq_first_assign_value(dst.first, src.first);
    MySeq_second_assign_value(dst.second, src.second);
}
inline MyArray_elem_assign_value(dst, src)
{
    dst = src;
    MyArray_elem_range_check(dst);
}
inline MyArray_elem_range_check(MyArray_elem_vc)
{
    assert(((MyArray_elem_vc >= 0) && (MyArray_elem_vc <= 10000)));
}
inline MyArray_elem_init_value(dst)
{
    MyArray_elem_assign_value(dst, 0);
}
inline MyArray_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. 1)
    {
        MyArray_elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
}
inline MyUnion_left_assign_value(dst, src)
{
    dst = src;
    MyUnion_left_range_check(dst);
}
inline MyUnion_left_range_check(MyUnion_left_vc)
{
    assert(((MyUnion_left_vc >= 0) && (MyUnion_left_vc <= 10000)));
}
inline MyUnion_right_first_assign_value(dst, src)
{
    dst = src;
    MyUnion_right_first_range_check(dst);
}
inline MyUnion_right_first_range_check(MyUnion_right_first_vc)
{
    assert(((MyUnion_right_first_vc >= 0) && (MyUnion_right_first_vc <= 10000)));
}
inline MyUnion_right_second_assign_value(dst, src)
{
    dst = src;
    MyUnion_right_second_range_check(dst);
}
inline MyUnion_right_second_range_check(MyUnion_right_second_vc)
{
    assert(((MyUnion_right_second_vc >= 0) && (MyUnion_right_second_vc <= 10000)));
}
inline MyUnion_right_assign_value(dst, src)
{
    MyUnion_right_first_assign_value(dst.first, src.first);
    MyUnion_right_second_assign_value(dst.second, src.second);
}
inline MyUnion_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyUnion_left_PRESENT);
        MyUnion_left_assign_value(dst.data.left, src.data.left);
    ::  (dst.selection == MyUnion_right_PRESENT);
        MyUnion_right_assign_value(dst.data.right, src.data.right);
    ::  else;
        skip;
    fi;
}
inline Myunion_selection_assign_value(dst, src)
{
    dst = src;
}
inline PID_Range_assign_value(dst, src)
{
    dst = src;
    PID_Range_range_check(dst);
}
inline PID_Range_range_check(PID_Range_vc)
{
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 2)));
}
inline PID_assign_value(dst, src)
{
    dst = src;
    PID_range_check(dst);
}
inline PID_range_check(PID_vc)
{
    assert((((PID_vc == PID_actuator) || (PID_vc == PID_controller)) || (PID_vc == PID_env)));
}
inline TimerData_timer_enabled_assign_value(dst, src)
{
    dst = src;
    TimerData_timer_enabled_range_check(dst);
}
inline TimerData_timer_enabled_range_check(TimerData_timer_enabled_vc)
{
    assert(true);
}
inline TimerData_interval_assign_value(dst, src)
{
    dst = src;
    TimerData_interval_range_check(dst);
}
inline TimerData_interval_range_check(TimerData_interval_vc)
{
    assert(((TimerData_interval_vc >= 0) && (TimerData_interval_vc <= 50000)));
}
inline TimerData_assign_value(dst, src)
{
    TimerData_timer_enabled_assign_value(dst.timer_enabled, src.timer_enabled);
    TimerData_interval_assign_value(dst.interval, src.interval);
}
inline AggregateTimerData_actuator_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_controller_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_dummy_entry_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_assign_value(dst, src)
{
    AggregateTimerData_actuator_assign_value(dst.actuator, src.actuator);
    AggregateTimerData_controller_assign_value(dst.controller, src.controller);
    AggregateTimerData_dummy_entry_assign_value(dst.dummy_entry, src.dummy_entry);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
