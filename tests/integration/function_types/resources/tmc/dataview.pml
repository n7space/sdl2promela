#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_test_param MyTestInteger
#define Controller_Context_up_check_param MyInteger
#define Controller_Context_down_check_param MyInteger
#define Controller_Context_up_result_param MyResultInteger
#define Controller_Context_down_result_param MyResultInteger
#define Controller_Context_up_value MyResultInteger
#define Controller_Context_down_value MyResultInteger
#define Controller_Context_error MyInteger
#define Controller_Context_reached MyInteger
#define MyInteger int
#define MyResultInteger int
#define MyTestInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_check_param MyInteger
#define Actuator_Context_result_param MyResultInteger
#define Controller_States_waitingfordown 0
#define Controller_States_waitingforup 1
#define Controller_States_waitingforboth 2
#define Controller_States_wait 3
#define Actuator_States_operation 0
#define Actuator_States_wait 1
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_check_param check_param;
    Actuator_Context_result_param result_param;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
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
inline Controller_Context_up_check_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_down_check_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_up_result_param_assign_value(dst, src)
{
    MyResultInteger_assign_value(dst, src);
}
inline Controller_Context_down_result_param_assign_value(dst, src)
{
    MyResultInteger_assign_value(dst, src);
}
inline Controller_Context_up_value_assign_value(dst, src)
{
    MyResultInteger_assign_value(dst, src);
}
inline Controller_Context_down_value_assign_value(dst, src)
{
    MyResultInteger_assign_value(dst, src);
}
inline Controller_Context_error_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_reached_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
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
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyResultInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyTestInteger_assign_value(dst, src)
{
    dst = src;
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
inline Actuator_Context_check_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Context_result_param_assign_value(dst, src)
{
    MyResultInteger_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_check_param_assign_value(dst.check_param, src.check_param);
    Actuator_Context_result_param_assign_value(dst.result_param, src.result_param);
}
