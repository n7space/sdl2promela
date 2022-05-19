#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_parallel_0_right_0_state Actuator_States
#define Actuator_Context_parallel_0_left_0_state Actuator_States
#define Actuator_Context_parallel_0_left_0_data MyInteger
#define Actuator_Context_parallel_0_left_0_selection MyChoice
#define Actuator_Mychoice_Selection int
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Mychoice_Selection int
#define MyInteger int
#define MyChoice_first MyInteger
#define MyChoice_second MyInteger
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_parallel_0_left 0
#define Actuator_States_parallel_0_left_0_wait 1
#define Actuator_States_parallel_0_right 2
#define Actuator_States_state_0_end 3
#define Actuator_States_parallel_0_right_0_wait 4
#define Actuator_States_parallel 5
#define Actuator_Mychoice_Selection_first_present 1
#define Actuator_Mychoice_Selection_second_present 2
#define Controller_States_wait 0
#define Controller_Mychoice_Selection_first_present 1
#define Controller_Mychoice_Selection_second_present 2
#define MyChoice_NONE 0
#define MyChoice_first_PRESENT 1
#define MyChoice_second_PRESENT 2
typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
}

typedef MyChoice_data {
    MyChoice_first first;
    MyChoice_second second;
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
    Actuator_Context_parallel_0_right_0_state parallel_0_right_0_state;
    Actuator_Context_parallel_0_left_0_state parallel_0_left_0_state;
    Actuator_Context_parallel_0_left_0_data parallel_0_left_0_data;
    Actuator_Context_parallel_0_left_0_selection parallel_0_left_0_selection;
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
inline Actuator_Context_parallel_0_right_0_state_assign_value(dst, src)
{
    Actuator-States_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_left_0_state_assign_value(dst, src)
{
    Actuator-States_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_left_0_data_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Context_parallel_0_left_0_selection_assign_value(dst, src)
{
    MyChoice_assign_value(dst, src);
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_parallel_0_right_0_state_assign_value(dst.parallel_0_right_0_state, src.parallel_0_right_0_state);
    Actuator_Context_parallel_0_left_0_state_assign_value(dst.parallel_0_left_0_state, src.parallel_0_left_0_state);
    Actuator_Context_parallel_0_left_0_data_assign_value(dst.parallel_0_left_0_data, src.parallel_0_left_0_data);
    Actuator_Context_parallel_0_left_0_selection_assign_value(dst.parallel_0_left_0_selection, src.parallel_0_left_0_selection);
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
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
}
inline Controller_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyChoice_first_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyChoice_second_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyChoice_assign_value(dst, src)
{
    MyChoice_first_assign_value(dst.data.first, src.data.first);
    MyChoice_second_assign_value(dst.data.second, src.data.second);
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
