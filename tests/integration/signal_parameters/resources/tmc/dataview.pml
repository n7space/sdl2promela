#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_first_check_param int
#define Actuator_Context_second_check_param int
#define Actuator_Context_result_param int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_error int
#define Controller_Context_reached int
#define Controller_Context_expected int
#define Controller_Context_test_param int
#define Controller_Context_check_param int
#define Controller_Context_result_param int
#define MyInteger int
#define TestInteger int
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
#define Actuator_States_second 0
#define Actuator_States_first 1
#define Actuator_Context_state_second 0
#define Actuator_Context_state_first 1
#define Actuator_Context_sender_actuator 0
#define Actuator_Context_sender_controller 1
#define Actuator_Context_sender_environ 2
#define Actuator_Context_sender_env 3
#define Actuator_Context_offspring_actuator 0
#define Actuator_Context_offspring_controller 1
#define Actuator_Context_offspring_environ 2
#define Actuator_Context_offspring_env 3
#define Controller_States_operationb 0
#define Controller_States_wait 1
#define Controller_States_operationa 2
#define Controller_Context_state_operationb 0
#define Controller_Context_state_wait 1
#define Controller_Context_state_operationa 2
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_environ 2
#define Controller_Context_sender_env 3
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_environ 2
#define Controller_Context_offspring_env 3
#define PID_actuator 0
#define PID_controller 1
#define PID_environ 2
#define PID_env 3
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_first_check_param first_check_param;
    Actuator_Context_second_check_param second_check_param;
    Actuator_Context_result_param result_param;
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
    Controller_Context_error error;
    Controller_Context_reached reached;
    Controller_Context_expected expected;
    Controller_Context_test_param test_param;
    Controller_Context_check_param check_param;
    Controller_Context_result_param result_param;
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

