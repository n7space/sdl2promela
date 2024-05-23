#define Worker_States int
#define Worker_Context_state int
#define Worker_Context_init_done bool
#define Worker_Context_sender int
#define Worker_Context_offspring int
#define Worker_Context_check_param int
#define Worker_Context_result_param int
#define Worker_T_Runtime_Error_Selection int
#define Context_worker_coeff int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_check_param int
#define Controller_Context_result_param int
#define Controller_Context_error int
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
#define Worker_States_wait 0
#define Worker_Context_state_wait 0
#define Worker_Context_sender_taste_user_interface 0
#define Worker_Context_sender_timer_manager 1
#define Worker_Context_sender_actuator 2
#define Worker_Context_sender_controller 3
#define Worker_Context_sender_env 4
#define Worker_Context_offspring_taste_user_interface 0
#define Worker_Context_offspring_timer_manager 1
#define Worker_Context_offspring_actuator 2
#define Worker_Context_offspring_controller 3
#define Worker_Context_offspring_env 4
#define Worker_T_Runtime_Error_Selection_noerror_present 1
#define Worker_T_Runtime_Error_Selection_encodeerror_present 2
#define Worker_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_wait 0
#define Controller_Context_state_wait 0
#define Controller_Context_sender_taste_user_interface 0
#define Controller_Context_sender_timer_manager 1
#define Controller_Context_sender_actuator 2
#define Controller_Context_sender_controller 3
#define Controller_Context_sender_env 4
#define Controller_Context_offspring_taste_user_interface 0
#define Controller_Context_offspring_timer_manager 1
#define Controller_Context_offspring_actuator 2
#define Controller_Context_offspring_controller 3
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
#define PID_controller 3
#define PID_env 4
typedef AggregateTimerData_actuator {
    bit dummy;
}

typedef AggregateTimerData_controller {
    bit dummy;
}

typedef AggregateTimerData_dummy_entry {
    bit dummy;
}

