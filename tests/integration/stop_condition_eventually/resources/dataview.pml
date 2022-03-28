#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_target Level
#define Actuator_Context_iteration Level
#define Actuator_Context_a InternalValue
#define Actuator_Context_b InternalValue
#define Actuator_Context_c InternalValue
#define Actuator_Context_response ResponseStatus
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_calculate_param Level
#define Controller_Context_finished_param ResponseStatus
#define Level int
#define InternalValue int
#define ResponseStatus bool
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_wait 0
#define Controller_States_calculating 1
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_target target;
    Actuator_Context_iteration iteration;
    Actuator_Context_a a;
    Actuator_Context_b b;
    Actuator_Context_c c;
    Actuator_Context_response response;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_calculate_param calculate_param;
    Controller_Context_finished_param finished_param;
}

typedef T_Null_Record {
    bit dummy;
}

inline Actuator_States_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_target_assign_value(dst.target, src.target);
    Actuator_Context_iteration_assign_value(dst.iteration, src.iteration);
    Actuator_Context_a_assign_value(dst.a, src.a);
    Actuator_Context_b_assign_value(dst.b, src.b);
    Actuator_Context_c_assign_value(dst.c, src.c);
    Actuator_Context_response_assign_value(dst.response, src.response);
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_calculate_param_assign_value(dst.calculate_param, src.calculate_param);
    Controller_Context_finished_param_assign_value(dst.finished_param, src.finished_param);
}
inline Level_assign_value(dst, src)
{
    dst = src;
}
inline InternalValue_assign_value(dst, src)
{
    dst = src;
}
inline ResponseStatus_assign_value(dst, src)
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
