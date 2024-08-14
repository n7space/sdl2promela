#define Actuator_States int
#define Actuator_Context__state int
#define Actuator_Context__init_done bool
#define Actuator_Context__sender int
#define Actuator_Context__offspring int
#define Actuator_Myvalues_Selection int
#define Actuator_T_Runtime_Error_Selection int
#define Controller_States int
#define Controller_Context__state int
#define Controller_Context__init_done bool
#define Controller_Context__sender int
#define Controller_Context__offspring int
#define Controller_Context__param_data__first int
#define Controller_Context__param_data__second int
#define Controller_Context__param_values__left int
#define Controller_Context__param_values__right int
#define Controller_Context__param_array__elem int
#define Controller_Context__param_nested__black int
#define Controller_Context__param_nested__red__first int
#define Controller_Context__param_nested__red__second int
#define Controller_Myvalues_Selection int
#define Controller_T_Runtime_Error_Selection int
#define Timer_manager_States int
#define Timer_manager_Context__state int
#define MyInteger int
#define MyData__first int
#define MyData__second int
#define MyValues__left int
#define MyValues__right int
#define MyArray__elem int
#define MyNested__black int
#define MyNested__red__first int
#define MyNested__red__second int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define T_Runtime_Error__noerror int
#define T_Runtime_Error__encodeerror int
#define T_Runtime_Error__decodeerror int
#define PID_Range int
#define PID int
#define TimerData__timer_enabled bool
#define TimerData__interval int
#define Actuator_States_wait 0
#define Actuator_Context__state_wait 0
#define Actuator_Context__sender_taste_user_interface 0
#define Actuator_Context__sender_timer_manager 1
#define Actuator_Context__sender_actuator 2
#define Actuator_Context__sender_controller 3
#define Actuator_Context__sender_env 4
#define Actuator_Context__offspring_taste_user_interface 0
#define Actuator_Context__offspring_timer_manager 1
#define Actuator_Context__offspring_actuator 2
#define Actuator_Context__offspring_controller 3
#define Actuator_Context__offspring_env 4
#define Actuator_Myvalues_Selection_left_present 1
#define Actuator_Myvalues_Selection_right_present 2
#define Actuator_T_Runtime_Error_Selection_noerror_present 1
#define Actuator_T_Runtime_Error_Selection_encodeerror_present 2
#define Actuator_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_waitforarray 0
#define Controller_States_waitfordata 1
#define Controller_States_waitfornested 2
#define Controller_States_error 3
#define Controller_States_waitforvalues 4
#define Controller_States_finished 5
#define Controller_Context__state_waitforarray 0
#define Controller_Context__state_waitfordata 1
#define Controller_Context__state_waitfornested 2
#define Controller_Context__state_error 3
#define Controller_Context__state_waitforvalues 4
#define Controller_Context__state_finished 5
#define Controller_Context__sender_taste_user_interface 0
#define Controller_Context__sender_timer_manager 1
#define Controller_Context__sender_actuator 2
#define Controller_Context__sender_controller 3
#define Controller_Context__sender_env 4
#define Controller_Context__offspring_taste_user_interface 0
#define Controller_Context__offspring_timer_manager 1
#define Controller_Context__offspring_actuator 2
#define Controller_Context__offspring_controller 3
#define Controller_Context__offspring_env 4
#define Controller_Context__param_values_NONE 0
#define Controller_Context__param_values_left_PRESENT 1
#define Controller_context__param_values_selection_left_PRESENT 1
#define Controller_Context__param_values_right_PRESENT 2
#define Controller_context__param_values_selection_right_PRESENT 2
#define Controller_Myvalues_Selection_left_present 1
#define Controller_Myvalues_Selection_right_present 2
#define Controller_T_Runtime_Error_Selection_noerror_present 1
#define Controller_T_Runtime_Error_Selection_encodeerror_present 2
#define Controller_T_Runtime_Error_Selection_decodeerror_present 3
#define Timer_manager_States_wait 0
#define Timer_manager_Context__state_wait 0
#define MyValues_NONE 0
#define MyValues_left_PRESENT 1
#define Myvalues_selection_left_PRESENT 1
#define MyValues_right_PRESENT 2
#define Myvalues_selection_right_PRESENT 2
#define T_Runtime_Error_NONE 0
#define T_Runtime_Error_noerror_PRESENT 1
#define T_runtime_error_selection_noerror_PRESENT 1
#define T_Runtime_Error_encodeerror_PRESENT 2
#define T_runtime_error_selection_encodeerror_PRESENT 2
#define T_Runtime_Error_decodeerror_PRESENT 3
#define T_runtime_error_selection_decodeerror_PRESENT 3
#define PID_taste_user_interface 0
#define PID_timer_manager 1
#define PID_actuator 2
#define PID_controller 3
#define PID_env 4
typedef Actuator_Context {
    Actuator_Context__state state;
    Actuator_Context__init_done init_done;
    Actuator_Context__sender sender;
    Actuator_Context__offspring offspring;
}

