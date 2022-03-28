#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_boolean_result MyBooleanResult
#define Actuator_Context_relation RelationTestParam
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_boolean_result MyBooleanResult
#define Controller_Context_relation RelationTestParam
#define Controller_Context_error MyInteger
#define Controller_Context_finished MyInteger
#define MyInteger int
#define MyBooleanResult bool
#define RelationTestParam_oper int
#define RelationTestParam_left MyInteger
#define RelationTestParam_right MyInteger
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_checknequal2 0
#define Controller_States_checkless2 1
#define Controller_States_checkless1 2
#define Controller_States_checkgreater2 3
#define Controller_States_checkless3 4
#define Controller_States_checklessequal1 5
#define Controller_States_checkgreaterequal1 6
#define Controller_States_checkgreater3 7
#define Controller_States_checkgreaterequal3 8
#define Controller_States_checkgreater1 9
#define Controller_States_checklessequal2 10
#define Controller_States_checkequal1 11
#define Controller_States_checknequal1 12
#define Controller_States_checkgreaterequal2 13
#define Controller_States_checklessequal3 14
#define Controller_States_checkequal2 15
#define Controller_States_error 16
#define RelationTestParam_oper_o_equal 0
#define RelationTestParam_oper_o_nequal 1
#define RelationTestParam_oper_o_less 2
#define RelationTestParam_oper_o_lessequal 3
#define RelationTestParam_oper_o_greater 4
#define RelationTestParam_oper_o_greaterequal 5
typedef RelationTestParam {
    RelationTestParam_oper oper;
    RelationTestParam_left left;
    RelationTestParam_right right;
}

typedef T_Null_Record {
    bit dummy;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_boolean_result boolean_result;
    Actuator_Context_relation relation;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_boolean_result boolean_result;
    Controller_Context_relation relation;
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
inline Actuator_Context_relation_assign_value(dst, src)
{
    RelationTestParam_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_boolean_result_assign_value(dst.boolean_result, src.boolean_result);
    Actuator_Context_relation_assign_value(dst.relation, src.relation);
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
inline Controller_Context_relation_assign_value(dst, src)
{
    RelationTestParam_assign_value(dst, src);
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
    Controller_Context_relation_assign_value(dst.relation, src.relation);
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
inline RelationTestParam_oper_assign_value(dst, src)
{
    dst = src;
}
inline RelationTestParam_left_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline RelationTestParam_right_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline RelationTestParam_assign_value(dst, src)
{
    RelationTestParam_oper_assign_value(dst.oper, src.oper);
    RelationTestParam_left_assign_value(dst.left, src.left);
    RelationTestParam_right_assign_value(dst.right, src.right);
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
