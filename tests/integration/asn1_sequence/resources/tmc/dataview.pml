#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_work_param MyParameter
#define Actuator_Context_result_param MyInteger
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_test_param MyTestInteger
#define Controller_Context_work_param MyParameter
#define Controller_Context_result_param MyInteger
#define Controller_Context_expected MyInteger
#define Controller_Context_error MyInteger
#define MyTestInteger int
#define MyInteger int
#define MyParameter_x MyInteger
#define MyParameter_y MyInteger
#define MyParameter_z MyInteger
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_wait 0
#define Controller_States_operation 1
typedef MyParameter_exist {
    bool z;
}

typedef T_Null_Record {
    bit dummy;
}

typedef MyParameter {
    MyParameter_x x;
    MyParameter_y y;
    MyParameter_z z;
    MyParameter_exist exist;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_work_param work_param;
    Actuator_Context_result_param result_param;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_test_param test_param;
    Controller_Context_work_param work_param;
    Controller_Context_result_param result_param;
    Controller_Context_expected expected;
    Controller_Context_error error;
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
inline Actuator_Context_work_param_assign_value(dst, src)
{
    MyParameter_assign_value(dst, src);
}
inline Actuator_Context_result_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_work_param_assign_value(dst.work_param, src.work_param);
    Actuator_Context_result_param_assign_value(dst.result_param, src.result_param);
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
inline Controller_Context_test_param_assign_value(dst, src)
{
    MyTestInteger_assign_value(dst, src);
}
inline Controller_Context_work_param_assign_value(dst, src)
{
    MyParameter_assign_value(dst, src);
}
inline Controller_Context_result_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_expected_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_error_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_test_param_assign_value(dst.test_param, src.test_param);
    Controller_Context_work_param_assign_value(dst.work_param, src.work_param);
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context_expected_assign_value(dst.expected, src.expected);
    Controller_Context_error_assign_value(dst.error, src.error);
}
inline MyTestInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyParameter_x_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyParameter_y_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyParameter_z_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyParameter_assign_value(dst, src)
{
    MyParameter_x_assign_value(dst.x, src.x);
    MyParameter_y_assign_value(dst.y, src.y);
    MyParameter_z_assign_value(dst.z, src.z);
    dst.exist.z = src.exist.z;
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
