#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_integer_result int
#define Actuator_Context_integer_binary_oper int
#define Actuator_Context_integer_binary_left int
#define Actuator_Context_integer_binary_right int
#define Actuator_Context_integer_unary_expr int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_integer_result int
#define Controller_Context_binary_integer_oper int
#define Controller_Context_binary_integer_left int
#define Controller_Context_binary_integer_right int
#define Controller_Context_unary_integer_expr int
#define Controller_Context_error int
#define Controller_Context_finished int
#define MyInteger int
#define MyIntegerResult int
#define BinaryIntegerTestParam_oper int
#define BinaryIntegerTestParam_left int
#define BinaryIntegerTestParam_right int
#define UnaryIntegerTestParam_expr int
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
#define Actuator_Context_integer_binary_oper_o_plus 0
#define Actuator_Context_integer_binary_oper_o_minus 1
#define Actuator_Context_integer_binary_oper_o_multiply 2
#define Actuator_Context_integer_binary_oper_o_divide 3
#define Actuator_Context_integer_binary_oper_o_modulo 4
#define Actuator_Context_integer_binary_oper_o_remainder 5
#define Controller_States_checknegation1 0
#define Controller_States_checkremainder 1
#define Controller_States_checknegation2 2
#define Controller_States_error 3
#define Controller_States_checkmultiply2 4
#define Controller_States_checkdivide2 5
#define Controller_States_checkdivide1 6
#define Controller_States_checkmultiply1 7
#define Controller_States_checkmodulo 8
#define Controller_States_checkplus2 9
#define Controller_States_checkplus1 10
#define Controller_States_checkminus2 11
#define Controller_States_checkminus1 12
#define Controller_Context_state_checknegation1 0
#define Controller_Context_state_checkremainder 1
#define Controller_Context_state_checknegation2 2
#define Controller_Context_state_error 3
#define Controller_Context_state_checkmultiply2 4
#define Controller_Context_state_checkdivide2 5
#define Controller_Context_state_checkdivide1 6
#define Controller_Context_state_checkmultiply1 7
#define Controller_Context_state_checkmodulo 8
#define Controller_Context_state_checkplus2 9
#define Controller_Context_state_checkplus1 10
#define Controller_Context_state_checkminus2 11
#define Controller_Context_state_checkminus1 12
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Context_binary_integer_oper_o_plus 0
#define Controller_Context_binary_integer_oper_o_minus 1
#define Controller_Context_binary_integer_oper_o_multiply 2
#define Controller_Context_binary_integer_oper_o_divide 3
#define Controller_Context_binary_integer_oper_o_modulo 4
#define Controller_Context_binary_integer_oper_o_remainder 5
#define BinaryIntegerTestParam_oper_o_plus 0
#define BinaryIntegerTestParam_oper_o_minus 1
#define BinaryIntegerTestParam_oper_o_multiply 2
#define BinaryIntegerTestParam_oper_o_divide 3
#define BinaryIntegerTestParam_oper_o_modulo 4
#define BinaryIntegerTestParam_oper_o_remainder 5
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context_integer_binary {
    Actuator_Context_integer_binary_oper oper;
    Actuator_Context_integer_binary_left left;
    Actuator_Context_integer_binary_right right;
}

