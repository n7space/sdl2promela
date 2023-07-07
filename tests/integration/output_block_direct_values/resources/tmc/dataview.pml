#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Myvalues_Selection int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_param_data_first int
#define Controller_Context_param_data_second int
#define Controller_Context_param_values_left int
#define Controller_Context_param_values_right int
#define Controller_Context_param_array_elem int
#define Controller_Context_param_nested_black int
#define Controller_Context_param_nested_red_first int
#define Controller_Context_param_nested_red_second int
#define Controller_Myvalues_Selection int
#define MyInteger int
#define MyData_first int
#define MyData_second int
#define MyValues_left int
#define MyValues_right int
#define MyArray_elem int
#define MyNested_black int
#define MyNested_red_first int
#define MyNested_red_second int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID_Range int
#define PID int
#define TimerData_timer_enabled bool
#define TimerData_interval int
#define Actuator_States_wait 0
#define Actuator_Context_state_wait 0
#define Actuator_Context_sender_actuator 0
#define Actuator_Context_sender_controller 1
#define Actuator_Context_sender_env 2
#define Actuator_Context_offspring_actuator 0
#define Actuator_Context_offspring_controller 1
#define Actuator_Context_offspring_env 2
#define Actuator_Myvalues_Selection_left_present 1
#define Actuator_Myvalues_Selection_right_present 2
#define Controller_States_waitforvalues 0
#define Controller_States_waitforarray 1
#define Controller_States_waitfornested 2
#define Controller_States_finished 3
#define Controller_States_waitfordata 4
#define Controller_States_error 5
#define Controller_Context_state_waitforvalues 0
#define Controller_Context_state_waitforarray 1
#define Controller_Context_state_waitfornested 2
#define Controller_Context_state_finished 3
#define Controller_Context_state_waitfordata 4
#define Controller_Context_state_error 5
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Context_param_values_NONE 0
#define Controller_Context_param_values_left_PRESENT 1
#define Controller_context_param_values_selection_left_PRESENT 1
#define Controller_Context_param_values_right_PRESENT 2
#define Controller_context_param_values_selection_right_PRESENT 2
#define Controller_Myvalues_Selection_left_present 1
#define Controller_Myvalues_Selection_right_present 2
#define MyValues_NONE 0
#define MyValues_left_PRESENT 1
#define Myvalues_selection_left_PRESENT 1
#define MyValues_right_PRESENT 2
#define Myvalues_selection_right_PRESENT 2
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
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

typedef Controller_Context_param_array {
    Controller_Context_param_array_elem data[2];
}

typedef Controller_Context_param_data {
    Controller_Context_param_data_first first;
    Controller_Context_param_data_second second;
}

typedef Controller_Context_param_nested_red {
    Controller_Context_param_nested_red_first first;
    Controller_Context_param_nested_red_second second;
}

typedef Controller_Context_param_values_data {
    Controller_Context_param_values_left left;
    Controller_Context_param_values_right right;
}

typedef MyArray {
    MyArray_elem data[2];
}

typedef MyData {
    MyData_first first;
    MyData_second second;
}

typedef MyNested_red {
    MyNested_red_first first;
    MyNested_red_second second;
}