typedef AggregateTimerData__actuator {
    bit dummy;
}

typedef AggregateTimerData__controller {
    bit dummy;
}

typedef AggregateTimerData__dummy_entry {
    bit dummy;
}

typedef Controller_Context__param_array {
    Controller_Context__param_array__elem data[2];
}

typedef Controller_Context__param_data {
    Controller_Context__param_data__first first;
    Controller_Context__param_data__second second;
}

typedef Controller_Context__param_nested__red {
    Controller_Context__param_nested__red__first first;
    Controller_Context__param_nested__red__second second;
}

typedef Controller_Context__param_values_data {
    Controller_Context__param_values__left left;
    Controller_Context__param_values__right right;
}

typedef MyArray {
    MyArray__elem data[2];
}

typedef MyData {
    MyData__first first;
    MyData__second second;
}

typedef MyNested__red {
    MyNested__red__first first;
    MyNested__red__second second;
}

typedef MyValues_data {
    MyValues__left left;
    MyValues__right right;
}

typedef T_Null_Record {
    bit dummy;
}

typedef T_Runtime_Error_data {
    T_Runtime_Error__noerror noerror;
    T_Runtime_Error__encodeerror encodeerror;
    T_Runtime_Error__decodeerror decodeerror;
}

typedef TimerData {
    TimerData__timer_enabled timer_enabled;
    TimerData__interval interval;
}

typedef Timer_manager_Context {
    Timer_manager_Context__state state;
}

typedef AggregateTimerData {
    AggregateTimerData__actuator actuator;
    AggregateTimerData__controller controller;
    AggregateTimerData__dummy_entry dummy_entry;
}

typedef Controller_Context__param_nested {
    Controller_Context__param_nested__black black;
    Controller_Context__param_nested__red red;
}

typedef Controller_Context__param_values {
    Controller_Context__param_values_data data;
    int selection;
}

typedef MyNested {
    MyNested__black black;
    MyNested__red red;
}

typedef MyValues {
    MyValues_data data;
    int selection;
}

typedef T_Runtime_Error {
    T_Runtime_Error_data data;
    int selection;
}

