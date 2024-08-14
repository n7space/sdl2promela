#define Actuator_States int
#define Actuator_Context__state int
#define Actuator_Context__init_done bool
#define Actuator_Context__sender int
#define Actuator_Context__offspring int
#define Actuator_Context__integer_result int
#define Actuator_Context__integer_binary__oper int
#define Actuator_Context__integer_binary__left int
#define Actuator_Context__integer_binary__right int
#define Actuator_Context__integer_unary__expr int
#define Actuator_T_Runtime_Error_Selection int
#define Controller_States int
#define Controller_Context__state int
#define Controller_Context__init_done bool
#define Controller_Context__sender int
#define Controller_Context__offspring int
#define Controller_Context__integer_result int
#define Controller_Context__binary_integer__oper int
#define Controller_Context__binary_integer__left int
#define Controller_Context__binary_integer__right int
#define Controller_Context__unary_integer__expr int
#define Controller_Context__error int
#define Controller_Context__finished int
#define Controller_T_Runtime_Error_Selection int
#define Timer_manager_States int
#define Timer_manager_Context__state int
#define MyInteger int
#define MyIntegerResult int
#define BinaryIntegerTestParam__oper int
#define BinaryIntegerTestParam__left int
#define BinaryIntegerTestParam__right int
#define UnaryIntegerTestParam__expr int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define T_Runtime_Error__noerror int
#define T_Runtime_Error__encodeerror int
#define T_Runtime_Error__decodeerror int
#define PID_Range int
#define PID int
#define TimerData__timer_enabled bool
#define TimerData__interval int
#define Actuator_States_wait 0
#define Actuator_Context__state_wait 0
#define Actuator_Context__sender_taste_user_interface 0
#define Actuator_Context__sender_timer_manager 1
#define Actuator_Context__sender_actuator 2
#define Actuator_Context__sender_controller 3
#define Actuator_Context__sender_env 4
#define Actuator_Context__offspring_taste_user_interface 0
#define Actuator_Context__offspring_timer_manager 1
#define Actuator_Context__offspring_actuator 2
#define Actuator_Context__offspring_controller 3
#define Actuator_Context__offspring_env 4
#define Actuator_Context__integer_binary__oper_o_plus 0
#define Actuator_Context__integer_binary__oper_o_minus 1
#define Actuator_Context__integer_binary__oper_o_multiply 2
#define Actuator_Context__integer_binary__oper_o_divide 3
#define Actuator_Context__integer_binary__oper_o_modulo 4
#define Actuator_Context__integer_binary__oper_o_remainder 5
#define Actuator_T_Runtime_Error_Selection_noerror_present 1
#define Actuator_T_Runtime_Error_Selection_encodeerror_present 2
#define Actuator_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_checkdivide2 0
#define Controller_States_checkplus1 1
#define Controller_States_checkmultiply2 2
#define Controller_States_checkdivide1 3
#define Controller_States_error 4
#define Controller_States_checkminus2 5
#define Controller_States_checknegation1 6
#define Controller_States_checkplus2 7
#define Controller_States_checkmultiply1 8
#define Controller_States_checkremainder 9
#define Controller_States_checkmodulo 10
#define Controller_States_checknegation2 11
#define Controller_States_checkminus1 12
#define Controller_Context__state_checkdivide2 0
#define Controller_Context__state_checkplus1 1
#define Controller_Context__state_checkmultiply2 2
#define Controller_Context__state_checkdivide1 3
#define Controller_Context__state_error 4
#define Controller_Context__state_checkminus2 5
#define Controller_Context__state_checknegation1 6
#define Controller_Context__state_checkplus2 7
#define Controller_Context__state_checkmultiply1 8
#define Controller_Context__state_checkremainder 9
#define Controller_Context__state_checkmodulo 10
#define Controller_Context__state_checknegation2 11
#define Controller_Context__state_checkminus1 12
#define Controller_Context__sender_taste_user_interface 0
#define Controller_Context__sender_timer_manager 1
#define Controller_Context__sender_actuator 2
#define Controller_Context__sender_controller 3
#define Controller_Context__sender_env 4
#define Controller_Context__offspring_taste_user_interface 0
#define Controller_Context__offspring_timer_manager 1
#define Controller_Context__offspring_actuator 2
#define Controller_Context__offspring_controller 3
#define Controller_Context__offspring_env 4
#define Controller_Context__binary_integer__oper_o_plus 0
#define Controller_Context__binary_integer__oper_o_minus 1
#define Controller_Context__binary_integer__oper_o_multiply 2
#define Controller_Context__binary_integer__oper_o_divide 3
#define Controller_Context__binary_integer__oper_o_modulo 4
#define Controller_Context__binary_integer__oper_o_remainder 5
#define Controller_T_Runtime_Error_Selection_noerror_present 1
#define Controller_T_Runtime_Error_Selection_encodeerror_present 2
#define Controller_T_Runtime_Error_Selection_decodeerror_present 3
#define Timer_manager_States_wait 0
#define Timer_manager_Context__state_wait 0
#define BinaryIntegerTestParam__oper_o_plus 0
#define BinaryIntegerTestParam__oper_o_minus 1
#define BinaryIntegerTestParam__oper_o_multiply 2
#define BinaryIntegerTestParam__oper_o_divide 3
#define BinaryIntegerTestParam__oper_o_modulo 4
#define BinaryIntegerTestParam__oper_o_remainder 5
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
typedef Actuator_Context__integer_binary {
    Actuator_Context__integer_binary__oper oper;
    Actuator_Context__integer_binary__left left;
    Actuator_Context__integer_binary__right right;
}