typedef MyValues_data {
    MyValues_left left;
    MyValues_right right;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef Controller_Context_param_nested {
    Controller_Context_param_nested_black black;
    Controller_Context_param_nested_red red;
}

typedef Controller_Context_param_values {
    Controller_Context_param_values_data data;
    int selection;
}

typedef MyNested {
    MyNested_black black;
    MyNested_red red;
}

typedef MyValues {
    MyValues_data data;
    int selection;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_param_data param_data;
    Controller_Context_param_values param_values;
    Controller_Context_param_array param_array;
    Controller_Context_param_nested param_nested;
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
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
}
inline Actuator_Myvalues_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Myvalues_Selection_range_check(dst);
}
inline Actuator_Myvalues_Selection_range_check(Actuator_Myvalues_Selection_vc)
{
    assert(((Actuator_Myvalues_Selection_vc == Actuator_Myvalues_Selection_left_present) || (Actuator_Myvalues_Selection_vc == Actuator_Myvalues_Selection_right_present)));
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert(((((((Controller_States_vc == Controller_States_waitforvalues) || (Controller_States_vc == Controller_States_waitforarray)) || (Controller_States_vc == Controller_States_waitfornested)) || (Controller_States_vc == Controller_States_finished)) || (Controller_States_vc == Controller_States_waitfordata)) || (Controller_States_vc == Controller_States_error)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert(((((((Controller_Context_state_vc == Controller_Context_state_waitforvalues) || (Controller_Context_state_vc == Controller_Context_state_waitforarray)) || (Controller_Context_state_vc == Controller_Context_state_waitfornested)) || (Controller_Context_state_vc == Controller_Context_state_finished)) || (Controller_Context_state_vc == Controller_Context_state_waitfordata)) || (Controller_Context_state_vc == Controller_Context_state_error)));
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
inline Controller_Context_param_data_first_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_data_first_range_check(dst);
}
inline Controller_Context_param_data_first_range_check(Controller_Context_param_data_first_vc)
{
    assert(((Controller_Context_param_data_first_vc >= 0) && (Controller_Context_param_data_first_vc <= 10000)));
}
inline Controller_Context_param_data_second_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_data_second_range_check(dst);
}
inline Controller_Context_param_data_second_range_check(Controller_Context_param_data_second_vc)
{
    assert(((Controller_Context_param_data_second_vc >= 0) && (Controller_Context_param_data_second_vc <= 10000)));
}
inline Controller_Context_param_data_assign_value(dst, src)
{
    Controller_Context_param_data_first_assign_value(dst.first, src.first);
    Controller_Context_param_data_second_assign_value(dst.second, src.second);
}
inline Controller_Context_param_values_left_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_values_left_range_check(dst);
}
inline Controller_Context_param_values_left_range_check(Controller_Context_param_values_left_vc)
{
    assert(((Controller_Context_param_values_left_vc >= 0) && (Controller_Context_param_values_left_vc <= 10000)));
}
inline Controller_Context_param_values_right_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_values_right_range_check(dst);
}
inline Controller_Context_param_values_right_range_check(Controller_Context_param_values_right_vc)
{
    assert(((Controller_Context_param_values_right_vc >= 0) && (Controller_Context_param_values_right_vc <= 10000)));
}
inline Controller_Context_param_values_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Controller_Context_param_values_left_PRESENT);
        Controller_Context_param_values_left_assign_value(dst.data.left, src.data.left);
    ::  (dst.selection == Controller_Context_param_values_right_PRESENT);
        Controller_Context_param_values_right_assign_value(dst.data.right, src.data.right);
    ::  else;
        skip;
    fi;
}
inline Controller_context_param_values_selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_param_array_elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_array_elem_range_check(dst);
}
inline Controller_Context_param_array_elem_range_check(Controller_Context_param_array_elem_vc)
{
    assert(((Controller_Context_param_array_elem_vc >= 0) && (Controller_Context_param_array_elem_vc <= 10000)));
}
inline Controller_Context_param_array_elem_init_value(dst)
{
    Controller_Context_param_array_elem_assign_value(dst, 0);
}
inline Controller_Context_param_array_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. 1)
    {
        Controller_Context_param_array_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
}
inline Controller_Context_param_nested_black_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_nested_black_range_check(dst);
}
inline Controller_Context_param_nested_black_range_check(Controller_Context_param_nested_black_vc)
{
    assert(((Controller_Context_param_nested_black_vc >= 0) && (Controller_Context_param_nested_black_vc <= 10000)));
}
inline Controller_Context_param_nested_red_first_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_nested_red_first_range_check(dst);
}
inline Controller_Context_param_nested_red_first_range_check(Controller_Context_param_nested_red_first_vc)
{
    assert(((Controller_Context_param_nested_red_first_vc >= 0) && (Controller_Context_param_nested_red_first_vc <= 10000)));
}
inline Controller_Context_param_nested_red_second_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_nested_red_second_range_check(dst);
}
inline Controller_Context_param_nested_red_second_range_check(Controller_Context_param_nested_red_second_vc)
{
    assert(((Controller_Context_param_nested_red_second_vc >= 0) && (Controller_Context_param_nested_red_second_vc <= 10000)));
}
inline Controller_Context_param_nested_red_assign_value(dst, src)
{
    Controller_Context_param_nested_red_first_assign_value(dst.first, src.first);
    Controller_Context_param_nested_red_second_assign_value(dst.second, src.second);
}
inline Controller_Context_param_nested_assign_value(dst, src)
{
    Controller_Context_param_nested_black_assign_value(dst.black, src.black);
    Controller_Context_param_nested_red_assign_value(dst.red, src.red);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_param_data_assign_value(dst.param_data, src.param_data);
    Controller_Context_param_values_assign_value(dst.param_values, src.param_values);
    Controller_Context_param_array_assign_value(dst.param_array, src.param_array);
    Controller_Context_param_nested_assign_value(dst.param_nested, src.param_nested);
}
inline Controller_Myvalues_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Myvalues_Selection_range_check(dst);
}
inline Controller_Myvalues_Selection_range_check(Controller_Myvalues_Selection_vc)
{
    assert(((Controller_Myvalues_Selection_vc == Controller_Myvalues_Selection_left_present) || (Controller_Myvalues_Selection_vc == Controller_Myvalues_Selection_right_present)));
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
inline MyData_first_assign_value(dst, src)
{
    dst = src;
    MyData_first_range_check(dst);
}
inline MyData_first_range_check(MyData_first_vc)
{
    assert(((MyData_first_vc >= 0) && (MyData_first_vc <= 10000)));
}
inline MyData_second_assign_value(dst, src)
{
    dst = src;
    MyData_second_range_check(dst);
}
inline MyData_second_range_check(MyData_second_vc)
{
    assert(((MyData_second_vc >= 0) && (MyData_second_vc <= 10000)));
}
inline MyData_assign_value(dst, src)
{
    MyData_first_assign_value(dst.first, src.first);
    MyData_second_assign_value(dst.second, src.second);
}
inline MyValues_left_assign_value(dst, src)
{
    dst = src;
    MyValues_left_range_check(dst);
}
inline MyValues_left_range_check(MyValues_left_vc)
{
    assert(((MyValues_left_vc >= 0) && (MyValues_left_vc <= 10000)));
}
inline MyValues_right_assign_value(dst, src)
{
    dst = src;
    MyValues_right_range_check(dst);
}
inline MyValues_right_range_check(MyValues_right_vc)
{
    assert(((MyValues_right_vc >= 0) && (MyValues_right_vc <= 10000)));
}
inline MyValues_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyValues_left_PRESENT);
        MyValues_left_assign_value(dst.data.left, src.data.left);
    ::  (dst.selection == MyValues_right_PRESENT);
        MyValues_right_assign_value(dst.data.right, src.data.right);
    ::  else;
        skip;
    fi;
}
inline Myvalues_selection_assign_value(dst, src)
{
    dst = src;
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
inline MyNested_black_assign_value(dst, src)
{
    dst = src;
    MyNested_black_range_check(dst);
}
inline MyNested_black_range_check(MyNested_black_vc)
{
    assert(((MyNested_black_vc >= 0) && (MyNested_black_vc <= 10000)));
}
inline MyNested_red_first_assign_value(dst, src)
{
    dst = src;
    MyNested_red_first_range_check(dst);
}
inline MyNested_red_first_range_check(MyNested_red_first_vc)
{
    assert(((MyNested_red_first_vc >= 0) && (MyNested_red_first_vc <= 10000)));
}
inline MyNested_red_second_assign_value(dst, src)
{
    dst = src;
    MyNested_red_second_range_check(dst);
}
inline MyNested_red_second_range_check(MyNested_red_second_vc)
{
    assert(((MyNested_red_second_vc >= 0) && (MyNested_red_second_vc <= 10000)));
}
inline MyNested_red_assign_value(dst, src)
{
    MyNested_red_first_assign_value(dst.first, src.first);
    MyNested_red_second_assign_value(dst.second, src.second);
}
inline MyNested_assign_value(dst, src)
{
    MyNested_black_assign_value(dst.black, src.black);
    MyNested_red_assign_value(dst.red, src.red);
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
