#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_parallel_0_right_0_state int
#define Actuator_Context_parallel_0_left_0_state int
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_parallel_0_left_0_data int
#define Actuator_Context_parallel_0_left_0_selection_first int
#define Actuator_Context_parallel_0_left_0_selection_second int
#define Actuator_Mychoice_Selection int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Mychoice_Selection int
#define MyInteger int
#define MyChoice_first int
#define MyChoice_second int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID_Range int
#define PID int
#define TimerData_timer_enabled bool
#define TimerData_interval int
#define Actuator_States_parallel_0_right 0
#define Actuator_States_state_0_end 1
#define Actuator_States_parallel_0_right_0_wait 2
#define Actuator_States_parallel_0_left_0_wait 3
#define Actuator_States_parallel_0_left 4
#define Actuator_States_parallel 5
#define Actuator_Context_state_parallel_0_right 0
#define Actuator_Context_state_state_0_end 1
#define Actuator_Context_state_parallel_0_right_0_wait 2
#define Actuator_Context_state_parallel_0_left_0_wait 3
#define Actuator_Context_state_parallel_0_left 4
#define Actuator_Context_state_parallel 5
#define Actuator_Context_parallel_0_right_0_state_parallel_0_right 0
#define Actuator_Context_parallel_0_right_0_state_state_0_end 1
#define Actuator_Context_parallel_0_right_0_state_parallel_0_right_0_wait 2
#define Actuator_Context_parallel_0_right_0_state_parallel_0_left_0_wait 3
#define Actuator_Context_parallel_0_right_0_state_parallel_0_left 4
#define Actuator_Context_parallel_0_right_0_state_parallel 5
#define Actuator_Context_parallel_0_left_0_state_parallel_0_right 0
#define Actuator_Context_parallel_0_left_0_state_state_0_end 1
#define Actuator_Context_parallel_0_left_0_state_parallel_0_right_0_wait 2
#define Actuator_Context_parallel_0_left_0_state_parallel_0_left_0_wait 3
#define Actuator_Context_parallel_0_left_0_state_parallel_0_left 4
#define Actuator_Context_parallel_0_left_0_state_parallel 5
#define Actuator_Context_sender_actuator 0
#define Actuator_Context_sender_controller 1
#define Actuator_Context_sender_env 2
#define Actuator_Context_offspring_actuator 0
#define Actuator_Context_offspring_controller 1
#define Actuator_Context_offspring_env 2
#define Actuator_Context_parallel_0_left_0_selection_NONE 0
#define Actuator_Context_parallel_0_left_0_selection_first_PRESENT 1
#define Actuator_context_parallel_0_left_0_selection_selection_first_PRESENT 1
#define Actuator_Context_parallel_0_left_0_selection_second_PRESENT 2
#define Actuator_context_parallel_0_left_0_selection_selection_second_PRESENT 2
#define Actuator_Mychoice_Selection_first_present 1
#define Actuator_Mychoice_Selection_second_present 2
#define Controller_States_wait 0
#define Controller_Context_state_wait 0
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Mychoice_Selection_first_present 1
#define Controller_Mychoice_Selection_second_present 2
#define MyChoice_NONE 0
#define MyChoice_first_PRESENT 1
#define Mychoice_selection_first_PRESENT 1
#define MyChoice_second_PRESENT 2
#define Mychoice_selection_second_PRESENT 2
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context_parallel_0_left_0_selection_data {
    Actuator_Context_parallel_0_left_0_selection_first first;
    Actuator_Context_parallel_0_left_0_selection_second second;
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
}

