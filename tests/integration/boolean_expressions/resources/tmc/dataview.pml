#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_boolean_result MyBooleanResult
#define Actuator_Context_boolean_binary BinaryBooleanTestParam
#define Actuator_Context_boolean_unary UnaryBooleanTestParam
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_boolean_result MyBooleanResult
#define Controller_Context_binary_boolean BinaryBooleanTestParam
#define Controller_Context_unary_boolean UnaryBooleanTestParam
#define Controller_Context_error MyInteger
#define Controller_Context_finished MyInteger
#define MyInteger int
#define MyBooleanResult bool
#define BinaryBooleanTestParam_oper int
#define BinaryBooleanTestParam_left MyBooleanResult
#define BinaryBooleanTestParam_right MyBooleanResult
#define UnaryBooleanTestParam_expr MyBooleanResult
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_checkor2 0
#define Controller_States_checkimplies4 1
#define Controller_States_checkand4 2
#define Controller_States_checkor3 3
#define Controller_States_checkimplies1 4
#define Controller_States_checknot1 5
#define Controller_States_checkimplies3 6
#define Controller_States_error 7
#define Controller_States_checkxor3 8
#define Controller_States_checkimplies2 9
#define Controller_States_checkxor1 10
#define Controller_States_checkand2 11
#define Controller_States_checknot2 12
#define Controller_States_checkand3 13
#define Controller_States_checkxor2 14
#define Controller_States_checkand1 15
#define Controller_States_checkor1 16
#define Controller_States_checkor4 17
#define Controller_States_checkxor4 18
#define BinaryBooleanTestParam_oper_o_and 0
#define BinaryBooleanTestParam_oper_o_or 1
#define BinaryBooleanTestParam_oper_o_xor 2
#define BinaryBooleanTestParam_oper_o_implies 3
typedef BinaryBooleanTestParam {
    BinaryBooleanTestParam_oper oper;
    BinaryBooleanTestParam_left left;
    BinaryBooleanTestParam_right right;
}

typedef T_Null_Record {
    bit dummy;
}

typedef UnaryBooleanTestParam {
    UnaryBooleanTestParam_expr expr;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_boolean_result boolean_result;
    Actuator_Context_boolean_binary boolean_binary;
    Actuator_Context_boolean_unary boolean_unary;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_boolean_result boolean_result;
    Controller_Context_binary_boolean binary_boolean;
    Controller_Context_unary_boolean unary_boolean;
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
inline Actuator_Context_boolean_result_assign_value(dst, src)
{
    MyBooleanResult_assign_value(dst, src);
}
inline Actuator_Context_boolean_binary_assign_value(dst, src)
{
    BinaryBooleanTestParam_assign_value(dst, src);
}
inline Actuator_Context_boolean_unary_assign_value(dst, src)
{
    UnaryBooleanTestParam_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_boolean_result_assign_value(dst.boolean_result, src.boolean_result);
    Actuator_Context_boolean_binary_assign_value(dst.boolean_binary, src.boolean_binary);
    Actuator_Context_boolean_unary_assign_value(dst.boolean_unary, src.boolean_unary);
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
inline Controller_Context_boolean_result_assign_value(dst, src)
{
    MyBooleanResult_assign_value(dst, src);
}
inline Controller_Context_binary_boolean_assign_value(dst, src)
{
    BinaryBooleanTestParam_assign_value(dst, src);
}
inline Controller_Context_unary_boolean_assign_value(dst, src)
{
    UnaryBooleanTestParam_assign_value(dst, src);
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
    Controller_Context_boolean_result_assign_value(dst.boolean_result, src.boolean_result);
    Controller_Context_binary_boolean_assign_value(dst.binary_boolean, src.binary_boolean);
    Controller_Context_unary_boolean_assign_value(dst.unary_boolean, src.unary_boolean);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_finished_assign_value(dst.finished, src.finished);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyBooleanResult_assign_value(dst, src)
{
    dst = src;
}
inline BinaryBooleanTestParam_oper_assign_value(dst, src)
{
    dst = src;
}
inline BinaryBooleanTestParam_left_assign_value(dst, src)
{
    MyBooleanResult_assign_value(dst, src);
}
inline BinaryBooleanTestParam_right_assign_value(dst, src)
{
    MyBooleanResult_assign_value(dst, src);
}
inline BinaryBooleanTestParam_assign_value(dst, src)
{
    BinaryBooleanTestParam_oper_assign_value(dst.oper, src.oper);
    BinaryBooleanTestParam_left_assign_value(dst.left, src.left);
    BinaryBooleanTestParam_right_assign_value(dst.right, src.right);
}
inline UnaryBooleanTestParam_expr_assign_value(dst, src)
{
    MyBooleanResult_assign_value(dst, src);
}
inline UnaryBooleanTestParam_assign_value(dst, src)
{
    UnaryBooleanTestParam_expr_assign_value(dst.expr, src.expr);
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
