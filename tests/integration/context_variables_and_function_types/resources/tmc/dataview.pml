#define Worker_States int
#define Worker_Context_state Worker_States
#define Worker_Context_init_done bool
#define Worker_Context_check_param MyInteger
#define Worker_Context_result_param MyInteger
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_check_param MyInteger
#define Controller_Context_result_param MyInteger
#define Controller_Context_error MyInteger
#define MyInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Context_worker_coeff MyInteger
#define Worker_States_wait 0
#define Controller_States_wait 0
typedef Context_worker {
    Context_worker_coeff coeff;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_check_param check_param;
    Controller_Context_result_param result_param;
    Controller_Context_error error;
}

typedef T_Null_Record {
    bit dummy;
}

typedef Worker_Context {
    Worker_Context_state state;
    Worker_Context_init_done init_done;
    Worker_Context_check_param check_param;
    Worker_Context_result_param result_param;
}

Context_worker actuator_ctxt;
Context_worker worker_ctxt;
inline actuator_ctxt_init()
{
    d_step {
        MyInteger_assign_value(actuator_ctxt.coeff, 10);
    }
}
inline Worker_States_assign_value(dst, src)
{
    dst = src;
}
inline Worker_Context_state_assign_value(dst, src)
{
    Worker-States_assign_value(dst, src);
}
inline Worker_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Worker_Context_check_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Worker_Context_result_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Worker_Context_assign_value(dst, src)
{
    Worker_Context_state_assign_value(dst.state, src.state);
    Worker_Context_init_done_assign_value(dst.init_done, src.init_done);
    Worker_Context_check_param_assign_value(dst.check_param, src.check_param);
    Worker_Context_result_param_assign_value(dst.result_param, src.result_param);
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
inline Controller_Context_check_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_result_param_assign_value(dst, src)
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
    Controller_Context_check_param_assign_value(dst.check_param, src.check_param);
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context_error_assign_value(dst.error, src.error);
}
inline MyInteger_assign_value(dst, src)
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
inline Context_worker_coeff_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Context_worker_assign_value(dst, src)
{
    Context_worker_coeff_assign_value(dst.coeff, src.coeff);
}
inline worker_ctxt_init()
{
    d_step {
        MyInteger_assign_value(worker_ctxt.coeff, 4);
    }
}