typedef Actuator_Context_integer_unary {
    Actuator_Context_integer_unary_expr expr;
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

typedef BinaryIntegerTestParam {
    BinaryIntegerTestParam_oper oper;
    BinaryIntegerTestParam_left left;
    BinaryIntegerTestParam_right right;
}

typedef Controller_Context_binary_integer {
    Controller_Context_binary_integer_oper oper;
    Controller_Context_binary_integer_left left;
    Controller_Context_binary_integer_right right;
}

typedef Controller_Context_unary_integer {
    Controller_Context_unary_integer_expr expr;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef UnaryIntegerTestParam {
    UnaryIntegerTestParam_expr expr;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_integer_result integer_result;
    Actuator_Context_integer_binary integer_binary;
    Actuator_Context_integer_unary integer_unary;
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
    Controller_Context_integer_result integer_result;
    Controller_Context_binary_integer binary_integer;
    Controller_Context_unary_integer unary_integer;
    Controller_Context_error error;
    Controller_Context_finished finished;
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
inline Actuator_Context_integer_result_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_integer_result_range_check(dst);
}
inline Actuator_Context_integer_result_range_check(Actuator_Context_integer_result_vc)
{
    assert(((Actuator_Context_integer_result_vc >= -1048576) && (Actuator_Context_integer_result_vc <= 1048576)));
}
inline Actuator_Context_integer_binary_oper_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_integer_binary_oper_range_check(dst);
}
inline Actuator_Context_integer_binary_oper_range_check(Actuator_Context_integer_binary_oper_vc)
{
    assert(((((((Actuator_Context_integer_binary_oper_vc == Actuator_Context_integer_binary_oper_o_plus) || (Actuator_Context_integer_binary_oper_vc == Actuator_Context_integer_binary_oper_o_minus)) || (Actuator_Context_integer_binary_oper_vc == Actuator_Context_integer_binary_oper_o_multiply)) || (Actuator_Context_integer_binary_oper_vc == Actuator_Context_integer_binary_oper_o_divide)) || (Actuator_Context_integer_binary_oper_vc == Actuator_Context_integer_binary_oper_o_modulo)) || (Actuator_Context_integer_binary_oper_vc == Actuator_Context_integer_binary_oper_o_remainder)));
}
inline Actuator_Context_integer_binary_left_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_integer_binary_left_range_check(dst);
}
inline Actuator_Context_integer_binary_left_range_check(Actuator_Context_integer_binary_left_vc)
{
    assert(((Actuator_Context_integer_binary_left_vc >= -1024) && (Actuator_Context_integer_binary_left_vc <= 1024)));
}
inline Actuator_Context_integer_binary_right_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_integer_binary_right_range_check(dst);
}
inline Actuator_Context_integer_binary_right_range_check(Actuator_Context_integer_binary_right_vc)
{
    assert(((Actuator_Context_integer_binary_right_vc >= -1024) && (Actuator_Context_integer_binary_right_vc <= 1024)));
}
inline Actuator_Context_integer_binary_assign_value(dst, src)
{
    Actuator_Context_integer_binary_oper_assign_value(dst.oper, src.oper);
    Actuator_Context_integer_binary_left_assign_value(dst.left, src.left);
    Actuator_Context_integer_binary_right_assign_value(dst.right, src.right);
}
inline Actuator_Context_integer_unary_expr_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_integer_unary_expr_range_check(dst);
}
inline Actuator_Context_integer_unary_expr_range_check(Actuator_Context_integer_unary_expr_vc)
{
    assert(((Actuator_Context_integer_unary_expr_vc >= -1024) && (Actuator_Context_integer_unary_expr_vc <= 1024)));
}
inline Actuator_Context_integer_unary_assign_value(dst, src)
{
    Actuator_Context_integer_unary_expr_assign_value(dst.expr, src.expr);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_integer_result_assign_value(dst.integer_result, src.integer_result);
    Actuator_Context_integer_binary_assign_value(dst.integer_binary, src.integer_binary);
    Actuator_Context_integer_unary_assign_value(dst.integer_unary, src.integer_unary);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((((((((((((((Controller_States_vc == Controller_States_checknegation1) || (Controller_States_vc == Controller_States_checkremainder)) || (Controller_States_vc == Controller_States_checknegation2)) || (Controller_States_vc == Controller_States_error)) || (Controller_States_vc == Controller_States_checkmultiply2)) || (Controller_States_vc == Controller_States_checkdivide2)) || (Controller_States_vc == Controller_States_checkdivide1)) || (Controller_States_vc == Controller_States_checkmultiply1)) || (Controller_States_vc == Controller_States_checkmodulo)) || (Controller_States_vc == Controller_States_checkplus2)) || (Controller_States_vc == Controller_States_checkplus1)) || (Controller_States_vc == Controller_States_checkminus2)) || (Controller_States_vc == Controller_States_checkminus1)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert((((((((((((((Controller_Context_state_vc == Controller_Context_state_checknegation1) || (Controller_Context_state_vc == Controller_Context_state_checkremainder)) || (Controller_Context_state_vc == Controller_Context_state_checknegation2)) || (Controller_Context_state_vc == Controller_Context_state_error)) || (Controller_Context_state_vc == Controller_Context_state_checkmultiply2)) || (Controller_Context_state_vc == Controller_Context_state_checkdivide2)) || (Controller_Context_state_vc == Controller_Context_state_checkdivide1)) || (Controller_Context_state_vc == Controller_Context_state_checkmultiply1)) || (Controller_Context_state_vc == Controller_Context_state_checkmodulo)) || (Controller_Context_state_vc == Controller_Context_state_checkplus2)) || (Controller_Context_state_vc == Controller_Context_state_checkplus1)) || (Controller_Context_state_vc == Controller_Context_state_checkminus2)) || (Controller_Context_state_vc == Controller_Context_state_checkminus1)));
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
inline Controller_Context_integer_result_assign_value(dst, src)
{
    dst = src;
    Controller_Context_integer_result_range_check(dst);
}
inline Controller_Context_integer_result_range_check(Controller_Context_integer_result_vc)
{
    assert(((Controller_Context_integer_result_vc >= -1048576) && (Controller_Context_integer_result_vc <= 1048576)));
}
inline Controller_Context_binary_integer_oper_assign_value(dst, src)
{
    dst = src;
    Controller_Context_binary_integer_oper_range_check(dst);
}
inline Controller_Context_binary_integer_oper_range_check(Controller_Context_binary_integer_oper_vc)
{
    assert(((((((Controller_Context_binary_integer_oper_vc == Controller_Context_binary_integer_oper_o_plus) || (Controller_Context_binary_integer_oper_vc == Controller_Context_binary_integer_oper_o_minus)) || (Controller_Context_binary_integer_oper_vc == Controller_Context_binary_integer_oper_o_multiply)) || (Controller_Context_binary_integer_oper_vc == Controller_Context_binary_integer_oper_o_divide)) || (Controller_Context_binary_integer_oper_vc == Controller_Context_binary_integer_oper_o_modulo)) || (Controller_Context_binary_integer_oper_vc == Controller_Context_binary_integer_oper_o_remainder)));
}
inline Controller_Context_binary_integer_left_assign_value(dst, src)
{
    dst = src;
    Controller_Context_binary_integer_left_range_check(dst);
}
inline Controller_Context_binary_integer_left_range_check(Controller_Context_binary_integer_left_vc)
{
    assert(((Controller_Context_binary_integer_left_vc >= -1024) && (Controller_Context_binary_integer_left_vc <= 1024)));
}
inline Controller_Context_binary_integer_right_assign_value(dst, src)
{
    dst = src;
    Controller_Context_binary_integer_right_range_check(dst);
}
inline Controller_Context_binary_integer_right_range_check(Controller_Context_binary_integer_right_vc)
{
    assert(((Controller_Context_binary_integer_right_vc >= -1024) && (Controller_Context_binary_integer_right_vc <= 1024)));
}
inline Controller_Context_binary_integer_assign_value(dst, src)
{
    Controller_Context_binary_integer_oper_assign_value(dst.oper, src.oper);
    Controller_Context_binary_integer_left_assign_value(dst.left, src.left);
    Controller_Context_binary_integer_right_assign_value(dst.right, src.right);
}
inline Controller_Context_unary_integer_expr_assign_value(dst, src)
{
    dst = src;
    Controller_Context_unary_integer_expr_range_check(dst);
}
inline Controller_Context_unary_integer_expr_range_check(Controller_Context_unary_integer_expr_vc)
{
    assert(((Controller_Context_unary_integer_expr_vc >= -1024) && (Controller_Context_unary_integer_expr_vc <= 1024)));
}
inline Controller_Context_unary_integer_assign_value(dst, src)
{
    Controller_Context_unary_integer_expr_assign_value(dst.expr, src.expr);
}
inline Controller_Context_error_assign_value(dst, src)
{
    dst = src;
    Controller_Context_error_range_check(dst);
}
inline Controller_Context_error_range_check(Controller_Context_error_vc)
{
    assert(((Controller_Context_error_vc >= -1024) && (Controller_Context_error_vc <= 1024)));
}
inline Controller_Context_finished_assign_value(dst, src)
{
    dst = src;
    Controller_Context_finished_range_check(dst);
}
inline Controller_Context_finished_range_check(Controller_Context_finished_vc)
{
    assert(((Controller_Context_finished_vc >= -1024) && (Controller_Context_finished_vc <= 1024)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_integer_result_assign_value(dst.integer_result, src.integer_result);
    Controller_Context_binary_integer_assign_value(dst.binary_integer, src.binary_integer);
    Controller_Context_unary_integer_assign_value(dst.unary_integer, src.unary_integer);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_finished_assign_value(dst.finished, src.finished);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
    MyInteger_range_check(dst);
}
inline MyInteger_range_check(MyInteger_vc)
{
    assert(((MyInteger_vc >= -1024) && (MyInteger_vc <= 1024)));
}
inline MyIntegerResult_assign_value(dst, src)
{
    dst = src;
    MyIntegerResult_range_check(dst);
}
inline MyIntegerResult_range_check(MyIntegerResult_vc)
{
    assert(((MyIntegerResult_vc >= -1048576) && (MyIntegerResult_vc <= 1048576)));
}
inline BinaryIntegerTestParam_oper_assign_value(dst, src)
{
    dst = src;
    BinaryIntegerTestParam_oper_range_check(dst);
}
inline BinaryIntegerTestParam_oper_range_check(BinaryIntegerTestParam_oper_vc)
{
    assert(((((((BinaryIntegerTestParam_oper_vc == BinaryIntegerTestParam_oper_o_plus) || (BinaryIntegerTestParam_oper_vc == BinaryIntegerTestParam_oper_o_minus)) || (BinaryIntegerTestParam_oper_vc == BinaryIntegerTestParam_oper_o_multiply)) || (BinaryIntegerTestParam_oper_vc == BinaryIntegerTestParam_oper_o_divide)) || (BinaryIntegerTestParam_oper_vc == BinaryIntegerTestParam_oper_o_modulo)) || (BinaryIntegerTestParam_oper_vc == BinaryIntegerTestParam_oper_o_remainder)));
}
inline BinaryIntegerTestParam_left_assign_value(dst, src)
{
    dst = src;
    BinaryIntegerTestParam_left_range_check(dst);
}
inline BinaryIntegerTestParam_left_range_check(BinaryIntegerTestParam_left_vc)
{
    assert(((BinaryIntegerTestParam_left_vc >= -1024) && (BinaryIntegerTestParam_left_vc <= 1024)));
}
inline BinaryIntegerTestParam_right_assign_value(dst, src)
{
    dst = src;
    BinaryIntegerTestParam_right_range_check(dst);
}
inline BinaryIntegerTestParam_right_range_check(BinaryIntegerTestParam_right_vc)
{
    assert(((BinaryIntegerTestParam_right_vc >= -1024) && (BinaryIntegerTestParam_right_vc <= 1024)));
}
inline BinaryIntegerTestParam_assign_value(dst, src)
{
    BinaryIntegerTestParam_oper_assign_value(dst.oper, src.oper);
    BinaryIntegerTestParam_left_assign_value(dst.left, src.left);
    BinaryIntegerTestParam_right_assign_value(dst.right, src.right);
}
inline UnaryIntegerTestParam_expr_assign_value(dst, src)
{
    dst = src;
    UnaryIntegerTestParam_expr_range_check(dst);
}
inline UnaryIntegerTestParam_expr_range_check(UnaryIntegerTestParam_expr_vc)
{
    assert(((UnaryIntegerTestParam_expr_vc >= -1024) && (UnaryIntegerTestParam_expr_vc <= 1024)));
}
inline UnaryIntegerTestParam_assign_value(dst, src)
{
    UnaryIntegerTestParam_expr_assign_value(dst.expr, src.expr);
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
