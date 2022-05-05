#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_parallel_0_left_0_state Actuator_States
#define Actuator_Context_parallel_0_right_0_state Actuator_States
#define Actuator_Context_result_param MyStatus
#define Actuator_Context_parallel_0_left_0_left_result_param MyStatus
#define Actuator_Context_parallel_0_right_0_right_result_param MyStatus
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
#define Actuator_States_parallel_0_left_0_wait 0
#define Actuator_States_wait 1
#define Actuator_States_parallel_0_left 2
#define Actuator_States_parallel_0_right_0_wait 3
#define Actuator_States_parallel 4
#define Actuator_States_first 5
#define Actuator_States_parallel_0_right 6
#define Actuator_States_state_0_end 7
#define Controller_States_waitfortransitionleftparallel 0
#define Controller_States_finished 1
#define Controller_States_waitforleaveparallel 2
#define Controller_States_waitfortransitiontop 3
#define Controller_States_error 4
#define Controller_States_waitforenterparallel 5
#define Controller_States_waitfortransitionrightparallel 6
#define MyStatus_transition_top 0
#define MyStatus_enter_parallel 1
#define MyStatus_transition_left_parallel 2
#define MyStatus_transition_right_parallel 3
#define MyStatus_leave_parallel 4
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_parallel_0_left_0_state parallel_0_left_0_state;
    Actuator_Context_parallel_0_right_0_state parallel_0_right_0_state;
    Actuator_Context_result_param result_param;
    Actuator_Context_parallel_0_left_0_left_result_param parallel_0_left_0_left_result_param;
    Actuator_Context_parallel_0_right_0_right_result_param parallel_0_right_0_right_result_param;
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
inline Actuator_Context_parallel_0_left_0_state_assign_value(dst, src)
{
    Actuator-States_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_right_0_state_assign_value(dst, src)
{
    Actuator-States_assign_value(dst, src);
}
inline Actuator_Context_result_param_assign_value(dst, src)
{
    MyStatus_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_left_0_left_result_param_assign_value(dst, src)
{
    MyStatus_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_right_0_right_result_param_assign_value(dst, src)
{
    MyStatus_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_parallel_0_left_0_state_assign_value(dst.parallel_0_left_0_state, src.parallel_0_left_0_state);
    Actuator_Context_parallel_0_right_0_state_assign_value(dst.parallel_0_right_0_state, src.parallel_0_right_0_state);
    Actuator_Context_result_param_assign_value(dst.result_param, src.result_param);
    Actuator_Context_parallel_0_left_0_left_result_param_assign_value(dst.parallel_0_left_0_left_result_param, src.parallel_0_left_0_left_result_param);
    Actuator_Context_parallel_0_right_0_right_result_param_assign_value(dst.parallel_0_right_0_right_result_param, src.parallel_0_right_0_right_result_param);
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
