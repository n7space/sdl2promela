#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_result_param MyStatus
#define Actuator_Context_nested_0_result_param MyStatus
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_finished MyInteger
#define Controller_Context_error MyInteger
#define Controller_Context_result_param MyStatus
#define MyInteger int
#define MyStatus int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Actuator_States_nested_0_green 1
#define Actuator_States_first 2
#define Actuator_States_nested_0_red 3
#define Controller_States_waitforenternested 0
#define Controller_States_waitfortransitiontop 1
#define Controller_States_finished 2
#define Controller_States_waitforleavenested 3
#define Controller_States_waitfortransitionnested 4
#define Controller_States_error 5
#define MyStatus_transition_top 0
#define MyStatus_enter_nested 1
#define MyStatus_transition_nested 2
#define MyStatus_leave_nested 3
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_result_param result_param;
    Actuator_Context_nested_0_result_param nested_0_result_param;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_finished finished;
    Controller_Context_error error;
    Controller_Context_result_param result_param;
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
inline Actuator_Context_result_param_assign_value(dst, src)
{
    MyStatus_assign_value(dst, src);
}
inline Actuator_Context_nested_0_result_param_assign_value(dst, src)
{
    MyStatus_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_result_param_assign_value(dst.result_param, src.result_param);
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
inline Controller_Context_finished_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_error_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_result_param_assign_value(dst, src)
{
    MyStatus_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_finished_assign_value(dst.finished, src.finished);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
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
