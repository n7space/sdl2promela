#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_command_lhs int
#define Actuator_Context_command_rhs int
#define Actuator_Context_z int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_parameters_lhs int
#define Controller_Context_parameters_rhs int
#define Controller_Context_z int
#define MyInteger int
#define MyCommand_lhs int
#define MyCommand_rhs int
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
#define Controller_States_finished 0
#define Controller_States_waitforresulta 1
#define Controller_States_waitforresultb 2
#define Controller_States_error 3
#define Controller_States_waitforresultd 4
#define Controller_States_waitforresultc 5
#define Controller_Context_state_finished 0
#define Controller_Context_state_waitforresulta 1
#define Controller_Context_state_waitforresultb 2
#define Controller_Context_state_error 3
#define Controller_Context_state_waitforresultd 4
#define Controller_Context_state_waitforresultc 5
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context_command {
    Actuator_Context_command_lhs lhs;
    Actuator_Context_command_rhs rhs;
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

typedef Controller_Context_parameters {
    Controller_Context_parameters_lhs lhs;
    Controller_Context_parameters_rhs rhs;
}

typedef MyCommand {
    MyCommand_lhs lhs;
    MyCommand_rhs rhs;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_command command;
    Actuator_Context_z z;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_parameters parameters;
    Controller_Context_z z;
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
inline Actuator_Context_command_lhs_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_command_lhs_range_check(dst);
}
inline Actuator_Context_command_lhs_range_check(Actuator_Context_command_lhs_vc)
{
    assert(((Actuator_Context_command_lhs_vc >= 0) && (Actuator_Context_command_lhs_vc <= 65535)));
}
inline Actuator_Context_command_rhs_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_command_rhs_range_check(dst);
}
inline Actuator_Context_command_rhs_range_check(Actuator_Context_command_rhs_vc)
{
    assert(((Actuator_Context_command_rhs_vc >= 0) && (Actuator_Context_command_rhs_vc <= 65535)));
}
inline Actuator_Context_command_assign_value(dst, src)
{
    Actuator_Context_command_lhs_assign_value(dst.lhs, src.lhs);
    Actuator_Context_command_rhs_assign_value(dst.rhs, src.rhs);
}
inline Actuator_Context_z_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_z_range_check(dst);
}
inline Actuator_Context_z_range_check(Actuator_Context_z_vc)
{
    assert(((Actuator_Context_z_vc >= 0) && (Actuator_Context_z_vc <= 65535)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_command_assign_value(dst.command, src.command);
    Actuator_Context_z_assign_value(dst.z, src.z);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert(((((((Controller_States_vc == Controller_States_finished) || (Controller_States_vc == Controller_States_waitforresulta)) || (Controller_States_vc == Controller_States_waitforresultb)) || (Controller_States_vc == Controller_States_error)) || (Controller_States_vc == Controller_States_waitforresultd)) || (Controller_States_vc == Controller_States_waitforresultc)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert(((((((Controller_Context_state_vc == Controller_Context_state_finished) || (Controller_Context_state_vc == Controller_Context_state_waitforresulta)) || (Controller_Context_state_vc == Controller_Context_state_waitforresultb)) || (Controller_Context_state_vc == Controller_Context_state_error)) || (Controller_Context_state_vc == Controller_Context_state_waitforresultd)) || (Controller_Context_state_vc == Controller_Context_state_waitforresultc)));
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
inline Controller_Context_parameters_lhs_assign_value(dst, src)
{
    dst = src;
    Controller_Context_parameters_lhs_range_check(dst);
}
inline Controller_Context_parameters_lhs_range_check(Controller_Context_parameters_lhs_vc)
{
    assert(((Controller_Context_parameters_lhs_vc >= 0) && (Controller_Context_parameters_lhs_vc <= 65535)));
}
inline Controller_Context_parameters_rhs_assign_value(dst, src)
{
    dst = src;
    Controller_Context_parameters_rhs_range_check(dst);
}
inline Controller_Context_parameters_rhs_range_check(Controller_Context_parameters_rhs_vc)
{
    assert(((Controller_Context_parameters_rhs_vc >= 0) && (Controller_Context_parameters_rhs_vc <= 65535)));
}
inline Controller_Context_parameters_assign_value(dst, src)
{
    Controller_Context_parameters_lhs_assign_value(dst.lhs, src.lhs);
    Controller_Context_parameters_rhs_assign_value(dst.rhs, src.rhs);
}
inline Controller_Context_z_assign_value(dst, src)
{
    dst = src;
    Controller_Context_z_range_check(dst);
}
inline Controller_Context_z_range_check(Controller_Context_z_vc)
{
    assert(((Controller_Context_z_vc >= 0) && (Controller_Context_z_vc <= 65535)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_parameters_assign_value(dst.parameters, src.parameters);
    Controller_Context_z_assign_value(dst.z, src.z);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
    MyInteger_range_check(dst);
}
inline MyInteger_range_check(MyInteger_vc)
{
    assert(((MyInteger_vc >= 0) && (MyInteger_vc <= 65535)));
}
inline MyCommand_lhs_assign_value(dst, src)
{
    dst = src;
    MyCommand_lhs_range_check(dst);
}
inline MyCommand_lhs_range_check(MyCommand_lhs_vc)
{
    assert(((MyCommand_lhs_vc >= 0) && (MyCommand_lhs_vc <= 65535)));
}
inline MyCommand_rhs_assign_value(dst, src)
{
    dst = src;
    MyCommand_rhs_range_check(dst);
}
inline MyCommand_rhs_range_check(MyCommand_rhs_vc)
{
    assert(((MyCommand_rhs_vc >= 0) && (MyCommand_rhs_vc <= 65535)));
}
inline MyCommand_assign_value(dst, src)
{
    MyCommand_lhs_assign_value(dst.lhs, src.lhs);
    MyCommand_rhs_assign_value(dst.rhs, src.rhs);
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
