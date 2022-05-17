#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_param MyInteger
#define Actuator_Context_enum_param MyParam
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_pong_param MyInteger
#define Controller_Context_error MyInteger
#define Controller_Context_reached MyInteger
#define Controller_Context_param MyInteger
#define Controller_Context_pong_enum_param MyParam
#define MyInteger int
#define MyParam int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_waitenum 0
#define Controller_States_wait 1
#define MyParam_on 0
#define MyParam_off 1
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_param param;
    Actuator_Context_enum_param enum_param;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_pong_param pong_param;
    Controller_Context_error error;
    Controller_Context_reached reached;
    Controller_Context_param param;
    Controller_Context_pong_enum_param pong_enum_param;
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
inline Actuator_Context_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Context_enum_param_assign_value(dst, src)
{
    MyParam_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_param_assign_value(dst.param, src.param);
    Actuator_Context_enum_param_assign_value(dst.enum_param, src.enum_param);
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
inline Controller_Context_pong_param_assign_value(dst, src)
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
inline Controller_Context_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_pong_enum_param_assign_value(dst, src)
{
    MyParam_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_pong_param_assign_value(dst.pong_param, src.pong_param);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_reached_assign_value(dst.reached, src.reached);
    Controller_Context_param_assign_value(dst.param, src.param);
    Controller_Context_pong_enum_param_assign_value(dst.pong_enum_param, src.pong_enum_param);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyParam_assign_value(dst, src)
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
