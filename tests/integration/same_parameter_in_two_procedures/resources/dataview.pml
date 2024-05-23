#define Actuator_States int
#define Actuator_Context__state int
#define Actuator_Context__init_done bool
#define Actuator_Context__tmp int
#define Actuator_Context__auxilary int
#define Actuator_Context__param int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define MyInteger int
#define MyData__left int
#define MyData__right int
#define Actuator_States_wait 0
#define Actuator_Context__state_wait 0
typedef Actuator_Context {
    Actuator_Context__state state;
    Actuator_Context__init_done init_done;
    Actuator_Context__tmp tmp;
    Actuator_Context__auxilary auxilary;
    Actuator_Context__param param;
}

typedef MyData {
    MyData__left left;
    MyData__right right;
}

typedef T_Null_Record {
    bit dummy;
}

inline Actuator_States_assign_value(dst, src)
{
    dst = src;
    Actuator_States_range_check(dst);
}
inline Actuator_States_range_check(Actuator_States_vc)
{
    assert((Actuator_States_vc == Actuator_States_wait));
}
inline Actuator_Context__state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__state_range_check(dst);
}
inline Actuator_Context__state_range_check(Actuator_Context__state_vc)
{
    assert((Actuator_Context__state_vc == Actuator_Context__state_wait));
}
inline Actuator_Context__init_done_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__init_done_range_check(dst);
}
inline Actuator_Context__init_done_range_check(Actuator_Context__init_done_vc)
{
    assert(true);
}
inline Actuator_Context__tmp_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__tmp_range_check(dst);
}
inline Actuator_Context__tmp_range_check(Actuator_Context__tmp_vc)
{
    assert(((Actuator_Context__tmp_vc >= 0) && (Actuator_Context__tmp_vc <= 10000)));
}
inline Actuator_Context__auxilary_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__auxilary_range_check(dst);
}
inline Actuator_Context__auxilary_range_check(Actuator_Context__auxilary_vc)
{
    assert(((Actuator_Context__auxilary_vc >= 0) && (Actuator_Context__auxilary_vc <= 10000)));
}
inline Actuator_Context__param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__param_range_check(dst);
}
inline Actuator_Context__param_range_check(Actuator_Context__param_vc)
{
    assert(((Actuator_Context__param_vc >= 0) && (Actuator_Context__param_vc <= 10000)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context__state_assign_value(dst.state, src.state);
    Actuator_Context__init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context__tmp_assign_value(dst.tmp, src.tmp);
    Actuator_Context__auxilary_assign_value(dst.auxilary, src.auxilary);
    Actuator_Context__param_assign_value(dst.param, src.param);
}
inline T_Int32_assign_value(dst, src)
{
    dst = src;
    T_Int32_range_check(dst);
}
inline T_Int32_range_check(T_Int32_vc)
{
    assert((T_Int32_vc <= 2147483647));
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
    T_UInt32_range_check(dst);
}
inline T_UInt32_range_check(T_UInt32_vc)
{
    assert(((T_UInt32_vc >= 0) && (T_UInt32_vc <= -1)));
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
inline MyInteger_assign_value(dst, src)
{
    dst = src;
    MyInteger_range_check(dst);
}
inline MyInteger_range_check(MyInteger_vc)
{
    assert(((MyInteger_vc >= 0) && (MyInteger_vc <= 10000)));
}
inline MyData__left_assign_value(dst, src)
{
    dst = src;
    MyData__left_range_check(dst);
}
inline MyData__left_range_check(MyData__left_vc)
{
    assert(((MyData__left_vc >= 0) && (MyData__left_vc <= 10000)));
}
inline MyData__right_assign_value(dst, src)
{
    dst = src;
    MyData__right_range_check(dst);
}
inline MyData__right_range_check(MyData__right_vc)
{
    assert(((MyData__right_vc >= 0) && (MyData__right_vc <= 10000)));
}
inline MyData_assign_value(dst, src)
{
    MyData__left_assign_value(dst.left, src.left);
    MyData__right_assign_value(dst.right, src.right);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
