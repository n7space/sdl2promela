#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_integer_result MyIntegerResult
#define Actuator_Context_integer_binary BinaryIntegerTestParam
#define Actuator_Context_integer_unary UnaryIntegerTestParam
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_integer_result MyIntegerResult
#define Controller_Context_binary_integer BinaryIntegerTestParam
#define Controller_Context_unary_integer UnaryIntegerTestParam
#define Controller_Context_error MyInteger
#define Controller_Context_finished MyInteger
#define MyInteger int
#define MyIntegerResult int
#define BinaryIntegerTestParam_oper int
#define BinaryIntegerTestParam_left int
#define BinaryIntegerTestParam_right int
#define UnaryIntegerTestParam_expr MyInteger
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_checkminus1 0
#define Controller_States_checkmodulo 1
#define Controller_States_checkmultiply1 2
#define Controller_States_checkplus2 3
#define Controller_States_checknegation2 4
#define Controller_States_checkdivide2 5
#define Controller_States_checkmultiply2 6
#define Controller_States_checknegation1 7
#define Controller_States_error 8
#define Controller_States_checkplus1 9
#define Controller_States_checkdivide1 10
#define Controller_States_checkremainder 11
#define Controller_States_checkminus2 12
#define BinaryIntegerTestParam_oper_o_plus 0
#define BinaryIntegerTestParam_oper_o_minus 1
#define BinaryIntegerTestParam_oper_o_multiply 2
#define BinaryIntegerTestParam_oper_o_divide 3
#define BinaryIntegerTestParam_oper_o_modulo 4
#define BinaryIntegerTestParam_oper_o_remainder 5
typedef BinaryIntegerTestParam {
    BinaryIntegerTestParam_oper oper;
    BinaryIntegerTestParam_left left;
    BinaryIntegerTestParam_right right;
}

typedef T_Null_Record {
    bit dummy;
}

typedef UnaryIntegerTestParam {
    UnaryIntegerTestParam_expr expr;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_integer_result integer_result;
    Actuator_Context_integer_binary integer_binary;
    Actuator_Context_integer_unary integer_unary;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_integer_result integer_result;
    Controller_Context_binary_integer binary_integer;
    Controller_Context_unary_integer unary_integer;
    Controller_Context_error error;
    Controller_Context_finished finished;
}

inline Actuator_States_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_state_assign_value(dst, src)
{
    Actuator-States_assign_value(dst, src);
}
inline Actuator_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_integer_result_assign_value(dst, src)
{
    MyIntegerResult_assign_value(dst, src);
}
inline Actuator_Context_integer_binary_assign_value(dst, src)
{
    BinaryIntegerTestParam_assign_value(dst, src);
}
inline Actuator_Context_integer_unary_assign_value(dst, src)
{
    UnaryIntegerTestParam_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_integer_result_assign_value(dst.integer_result, src.integer_result);
    Actuator_Context_integer_binary_assign_value(dst.integer_binary, src.integer_binary);
    Actuator_Context_integer_unary_assign_value(dst.integer_unary, src.integer_unary);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_state_assign_value(dst, src)
{
    Controller-States_assign_value(dst, src);
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_integer_result_assign_value(dst, src)
{
    MyIntegerResult_assign_value(dst, src);
}
inline Controller_Context_binary_integer_assign_value(dst, src)
{
    BinaryIntegerTestParam_assign_value(dst, src);
}
inline Controller_Context_unary_integer_assign_value(dst, src)
{
    UnaryIntegerTestParam_assign_value(dst, src);
}
inline Controller_Context_error_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_finished_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_integer_result_assign_value(dst.integer_result, src.integer_result);
    Controller_Context_binary_integer_assign_value(dst.binary_integer, src.binary_integer);
    Controller_Context_unary_integer_assign_value(dst.unary_integer, src.unary_integer);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_finished_assign_value(dst.finished, src.finished);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyIntegerResult_assign_value(dst, src)
{
    dst = src;
}
inline BinaryIntegerTestParam_oper_assign_value(dst, src)
{
    dst = src;
}
inline BinaryIntegerTestParam_left_assign_value(dst, src)
{
    dst = src;
}
inline BinaryIntegerTestParam_right_assign_value(dst, src)
{
    dst = src;
}
inline BinaryIntegerTestParam_assign_value(dst, src)
{
    BinaryIntegerTestParam_oper_assign_value(dst.oper, src.oper);
    BinaryIntegerTestParam_left_assign_value(dst.left, src.left);
    BinaryIntegerTestParam_right_assign_value(dst.right, src.right);
}
inline UnaryIntegerTestParam_expr_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline UnaryIntegerTestParam_assign_value(dst, src)
{
    UnaryIntegerTestParam_expr_assign_value(dst.expr, src.expr);
}
inline T_Int32_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
}
inline T_Int8_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt8_assign_value(dst, src)
{
    dst = src;
}
inline T_Boolean_assign_value(dst, src)
{
    dst = src;
}
inline T_Null_Record_assign_value(dst, src)
{
    skip;
}