typedef Context_worker {
    Context_worker_coeff coeff;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_check_param check_param;
    Controller_Context_result_param result_param;
    Controller_Context_error error;
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

typedef Worker_Context {
    Worker_Context_state state;
    Worker_Context_init_done init_done;
    Worker_Context_sender sender;
    Worker_Context_offspring offspring;
    Worker_Context_check_param check_param;
    Worker_Context_result_param result_param;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef T_Runtime_Error {
    T_Runtime_Error_data data;
    int selection;
}

Context_worker worker_ctxt;
Context_worker actuator_ctxt;
inline Worker_States_assign_value(dst, src)
{
    dst = src;
    Worker_States_range_check(dst);
}
inline Worker_States_range_check(Worker_States_vc)
{
    assert((Worker_States_vc == Worker_States_wait));
}
inline Worker_Context_state_assign_value(dst, src)
{
    dst = src;
    Worker_Context_state_range_check(dst);
}
inline Worker_Context_state_range_check(Worker_Context_state_vc)
{
    assert((Worker_Context_state_vc == Worker_Context_state_wait));
}
inline Worker_Context_init_done_assign_value(dst, src)
{
    dst = src;
    Worker_Context_init_done_range_check(dst);
}
inline Worker_Context_init_done_range_check(Worker_Context_init_done_vc)
{
    assert(true);
}
inline Worker_Context_sender_assign_value(dst, src)
{
    dst = src;
    Worker_Context_sender_range_check(dst);
}
inline Worker_Context_sender_range_check(Worker_Context_sender_vc)
{
    assert((((((Worker_Context_sender_vc == Worker_Context_sender_taste_user_interface) || (Worker_Context_sender_vc == Worker_Context_sender_timer_manager)) || (Worker_Context_sender_vc == Worker_Context_sender_actuator)) || (Worker_Context_sender_vc == Worker_Context_sender_controller)) || (Worker_Context_sender_vc == Worker_Context_sender_env)));
}
inline Worker_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Worker_Context_offspring_range_check(dst);
}
inline Worker_Context_offspring_range_check(Worker_Context_offspring_vc)
{
    assert((((((Worker_Context_offspring_vc == Worker_Context_offspring_taste_user_interface) || (Worker_Context_offspring_vc == Worker_Context_offspring_timer_manager)) || (Worker_Context_offspring_vc == Worker_Context_offspring_actuator)) || (Worker_Context_offspring_vc == Worker_Context_offspring_controller)) || (Worker_Context_offspring_vc == Worker_Context_offspring_env)));
}
inline Worker_Context_check_param_assign_value(dst, src)
{
    dst = src;
    Worker_Context_check_param_range_check(dst);
}
inline Worker_Context_check_param_range_check(Worker_Context_check_param_vc)
{
    assert(((Worker_Context_check_param_vc >= 0) && (Worker_Context_check_param_vc <= 100)));
}
inline Worker_Context_result_param_assign_value(dst, src)
{
    dst = src;
    Worker_Context_result_param_range_check(dst);
}
inline Worker_Context_result_param_range_check(Worker_Context_result_param_vc)
{
    assert(((Worker_Context_result_param_vc >= 0) && (Worker_Context_result_param_vc <= 100)));
}
inline Worker_Context_assign_value(dst, src)
{
    Worker_Context_state_assign_value(dst.state, src.state);
    Worker_Context_init_done_assign_value(dst.init_done, src.init_done);
    Worker_Context_sender_assign_value(dst.sender, src.sender);
    Worker_Context_offspring_assign_value(dst.offspring, src.offspring);
    Worker_Context_check_param_assign_value(dst.check_param, src.check_param);
    Worker_Context_result_param_assign_value(dst.result_param, src.result_param);
}
inline Worker_T_Runtime_Error_Selection_assign_value(dst, src)
{
    dst = src;
    Worker_T_Runtime_Error_Selection_range_check(dst);
}
inline Worker_T_Runtime_Error_Selection_range_check(Worker_T_Runtime_Error_Selection_vc)
{
    assert((((Worker_T_Runtime_Error_Selection_vc == Worker_T_Runtime_Error_Selection_noerror_present) || (Worker_T_Runtime_Error_Selection_vc == Worker_T_Runtime_Error_Selection_encodeerror_present)) || (Worker_T_Runtime_Error_Selection_vc == Worker_T_Runtime_Error_Selection_decodeerror_present)));
}
inline Context_worker_coeff_assign_value(dst, src)
{
    dst = src;
    Context_worker_coeff_range_check(dst);
}
inline Context_worker_coeff_range_check(Context_worker_coeff_vc)
{
    assert(((Context_worker_coeff_vc >= 0) && (Context_worker_coeff_vc <= 100)));
}
inline Context_worker_assign_value(dst, src)
{
    Context_worker_coeff_assign_value(dst.coeff, src.coeff);
}
inline worker_ctxt_init()
{
    d_step {
        MyInteger_assign_value(worker_ctxt.coeff, 4);
    }
}
inline actuator_ctxt_init()
{
    d_step {
        MyInteger_assign_value(actuator_ctxt.coeff, 10);
    }
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
    assert((((((Controller_Context_sender_vc == Controller_Context_sender_taste_user_interface) || (Controller_Context_sender_vc == Controller_Context_sender_timer_manager)) || (Controller_Context_sender_vc == Controller_Context_sender_actuator)) || (Controller_Context_sender_vc == Controller_Context_sender_controller)) || (Controller_Context_sender_vc == Controller_Context_sender_env)));
}
inline Controller_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context_offspring_range_check(dst);
}
inline Controller_Context_offspring_range_check(Controller_Context_offspring_vc)
{
    assert((((((Controller_Context_offspring_vc == Controller_Context_offspring_taste_user_interface) || (Controller_Context_offspring_vc == Controller_Context_offspring_timer_manager)) || (Controller_Context_offspring_vc == Controller_Context_offspring_actuator)) || (Controller_Context_offspring_vc == Controller_Context_offspring_controller)) || (Controller_Context_offspring_vc == Controller_Context_offspring_env)));
}
inline Controller_Context_check_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_check_param_range_check(dst);
}
inline Controller_Context_check_param_range_check(Controller_Context_check_param_vc)
{
    assert(((Controller_Context_check_param_vc >= 0) && (Controller_Context_check_param_vc <= 100)));
}
inline Controller_Context_result_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_result_param_range_check(dst);
}
inline Controller_Context_result_param_range_check(Controller_Context_result_param_vc)
{
    assert(((Controller_Context_result_param_vc >= 0) && (Controller_Context_result_param_vc <= 100)));
}
inline Controller_Context_error_assign_value(dst, src)
{
    dst = src;
    Controller_Context_error_range_check(dst);
}
inline Controller_Context_error_range_check(Controller_Context_error_vc)
{
    assert(((Controller_Context_error_vc >= 0) && (Controller_Context_error_vc <= 100)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_check_param_assign_value(dst.check_param, src.check_param);
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context_error_assign_value(dst.error, src.error);
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
    assert(((MyInteger_vc >= 0) && (MyInteger_vc <= 100)));
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
    assert((((((PID_vc == PID_taste_user_interface) || (PID_vc == PID_timer_manager)) || (PID_vc == PID_actuator)) || (PID_vc == PID_controller)) || (PID_vc == PID_env)));
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
        worker_ctxt_init();
        actuator_ctxt_init();
    }
}