typedef MyChoice_data {
    MyChoice_first first;
    MyChoice_second second;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef Actuator_Context_parallel_0_left_0_selection {
    Actuator_Context_parallel_0_left_0_selection_data data;
    int selection;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef MyChoice {
    MyChoice_data data;
    int selection;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_parallel_0_right_0_state parallel_0_right_0_state;
    Actuator_Context_parallel_0_left_0_state parallel_0_left_0_state;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_parallel_0_left_0_data parallel_0_left_0_data;
    Actuator_Context_parallel_0_left_0_selection parallel_0_left_0_selection;
}

inline Actuator_States_assign_value(dst, src)
{
    dst = src;
    Actuator_States_range_check(dst);
}
inline Actuator_States_range_check(Actuator_States_vc)
{
    assert(((((((Actuator_States_vc == Actuator_States_parallel_0_right) || (Actuator_States_vc == Actuator_States_state_0_end)) || (Actuator_States_vc == Actuator_States_parallel_0_right_0_wait)) || (Actuator_States_vc == Actuator_States_parallel_0_left_0_wait)) || (Actuator_States_vc == Actuator_States_parallel_0_left)) || (Actuator_States_vc == Actuator_States_parallel)));
}
inline Actuator_Context_state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_state_range_check(dst);
}
inline Actuator_Context_state_range_check(Actuator_Context_state_vc)
{
    assert(((((((Actuator_Context_state_vc == Actuator_Context_state_parallel_0_right) || (Actuator_Context_state_vc == Actuator_Context_state_state_0_end)) || (Actuator_Context_state_vc == Actuator_Context_state_parallel_0_right_0_wait)) || (Actuator_Context_state_vc == Actuator_Context_state_parallel_0_left_0_wait)) || (Actuator_Context_state_vc == Actuator_Context_state_parallel_0_left)) || (Actuator_Context_state_vc == Actuator_Context_state_parallel)));
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
inline Actuator_Context_parallel_0_right_0_state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_parallel_0_right_0_state_range_check(dst);
}
inline Actuator_Context_parallel_0_right_0_state_range_check(Actuator_Context_parallel_0_right_0_state_vc)
{
    assert(((((((Actuator_Context_parallel_0_right_0_state_vc == Actuator_Context_parallel_0_right_0_state_parallel_0_right) || (Actuator_Context_parallel_0_right_0_state_vc == Actuator_Context_parallel_0_right_0_state_state_0_end)) || (Actuator_Context_parallel_0_right_0_state_vc == Actuator_Context_parallel_0_right_0_state_parallel_0_right_0_wait)) || (Actuator_Context_parallel_0_right_0_state_vc == Actuator_Context_parallel_0_right_0_state_parallel_0_left_0_wait)) || (Actuator_Context_parallel_0_right_0_state_vc == Actuator_Context_parallel_0_right_0_state_parallel_0_left)) || (Actuator_Context_parallel_0_right_0_state_vc == Actuator_Context_parallel_0_right_0_state_parallel)));
}
inline Actuator_Context_parallel_0_left_0_state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_parallel_0_left_0_state_range_check(dst);
}
inline Actuator_Context_parallel_0_left_0_state_range_check(Actuator_Context_parallel_0_left_0_state_vc)
{
    assert(((((((Actuator_Context_parallel_0_left_0_state_vc == Actuator_Context_parallel_0_left_0_state_parallel_0_right) || (Actuator_Context_parallel_0_left_0_state_vc == Actuator_Context_parallel_0_left_0_state_state_0_end)) || (Actuator_Context_parallel_0_left_0_state_vc == Actuator_Context_parallel_0_left_0_state_parallel_0_right_0_wait)) || (Actuator_Context_parallel_0_left_0_state_vc == Actuator_Context_parallel_0_left_0_state_parallel_0_left_0_wait)) || (Actuator_Context_parallel_0_left_0_state_vc == Actuator_Context_parallel_0_left_0_state_parallel_0_left)) || (Actuator_Context_parallel_0_left_0_state_vc == Actuator_Context_parallel_0_left_0_state_parallel)));
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
inline Actuator_Context_parallel_0_left_0_data_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_parallel_0_left_0_data_range_check(dst);
}
inline Actuator_Context_parallel_0_left_0_data_range_check(Actuator_Context_parallel_0_left_0_data_vc)
{
    assert(((Actuator_Context_parallel_0_left_0_data_vc >= 0) && (Actuator_Context_parallel_0_left_0_data_vc <= 10000)));
}
inline Actuator_Context_parallel_0_left_0_selection_first_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_parallel_0_left_0_selection_first_range_check(dst);
}
inline Actuator_Context_parallel_0_left_0_selection_first_range_check(Actuator_Context_parallel_0_left_0_selection_first_vc)
{
    assert(((Actuator_Context_parallel_0_left_0_selection_first_vc >= 0) && (Actuator_Context_parallel_0_left_0_selection_first_vc <= 10000)));
}
inline Actuator_Context_parallel_0_left_0_selection_second_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_parallel_0_left_0_selection_second_range_check(dst);
}
inline Actuator_Context_parallel_0_left_0_selection_second_range_check(Actuator_Context_parallel_0_left_0_selection_second_vc)
{
    assert(((Actuator_Context_parallel_0_left_0_selection_second_vc >= 0) && (Actuator_Context_parallel_0_left_0_selection_second_vc <= 10000)));
}
inline Actuator_Context_parallel_0_left_0_selection_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context_parallel_0_left_0_selection_first_PRESENT);
        Actuator_Context_parallel_0_left_0_selection_first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == Actuator_Context_parallel_0_left_0_selection_second_PRESENT);
        Actuator_Context_parallel_0_left_0_selection_second_assign_value(dst.data.second, src.data.second);
    ::  else;
        skip;
    fi;
}
inline Actuator_context_parallel_0_left_0_selection_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_parallel_0_right_0_state_assign_value(dst.parallel_0_right_0_state, src.parallel_0_right_0_state);
    Actuator_Context_parallel_0_left_0_state_assign_value(dst.parallel_0_left_0_state, src.parallel_0_left_0_state);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_parallel_0_left_0_data_assign_value(dst.parallel_0_left_0_data, src.parallel_0_left_0_data);
    Actuator_Context_parallel_0_left_0_selection_assign_value(dst.parallel_0_left_0_selection, src.parallel_0_left_0_selection);
}
inline Actuator_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Mychoice_Selection_range_check(dst);
}
inline Actuator_Mychoice_Selection_range_check(Actuator_Mychoice_Selection_vc)
{
    assert(((Actuator_Mychoice_Selection_vc == Actuator_Mychoice_Selection_first_present) || (Actuator_Mychoice_Selection_vc == Actuator_Mychoice_Selection_second_present)));
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
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
}
inline Controller_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Mychoice_Selection_range_check(dst);
}
inline Controller_Mychoice_Selection_range_check(Controller_Mychoice_Selection_vc)
{
    assert(((Controller_Mychoice_Selection_vc == Controller_Mychoice_Selection_first_present) || (Controller_Mychoice_Selection_vc == Controller_Mychoice_Selection_second_present)));
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
inline MyChoice_first_assign_value(dst, src)
{
    dst = src;
    MyChoice_first_range_check(dst);
}
inline MyChoice_first_range_check(MyChoice_first_vc)
{
    assert(((MyChoice_first_vc >= 0) && (MyChoice_first_vc <= 10000)));
}
inline MyChoice_second_assign_value(dst, src)
{
    dst = src;
    MyChoice_second_range_check(dst);
}
inline MyChoice_second_range_check(MyChoice_second_vc)
{
    assert(((MyChoice_second_vc >= 0) && (MyChoice_second_vc <= 10000)));
}
inline MyChoice_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyChoice_first_PRESENT);
        MyChoice_first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == MyChoice_second_PRESENT);
        MyChoice_second_assign_value(dst.data.second, src.data.second);
    ::  else;
        skip;
    fi;
}
inline Mychoice_selection_assign_value(dst, src)
{
    dst = src;
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
