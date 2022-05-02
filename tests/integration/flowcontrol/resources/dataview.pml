#define FlowControl_States int
#define FlowControl_Context_state FlowControl_States
#define FlowControl_Context_wparam TestInteger
#define FlowControl_Context_i TestInteger
#define FlowControl_Context_wresult TestInteger
#define TestInteger int

#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Flowcontrol_States_wait 0

typedef T_Null_Record {
    bit dummy;
}

typedef FlowControl_Context {
    FlowControl_Context_state state;
    FlowControl_Context_wparam wparam;
    FlowControl_Context_i i;
    FlowControl_Context_wresult wresult;
}

inline TestInteger_assign_value(dst, src)
{
    dst = src;
}
inline FlowControl_Context_wparam_assign_value(dst, src)
{
    TestInteger_assign_value(dst, src);
}
inline FlowControl_Context_i_assign_value(dst, src)
{
    TestInteger_assign_value(dst, src);
}
inline FlowControl_Context_wresult_assign_value(dst, src)
{
    TestInteger_assign_value(dst, src);
}
