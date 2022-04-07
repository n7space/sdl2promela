#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_p1 MyBool
#define Controller_Context_valreceived MyBool
#define MyBool bool
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Controller_States_wait 0
typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_p1 p1;
    Controller_Context_valreceived valreceived;
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
inline Controller_Context_p1_assign_value(dst, src)
{
    MyBool_assign_value(dst, src);
}
inline Controller_Context_valreceived_assign_value(dst, src)
{
    MyBool_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_p1_assign_value(dst.p1, src.p1);
    Controller_Context_valreceived_assign_value(dst.valreceived, src.valreceived);
}
inline MyBool_assign_value(dst, src)
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
