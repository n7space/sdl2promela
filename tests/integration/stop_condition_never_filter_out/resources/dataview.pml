#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_param MyInteger
#define Controller_Context_my InternalInteger
#define Controller_Context_myflag InternalFlag
#define MyInteger int
#define InternalInteger int
#define InternalFlag bool
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Controller_States_first 0
typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_param param;
    Controller_Context_my my;
    Controller_Context_myflag myflag;
}

typedef T_Null_Record {
    bit dummy;
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
    Controller_Context_param_assign_value(dst.param, src.param);
    Controller_Context_my_assign_value(dst.my, src.my);
    Controller_Context_myflag_assign_value(dst.myflag, src.myflag);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline InternalInteger_assign_value(dst, src)
{
    dst = src;
}
inline InternalFlag_assign_value(dst, src)
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
