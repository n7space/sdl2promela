#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_parallel_0_left_0_state Actuator_States
#define Actuator_Context_parallel_0_right_0_state Actuator_States
#define Actuator_Context_result_param ResultStatus
#define Actuator_Context_parallel_0_left_0_ok_result_param ResultStatus
#define Actuator_Context_parallel_0_left_0_work_result_param ResultStatus
#define Actuator_Context_parallel_0_right_0_result_param ResultStatus
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_result_param ResultStatus
#define Controller_Context_error MyInteger
#define Controller_Context_reached MyInteger
#define MyInteger int
#define ResultStatus int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Actuator_States_parallel_0_left_0_enabled 1
#define Actuator_States_parallel_0_left_0_disabled 2
#define Actuator_States_state_0_end 3
#define Actuator_States_parallel_0_left 4
#define Actuator_States_parallel_0_right 5
#define Actuator_States_parallel_0_left_0_working 6
#define Actuator_States_parallel_0_right_0_working 7
#define Actuator_States_parallel 8
#define Controller_States_waitfortick 0
#define Controller_States_waitforwork 1
#define Controller_States_waitforrightinparallel 2
#define Controller_States_error 3
#define Controller_States_finished 4
#define Controller_States_waitforleftinparallel 5
#define Controller_States_waitforenterparallel 6
#define ResultStatus_ok 0
#define ResultStatus_work 1
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_parallel_0_left_0_state parallel_0_left_0_state;
    Actuator_Context_parallel_0_right_0_state parallel_0_right_0_state;
    Actuator_Context_result_param result_param;
    Actuator_Context_parallel_0_left_0_ok_result_param parallel_0_left_0_ok_result_param;
    Actuator_Context_parallel_0_left_0_work_result_param parallel_0_left_0_work_result_param;
    Actuator_Context_parallel_0_right_0_result_param parallel_0_right_0_result_param;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
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
    ResultStatus_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_left_0_ok_result_param_assign_value(dst, src)
{
    ResultStatus_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_left_0_work_result_param_assign_value(dst, src)
{
    ResultStatus_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_right_0_result_param_assign_value(dst, src)
{
    ResultStatus_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_parallel_0_left_0_state_assign_value(dst.parallel_0_left_0_state, src.parallel_0_left_0_state);
    Actuator_Context_parallel_0_right_0_state_assign_value(dst.parallel_0_right_0_state, src.parallel_0_right_0_state);
    Actuator_Context_result_param_assign_value(dst.result_param, src.result_param);
    Actuator_Context_parallel_0_left_0_ok_result_param_assign_value(dst.parallel_0_left_0_ok_result_param, src.parallel_0_left_0_ok_result_param);
    Actuator_Context_parallel_0_left_0_work_result_param_assign_value(dst.parallel_0_left_0_work_result_param, src.parallel_0_left_0_work_result_param);
    Actuator_Context_parallel_0_right_0_result_param_assign_value(dst.parallel_0_right_0_result_param, src.parallel_0_right_0_result_param);
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
inline Controller_Context_result_param_assign_value(dst, src)
{
    ResultStatus_assign_value(dst, src);
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
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_reached_assign_value(dst.reached, src.reached);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline ResultStatus_assign_value(dst, src)
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
