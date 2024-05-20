#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_T_Runtime_Error_Selection int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_wait_0_right_0_state int
#define Controller_Context_wait_0_left_0_state int
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_T_Runtime_Error_Selection int
#define Timer_manager_States int
#define Timer_manager_Context_state int
#define MyInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define T_Runtime_Error_noerror int
#define T_Runtime_Error_encodeerror int
#define T_Runtime_Error_decodeerror int
#define PID_Range int
#define PID int
#define TimerData_timer_enabled bool
#define TimerData_interval int
#define Actuator_States_wait 0
#define Actuator_Context_state_wait 0
#define Actuator_Context_sender_taste_user_interface 0
#define Actuator_Context_sender_timer_manager 1
#define Actuator_Context_sender_actuator 2
#define Actuator_Context_sender_inst 3
#define Actuator_Context_sender_env 4
#define Actuator_Context_offspring_taste_user_interface 0
#define Actuator_Context_offspring_timer_manager 1
#define Actuator_Context_offspring_actuator 2
#define Actuator_Context_offspring_inst 3
#define Actuator_Context_offspring_env 4
#define Actuator_T_Runtime_Error_Selection_noerror_present 1
#define Actuator_T_Runtime_Error_Selection_encodeerror_present 2
#define Actuator_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_wait_0_right 0
#define Controller_States_state_0_end 1
#define Controller_States_wait_0_left 2
#define Controller_States_wait 3
#define Controller_States_wait_0_left_0_reached 4
#define Controller_States_wait_0_left_0_wait 5
#define Controller_States_wait_0_right_0_wait 6
#define Controller_Context_state_wait_0_right 0
#define Controller_Context_state_state_0_end 1
#define Controller_Context_state_wait_0_left 2
#define Controller_Context_state_wait 3
#define Controller_Context_state_wait_0_left_0_reached 4
#define Controller_Context_state_wait_0_left_0_wait 5
#define Controller_Context_state_wait_0_right_0_wait 6
#define Controller_Context_wait_0_right_0_state_wait_0_right 0
#define Controller_Context_wait_0_right_0_state_state_0_end 1
#define Controller_Context_wait_0_right_0_state_wait_0_left 2
#define Controller_Context_wait_0_right_0_state_wait 3
#define Controller_Context_wait_0_right_0_state_wait_0_left_0_reached 4
#define Controller_Context_wait_0_right_0_state_wait_0_left_0_wait 5
#define Controller_Context_wait_0_right_0_state_wait_0_right_0_wait 6
#define Controller_Context_wait_0_left_0_state_wait_0_right 0
#define Controller_Context_wait_0_left_0_state_state_0_end 1
#define Controller_Context_wait_0_left_0_state_wait_0_left 2
#define Controller_Context_wait_0_left_0_state_wait 3
#define Controller_Context_wait_0_left_0_state_wait_0_left_0_reached 4
#define Controller_Context_wait_0_left_0_state_wait_0_left_0_wait 5
#define Controller_Context_wait_0_left_0_state_wait_0_right_0_wait 6
#define Controller_Context_sender_taste_user_interface 0
#define Controller_Context_sender_timer_manager 1
#define Controller_Context_sender_actuator 2
#define Controller_Context_sender_inst 3
#define Controller_Context_sender_env 4
#define Controller_Context_offspring_taste_user_interface 0
#define Controller_Context_offspring_timer_manager 1
#define Controller_Context_offspring_actuator 2
#define Controller_Context_offspring_inst 3
#define Controller_Context_offspring_env 4
#define Controller_T_Runtime_Error_Selection_noerror_present 1
#define Controller_T_Runtime_Error_Selection_encodeerror_present 2
#define Controller_T_Runtime_Error_Selection_decodeerror_present 3
#define Timer_manager_States_wait 0
#define Timer_manager_Context_state_wait 0
#define T_Runtime_Error_NONE 0
#define T_Runtime_Error_noerror_PRESENT 1
#define T_runtime_error_selection_noerror_PRESENT 1
#define T_Runtime_Error_encodeerror_PRESENT 2
#define T_runtime_error_selection_encodeerror_PRESENT 2
#define T_Runtime_Error_decodeerror_PRESENT 3
#define T_runtime_error_selection_decodeerror_PRESENT 3
#define PID_taste_user_interface 0
#define PID_timer_manager 1
#define PID_actuator 2
#define PID_inst 3
#define PID_env 4
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
}

typedef AggregateTimerData_actuator {
    bit dummy;
}

typedef AggregateTimerData_dummy_entry {
    bit dummy;
}

typedef AggregateTimerData_inst {
    bit dummy;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_wait_0_right_0_state wait_0_right_0_state;
    Controller_Context_wait_0_left_0_state wait_0_left_0_state;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
}