typedef Actuator_Context__integer_unary {
    Actuator_Context__integer_unary__expr expr;
}

typedef AggregateTimerData__actuator {
    bit dummy;
}

typedef AggregateTimerData__controller {
    bit dummy;
}

typedef AggregateTimerData__dummy_entry {
    bit dummy;
}

typedef BinaryIntegerTestParam {
    BinaryIntegerTestParam__oper oper;
    BinaryIntegerTestParam__left left;
    BinaryIntegerTestParam__right right;
}

typedef Controller_Context__binary_integer {
    Controller_Context__binary_integer__oper oper;
    Controller_Context__binary_integer__left left;
    Controller_Context__binary_integer__right right;
}

typedef Controller_Context__unary_integer {
    Controller_Context__unary_integer__expr expr;
}

typedef T_Null_Record {
    bit dummy;
}

typedef T_Runtime_Error_data {
    T_Runtime_Error__noerror noerror;
    T_Runtime_Error__encodeerror encodeerror;
    T_Runtime_Error__decodeerror decodeerror;
}

typedef TimerData {
    TimerData__timer_enabled timer_enabled;
    TimerData__interval interval;
}

typedef Timer_manager_Context {
    Timer_manager_Context__state state;
}

typedef UnaryIntegerTestParam {
    UnaryIntegerTestParam__expr expr;
}

typedef Actuator_Context {
    Actuator_Context__state state;
    Actuator_Context__init_done init_done;
    Actuator_Context__sender sender;
    Actuator_Context__offspring offspring;
    Actuator_Context__integer_result integer_result;
    Actuator_Context__integer_binary integer_binary;
    Actuator_Context__integer_unary integer_unary;
}

typedef AggregateTimerData {
    AggregateTimerData__actuator actuator;
    AggregateTimerData__controller controller;
    AggregateTimerData__dummy_entry dummy_entry;
}

