#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_boolean_result bool
#define Actuator_Context_boolean_binary_oper int
#define Actuator_Context_boolean_binary_left bool
#define Actuator_Context_boolean_binary_right bool
#define Actuator_Context_boolean_unary_expr bool
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_boolean_result bool
#define Controller_Context_binary_boolean_oper int
#define Controller_Context_binary_boolean_left bool
#define Controller_Context_binary_boolean_right bool
#define Controller_Context_unary_boolean_expr bool
#define Controller_Context_error int
#define Controller_Context_finished int
#define MyInteger int
#define MyBooleanResult bool
#define BinaryBooleanTestParam_oper int
#define BinaryBooleanTestParam_left bool
#define BinaryBooleanTestParam_right bool
#define UnaryBooleanTestParam_expr bool
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
#define Actuator_Context_boolean_binary_oper_o_and 0
#define Actuator_Context_boolean_binary_oper_o_or 1
#define Actuator_Context_boolean_binary_oper_o_xor 2
#define Actuator_Context_boolean_binary_oper_o_implies 3
#define Controller_States_checkxor2 0
#define Controller_States_checkxor1 1
#define Controller_States_checkimplies2 2
#define Controller_States_checkimplies3 3
#define Controller_States_checkand2 4
#define Controller_States_checknot1 5
#define Controller_States_checkxor3 6
#define Controller_States_checkor3 7
#define Controller_States_checkimplies4 8
#define Controller_States_checkand4 9
#define Controller_States_checkor4 10
#define Controller_States_checkand1 11
#define Controller_States_checknot2 12
#define Controller_States_checkor1 13
#define Controller_States_checkand3 14
#define Controller_States_checkxor4 15
#define Controller_States_checkimplies1 16
#define Controller_States_error 17
#define Controller_States_checkor2 18
#define Controller_Context_state_checkxor2 0
#define Controller_Context_state_checkxor1 1
#define Controller_Context_state_checkimplies2 2
#define Controller_Context_state_checkimplies3 3
#define Controller_Context_state_checkand2 4
#define Controller_Context_state_checknot1 5
#define Controller_Context_state_checkxor3 6
#define Controller_Context_state_checkor3 7
#define Controller_Context_state_checkimplies4 8
#define Controller_Context_state_checkand4 9
#define Controller_Context_state_checkor4 10
#define Controller_Context_state_checkand1 11
#define Controller_Context_state_checknot2 12
#define Controller_Context_state_checkor1 13
#define Controller_Context_state_checkand3 14
#define Controller_Context_state_checkxor4 15
#define Controller_Context_state_checkimplies1 16
#define Controller_Context_state_error 17
#define Controller_Context_state_checkor2 18
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Context_binary_boolean_oper_o_and 0
#define Controller_Context_binary_boolean_oper_o_or 1
#define Controller_Context_binary_boolean_oper_o_xor 2
#define Controller_Context_binary_boolean_oper_o_implies 3
#define BinaryBooleanTestParam_oper_o_and 0
#define BinaryBooleanTestParam_oper_o_or 1
#define BinaryBooleanTestParam_oper_o_xor 2
#define BinaryBooleanTestParam_oper_o_implies 3
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context_boolean_binary {
    Actuator_Context_boolean_binary_oper oper;
    Actuator_Context_boolean_binary_left left;
    Actuator_Context_boolean_binary_right right;
}