typedef T_Null_Record {
    bit dummy;
}

typedef T_Runtime_Error_data {
    T_Runtime_Error_noerror noerror;
    T_Runtime_Error_encodeerror encodeerror;
    T_Runtime_Error_decodeerror decodeerror;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef Timer_manager_Context {
    Timer_manager_Context_state state;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_inst inst;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef T_Runtime_Error {
    T_Runtime_Error_data data;
    int selection;
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
    assert((((((Actuator_Context_sender_vc == Actuator_Context_sender_taste_user_interface) || (Actuator_Context_sender_vc == Actuator_Context_sender_timer_manager)) || (Actuator_Context_sender_vc == Actuator_Context_sender_actuator)) || (Actuator_Context_sender_vc == Actuator_Context_sender_inst)) || (Actuator_Context_sender_vc == Actuator_Context_sender_env)));
}
inline Actuator_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_offspring_range_check(dst);
}
inline Actuator_Context_offspring_range_check(Actuator_Context_offspring_vc)
{
    assert((((((Actuator_Context_offspring_vc == Actuator_Context_offspring_taste_user_interface) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_timer_manager)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_actuator)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_inst)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_env)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
}
inline Actuator_T_Runtime_Error_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_T_Runtime_Error_Selection_range_check(dst);
}
inline Actuator_T_Runtime_Error_Selection_range_check(Actuator_T_Runtime_Error_Selection_vc)
{
    assert((((Actuator_T_Runtime_Error_Selection_vc == Actuator_T_Runtime_Error_Selection_noerror_present) || (Actuator_T_Runtime_Error_Selection_vc == Actuator_T_Runtime_Error_Selection_encodeerror_present)) || (Actuator_T_Runtime_Error_Selection_vc == Actuator_T_Runtime_Error_Selection_decodeerror_present)));
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((((((((Controller_States_vc == Controller_States_wait_0_right) || (Controller_States_vc == Controller_States_state_0_end)) || (Controller_States_vc == Controller_States_wait_0_left)) || (Controller_States_vc == Controller_States_wait)) || (Controller_States_vc == Controller_States_wait_0_left_0_reached)) || (Controller_States_vc == Controller_States_wait_0_left_0_wait)) || (Controller_States_vc == Controller_States_wait_0_right_0_wait)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert((((((((Controller_Context_state_vc == Controller_Context_state_wait_0_right) || (Controller_Context_state_vc == Controller_Context_state_state_0_end)) || (Controller_Context_state_vc == Controller_Context_state_wait_0_left)) || (Controller_Context_state_vc == Controller_Context_state_wait)) || (Controller_Context_state_vc == Controller_Context_state_wait_0_left_0_reached)) || (Controller_Context_state_vc == Controller_Context_state_wait_0_left_0_wait)) || (Controller_Context_state_vc == Controller_Context_state_wait_0_right_0_wait)));
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
inline Controller_Context_wait_0_right_0_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_wait_0_right_0_state_range_check(dst);
}
inline Controller_Context_wait_0_right_0_state_range_check(Controller_Context_wait_0_right_0_state_vc)
{
    assert((((((((Controller_Context_wait_0_right_0_state_vc == Controller_Context_wait_0_right_0_state_wait_0_right) || (Controller_Context_wait_0_right_0_state_vc == Controller_Context_wait_0_right_0_state_state_0_end)) || (Controller_Context_wait_0_right_0_state_vc == Controller_Context_wait_0_right_0_state_wait_0_left)) || (Controller_Context_wait_0_right_0_state_vc == Controller_Context_wait_0_right_0_state_wait)) || (Controller_Context_wait_0_right_0_state_vc == Controller_Context_wait_0_right_0_state_wait_0_left_0_reached)) || (Controller_Context_wait_0_right_0_state_vc == Controller_Context_wait_0_right_0_state_wait_0_left_0_wait)) || (Controller_Context_wait_0_right_0_state_vc == Controller_Context_wait_0_right_0_state_wait_0_right_0_wait)));
}
inline Controller_Context_wait_0_left_0_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_wait_0_left_0_state_range_check(dst);
}
inline Controller_Context_wait_0_left_0_state_range_check(Controller_Context_wait_0_left_0_state_vc)
{
    assert((((((((Controller_Context_wait_0_left_0_state_vc == Controller_Context_wait_0_left_0_state_wait_0_right) || (Controller_Context_wait_0_left_0_state_vc == Controller_Context_wait_0_left_0_state_state_0_end)) || (Controller_Context_wait_0_left_0_state_vc == Controller_Context_wait_0_left_0_state_wait_0_left)) || (Controller_Context_wait_0_left_0_state_vc == Controller_Context_wait_0_left_0_state_wait)) || (Controller_Context_wait_0_left_0_state_vc == Controller_Context_wait_0_left_0_state_wait_0_left_0_reached)) || (Controller_Context_wait_0_left_0_state_vc == Controller_Context_wait_0_left_0_state_wait_0_left_0_wait)) || (Controller_Context_wait_0_left_0_state_vc == Controller_Context_wait_0_left_0_state_wait_0_right_0_wait)));
}
inline Controller_Context_sender_assign_value(dst, src)
{
    dst = src;
    Controller_Context_sender_range_check(dst);
}
inline Controller_Context_sender_range_check(Controller_Context_sender_vc)
{
    assert((((((Controller_Context_sender_vc == Controller_Context_sender_taste_user_interface) || (Controller_Context_sender_vc == Controller_Context_sender_timer_manager)) || (Controller_Context_sender_vc == Controller_Context_sender_actuator)) || (Controller_Context_sender_vc == Controller_Context_sender_inst)) || (Controller_Context_sender_vc == Controller_Context_sender_env)));
}
inline Controller_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context_offspring_range_check(dst);
}
inline Controller_Context_offspring_range_check(Controller_Context_offspring_vc)
{
    assert((((((Controller_Context_offspring_vc == Controller_Context_offspring_taste_user_interface) || (Controller_Context_offspring_vc == Controller_Context_offspring_timer_manager)) || (Controller_Context_offspring_vc == Controller_Context_offspring_actuator)) || (Controller_Context_offspring_vc == Controller_Context_offspring_inst)) || (Controller_Context_offspring_vc == Controller_Context_offspring_env)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_wait_0_right_0_state_assign_value(dst.wait_0_right_0_state, src.wait_0_right_0_state);
    Controller_Context_wait_0_left_0_state_assign_value(dst.wait_0_left_0_state, src.wait_0_left_0_state);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
}
inline Controller_T_Runtime_Error_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_T_Runtime_Error_Selection_range_check(dst);
}
inline Controller_T_Runtime_Error_Selection_range_check(Controller_T_Runtime_Error_Selection_vc)
{
    assert((((Controller_T_Runtime_Error_Selection_vc == Controller_T_Runtime_Error_Selection_noerror_present) || (Controller_T_Runtime_Error_Selection_vc == Controller_T_Runtime_Error_Selection_encodeerror_present)) || (Controller_T_Runtime_Error_Selection_vc == Controller_T_Runtime_Error_Selection_decodeerror_present)));
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
    assert((T_Int32_vc <= 2147483647));
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
inline T_Runtime_Error_noerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error_noerror_range_check(dst);
}
inline T_Runtime_Error_noerror_range_check(T_Runtime_Error_noerror_vc)
{
    assert(((T_Runtime_Error_noerror_vc >= 0) && (T_Runtime_Error_noerror_vc <= -1)));
}
inline T_Runtime_Error_encodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error_encodeerror_range_check(dst);
}
inline T_Runtime_Error_encodeerror_range_check(T_Runtime_Error_encodeerror_vc)
{
    assert((T_Runtime_Error_encodeerror_vc <= 2147483647));
}
inline T_Runtime_Error_decodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error_decodeerror_range_check(dst);
}
inline T_Runtime_Error_decodeerror_range_check(T_Runtime_Error_decodeerror_vc)
{
    assert((T_Runtime_Error_decodeerror_vc <= 2147483647));
}
inline T_Runtime_Error_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == T_Runtime_Error_noerror_PRESENT);
        T_Runtime_Error_noerror_assign_value(dst.data.noerror, src.data.noerror);
    ::  (dst.selection == T_Runtime_Error_encodeerror_PRESENT);
        T_Runtime_Error_encodeerror_assign_value(dst.data.encodeerror, src.data.encodeerror);
    ::  (dst.selection == T_Runtime_Error_decodeerror_PRESENT);
        T_Runtime_Error_decodeerror_assign_value(dst.data.decodeerror, src.data.decodeerror);
    ::  else;
        skip;
    fi;
}
inline T_runtime_error_selection_assign_value(dst, src)
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
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 5)));
}
inline PID_assign_value(dst, src)
{
    dst = src;
    PID_range_check(dst);
}
inline PID_range_check(PID_vc)
{
    assert((((((PID_vc == PID_taste_user_interface) || (PID_vc == PID_timer_manager)) || (PID_vc == PID_actuator)) || (PID_vc == PID_inst)) || (PID_vc == PID_env)));
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
inline AggregateTimerData_inst_assign_value(dst, src)
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
    AggregateTimerData_inst_assign_value(dst.inst, src.inst);
    AggregateTimerData_dummy_entry_assign_value(dst.dummy_entry, src.dummy_entry);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
