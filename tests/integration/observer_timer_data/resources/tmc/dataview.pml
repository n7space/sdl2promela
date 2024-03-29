#define Observer_States int
#define Observer_Context_state int
#define Observer_Context_init_done bool
#define Observer_Context_sender int
#define Observer_Context_offspring int
#define Observer_Timer_Manager_Event_Msg_Out_Selection int
#define Observer_Timer_Manager_Event_Selection int
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
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Timer_manager_States int
#define Timer_manager_Context_state int
#define MyInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID_Range int
#define PID int
#define TimerData_timer_enabled bool
#define TimerData_interval int
#define AggregateTimerData_actuator_trigger_timer_enabled bool
#define AggregateTimerData_actuator_trigger_interval int
#define Observer_States_error 0
#define Observer_States_idle 1
#define Observer_Context_state_error 0
#define Observer_Context_state_idle 1
#define Observer_Context_sender_timer_manager 0
#define Observer_Context_sender_actuator 1
#define Observer_Context_sender_controller 2
#define Observer_Context_sender_env 3
#define Observer_Context_offspring_timer_manager 0
#define Observer_Context_offspring_actuator 1
#define Observer_Context_offspring_controller 2
#define Observer_Context_offspring_env 3
#define Observer_Timer_Manager_Event_Msg_Out_Selection_actuator_trigger_present 1
#define Observer_Timer_Manager_Event_Msg_Out_Selection_actuator_trigger_reset_present 2
#define Observer_Timer_Manager_Event_Msg_Out_Selection_actuator_trigger_set_present 3
#define Observer_Timer_Manager_Event_Selection_msg_out_present 1
#define Observer_Actuator_Event_Msg_In_Selection_input_none_present 1
#define Observer_Actuator_Event_Msg_In_Selection_ping_present 2
#define Observer_Actuator_Event_Msg_In_Selection_trigger_present 3
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
#define Observer_Function_Event_Selection_timer_manager_present 3
#define Observer_Observable_Event_Selection_no_event_present 1
#define Observer_Observable_Event_Selection_system_startup_present 2
#define Observer_Observable_Event_Selection_input_event_present 3
#define Observer_Observable_Event_Selection_output_event_present 4
#define Observer_Observable_Event_Selection_unhandled_input_present 5
#define Actuator_States_wait 0
#define Actuator_Context_state_wait 0
#define Actuator_Context_sender_timer_manager 0
#define Actuator_Context_sender_actuator 1
#define Actuator_Context_sender_controller 2
#define Actuator_Context_sender_env 3
#define Actuator_Context_offspring_timer_manager 0
#define Actuator_Context_offspring_actuator 1
#define Actuator_Context_offspring_controller 2
#define Actuator_Context_offspring_env 3
#define Controller_States_wait 0
#define Controller_Context_state_wait 0
#define Controller_Context_sender_timer_manager 0
#define Controller_Context_sender_actuator 1
#define Controller_Context_sender_controller 2
#define Controller_Context_sender_env 3
#define Controller_Context_offspring_timer_manager 0
#define Controller_Context_offspring_actuator 1
#define Controller_Context_offspring_controller 2
#define Controller_Context_offspring_env 3
#define Timer_manager_States_wait 0
#define Timer_manager_Context_state_wait 0
#define PID_timer_manager 0
#define PID_actuator 1
#define PID_controller 2
#define PID_env 3
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
}