typedef Actuator_Context_boolean_unary {
    Actuator_Context_boolean_unary_expr expr;
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

typedef BinaryBooleanTestParam {
    BinaryBooleanTestParam_oper oper;
    BinaryBooleanTestParam_left left;
    BinaryBooleanTestParam_right right;
}

typedef Controller_Context_binary_boolean {
    Controller_Context_binary_boolean_oper oper;
    Controller_Context_binary_boolean_left left;
    Controller_Context_binary_boolean_right right;
}

typedef Controller_Context_unary_boolean {
    Controller_Context_unary_boolean_expr expr;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef UnaryBooleanTestParam {
    UnaryBooleanTestParam_expr expr;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_boolean_result boolean_result;
    Actuator_Context_boolean_binary boolean_binary;
    Actuator_Context_boolean_unary boolean_unary;
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
    Controller_Context_boolean_result boolean_result;
    Controller_Context_binary_boolean binary_boolean;
    Controller_Context_unary_boolean unary_boolean;
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
inline Actuator_Context_boolean_result_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_boolean_result_range_check(dst);
}
inline Actuator_Context_boolean_result_range_check(Actuator_Context_boolean_result_vc)
{
    assert(true);
}
inline Actuator_Context_boolean_binary_oper_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_boolean_binary_oper_range_check(dst);
}
inline Actuator_Context_boolean_binary_oper_range_check(Actuator_Context_boolean_binary_oper_vc)
{
    assert(((((Actuator_Context_boolean_binary_oper_vc == Actuator_Context_boolean_binary_oper_o_and) || (Actuator_Context_boolean_binary_oper_vc == Actuator_Context_boolean_binary_oper_o_or)) || (Actuator_Context_boolean_binary_oper_vc == Actuator_Context_boolean_binary_oper_o_xor)) || (Actuator_Context_boolean_binary_oper_vc == Actuator_Context_boolean_binary_oper_o_implies)));
}
inline Actuator_Context_boolean_binary_left_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_boolean_binary_left_range_check(dst);
}
inline Actuator_Context_boolean_binary_left_range_check(Actuator_Context_boolean_binary_left_vc)
{
    assert(true);
}
inline Actuator_Context_boolean_binary_right_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_boolean_binary_right_range_check(dst);
}
inline Actuator_Context_boolean_binary_right_range_check(Actuator_Context_boolean_binary_right_vc)
{
    assert(true);
}
inline Actuator_Context_boolean_binary_assign_value(dst, src)
{
    Actuator_Context_boolean_binary_oper_assign_value(dst.oper, src.oper);
    Actuator_Context_boolean_binary_left_assign_value(dst.left, src.left);
    Actuator_Context_boolean_binary_right_assign_value(dst.right, src.right);
}
inline Actuator_Context_boolean_unary_expr_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_boolean_unary_expr_range_check(dst);
}
inline Actuator_Context_boolean_unary_expr_range_check(Actuator_Context_boolean_unary_expr_vc)
{
    assert(true);
}
inline Actuator_Context_boolean_unary_assign_value(dst, src)
{
    Actuator_Context_boolean_unary_expr_assign_value(dst.expr, src.expr);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_boolean_result_assign_value(dst.boolean_result, src.boolean_result);
    Actuator_Context_boolean_binary_assign_value(dst.boolean_binary, src.boolean_binary);
    Actuator_Context_boolean_unary_assign_value(dst.boolean_unary, src.boolean_unary);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((((((((((((((((((((Controller_States_vc == Controller_States_checkxor2) || (Controller_States_vc == Controller_States_checkxor1)) || (Controller_States_vc == Controller_States_checkimplies2)) || (Controller_States_vc == Controller_States_checkimplies3)) || (Controller_States_vc == Controller_States_checkand2)) || (Controller_States_vc == Controller_States_checknot1)) || (Controller_States_vc == Controller_States_checkxor3)) || (Controller_States_vc == Controller_States_checkor3)) || (Controller_States_vc == Controller_States_checkimplies4)) || (Controller_States_vc == Controller_States_checkand4)) || (Controller_States_vc == Controller_States_checkor4)) || (Controller_States_vc == Controller_States_checkand1)) || (Controller_States_vc == Controller_States_checknot2)) || (Controller_States_vc == Controller_States_checkor1)) || (Controller_States_vc == Controller_States_checkand3)) || (Controller_States_vc == Controller_States_checkxor4)) || (Controller_States_vc == Controller_States_checkimplies1)) || (Controller_States_vc == Controller_States_error)) || (Controller_States_vc == Controller_States_checkor2)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert((((((((((((((((((((Controller_Context_state_vc == Controller_Context_state_checkxor2) || (Controller_Context_state_vc == Controller_Context_state_checkxor1)) || (Controller_Context_state_vc == Controller_Context_state_checkimplies2)) || (Controller_Context_state_vc == Controller_Context_state_checkimplies3)) || (Controller_Context_state_vc == Controller_Context_state_checkand2)) || (Controller_Context_state_vc == Controller_Context_state_checknot1)) || (Controller_Context_state_vc == Controller_Context_state_checkxor3)) || (Controller_Context_state_vc == Controller_Context_state_checkor3)) || (Controller_Context_state_vc == Controller_Context_state_checkimplies4)) || (Controller_Context_state_vc == Controller_Context_state_checkand4)) || (Controller_Context_state_vc == Controller_Context_state_checkor4)) || (Controller_Context_state_vc == Controller_Context_state_checkand1)) || (Controller_Context_state_vc == Controller_Context_state_checknot2)) || (Controller_Context_state_vc == Controller_Context_state_checkor1)) || (Controller_Context_state_vc == Controller_Context_state_checkand3)) || (Controller_Context_state_vc == Controller_Context_state_checkxor4)) || (Controller_Context_state_vc == Controller_Context_state_checkimplies1)) || (Controller_Context_state_vc == Controller_Context_state_error)) || (Controller_Context_state_vc == Controller_Context_state_checkor2)));
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
inline Controller_Context_boolean_result_assign_value(dst, src)
{
    dst = src;
    Controller_Context_boolean_result_range_check(dst);
}
inline Controller_Context_boolean_result_range_check(Controller_Context_boolean_result_vc)
{
    assert(true);
}
inline Controller_Context_binary_boolean_oper_assign_value(dst, src)
{
    dst = src;
    Controller_Context_binary_boolean_oper_range_check(dst);
}
inline Controller_Context_binary_boolean_oper_range_check(Controller_Context_binary_boolean_oper_vc)
{
    assert(((((Controller_Context_binary_boolean_oper_vc == Controller_Context_binary_boolean_oper_o_and) || (Controller_Context_binary_boolean_oper_vc == Controller_Context_binary_boolean_oper_o_or)) || (Controller_Context_binary_boolean_oper_vc == Controller_Context_binary_boolean_oper_o_xor)) || (Controller_Context_binary_boolean_oper_vc == Controller_Context_binary_boolean_oper_o_implies)));
}
inline Controller_Context_binary_boolean_left_assign_value(dst, src)
{
    dst = src;
    Controller_Context_binary_boolean_left_range_check(dst);
}
inline Controller_Context_binary_boolean_left_range_check(Controller_Context_binary_boolean_left_vc)
{
    assert(true);
}
inline Controller_Context_binary_boolean_right_assign_value(dst, src)
{
    dst = src;
    Controller_Context_binary_boolean_right_range_check(dst);
}
inline Controller_Context_binary_boolean_right_range_check(Controller_Context_binary_boolean_right_vc)
{
    assert(true);
}
inline Controller_Context_binary_boolean_assign_value(dst, src)
{
    Controller_Context_binary_boolean_oper_assign_value(dst.oper, src.oper);
    Controller_Context_binary_boolean_left_assign_value(dst.left, src.left);
    Controller_Context_binary_boolean_right_assign_value(dst.right, src.right);
}
inline Controller_Context_unary_boolean_expr_assign_value(dst, src)
{
    dst = src;
    Controller_Context_unary_boolean_expr_range_check(dst);
}
inline Controller_Context_unary_boolean_expr_range_check(Controller_Context_unary_boolean_expr_vc)
{
    assert(true);
}
inline Controller_Context_unary_boolean_assign_value(dst, src)
{
    Controller_Context_unary_boolean_expr_assign_value(dst.expr, src.expr);
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
    Controller_Context_boolean_result_assign_value(dst.boolean_result, src.boolean_result);
    Controller_Context_binary_boolean_assign_value(dst.binary_boolean, src.binary_boolean);
    Controller_Context_unary_boolean_assign_value(dst.unary_boolean, src.unary_boolean);
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
inline MyBooleanResult_assign_value(dst, src)
{
    dst = src;
    MyBooleanResult_range_check(dst);
}
inline MyBooleanResult_range_check(MyBooleanResult_vc)
{
    assert(true);
}
inline BinaryBooleanTestParam_oper_assign_value(dst, src)
{
    dst = src;
    BinaryBooleanTestParam_oper_range_check(dst);
}
inline BinaryBooleanTestParam_oper_range_check(BinaryBooleanTestParam_oper_vc)
{
    assert(((((BinaryBooleanTestParam_oper_vc == BinaryBooleanTestParam_oper_o_and) || (BinaryBooleanTestParam_oper_vc == BinaryBooleanTestParam_oper_o_or)) || (BinaryBooleanTestParam_oper_vc == BinaryBooleanTestParam_oper_o_xor)) || (BinaryBooleanTestParam_oper_vc == BinaryBooleanTestParam_oper_o_implies)));
}
inline BinaryBooleanTestParam_left_assign_value(dst, src)
{
    dst = src;
    BinaryBooleanTestParam_left_range_check(dst);
}
inline BinaryBooleanTestParam_left_range_check(BinaryBooleanTestParam_left_vc)
{
    assert(true);
}
inline BinaryBooleanTestParam_right_assign_value(dst, src)
{
    dst = src;
    BinaryBooleanTestParam_right_range_check(dst);
}
inline BinaryBooleanTestParam_right_range_check(BinaryBooleanTestParam_right_vc)
{
    assert(true);
}
inline BinaryBooleanTestParam_assign_value(dst, src)
{
    BinaryBooleanTestParam_oper_assign_value(dst.oper, src.oper);
    BinaryBooleanTestParam_left_assign_value(dst.left, src.left);
    BinaryBooleanTestParam_right_assign_value(dst.right, src.right);
}
inline UnaryBooleanTestParam_expr_assign_value(dst, src)
{
    dst = src;
    UnaryBooleanTestParam_expr_range_check(dst);
}
inline UnaryBooleanTestParam_expr_range_check(UnaryBooleanTestParam_expr_vc)
{
    assert(true);
}
inline UnaryBooleanTestParam_assign_value(dst, src)
{
    UnaryBooleanTestParam_expr_assign_value(dst.expr, src.expr);
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