inline Actuator_States_assign_value(dst, src)
{
    dst = src;
    Actuator_States_range_check(dst);
}
inline Actuator_States_range_check(Actuator_States_vc)
{
    assert(((Actuator_States_vc == Actuator_States_second) || (Actuator_States_vc == Actuator_States_first)));
}
inline Actuator_Context_state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_state_range_check(dst);
}
inline Actuator_Context_state_range_check(Actuator_Context_state_vc)
{
    assert(((Actuator_Context_state_vc == Actuator_Context_state_second) || (Actuator_Context_state_vc == Actuator_Context_state_first)));
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
    assert(((((Actuator_Context_sender_vc == Actuator_Context_sender_actuator) || (Actuator_Context_sender_vc == Actuator_Context_sender_controller)) || (Actuator_Context_sender_vc == Actuator_Context_sender_environ)) || (Actuator_Context_sender_vc == Actuator_Context_sender_env)));
}
inline Actuator_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_offspring_range_check(dst);
}
inline Actuator_Context_offspring_range_check(Actuator_Context_offspring_vc)
{
    assert(((((Actuator_Context_offspring_vc == Actuator_Context_offspring_actuator) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_controller)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_environ)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_env)));
}
inline Actuator_Context_first_check_param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_first_check_param_range_check(dst);
}
inline Actuator_Context_first_check_param_range_check(Actuator_Context_first_check_param_vc)
{
    assert(((Actuator_Context_first_check_param_vc >= 0) && (Actuator_Context_first_check_param_vc <= 10000)));
}
inline Actuator_Context_second_check_param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_second_check_param_range_check(dst);
}
inline Actuator_Context_second_check_param_range_check(Actuator_Context_second_check_param_vc)
{
    assert(((Actuator_Context_second_check_param_vc >= 0) && (Actuator_Context_second_check_param_vc <= 10000)));
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
    Actuator_Context_first_check_param_assign_value(dst.first_check_param, src.first_check_param);
    Actuator_Context_second_check_param_assign_value(dst.second_check_param, src.second_check_param);
    Actuator_Context_result_param_assign_value(dst.result_param, src.result_param);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((((Controller_States_vc == Controller_States_operationb) || (Controller_States_vc == Controller_States_wait)) || (Controller_States_vc == Controller_States_operationa)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert((((Controller_Context_state_vc == Controller_Context_state_operationb) || (Controller_Context_state_vc == Controller_Context_state_wait)) || (Controller_Context_state_vc == Controller_Context_state_operationa)));
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
    assert(((((Controller_Context_sender_vc == Controller_Context_sender_actuator) || (Controller_Context_sender_vc == Controller_Context_sender_controller)) || (Controller_Context_sender_vc == Controller_Context_sender_environ)) || (Controller_Context_sender_vc == Controller_Context_sender_env)));
}
inline Controller_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context_offspring_range_check(dst);
}
inline Controller_Context_offspring_range_check(Controller_Context_offspring_vc)
{
    assert(((((Controller_Context_offspring_vc == Controller_Context_offspring_actuator) || (Controller_Context_offspring_vc == Controller_Context_offspring_controller)) || (Controller_Context_offspring_vc == Controller_Context_offspring_environ)) || (Controller_Context_offspring_vc == Controller_Context_offspring_env)));
}
inline Controller_Context_error_assign_value(dst, src)
{
    dst = src;
    Controller_Context_error_range_check(dst);
}
inline Controller_Context_error_range_check(Controller_Context_error_vc)
{
    assert(((Controller_Context_error_vc >= 0) && (Controller_Context_error_vc <= 10000)));
}
inline Controller_Context_reached_assign_value(dst, src)
{
    dst = src;
    Controller_Context_reached_range_check(dst);
}
inline Controller_Context_reached_range_check(Controller_Context_reached_vc)
{
    assert(((Controller_Context_reached_vc >= 0) && (Controller_Context_reached_vc <= 10000)));
}
inline Controller_Context_expected_assign_value(dst, src)
{
    dst = src;
    Controller_Context_expected_range_check(dst);
}
inline Controller_Context_expected_range_check(Controller_Context_expected_vc)
{
    assert(((Controller_Context_expected_vc >= 0) && (Controller_Context_expected_vc <= 10000)));
}
inline Controller_Context_test_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_test_param_range_check(dst);
}
inline Controller_Context_test_param_range_check(Controller_Context_test_param_vc)
{
    assert(((Controller_Context_test_param_vc >= 0) && (Controller_Context_test_param_vc <= 10)));
}
inline Controller_Context_check_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_check_param_range_check(dst);
}
inline Controller_Context_check_param_range_check(Controller_Context_check_param_vc)
{
    assert(((Controller_Context_check_param_vc >= 0) && (Controller_Context_check_param_vc <= 10000)));
}
inline Controller_Context_result_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_result_param_range_check(dst);
}
inline Controller_Context_result_param_range_check(Controller_Context_result_param_vc)
{
    assert(((Controller_Context_result_param_vc >= 0) && (Controller_Context_result_param_vc <= 10000)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_reached_assign_value(dst.reached, src.reached);
    Controller_Context_expected_assign_value(dst.expected, src.expected);
    Controller_Context_test_param_assign_value(dst.test_param, src.test_param);
    Controller_Context_check_param_assign_value(dst.check_param, src.check_param);
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
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
inline TestInteger_assign_value(dst, src)
{
    dst = src;
    TestInteger_range_check(dst);
}
inline TestInteger_range_check(TestInteger_vc)
{
    assert(((TestInteger_vc >= 0) && (TestInteger_vc <= 10)));
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
    assert(((((PID_vc == PID_actuator) || (PID_vc == PID_controller)) || (PID_vc == PID_environ)) || (PID_vc == PID_env)));
}
inline Environ_test_p1_assign_value(dst, src)
{
    dst = src;
    Environ_test_p1_range_check(dst);
}
inline Environ_test_p1_range_check(Environ_test_p1_vc)
{
    assert(((Environ_test_p1_vc >= 0) && (Environ_test_p1_vc <= 10)));
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
