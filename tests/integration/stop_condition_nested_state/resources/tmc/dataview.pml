#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_nested_0_param MyInteger
#define Actuator_Context_nested_0_data MyChoice
#define Actuator_Mychoice_Selection int
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_test_param MyTestInteger
#define Controller_Context_ticks MyTestInteger
#define Controller_Context_result_param MyInteger
#define Controller_Context_expected MyInteger
#define Controller_Context_error MyInteger
#define Controller_Mychoice_Selection int
#define MyInteger int
#define MyTestInteger int
#define MyChoice_first MyInteger
#define MyChoice_secONd MyInteger
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Actuator_States_nested_0_work 1
#define Actuator_Mychoice_Selection_first_present 1
#define Actuator_Mychoice_Selection_secONd_present 2
#define Controller_States_wait 0
#define Controller_States_reseting 1
#define Controller_States_testing 2
#define Controller_Mychoice_Selection_first_present 1
#define Controller_Mychoice_Selection_secONd_present 2
#define MyChoice_NONE 0
#define MyChoice_first_PRESENT 1
#define MyChoice_secONd_PRESENT 2
typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_test_param test_param;
    Controller_Context_ticks ticks;
    Controller_Context_result_param result_param;
    Controller_Context_expected expected;
    Controller_Context_error error;
}

typedef MyChoice_data {
    MyChoice_first first;
    MyChoice_secONd secONd;
}

typedef T_Null_Record {
    bit dummy;
}

typedef MyChoice {
    MyChoice_data data;
    int selection;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_nested_0_param nested_0_param;
    Actuator_Context_nested_0_data nested_0_data;
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
inline Actuator_Context_nested_0_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Context_nested_0_data_assign_value(dst, src)
{
    MyChoice_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_nested_0_param_assign_value(dst.nested_0_param, src.nested_0_param);
    Actuator_Context_nested_0_data_assign_value(dst.nested_0_data, src.nested_0_data);
}
inline Actuator_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
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
inline Controller_Context_test_param_assign_value(dst, src)
{
    MyTestInteger_assign_value(dst, src);
}
inline Controller_Context_ticks_assign_value(dst, src)
{
    MyTestInteger_assign_value(dst, src);
}
inline Controller_Context_result_param_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_expected_assign_value(dst, src)
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
    Controller_Context_test_param_assign_value(dst.test_param, src.test_param);
    Controller_Context_ticks_assign_value(dst.ticks, src.ticks);
    Controller_Context_result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context_expected_assign_value(dst.expected, src.expected);
    Controller_Context_error_assign_value(dst.error, src.error);
}
inline Controller_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyTestInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyChoice_first_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyChoice_secONd_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyChoice_assign_value(dst, src)
{
    MyChoice_first_assign_value(dst.data.first, src.data.first);
    MyChoice_secONd_assign_value(dst.data.secONd, src.data.secONd);
    dst.selection = src.selection;
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
