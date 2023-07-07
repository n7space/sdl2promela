#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_test_param int
#define Controller_Context_up_check_param int
#define Controller_Context_down_check_param int
#define Controller_Context_up_result_param int
#define Controller_Context_down_result_param int
#define Controller_Context_up_value int
#define Controller_Context_down_value int
#define Controller_Context_error int
#define Controller_Context_reached int
#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_check_param int
#define Actuator_Context_result_param int
#define MyInteger int
#define MyResultInteger int
#define MyTestInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID_Range int
#define PID int
#define Environ_test_p1 int
#define TimerData_timer_enabled bool
#define TimerData_interval int
#define Controller_States_waitingforup 0
#define Controller_States_wait 1
#define Controller_States_waitingforboth 2
#define Controller_States_waitingfordown 3
#define Controller_Context_state_waitingforup 0
#define Controller_Context_state_wait 1
#define Controller_Context_state_waitingforboth 2
#define Controller_Context_state_waitingfordown 3
#define Controller_Context_sender_controller 0
#define Controller_Context_sender_down 1
#define Controller_Context_sender_environ 2
#define Controller_Context_sender_up 3
#define Controller_Context_sender_env 4
#define Controller_Context_offspring_controller 0
#define Controller_Context_offspring_down 1
#define Controller_Context_offspring_environ 2
#define Controller_Context_offspring_up 3
#define Controller_Context_offspring_env 4
#define Actuator_States_operation 0
#define Actuator_States_wait 1
#define Actuator_Context_state_operation 0
#define Actuator_Context_state_wait 1
#define Actuator_Context_sender_controller 0
#define Actuator_Context_sender_down 1
#define Actuator_Context_sender_environ 2
#define Actuator_Context_sender_up 3
#define Actuator_Context_sender_env 4
#define Actuator_Context_offspring_controller 0
#define Actuator_Context_offspring_down 1
#define Actuator_Context_offspring_environ 2
#define Actuator_Context_offspring_up 3
#define Actuator_Context_offspring_env 4
#define PID_controller 0
#define PID_down 1
#define PID_environ 2
#define PID_up 3
#define PID_env 4
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_check_param check_param;
    Actuator_Context_result_param result_param;
}

typedef AggregateTimerData_controller {
    bit dummy;
}

typedef AggregateTimerData_down {
    bit dummy;
}

typedef AggregateTimerData_dummy_entry {
    bit dummy;
}