typedef AggregateTimerData_actuator_trigger {
    AggregateTimerData_actuator_trigger_timer_enabled timer_enabled;
    AggregateTimerData_actuator_trigger_interval interval;
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

typedef Timer_manager_Context {
    Timer_manager_Context_state state;
}

typedef AggregateTimerData_actuator {
    AggregateTimerData_actuator_trigger trigger;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
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
    assert(((((Observer_Context_sender_vc == Observer_Context_sender_timer_manager) || (Observer_Context_sender_vc == Observer_Context_sender_actuator)) || (Observer_Context_sender_vc == Observer_Context_sender_controller)) || (Observer_Context_sender_vc == Observer_Context_sender_env)));
}
inline Observer_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Observer_Context_offspring_range_check(dst);
}
inline Observer_Context_offspring_range_check(Observer_Context_offspring_vc)
{
    assert(((((Observer_Context_offspring_vc == Observer_Context_offspring_timer_manager) || (Observer_Context_offspring_vc == Observer_Context_offspring_actuator)) || (Observer_Context_offspring_vc == Observer_Context_offspring_controller)) || (Observer_Context_offspring_vc == Observer_Context_offspring_env)));
}
inline Observer_Context_assign_value(dst, src)
{
    Observer_Context_state_assign_value(dst.state, src.state);
    Observer_Context_init_done_assign_value(dst.init_done, src.init_done);
    Observer_Context_sender_assign_value(dst.sender, src.sender);
    Observer_Context_offspring_assign_value(dst.offspring, src.offspring);
}
inline Observer_Timer_Manager_Event_Msg_Out_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Timer_Manager_Event_Msg_Out_Selection_range_check(dst);
}
inline Observer_Timer_Manager_Event_Msg_Out_Selection_range_check(Observer_Timer_Manager_Event_Msg_Out_Selection_vc)
{
    assert((((Observer_Timer_Manager_Event_Msg_Out_Selection_vc == Observer_Timer_Manager_Event_Msg_Out_Selection_actuator_trigger_present) || (Observer_Timer_Manager_Event_Msg_Out_Selection_vc == Observer_Timer_Manager_Event_Msg_Out_Selection_actuator_trigger_reset_present)) || (Observer_Timer_Manager_Event_Msg_Out_Selection_vc == Observer_Timer_Manager_Event_Msg_Out_Selection_actuator_trigger_set_present)));
}
inline Observer_Timer_Manager_Event_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Timer_Manager_Event_Selection_range_check(dst);
}
inline Observer_Timer_Manager_Event_Selection_range_check(Observer_Timer_Manager_Event_Selection_vc)
{
    assert((Observer_Timer_Manager_Event_Selection_vc == Observer_Timer_Manager_Event_Selection_msg_out_present));
}
inline Observer_Actuator_Event_Msg_In_Selection_assign_value(dst, src)
{
    dst = src;
    Observer_Actuator_Event_Msg_In_Selection_range_check(dst);
}
inline Observer_Actuator_Event_Msg_In_Selection_range_check(Observer_Actuator_Event_Msg_In_Selection_vc)
{
    assert((((Observer_Actuator_Event_Msg_In_Selection_vc == Observer_Actuator_Event_Msg_In_Selection_input_none_present) || (Observer_Actuator_Event_Msg_In_Selection_vc == Observer_Actuator_Event_Msg_In_Selection_ping_present)) || (Observer_Actuator_Event_Msg_In_Selection_vc == Observer_Actuator_Event_Msg_In_Selection_trigger_present)));
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
    assert((((Observer_Function_Event_Selection_vc == Observer_Function_Event_Selection_actuator_present) || (Observer_Function_Event_Selection_vc == Observer_Function_Event_Selection_controller_present)) || (Observer_Function_Event_Selection_vc == Observer_Function_Event_Selection_timer_manager_present)));
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
    assert(((((Actuator_Context_sender_vc == Actuator_Context_sender_timer_manager) || (Actuator_Context_sender_vc == Actuator_Context_sender_actuator)) || (Actuator_Context_sender_vc == Actuator_Context_sender_controller)) || (Actuator_Context_sender_vc == Actuator_Context_sender_env)));
}
inline Actuator_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_offspring_range_check(dst);
}
inline Actuator_Context_offspring_range_check(Actuator_Context_offspring_vc)
{
    assert(((((Actuator_Context_offspring_vc == Actuator_Context_offspring_timer_manager) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_actuator)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_controller)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_env)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
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
    assert(((((Controller_Context_sender_vc == Controller_Context_sender_timer_manager) || (Controller_Context_sender_vc == Controller_Context_sender_actuator)) || (Controller_Context_sender_vc == Controller_Context_sender_controller)) || (Controller_Context_sender_vc == Controller_Context_sender_env)));
}
inline Controller_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context_offspring_range_check(dst);
}
inline Controller_Context_offspring_range_check(Controller_Context_offspring_vc)
{
    assert(((((Controller_Context_offspring_vc == Controller_Context_offspring_timer_manager) || (Controller_Context_offspring_vc == Controller_Context_offspring_actuator)) || (Controller_Context_offspring_vc == Controller_Context_offspring_controller)) || (Controller_Context_offspring_vc == Controller_Context_offspring_env)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
}
inline Timer_manager_States_assign_value(dst, src)
{
    dst = src;
    Timer_manager_States_range_check(dst);
}
inline Timer_manager_States_range_check(Timer_manager_States_vc)
{
    assert((Timer_manager_States_vc == Timer_manager_States_wait));
}
inline Timer_manager_Context_state_assign_value(dst, src)
{
    dst = src;
    Timer_manager_Context_state_range_check(dst);
}
inline Timer_manager_Context_state_range_check(Timer_manager_Context_state_vc)
{
    assert((Timer_manager_Context_state_vc == Timer_manager_Context_state_wait));
}
inline Timer_manager_Context_assign_value(dst, src)
{
    Timer_manager_Context_state_assign_value(dst.state, src.state);
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
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 3)));
}
inline PID_assign_value(dst, src)
{
    dst = src;
    PID_range_check(dst);
}
inline PID_range_check(PID_vc)
{
    assert(((((PID_vc == PID_timer_manager) || (PID_vc == PID_actuator)) || (PID_vc == PID_controller)) || (PID_vc == PID_env)));
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
inline AggregateTimerData_actuator_trigger_timer_enabled_assign_value(dst, src)
{
    dst = src;
    AggregateTimerData_actuator_trigger_timer_enabled_range_check(dst);
}
inline AggregateTimerData_actuator_trigger_timer_enabled_range_check(AggregateTimerData_actuator_trigger_timer_enabled_vc)
{
    assert(true);
}
inline AggregateTimerData_actuator_trigger_interval_assign_value(dst, src)
{
    dst = src;
    AggregateTimerData_actuator_trigger_interval_range_check(dst);
}
inline AggregateTimerData_actuator_trigger_interval_range_check(AggregateTimerData_actuator_trigger_interval_vc)
{
    assert(((AggregateTimerData_actuator_trigger_interval_vc >= 0) && (AggregateTimerData_actuator_trigger_interval_vc <= 50000)));
}
inline AggregateTimerData_actuator_trigger_assign_value(dst, src)
{
    AggregateTimerData_actuator_trigger_timer_enabled_assign_value(dst.timer_enabled, src.timer_enabled);
    AggregateTimerData_actuator_trigger_interval_assign_value(dst.interval, src.interval);
}
inline AggregateTimerData_actuator_assign_value(dst, src)
{
    AggregateTimerData_actuator_trigger_assign_value(dst.trigger, src.trigger);
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
