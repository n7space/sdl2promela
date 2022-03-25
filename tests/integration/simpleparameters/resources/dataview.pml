#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_wparam TestParam
#define Actuator_Context_wresult TestInteger
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_pparam TestParam
#define Controller_Context_pint TestInteger
#define TestInteger int
#define TestParam_valueA TestInteger
#define TestParam_valueB TestInteger
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_operation 0
#define Controller_States_wait 1
typedef T_Null_Record {
    bit dummy;
}

typedef TestParam_exist {
    bool valueB;
}

typedef TestParam {
    TestParam_valueA valueA;
    TestParam_valueB valueB;
    TestParam_exist exist;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_wparam wparam;
    Actuator_Context_wresult wresult;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_pparam pparam;
    Controller_Context_pint pint;
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
inline Actuator_Context_wparam_assign_value(dst, src)
{
    TestParam_assign_value(dst, src);
}
inline Actuator_Context_wresult_assign_value(dst, src)
{
    TestInteger_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_wparam_assign_value(dst.wparam, src.wparam);
    Actuator_Context_wresult_assign_value(dst.wresult, src.wresult);
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
inline Controller_Context_pparam_assign_value(dst, src)
{
    TestParam_assign_value(dst, src);
}
inline Controller_Context_pint_assign_value(dst, src)
{
    TestInteger_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_pparam_assign_value(dst.pparam, src.pparam);
    Controller_Context_pint_assign_value(dst.pint, src.pint);
}
inline TestInteger_assign_value(dst, src)
{
    dst = src;
}
inline TestParam_valueA_assign_value(dst, src)
{
    TestInteger_assign_value(dst, src);
}
inline TestParam_valueB_assign_value(dst, src)
{
    TestInteger_assign_value(dst, src);
}
inline TestParam_assign_value(dst, src)
{
    TestParam_valueA_assign_value(dst.valueA, src.valueA);
    TestParam_valueB_assign_value(dst.valueB, src.valueB);
    dst.exist.valueB = src.exist.valueB;
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