typedef AggregateTimerData_up {
    bit dummy;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_test_param test_param;
    Controller_Context_up_check_param up_check_param;
    Controller_Context_down_check_param down_check_param;
    Controller_Context_up_result_param up_result_param;
    Controller_Context_down_result_param down_result_param;
    Controller_Context_up_value up_value;
    Controller_Context_down_value down_value;
    Controller_Context_error error;
    Controller_Context_reached reached;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef AggregateTimerData {
    AggregateTimerData_controller controller;
    AggregateTimerData_down down;
    AggregateTimerData_up up;
    AggregateTimerData_dummy_entry dummy_entry;
}

inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert(((((Controller_States_vc == Controller_States_waitingforup) || (Controller_States_vc == Controller_States_wait)) || (Controller_States_vc == Controller_States_waitingforboth)) || (Controller_States_vc == Controller_States_waitingfordown)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert(((((Controller_Context_state_vc == Controller_Context_state_waitingforup) || (Controller_Context_state_vc == Controller_Context_state_wait)) || (Controller_Context_state_vc == Controller_Context_state_waitingforboth)) || (Controller_Context_state_vc == Controller_Context_state_waitingfordown)));
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
    assert((((((Controller_Context_sender_vc == Controller_Context_sender_controller) || (Controller_Context_sender_vc == Controller_Context_sender_down)) || (Controller_Context_sender_vc == Controller_Context_sender_environ)) || (Controller_Context_sender_vc == Controller_Context_sender_up)) || (Controller_Context_sender_vc == Controller_Context_sender_env)));
}
inline Controller_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context_offspring_range_check(dst);
}
inline Controller_Context_offspring_range_check(Controller_Context_offspring_vc)
{
    assert((((((Controller_Context_offspring_vc == Controller_Context_offspring_controller) || (Controller_Context_offspring_vc == Controller_Context_offspring_down)) || (Controller_Context_offspring_vc == Controller_Context_offspring_environ)) || (Controller_Context_offspring_vc == Controller_Context_offspring_up)) || (Controller_Context_offspring_vc == Controller_Context_offspring_env)));
}
inline Controller_Context_test_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_test_param_range_check(dst);
}
inline Controller_Context_test_param_range_check(Controller_Context_test_param_vc)
{
    assert(((Controller_Context_test_param_vc >= 1) && (Controller_Context_test_param_vc <= 4)));
}
inline Controller_Context_up_check_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_up_check_param_range_check(dst);
}
inline Controller_Context_up_check_param_range_check(Controller_Context_up_check_param_vc)
{
    assert(((Controller_Context_up_check_param_vc >= 0) && (Controller_Context_up_check_param_vc <= 100)));
}
inline Controller_Context_down_check_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_down_check_param_range_check(dst);
}
inline Controller_Context_down_check_param_range_check(Controller_Context_down_check_param_vc)
{
    assert(((Controller_Context_down_check_param_vc >= 0) && (Controller_Context_down_check_param_vc <= 100)));
}
inline Controller_Context_up_result_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_up_result_param_range_check(dst);
}
inline Controller_Context_up_result_param_range_check(Controller_Context_up_result_param_vc)
{
    assert(((Controller_Context_up_result_param_vc >= 0) && (Controller_Context_up_result_param_vc <= 10000)));
}
inline Controller_Context_down_result_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_down_result_param_range_check(dst);
}
inline Controller_Context_down_result_param_range_check(Controller_Context_down_result_param_vc)
{
    assert(((Controller_Context_down_result_param_vc >= 0) && (Controller_Context_down_result_param_vc <= 10000)));
}
inline Controller_Context_up_value_assign_value(dst, src)
{
    dst = src;
    Controller_Context_up_value_range_check(dst);
}
inline Controller_Context_up_value_range_check(Controller_Context_up_value_vc)
{
    assert(((Controller_Context_up_value_vc >= 0) && (Controller_Context_up_value_vc <= 10000)));
}
inline Controller_Context_down_value_assign_value(dst, src)
{
    dst = src;
    Controller_Context_down_value_range_check(dst);
}
inline Controller_Context_down_value_range_check(Controller_Context_down_value_vc)
{
    assert(((Controller_Context_down_value_vc >= 0) && (Controller_Context_down_value_vc <= 10000)));
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
inline Controller_Context_reached_assign_value(dst, src)
{
    dst = src;
    Controller_Context_reached_range_check(dst);
}
inline Controller_Context_reached_range_check(Controller_Context_reached_vc)
{
    assert(((Controller_Context_reached_vc >= 0) && (Controller_Context_reached_vc <= 100)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_test_param_assign_value(dst.test_param, src.test_param);
    Controller_Context_up_check_param_assign_value(dst.up_check_param, src.up_check_param);
    Controller_Context_down_check_param_assign_value(dst.down_check_param, src.down_check_param);
    Controller_Context_up_result_param_assign_value(dst.up_result_param, src.up_result_param);
    Controller_Context_down_result_param_assign_value(dst.down_result_param, src.down_result_param);
    Controller_Context_up_value_assign_value(dst.up_value, src.up_value);
    Controller_Context_down_value_assign_value(dst.down_value, src.down_value);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_reached_assign_value(dst.reached, src.reached);
}
inline Actuator_States_assign_value(dst, src)
{
    dst = src;
    Actuator_States_range_check(dst);
}
inline Actuator_States_range_check(Actuator_States_vc)
{
    assert(((Actuator_States_vc == Actuator_States_operation) || (Actuator_States_vc == Actuator_States_wait)));
}
inline Actuator_Context_state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_state_range_check(dst);
}
inline Actuator_Context_state_range_check(Actuator_Context_state_vc)
{
    assert(((Actuator_Context_state_vc == Actuator_Context_state_operation) || (Actuator_Context_state_vc == Actuator_Context_state_wait)));
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
    assert((((((Actuator_Context_sender_vc == Actuator_Context_sender_controller) || (Actuator_Context_sender_vc == Actuator_Context_sender_down)) || (Actuator_Context_sender_vc == Actuator_Context_sender_environ)) || (Actuator_Context_sender_vc == Actuator_Context_sender_up)) || (Actuator_Context_sender_vc == Actuator_Context_sender_env)));
}
inline Actuator_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_offspring_range_check(dst);
}
inline Actuator_Context_offspring_range_check(Actuator_Context_offspring_vc)
{
    assert((((((Actuator_Context_offspring_vc == Actuator_Context_offspring_controller) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_down)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_environ)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_up)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_env)));
}
inline Actuator_Context_check_param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_check_param_range_check(dst);
}
inline Actuator_Context_check_param_range_check(Actuator_Context_check_param_vc)
{
    assert(((Actuator_Context_check_param_vc >= 0) && (Actuator_Context_check_param_vc <= 100)));
}
inline Actuator_Context_result_param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_result_param_range_check(dst);
}
inline Actuator_Context_result_param_range_check(Actuator_Context_result_param_vc)
{
    assert(((Actuator_Context_result_param_vc >= 0) && (Actuator_Context_result_param_vc <= 10000)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_check_param_assign_value(dst.check_param, src.check_param);
    Actuator_Context_result_param_assign_value(dst.result_param, src.result_param);
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
inline MyResultInteger_assign_value(dst, src)
{
    dst = src;
    MyResultInteger_range_check(dst);
}
inline MyResultInteger_range_check(MyResultInteger_vc)
{
    assert(((MyResultInteger_vc >= 0) && (MyResultInteger_vc <= 10000)));
}
inline MyTestInteger_assign_value(dst, src)
{
    dst = src;
    MyTestInteger_range_check(dst);
}
inline MyTestInteger_range_check(MyTestInteger_vc)
{
    assert(((MyTestInteger_vc >= 1) && (MyTestInteger_vc <= 4)));
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
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 5)));
}
inline PID_assign_value(dst, src)
{
    dst = src;
    PID_range_check(dst);
}
inline PID_range_check(PID_vc)
{
    assert((((((PID_vc == PID_controller) || (PID_vc == PID_down)) || (PID_vc == PID_environ)) || (PID_vc == PID_up)) || (PID_vc == PID_env)));
}
inline Environ_test_p1_assign_value(dst, src)
{
    dst = src;
    Environ_test_p1_range_check(dst);
}
inline Environ_test_p1_range_check(Environ_test_p1_vc)
{
    assert(((Environ_test_p1_vc >= 1) && (Environ_test_p1_vc <= 4)));
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
inline AggregateTimerData_controller_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_down_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_up_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_dummy_entry_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_assign_value(dst, src)
{
    AggregateTimerData_controller_assign_value(dst.controller, src.controller);
    AggregateTimerData_down_assign_value(dst.down, src.down);
    AggregateTimerData_up_assign_value(dst.up, src.up);
    AggregateTimerData_dummy_entry_assign_value(dst.dummy_entry, src.dummy_entry);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