typedef Controller_Context {
    Controller_Context__state state;
    Controller_Context__init_done init_done;
    Controller_Context__sender sender;
    Controller_Context__offspring offspring;
    Controller_Context__param_data param_data;
    Controller_Context__param_values param_values;
    Controller_Context__param_array param_array;
    Controller_Context__param_nested param_nested;
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
inline Actuator_Context__sender_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__sender_range_check(dst);
}
inline Actuator_Context__sender_range_check(Actuator_Context__sender_vc)
{
    assert((((((Actuator_Context__sender_vc == Actuator_Context__sender_taste_user_interface) || (Actuator_Context__sender_vc == Actuator_Context__sender_timer_manager)) || (Actuator_Context__sender_vc == Actuator_Context__sender_actuator)) || (Actuator_Context__sender_vc == Actuator_Context__sender_controller)) || (Actuator_Context__sender_vc == Actuator_Context__sender_env)));
}
inline Actuator_Context__offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__offspring_range_check(dst);
}
inline Actuator_Context__offspring_range_check(Actuator_Context__offspring_vc)
{
    assert((((((Actuator_Context__offspring_vc == Actuator_Context__offspring_taste_user_interface) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_timer_manager)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_actuator)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_controller)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_env)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context__state_assign_value(dst.state, src.state);
    Actuator_Context__init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context__sender_assign_value(dst.sender, src.sender);
    Actuator_Context__offspring_assign_value(dst.offspring, src.offspring);
}
inline Actuator_Myvalues_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Myvalues_Selection_range_check(dst);
}
inline Actuator_Myvalues_Selection_range_check(Actuator_Myvalues_Selection_vc)
{
    assert(((Actuator_Myvalues_Selection_vc == Actuator_Myvalues_Selection_left_present) || (Actuator_Myvalues_Selection_vc == Actuator_Myvalues_Selection_right_present)));
}
inline Actuator_T_Runtime_Error_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_T_Runtime_Error_Selection_range_check(dst);
}
inline Actuator_T_Runtime_Error_Selection_range_check(Actuator_T_Runtime_Error_Selection_vc)
{
    assert((((Actuator_T_Runtime_Error_Selection_vc == Actuator_T_Runtime_Error_Selection_noerror_present) || (Actuator_T_Runtime_Error_Selection_vc == Actuator_T_Runtime_Error_Selection_encodeerror_present)) || (Actuator_T_Runtime_Error_Selection_vc == Actuator_T_Runtime_Error_Selection_decodeerror_present)));
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert(((((((Controller_States_vc == Controller_States_waitforarray) || (Controller_States_vc == Controller_States_waitfordata)) || (Controller_States_vc == Controller_States_waitfornested)) || (Controller_States_vc == Controller_States_error)) || (Controller_States_vc == Controller_States_waitforvalues)) || (Controller_States_vc == Controller_States_finished)));
}
inline Controller_Context__state_assign_value(dst, src)
{
    dst = src;
    Controller_Context__state_range_check(dst);
}
inline Controller_Context__state_range_check(Controller_Context__state_vc)
{
    assert(((((((Controller_Context__state_vc == Controller_Context__state_waitforarray) || (Controller_Context__state_vc == Controller_Context__state_waitfordata)) || (Controller_Context__state_vc == Controller_Context__state_waitfornested)) || (Controller_Context__state_vc == Controller_Context__state_error)) || (Controller_Context__state_vc == Controller_Context__state_waitforvalues)) || (Controller_Context__state_vc == Controller_Context__state_finished)));
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
inline Controller_Context__sender_assign_value(dst, src)
{
    dst = src;
    Controller_Context__sender_range_check(dst);
}
inline Controller_Context__sender_range_check(Controller_Context__sender_vc)
{
    assert((((((Controller_Context__sender_vc == Controller_Context__sender_taste_user_interface) || (Controller_Context__sender_vc == Controller_Context__sender_timer_manager)) || (Controller_Context__sender_vc == Controller_Context__sender_actuator)) || (Controller_Context__sender_vc == Controller_Context__sender_controller)) || (Controller_Context__sender_vc == Controller_Context__sender_env)));
}
inline Controller_Context__offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context__offspring_range_check(dst);
}
inline Controller_Context__offspring_range_check(Controller_Context__offspring_vc)
{
    assert((((((Controller_Context__offspring_vc == Controller_Context__offspring_taste_user_interface) || (Controller_Context__offspring_vc == Controller_Context__offspring_timer_manager)) || (Controller_Context__offspring_vc == Controller_Context__offspring_actuator)) || (Controller_Context__offspring_vc == Controller_Context__offspring_controller)) || (Controller_Context__offspring_vc == Controller_Context__offspring_env)));
}
inline Controller_Context__param_data__first_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_data__first_range_check(dst);
}
inline Controller_Context__param_data__first_range_check(Controller_Context__param_data__first_vc)
{
    assert(((Controller_Context__param_data__first_vc >= 0) && (Controller_Context__param_data__first_vc <= 10000)));
}
inline Controller_Context__param_data__second_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_data__second_range_check(dst);
}
inline Controller_Context__param_data__second_range_check(Controller_Context__param_data__second_vc)
{
    assert(((Controller_Context__param_data__second_vc >= 0) && (Controller_Context__param_data__second_vc <= 10000)));
}
inline Controller_Context__param_data_assign_value(dst, src)
{
    Controller_Context__param_data__first_assign_value(dst.first, src.first);
    Controller_Context__param_data__second_assign_value(dst.second, src.second);
}
inline Controller_Context__param_values__left_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_values__left_range_check(dst);
}
inline Controller_Context__param_values__left_range_check(Controller_Context__param_values__left_vc)
{
    assert(((Controller_Context__param_values__left_vc >= 0) && (Controller_Context__param_values__left_vc <= 10000)));
}
inline Controller_Context__param_values__right_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_values__right_range_check(dst);
}
inline Controller_Context__param_values__right_range_check(Controller_Context__param_values__right_vc)
{
    assert(((Controller_Context__param_values__right_vc >= 0) && (Controller_Context__param_values__right_vc <= 10000)));
}
inline Controller_Context__param_values_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Controller_Context__param_values_left_PRESENT);
        Controller_Context__param_values__left_assign_value(dst.data.left, src.data.left);
    ::  (dst.selection == Controller_Context__param_values_right_PRESENT);
        Controller_Context__param_values__right_assign_value(dst.data.right, src.data.right);
    ::  else;
        skip;
    fi;
}
inline Controller_context__param_values_selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context__param_array__elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_array__elem_range_check(dst);
}
inline Controller_Context__param_array__elem_range_check(Controller_Context__param_array__elem_vc)
{
    assert(((Controller_Context__param_array__elem_vc >= 0) && (Controller_Context__param_array__elem_vc <= 10000)));
}
inline Controller_Context__param_array__elem_init_value(dst)
{
    Controller_Context__param_array__elem_assign_value(dst, 0);
}
inline Controller_Context__param_array_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. 1)
    {
        Controller_Context__param_array__elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
}
inline Controller_Context__param_nested__black_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_nested__black_range_check(dst);
}
inline Controller_Context__param_nested__black_range_check(Controller_Context__param_nested__black_vc)
{
    assert(((Controller_Context__param_nested__black_vc >= 0) && (Controller_Context__param_nested__black_vc <= 10000)));
}
inline Controller_Context__param_nested__red__first_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_nested__red__first_range_check(dst);
}
inline Controller_Context__param_nested__red__first_range_check(Controller_Context__param_nested__red__first_vc)
{
    assert(((Controller_Context__param_nested__red__first_vc >= 0) && (Controller_Context__param_nested__red__first_vc <= 10000)));
}
inline Controller_Context__param_nested__red__second_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_nested__red__second_range_check(dst);
}
inline Controller_Context__param_nested__red__second_range_check(Controller_Context__param_nested__red__second_vc)
{
    assert(((Controller_Context__param_nested__red__second_vc >= 0) && (Controller_Context__param_nested__red__second_vc <= 10000)));
}
inline Controller_Context__param_nested__red_assign_value(dst, src)
{
    Controller_Context__param_nested__red__first_assign_value(dst.first, src.first);
    Controller_Context__param_nested__red__second_assign_value(dst.second, src.second);
}
inline Controller_Context__param_nested_assign_value(dst, src)
{
    Controller_Context__param_nested__black_assign_value(dst.black, src.black);
    Controller_Context__param_nested__red_assign_value(dst.red, src.red);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context__state_assign_value(dst.state, src.state);
    Controller_Context__init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context__sender_assign_value(dst.sender, src.sender);
    Controller_Context__offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context__param_data_assign_value(dst.param_data, src.param_data);
    Controller_Context__param_values_assign_value(dst.param_values, src.param_values);
    Controller_Context__param_array_assign_value(dst.param_array, src.param_array);
    Controller_Context__param_nested_assign_value(dst.param_nested, src.param_nested);
}
inline Controller_Myvalues_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Myvalues_Selection_range_check(dst);
}
inline Controller_Myvalues_Selection_range_check(Controller_Myvalues_Selection_vc)
{
    assert(((Controller_Myvalues_Selection_vc == Controller_Myvalues_Selection_left_present) || (Controller_Myvalues_Selection_vc == Controller_Myvalues_Selection_right_present)));
}
inline Controller_T_Runtime_Error_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_T_Runtime_Error_Selection_range_check(dst);
}
inline Controller_T_Runtime_Error_Selection_range_check(Controller_T_Runtime_Error_Selection_vc)
{
    assert((((Controller_T_Runtime_Error_Selection_vc == Controller_T_Runtime_Error_Selection_noerror_present) || (Controller_T_Runtime_Error_Selection_vc == Controller_T_Runtime_Error_Selection_encodeerror_present)) || (Controller_T_Runtime_Error_Selection_vc == Controller_T_Runtime_Error_Selection_decodeerror_present)));
}
inline Timer_manager_States_assign_value(dst, src)
{
    dst = src;
    Timer_manager_States_range_check(dst);
}
inline Timer_manager_States_range_check(Timer_manager_States_vc)
{
    assert((Timer_manager_States_vc == Timer_manager_States_wait));
}
inline Timer_manager_Context__state_assign_value(dst, src)
{
    dst = src;
    Timer_manager_Context__state_range_check(dst);
}
inline Timer_manager_Context__state_range_check(Timer_manager_Context__state_vc)
{
    assert((Timer_manager_Context__state_vc == Timer_manager_Context__state_wait));
}
inline Timer_manager_Context_assign_value(dst, src)
{
    Timer_manager_Context__state_assign_value(dst.state, src.state);
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
inline MyData__first_assign_value(dst, src)
{
    dst = src;
    MyData__first_range_check(dst);
}
inline MyData__first_range_check(MyData__first_vc)
{
    assert(((MyData__first_vc >= 0) && (MyData__first_vc <= 10000)));
}
inline MyData__second_assign_value(dst, src)
{
    dst = src;
    MyData__second_range_check(dst);
}
inline MyData__second_range_check(MyData__second_vc)
{
    assert(((MyData__second_vc >= 0) && (MyData__second_vc <= 10000)));
}
inline MyData_assign_value(dst, src)
{
    MyData__first_assign_value(dst.first, src.first);
    MyData__second_assign_value(dst.second, src.second);
}
inline MyValues__left_assign_value(dst, src)
{
    dst = src;
    MyValues__left_range_check(dst);
}
inline MyValues__left_range_check(MyValues__left_vc)
{
    assert(((MyValues__left_vc >= 0) && (MyValues__left_vc <= 10000)));
}
inline MyValues__right_assign_value(dst, src)
{
    dst = src;
    MyValues__right_range_check(dst);
}
inline MyValues__right_range_check(MyValues__right_vc)
{
    assert(((MyValues__right_vc >= 0) && (MyValues__right_vc <= 10000)));
}
inline MyValues_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyValues_left_PRESENT);
        MyValues__left_assign_value(dst.data.left, src.data.left);
    ::  (dst.selection == MyValues_right_PRESENT);
        MyValues__right_assign_value(dst.data.right, src.data.right);
    ::  else;
        skip;
    fi;
}
inline Myvalues_selection_assign_value(dst, src)
{
    dst = src;
}
inline MyArray__elem_assign_value(dst, src)
{
    dst = src;
    MyArray__elem_range_check(dst);
}
inline MyArray__elem_range_check(MyArray__elem_vc)
{
    assert(((MyArray__elem_vc >= 0) && (MyArray__elem_vc <= 10000)));
}
inline MyArray__elem_init_value(dst)
{
    MyArray__elem_assign_value(dst, 0);
}
inline MyArray_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. 1)
    {
        MyArray__elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
}
inline MyNested__black_assign_value(dst, src)
{
    dst = src;
    MyNested__black_range_check(dst);
}
inline MyNested__black_range_check(MyNested__black_vc)
{
    assert(((MyNested__black_vc >= 0) && (MyNested__black_vc <= 10000)));
}
inline MyNested__red__first_assign_value(dst, src)
{
    dst = src;
    MyNested__red__first_range_check(dst);
}
inline MyNested__red__first_range_check(MyNested__red__first_vc)
{
    assert(((MyNested__red__first_vc >= 0) && (MyNested__red__first_vc <= 10000)));
}
inline MyNested__red__second_assign_value(dst, src)
{
    dst = src;
    MyNested__red__second_range_check(dst);
}
inline MyNested__red__second_range_check(MyNested__red__second_vc)
{
    assert(((MyNested__red__second_vc >= 0) && (MyNested__red__second_vc <= 10000)));
}
inline MyNested__red_assign_value(dst, src)
{
    MyNested__red__first_assign_value(dst.first, src.first);
    MyNested__red__second_assign_value(dst.second, src.second);
}
inline MyNested_assign_value(dst, src)
{
    MyNested__black_assign_value(dst.black, src.black);
    MyNested__red_assign_value(dst.red, src.red);
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
inline T_Runtime_Error__noerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__noerror_range_check(dst);
}
inline T_Runtime_Error__noerror_range_check(T_Runtime_Error__noerror_vc)
{
    assert((T_Runtime_Error__noerror_vc >= 0));
}
inline T_Runtime_Error__encodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__encodeerror_range_check(dst);
}
inline T_Runtime_Error__encodeerror_range_check(T_Runtime_Error__encodeerror_vc)
{
    assert(1);
}
inline T_Runtime_Error__decodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__decodeerror_range_check(dst);
}
inline T_Runtime_Error__decodeerror_range_check(T_Runtime_Error__decodeerror_vc)
{
    assert(1);
}
inline T_Runtime_Error_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == T_Runtime_Error_noerror_PRESENT);
        T_Runtime_Error__noerror_assign_value(dst.data.noerror, src.data.noerror);
    ::  (dst.selection == T_Runtime_Error_encodeerror_PRESENT);
        T_Runtime_Error__encodeerror_assign_value(dst.data.encodeerror, src.data.encodeerror);
    ::  (dst.selection == T_Runtime_Error_decodeerror_PRESENT);
        T_Runtime_Error__decodeerror_assign_value(dst.data.decodeerror, src.data.decodeerror);
    ::  else;
        skip;
    fi;
}
inline T_runtime_error_selection_assign_value(dst, src)
{
    dst = src;
}
inline PID_Range_assign_value(dst, src)
{
    dst = src;
    PID_Range_range_check(dst);
}
inline PID_Range_range_check(PID_Range_vc)
{
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 4)));
}
inline PID_assign_value(dst, src)
{
    dst = src;
    PID_range_check(dst);
}
inline PID_range_check(PID_vc)
{
    assert((((((PID_vc == PID_taste_user_interface) || (PID_vc == PID_timer_manager)) || (PID_vc == PID_actuator)) || (PID_vc == PID_controller)) || (PID_vc == PID_env)));
}
inline TimerData__timer_enabled_assign_value(dst, src)
{
    dst = src;
    TimerData__timer_enabled_range_check(dst);
}
inline TimerData__timer_enabled_range_check(TimerData__timer_enabled_vc)
{
    assert(true);
}
inline TimerData__interval_assign_value(dst, src)
{
    dst = src;
    TimerData__interval_range_check(dst);
}
inline TimerData__interval_range_check(TimerData__interval_vc)
{
    assert(((TimerData__interval_vc >= 0) && (TimerData__interval_vc <= 50000)));
}
inline TimerData_assign_value(dst, src)
{
    TimerData__timer_enabled_assign_value(dst.timer_enabled, src.timer_enabled);
    TimerData__interval_assign_value(dst.interval, src.interval);
}
inline AggregateTimerData__actuator_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData__controller_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData__dummy_entry_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_assign_value(dst, src)
{
    AggregateTimerData__actuator_assign_value(dst.actuator, src.actuator);
    AggregateTimerData__controller_assign_value(dst.controller, src.controller);
    AggregateTimerData__dummy_entry_assign_value(dst.dummy_entry, src.dummy_entry);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
