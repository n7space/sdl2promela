#define Controller_States int
#define Controller_Context__state int
#define Controller_Context__init_done bool
#define Controller_Context__param int
#define Controller_Context__my int
#define Controller_Context__myflag bool
#define MyInteger int
#define InternalInteger int
#define InternalFlag bool
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Controller_States_first 0
#define Controller_Context__state_first 0
typedef Controller_Context {
    Controller_Context__state state;
    Controller_Context__init_done init_done;
    Controller_Context__param param;
    Controller_Context__my my;
    Controller_Context__myflag myflag;
}

typedef T_Null_Record {
    bit dummy;
}

inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((Controller_States_vc == Controller_States_first));
}
inline Controller_Context__state_assign_value(dst, src)
{
    dst = src;
    Controller_Context__state_range_check(dst);
}
inline Controller_Context__state_range_check(Controller_Context__state_vc)
{
    assert((Controller_Context__state_vc == Controller_Context__state_first));
}
inline Controller_Context__init_done_assign_value(dst, src)
{
    dst = src;
    Controller_Context__init_done_range_check(dst);
}
inline Controller_Context__init_done_range_check(Controller_Context__init_done_vc)
{
    assert(true);
}
inline Controller_Context__param_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_range_check(dst);
}
inline Controller_Context__param_range_check(Controller_Context__param_vc)
{
    assert(((Controller_Context__param_vc >= 0) && (Controller_Context__param_vc <= 16)));
}
inline Controller_Context__my_assign_value(dst, src)
{
    dst = src;
    Controller_Context__my_range_check(dst);
}
inline Controller_Context__my_range_check(Controller_Context__my_vc)
{
    assert(((Controller_Context__my_vc >= 0) && (Controller_Context__my_vc <= 255)));
}
inline Controller_Context__myflag_assign_value(dst, src)
{
    dst = src;
    Controller_Context__myflag_range_check(dst);
}
inline Controller_Context__myflag_range_check(Controller_Context__myflag_vc)
{
    assert(true);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context__state_assign_value(dst.state, src.state);
    Controller_Context__init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context__param_assign_value(dst.param, src.param);
    Controller_Context__my_assign_value(dst.my, src.my);
    Controller_Context__myflag_assign_value(dst.myflag, src.myflag);
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
    MyInteger_range_check(dst);
}
inline MyInteger_range_check(MyInteger_vc)
{
    assert(((MyInteger_vc >= 0) && (MyInteger_vc <= 16)));
}
inline InternalInteger_assign_value(dst, src)
{
    dst = src;
    InternalInteger_range_check(dst);
}
inline InternalInteger_range_check(InternalInteger_vc)
{
    assert(((InternalInteger_vc >= 0) && (InternalInteger_vc <= 255)));
}
inline InternalFlag_assign_value(dst, src)
{
    dst = src;
    InternalFlag_range_check(dst);
}
inline InternalFlag_range_check(InternalFlag_vc)
{
    assert(true);
}
inline T_Int32_assign_value(dst, src)
{
    dst = src;
    T_Int32_range_check(dst);
}
inline T_Int32_range_check(T_Int32_vc)
{
    assert(1);
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
    T_UInt32_range_check(dst);
}
inline T_UInt32_range_check(T_UInt32_vc)
{
    assert((T_UInt32_vc >= 0));
}
inline T_Int8_assign_value(dst, src)
{
    dst = src;
    T_Int8_range_check(dst);
}
inline T_Int8_range_check(T_Int8_vc)
{
    assert(((T_Int8_vc >= -128) && (T_Int8_vc <= 127)));
}
inline T_UInt8_assign_value(dst, src)
{
    dst = src;
    T_UInt8_range_check(dst);
}
inline T_UInt8_range_check(T_UInt8_vc)
{
    assert(((T_UInt8_vc >= 0) && (T_UInt8_vc <= 255)));
}
inline T_Boolean_assign_value(dst, src)
{
    dst = src;
    T_Boolean_range_check(dst);
}
inline T_Boolean_range_check(T_Boolean_vc)
{
    assert(true);
}
inline T_Null_Record_assign_value(dst, src)
{
    skip;
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