typedef Controller_Context {
    Controller_Context__state state;
    Controller_Context__init_done init_done;
    Controller_Context__sender sender;
    Controller_Context__offspring offspring;
    Controller_Context__integer_result integer_result;
    Controller_Context__binary_integer binary_integer;
    Controller_Context__unary_integer unary_integer;
    Controller_Context__error error;
    Controller_Context__finished finished;
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
inline Actuator_Context__state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__state_range_check(dst);
}
inline Actuator_Context__state_range_check(Actuator_Context__state_vc)
{
    assert((Actuator_Context__state_vc == Actuator_Context__state_wait));
}
inline Actuator_Context__init_done_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__init_done_range_check(dst);
}
inline Actuator_Context__init_done_range_check(Actuator_Context__init_done_vc)
{
    assert(true);
}
inline Actuator_Context__sender_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__sender_range_check(dst);
}
inline Actuator_Context__sender_range_check(Actuator_Context__sender_vc)
{
    assert((((((Actuator_Context__sender_vc == Actuator_Context__sender_taste_user_interface) || (Actuator_Context__sender_vc == Actuator_Context__sender_timer_manager)) || (Actuator_Context__sender_vc == Actuator_Context__sender_actuator)) || (Actuator_Context__sender_vc == Actuator_Context__sender_controller)) || (Actuator_Context__sender_vc == Actuator_Context__sender_env)));
}
inline Actuator_Context__offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__offspring_range_check(dst);
}
inline Actuator_Context__offspring_range_check(Actuator_Context__offspring_vc)
{
    assert((((((Actuator_Context__offspring_vc == Actuator_Context__offspring_taste_user_interface) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_timer_manager)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_actuator)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_controller)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_env)));
}
inline Actuator_Context__integer_result_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__integer_result_range_check(dst);
}
inline Actuator_Context__integer_result_range_check(Actuator_Context__integer_result_vc)
{
    assert(((Actuator_Context__integer_result_vc >= -1048576) && (Actuator_Context__integer_result_vc <= 1048576)));
}
inline Actuator_Context__integer_binary__oper_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__integer_binary__oper_range_check(dst);
}
inline Actuator_Context__integer_binary__oper_range_check(Actuator_Context__integer_binary__oper_vc)
{
    assert(((((((Actuator_Context__integer_binary__oper_vc == Actuator_Context__integer_binary__oper_o_plus) || (Actuator_Context__integer_binary__oper_vc == Actuator_Context__integer_binary__oper_o_minus)) || (Actuator_Context__integer_binary__oper_vc == Actuator_Context__integer_binary__oper_o_multiply)) || (Actuator_Context__integer_binary__oper_vc == Actuator_Context__integer_binary__oper_o_divide)) || (Actuator_Context__integer_binary__oper_vc == Actuator_Context__integer_binary__oper_o_modulo)) || (Actuator_Context__integer_binary__oper_vc == Actuator_Context__integer_binary__oper_o_remainder)));
}
inline Actuator_Context__integer_binary__left_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__integer_binary__left_range_check(dst);
}
inline Actuator_Context__integer_binary__left_range_check(Actuator_Context__integer_binary__left_vc)
{
    assert(((Actuator_Context__integer_binary__left_vc >= -1024) && (Actuator_Context__integer_binary__left_vc <= 1024)));
}
inline Actuator_Context__integer_binary__right_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__integer_binary__right_range_check(dst);
}
inline Actuator_Context__integer_binary__right_range_check(Actuator_Context__integer_binary__right_vc)
{
    assert(((Actuator_Context__integer_binary__right_vc >= -1024) && (Actuator_Context__integer_binary__right_vc <= 1024)));
}
inline Actuator_Context__integer_binary_assign_value(dst, src)
{
    Actuator_Context__integer_binary__oper_assign_value(dst.oper, src.oper);
    Actuator_Context__integer_binary__left_assign_value(dst.left, src.left);
    Actuator_Context__integer_binary__right_assign_value(dst.right, src.right);
}
inline Actuator_Context__integer_unary__expr_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__integer_unary__expr_range_check(dst);
}
inline Actuator_Context__integer_unary__expr_range_check(Actuator_Context__integer_unary__expr_vc)
{
    assert(((Actuator_Context__integer_unary__expr_vc >= -1024) && (Actuator_Context__integer_unary__expr_vc <= 1024)));
}
inline Actuator_Context__integer_unary_assign_value(dst, src)
{
    Actuator_Context__integer_unary__expr_assign_value(dst.expr, src.expr);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context__state_assign_value(dst.state, src.state);
    Actuator_Context__init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context__sender_assign_value(dst.sender, src.sender);
    Actuator_Context__offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context__integer_result_assign_value(dst.integer_result, src.integer_result);
    Actuator_Context__integer_binary_assign_value(dst.integer_binary, src.integer_binary);
    Actuator_Context__integer_unary_assign_value(dst.integer_unary, src.integer_unary);
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
    assert((((((((((((((Controller_States_vc == Controller_States_checkdivide2) || (Controller_States_vc == Controller_States_checkplus1)) || (Controller_States_vc == Controller_States_checkmultiply2)) || (Controller_States_vc == Controller_States_checkdivide1)) || (Controller_States_vc == Controller_States_error)) || (Controller_States_vc == Controller_States_checkminus2)) || (Controller_States_vc == Controller_States_checknegation1)) || (Controller_States_vc == Controller_States_checkplus2)) || (Controller_States_vc == Controller_States_checkmultiply1)) || (Controller_States_vc == Controller_States_checkremainder)) || (Controller_States_vc == Controller_States_checkmodulo)) || (Controller_States_vc == Controller_States_checknegation2)) || (Controller_States_vc == Controller_States_checkminus1)));
}
inline Controller_Context__state_assign_value(dst, src)
{
    dst = src;
    Controller_Context__state_range_check(dst);
}
inline Controller_Context__state_range_check(Controller_Context__state_vc)
{
    assert((((((((((((((Controller_Context__state_vc == Controller_Context__state_checkdivide2) || (Controller_Context__state_vc == Controller_Context__state_checkplus1)) || (Controller_Context__state_vc == Controller_Context__state_checkmultiply2)) || (Controller_Context__state_vc == Controller_Context__state_checkdivide1)) || (Controller_Context__state_vc == Controller_Context__state_error)) || (Controller_Context__state_vc == Controller_Context__state_checkminus2)) || (Controller_Context__state_vc == Controller_Context__state_checknegation1)) || (Controller_Context__state_vc == Controller_Context__state_checkplus2)) || (Controller_Context__state_vc == Controller_Context__state_checkmultiply1)) || (Controller_Context__state_vc == Controller_Context__state_checkremainder)) || (Controller_Context__state_vc == Controller_Context__state_checkmodulo)) || (Controller_Context__state_vc == Controller_Context__state_checknegation2)) || (Controller_Context__state_vc == Controller_Context__state_checkminus1)));
}
inline Controller_Context__init_done_assign_value(dst, src)
{
    dst = src;
    Controller_Context__init_done_range_check(dst);
}
inline Controller_Context__init_done_range_check(Controller_Context__init_done_vc)
{
    assert(true);
}
inline Controller_Context__sender_assign_value(dst, src)
{
    dst = src;
    Controller_Context__sender_range_check(dst);
}
inline Controller_Context__sender_range_check(Controller_Context__sender_vc)
{
    assert((((((Controller_Context__sender_vc == Controller_Context__sender_taste_user_interface) || (Controller_Context__sender_vc == Controller_Context__sender_timer_manager)) || (Controller_Context__sender_vc == Controller_Context__sender_actuator)) || (Controller_Context__sender_vc == Controller_Context__sender_controller)) || (Controller_Context__sender_vc == Controller_Context__sender_env)));
}
inline Controller_Context__offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context__offspring_range_check(dst);
}
inline Controller_Context__offspring_range_check(Controller_Context__offspring_vc)
{
    assert((((((Controller_Context__offspring_vc == Controller_Context__offspring_taste_user_interface) || (Controller_Context__offspring_vc == Controller_Context__offspring_timer_manager)) || (Controller_Context__offspring_vc == Controller_Context__offspring_actuator)) || (Controller_Context__offspring_vc == Controller_Context__offspring_controller)) || (Controller_Context__offspring_vc == Controller_Context__offspring_env)));
}
inline Controller_Context__integer_result_assign_value(dst, src)
{
    dst = src;
    Controller_Context__integer_result_range_check(dst);
}
inline Controller_Context__integer_result_range_check(Controller_Context__integer_result_vc)
{
    assert(((Controller_Context__integer_result_vc >= -1048576) && (Controller_Context__integer_result_vc <= 1048576)));
}
inline Controller_Context__binary_integer__oper_assign_value(dst, src)
{
    dst = src;
    Controller_Context__binary_integer__oper_range_check(dst);
}
inline Controller_Context__binary_integer__oper_range_check(Controller_Context__binary_integer__oper_vc)
{
    assert(((((((Controller_Context__binary_integer__oper_vc == Controller_Context__binary_integer__oper_o_plus) || (Controller_Context__binary_integer__oper_vc == Controller_Context__binary_integer__oper_o_minus)) || (Controller_Context__binary_integer__oper_vc == Controller_Context__binary_integer__oper_o_multiply)) || (Controller_Context__binary_integer__oper_vc == Controller_Context__binary_integer__oper_o_divide)) || (Controller_Context__binary_integer__oper_vc == Controller_Context__binary_integer__oper_o_modulo)) || (Controller_Context__binary_integer__oper_vc == Controller_Context__binary_integer__oper_o_remainder)));
}
inline Controller_Context__binary_integer__left_assign_value(dst, src)
{
    dst = src;
    Controller_Context__binary_integer__left_range_check(dst);
}
inline Controller_Context__binary_integer__left_range_check(Controller_Context__binary_integer__left_vc)
{
    assert(((Controller_Context__binary_integer__left_vc >= -1024) && (Controller_Context__binary_integer__left_vc <= 1024)));
}
inline Controller_Context__binary_integer__right_assign_value(dst, src)
{
    dst = src;
    Controller_Context__binary_integer__right_range_check(dst);
}
inline Controller_Context__binary_integer__right_range_check(Controller_Context__binary_integer__right_vc)
{
    assert(((Controller_Context__binary_integer__right_vc >= -1024) && (Controller_Context__binary_integer__right_vc <= 1024)));
}
inline Controller_Context__binary_integer_assign_value(dst, src)
{
    Controller_Context__binary_integer__oper_assign_value(dst.oper, src.oper);
    Controller_Context__binary_integer__left_assign_value(dst.left, src.left);
    Controller_Context__binary_integer__right_assign_value(dst.right, src.right);
}
inline Controller_Context__unary_integer__expr_assign_value(dst, src)
{
    dst = src;
    Controller_Context__unary_integer__expr_range_check(dst);
}
inline Controller_Context__unary_integer__expr_range_check(Controller_Context__unary_integer__expr_vc)
{
    assert(((Controller_Context__unary_integer__expr_vc >= -1024) && (Controller_Context__unary_integer__expr_vc <= 1024)));
}
inline Controller_Context__unary_integer_assign_value(dst, src)
{
    Controller_Context__unary_integer__expr_assign_value(dst.expr, src.expr);
}
inline Controller_Context__error_assign_value(dst, src)
{
    dst = src;
    Controller_Context__error_range_check(dst);
}
inline Controller_Context__error_range_check(Controller_Context__error_vc)
{
    assert(((Controller_Context__error_vc >= -1024) && (Controller_Context__error_vc <= 1024)));
}
inline Controller_Context__finished_assign_value(dst, src)
{
    dst = src;
    Controller_Context__finished_range_check(dst);
}
inline Controller_Context__finished_range_check(Controller_Context__finished_vc)
{
    assert(((Controller_Context__finished_vc >= -1024) && (Controller_Context__finished_vc <= 1024)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context__state_assign_value(dst.state, src.state);
    Controller_Context__init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context__sender_assign_value(dst.sender, src.sender);
    Controller_Context__offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context__integer_result_assign_value(dst.integer_result, src.integer_result);
    Controller_Context__binary_integer_assign_value(dst.binary_integer, src.binary_integer);
    Controller_Context__unary_integer_assign_value(dst.unary_integer, src.unary_integer);
    Controller_Context__error_assign_value(dst.error, src.error);
    Controller_Context__finished_assign_value(dst.finished, src.finished);
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
inline Timer_manager_Context__state_assign_value(dst, src)
{
    dst = src;
    Timer_manager_Context__state_range_check(dst);
}
inline Timer_manager_Context__state_range_check(Timer_manager_Context__state_vc)
{
    assert((Timer_manager_Context__state_vc == Timer_manager_Context__state_wait));
}
inline Timer_manager_Context_assign_value(dst, src)
{
    Timer_manager_Context__state_assign_value(dst.state, src.state);
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
inline BinaryIntegerTestParam__oper_assign_value(dst, src)
{
    dst = src;
    BinaryIntegerTestParam__oper_range_check(dst);
}
inline BinaryIntegerTestParam__oper_range_check(BinaryIntegerTestParam__oper_vc)
{
    assert(((((((BinaryIntegerTestParam__oper_vc == BinaryIntegerTestParam__oper_o_plus) || (BinaryIntegerTestParam__oper_vc == BinaryIntegerTestParam__oper_o_minus)) || (BinaryIntegerTestParam__oper_vc == BinaryIntegerTestParam__oper_o_multiply)) || (BinaryIntegerTestParam__oper_vc == BinaryIntegerTestParam__oper_o_divide)) || (BinaryIntegerTestParam__oper_vc == BinaryIntegerTestParam__oper_o_modulo)) || (BinaryIntegerTestParam__oper_vc == BinaryIntegerTestParam__oper_o_remainder)));
}
inline BinaryIntegerTestParam__left_assign_value(dst, src)
{
    dst = src;
    BinaryIntegerTestParam__left_range_check(dst);
}
inline BinaryIntegerTestParam__left_range_check(BinaryIntegerTestParam__left_vc)
{
    assert(((BinaryIntegerTestParam__left_vc >= -1024) && (BinaryIntegerTestParam__left_vc <= 1024)));
}
inline BinaryIntegerTestParam__right_assign_value(dst, src)
{
    dst = src;
    BinaryIntegerTestParam__right_range_check(dst);
}
inline BinaryIntegerTestParam__right_range_check(BinaryIntegerTestParam__right_vc)
{
    assert(((BinaryIntegerTestParam__right_vc >= -1024) && (BinaryIntegerTestParam__right_vc <= 1024)));
}
inline BinaryIntegerTestParam_assign_value(dst, src)
{
    BinaryIntegerTestParam__oper_assign_value(dst.oper, src.oper);
    BinaryIntegerTestParam__left_assign_value(dst.left, src.left);
    BinaryIntegerTestParam__right_assign_value(dst.right, src.right);
}
inline UnaryIntegerTestParam__expr_assign_value(dst, src)
{
    dst = src;
    UnaryIntegerTestParam__expr_range_check(dst);
}
inline UnaryIntegerTestParam__expr_range_check(UnaryIntegerTestParam__expr_vc)
{
    assert(((UnaryIntegerTestParam__expr_vc >= -1024) && (UnaryIntegerTestParam__expr_vc <= 1024)));
}
inline UnaryIntegerTestParam_assign_value(dst, src)
{
    UnaryIntegerTestParam__expr_assign_value(dst.expr, src.expr);
}
inline T_Int32_assign_value(dst, src)
{
    dst = src;
    T_Int32_range_check(dst);
}
inline T_Int32_range_check(T_Int32_vc)
{
    assert(1);
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
    T_UInt32_range_check(dst);
}
inline T_UInt32_range_check(T_UInt32_vc)
{
    assert((T_UInt32_vc >= 0));
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
inline T_Runtime_Error__noerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__noerror_range_check(dst);
}
inline T_Runtime_Error__noerror_range_check(T_Runtime_Error__noerror_vc)
{
    assert((T_Runtime_Error__noerror_vc >= 0));
}
inline T_Runtime_Error__encodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__encodeerror_range_check(dst);
}
inline T_Runtime_Error__encodeerror_range_check(T_Runtime_Error__encodeerror_vc)
{
    assert(1);
}
inline T_Runtime_Error__decodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__decodeerror_range_check(dst);
}
inline T_Runtime_Error__decodeerror_range_check(T_Runtime_Error__decodeerror_vc)
{
    assert(1);
}
inline T_Runtime_Error_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == T_Runtime_Error_noerror_PRESENT);
        T_Runtime_Error__noerror_assign_value(dst.data.noerror, src.data.noerror);
    ::  (dst.selection == T_Runtime_Error_encodeerror_PRESENT);
        T_Runtime_Error__encodeerror_assign_value(dst.data.encodeerror, src.data.encodeerror);
    ::  (dst.selection == T_Runtime_Error_decodeerror_PRESENT);
        T_Runtime_Error__decodeerror_assign_value(dst.data.decodeerror, src.data.decodeerror);
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
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 4)));
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
inline TimerData__timer_enabled_assign_value(dst, src)
{
    dst = src;
    TimerData__timer_enabled_range_check(dst);
}
inline TimerData__timer_enabled_range_check(TimerData__timer_enabled_vc)
{
    assert(true);
}
inline TimerData__interval_assign_value(dst, src)
{
    dst = src;
    TimerData__interval_range_check(dst);
}
inline TimerData__interval_range_check(TimerData__interval_vc)
{
    assert(((TimerData__interval_vc >= 0) && (TimerData__interval_vc <= 50000)));
}
inline TimerData_assign_value(dst, src)
{
    TimerData__timer_enabled_assign_value(dst.timer_enabled, src.timer_enabled);
    TimerData__interval_assign_value(dst.interval, src.interval);
}
inline AggregateTimerData__actuator_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData__controller_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData__dummy_entry_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_assign_value(dst, src)
{
    AggregateTimerData__actuator_assign_value(dst.actuator, src.actuator);
    AggregateTimerData__controller_assign_value(dst.controller, src.controller);
    AggregateTimerData__dummy_entry_assign_value(dst.dummy_entry, src.dummy_entry);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
