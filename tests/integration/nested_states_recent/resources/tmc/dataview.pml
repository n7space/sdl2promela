#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_nested_0_result_param MyInteger
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_status_param MyStatus
#define Controller_Context_result_param MyInteger
#define Controller_Context_error MyInteger
#define Controller_Context_reached MyInteger
#define MyInteger int
#define MyStatus int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_nested_0_second 0
#define Actuator_States_nested_0_first 1
#define Controller_States_waitforresult 0
#define Controller_States_finished 1
#define Controller_States_waitforexit 2
#define Controller_States_waitforreentry 3
#define Controller_States_error 4
#define Controller_States_waitforentry 5
#define Controller_States_waitforresultagain 6
#define MyStatus_on_entry 0
#define MyStatus_on_exit 1
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_nested_0_result_param nested_0_result_param;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_status_param status_param;
    Controller_Context_result_param result_param;
    Controller_Context_error error;
    Controller_Context_reached reached;
}

typedef T_Null_Record {
    bit dummy;
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
inline Actuator_Context_nested_0_result_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_nested_0_result_param_assign_value(dst.nested_0_result_param, src.nested_0_result_param);
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
inline Controller_Context_status_param_assign_value(dst, src)
{
    MyStatus_assign_value(dst, src);
}
inline Controller_Context_result_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
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
    Controller_Context_status_param_assign_value(dst.status_param, src.status_param);
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_reached_assign_value(dst.reached, src.reached);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyStatus_assign_value(dst, src)
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
