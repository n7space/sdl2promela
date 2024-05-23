#define Actuator_States int
#define Actuator_Context__state int
#define Actuator_Context__init_done bool
#define Actuator_Context__sender int
#define Actuator_Context__offspring int
#define Actuator_Context__nested_0_param int
#define Actuator_Context__nested_0_data__first int
#define Actuator_Context__nested_0_data__secONd int
#define Actuator_Mychoice_Selection int
#define Actuator_T_Runtime_Error_Selection int
#define Controller_States int
#define Controller_Context__state int
#define Controller_Context__init_done bool
#define Controller_Context__sender int
#define Controller_Context__offspring int
#define Controller_Context__test_param int
#define Controller_Context__ticks int
#define Controller_Context__result_param int
#define Controller_Context__expected int
#define Controller_Context__error int
#define Controller_Mychoice_Selection int
#define Controller_T_Runtime_Error_Selection int
#define MyInteger int
#define MyTestInteger int
#define MyChoice__first int
#define MyChoice__secONd int
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
#define Environ_test_p1 int
#define TimerData__timer_enabled bool
#define TimerData__interval int
#define Actuator_States_wait 0
#define Actuator_States_nested_0_work 1
#define Actuator_Context__state_wait 0
#define Actuator_Context__state_nested_0_work 1
#define Actuator_Context__sender_actuator 0
#define Actuator_Context__sender_controller 1
#define Actuator_Context__sender_environ 2
#define Actuator_Context__sender_env 3
#define Actuator_Context__offspring_actuator 0
#define Actuator_Context__offspring_controller 1
#define Actuator_Context__offspring_environ 2
#define Actuator_Context__offspring_env 3
#define Actuator_Context__nested_0_data_NONE 0
#define Actuator_Context__nested_0_data_first_PRESENT 1
#define Actuator_context__nested_0_data_selection_first_PRESENT 1
#define Actuator_Context__nested_0_data_secONd_PRESENT 2
#define Actuator_context__nested_0_data_selection_secONd_PRESENT 2
#define Actuator_Mychoice_Selection_first_present 1
#define Actuator_Mychoice_Selection_secONd_present 2
#define Actuator_T_Runtime_Error_Selection_noerror_present 1
#define Actuator_T_Runtime_Error_Selection_encodeerror_present 2
#define Actuator_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_reseting 0
#define Controller_States_wait 1
#define Controller_States_testing 2
#define Controller_Context__state_reseting 0
#define Controller_Context__state_wait 1
#define Controller_Context__state_testing 2
#define Controller_Context__sender_actuator 0
#define Controller_Context__sender_controller 1
#define Controller_Context__sender_environ 2
#define Controller_Context__sender_env 3
#define Controller_Context__offspring_actuator 0
#define Controller_Context__offspring_controller 1
#define Controller_Context__offspring_environ 2
#define Controller_Context__offspring_env 3
#define Controller_Mychoice_Selection_first_present 1
#define Controller_Mychoice_Selection_secONd_present 2
#define Controller_T_Runtime_Error_Selection_noerror_present 1
#define Controller_T_Runtime_Error_Selection_encodeerror_present 2
#define Controller_T_Runtime_Error_Selection_decodeerror_present 3
#define MyChoice_NONE 0
#define MyChoice_first_PRESENT 1
#define Mychoice_selection_first_PRESENT 1
#define MyChoice_secONd_PRESENT 2
#define Mychoice_selection_secONd_PRESENT 2
#define T_Runtime_Error_NONE 0
#define T_Runtime_Error_noerror_PRESENT 1
#define T_runtime_error_selection_noerror_PRESENT 1
#define T_Runtime_Error_encodeerror_PRESENT 2
#define T_runtime_error_selection_encodeerror_PRESENT 2
#define T_Runtime_Error_decodeerror_PRESENT 3
#define T_runtime_error_selection_decodeerror_PRESENT 3
#define PID_actuator 0
#define PID_controller 1
#define PID_environ 2
#define PID_env 3
typedef Actuator_Context__nested_0_data_data {
    Actuator_Context__nested_0_data__first first;
    Actuator_Context__nested_0_data__secONd secONd;
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

typedef Controller_Context {
    Controller_Context__state state;
    Controller_Context__init_done init_done;
    Controller_Context__sender sender;
    Controller_Context__offspring offspring;
    Controller_Context__test_param test_param;
    Controller_Context__ticks ticks;
    Controller_Context__result_param result_param;
    Controller_Context__expected expected;
    Controller_Context__error error;
}

typedef MyChoice_data {
    MyChoice__first first;
    MyChoice__secONd secONd;
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

typedef Actuator_Context__nested_0_data {
    Actuator_Context__nested_0_data_data data;
    int selection;
}

typedef AggregateTimerData {
    AggregateTimerData__actuator actuator;
    AggregateTimerData__controller controller;
    AggregateTimerData__dummy_entry dummy_entry;
}

typedef MyChoice {
    MyChoice_data data;
    int selection;
}

typedef T_Runtime_Error {
    T_Runtime_Error_data data;
    int selection;
}

typedef Actuator_Context {
    Actuator_Context__state state;
    Actuator_Context__init_done init_done;
    Actuator_Context__sender sender;
    Actuator_Context__offspring offspring;
    Actuator_Context__nested_0_param nested_0_param;
    Actuator_Context__nested_0_data nested_0_data;
}

inline Actuator_States_assign_value(dst, src)
{
    dst = src;
    Actuator_States_range_check(dst);
}
inline Actuator_States_range_check(Actuator_States_vc)
{
    assert(((Actuator_States_vc == Actuator_States_wait) || (Actuator_States_vc == Actuator_States_nested_0_work)));
}
inline Actuator_Context__state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__state_range_check(dst);
}
inline Actuator_Context__state_range_check(Actuator_Context__state_vc)
{
    assert(((Actuator_Context__state_vc == Actuator_Context__state_wait) || (Actuator_Context__state_vc == Actuator_Context__state_nested_0_work)));
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
    assert(((((Actuator_Context__sender_vc == Actuator_Context__sender_actuator) || (Actuator_Context__sender_vc == Actuator_Context__sender_controller)) || (Actuator_Context__sender_vc == Actuator_Context__sender_environ)) || (Actuator_Context__sender_vc == Actuator_Context__sender_env)));
}
inline Actuator_Context__offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__offspring_range_check(dst);
}
inline Actuator_Context__offspring_range_check(Actuator_Context__offspring_vc)
{
    assert(((((Actuator_Context__offspring_vc == Actuator_Context__offspring_actuator) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_controller)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_environ)) || (Actuator_Context__offspring_vc == Actuator_Context__offspring_env)));
}
inline Actuator_Context__nested_0_param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__nested_0_param_range_check(dst);
}
inline Actuator_Context__nested_0_param_range_check(Actuator_Context__nested_0_param_vc)
{
    assert(((Actuator_Context__nested_0_param_vc >= 0) && (Actuator_Context__nested_0_param_vc <= 10000)));
}
inline Actuator_Context__nested_0_data__first_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__nested_0_data__first_range_check(dst);
}
inline Actuator_Context__nested_0_data__first_range_check(Actuator_Context__nested_0_data__first_vc)
{
    assert(((Actuator_Context__nested_0_data__first_vc >= 0) && (Actuator_Context__nested_0_data__first_vc <= 10000)));
}
inline Actuator_Context__nested_0_data__secONd_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__nested_0_data__secONd_range_check(dst);
}
inline Actuator_Context__nested_0_data__secONd_range_check(Actuator_Context__nested_0_data__secONd_vc)
{
    assert(((Actuator_Context__nested_0_data__secONd_vc >= 0) && (Actuator_Context__nested_0_data__secONd_vc <= 10000)));
}
inline Actuator_Context__nested_0_data_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context__nested_0_data_first_PRESENT);
        Actuator_Context__nested_0_data__first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == Actuator_Context__nested_0_data_secONd_PRESENT);
        Actuator_Context__nested_0_data__secONd_assign_value(dst.data.secONd, src.data.secONd);
    ::  else;
        skip;
    fi;
}
inline Actuator_context__nested_0_data_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context__state_assign_value(dst.state, src.state);
    Actuator_Context__init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context__sender_assign_value(dst.sender, src.sender);
    Actuator_Context__offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context__nested_0_param_assign_value(dst.nested_0_param, src.nested_0_param);
    Actuator_Context__nested_0_data_assign_value(dst.nested_0_data, src.nested_0_data);
}
inline Actuator_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Mychoice_Selection_range_check(dst);
}
inline Actuator_Mychoice_Selection_range_check(Actuator_Mychoice_Selection_vc)
{
    assert(((Actuator_Mychoice_Selection_vc == Actuator_Mychoice_Selection_first_present) || (Actuator_Mychoice_Selection_vc == Actuator_Mychoice_Selection_secONd_present)));
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
    assert((((Controller_States_vc == Controller_States_reseting) || (Controller_States_vc == Controller_States_wait)) || (Controller_States_vc == Controller_States_testing)));
}
inline Controller_Context__state_assign_value(dst, src)
{
    dst = src;
    Controller_Context__state_range_check(dst);
}
inline Controller_Context__state_range_check(Controller_Context__state_vc)
{
    assert((((Controller_Context__state_vc == Controller_Context__state_reseting) || (Controller_Context__state_vc == Controller_Context__state_wait)) || (Controller_Context__state_vc == Controller_Context__state_testing)));
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
    assert(((((Controller_Context__sender_vc == Controller_Context__sender_actuator) || (Controller_Context__sender_vc == Controller_Context__sender_controller)) || (Controller_Context__sender_vc == Controller_Context__sender_environ)) || (Controller_Context__sender_vc == Controller_Context__sender_env)));
}
inline Controller_Context__offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context__offspring_range_check(dst);
}
inline Controller_Context__offspring_range_check(Controller_Context__offspring_vc)
{
    assert(((((Controller_Context__offspring_vc == Controller_Context__offspring_actuator) || (Controller_Context__offspring_vc == Controller_Context__offspring_controller)) || (Controller_Context__offspring_vc == Controller_Context__offspring_environ)) || (Controller_Context__offspring_vc == Controller_Context__offspring_env)));
}
inline Controller_Context__test_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context__test_param_range_check(dst);
}
inline Controller_Context__test_param_range_check(Controller_Context__test_param_vc)
{
    assert(((Controller_Context__test_param_vc >= 1) && (Controller_Context__test_param_vc <= 8)));
}
inline Controller_Context__ticks_assign_value(dst, src)
{
    dst = src;
    Controller_Context__ticks_range_check(dst);
}
inline Controller_Context__ticks_range_check(Controller_Context__ticks_vc)
{
    assert(((Controller_Context__ticks_vc >= 1) && (Controller_Context__ticks_vc <= 8)));
}
inline Controller_Context__result_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context__result_param_range_check(dst);
}
inline Controller_Context__result_param_range_check(Controller_Context__result_param_vc)
{
    assert(((Controller_Context__result_param_vc >= 0) && (Controller_Context__result_param_vc <= 10000)));
}
inline Controller_Context__expected_assign_value(dst, src)
{
    dst = src;
    Controller_Context__expected_range_check(dst);
}
inline Controller_Context__expected_range_check(Controller_Context__expected_vc)
{
    assert(((Controller_Context__expected_vc >= 0) && (Controller_Context__expected_vc <= 10000)));
}
inline Controller_Context__error_assign_value(dst, src)
{
    dst = src;
    Controller_Context__error_range_check(dst);
}
inline Controller_Context__error_range_check(Controller_Context__error_vc)
{
    assert(((Controller_Context__error_vc >= 0) && (Controller_Context__error_vc <= 10000)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context__state_assign_value(dst.state, src.state);
    Controller_Context__init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context__sender_assign_value(dst.sender, src.sender);
    Controller_Context__offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context__test_param_assign_value(dst.test_param, src.test_param);
    Controller_Context__ticks_assign_value(dst.ticks, src.ticks);
    Controller_Context__result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context__expected_assign_value(dst.expected, src.expected);
    Controller_Context__error_assign_value(dst.error, src.error);
}
inline Controller_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Mychoice_Selection_range_check(dst);
}
inline Controller_Mychoice_Selection_range_check(Controller_Mychoice_Selection_vc)
{
    assert(((Controller_Mychoice_Selection_vc == Controller_Mychoice_Selection_first_present) || (Controller_Mychoice_Selection_vc == Controller_Mychoice_Selection_secONd_present)));
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
inline MyInteger_assign_value(dst, src)
{
    dst = src;
    MyInteger_range_check(dst);
}
inline MyInteger_range_check(MyInteger_vc)
{
    assert(((MyInteger_vc >= 0) && (MyInteger_vc <= 10000)));
}
inline MyTestInteger_assign_value(dst, src)
{
    dst = src;
    MyTestInteger_range_check(dst);
}
inline MyTestInteger_range_check(MyTestInteger_vc)
{
    assert(((MyTestInteger_vc >= 1) && (MyTestInteger_vc <= 8)));
}
inline MyChoice__first_assign_value(dst, src)
{
    dst = src;
    MyChoice__first_range_check(dst);
}
inline MyChoice__first_range_check(MyChoice__first_vc)
{
    assert(((MyChoice__first_vc >= 0) && (MyChoice__first_vc <= 10000)));
}
inline MyChoice__secONd_assign_value(dst, src)
{
    dst = src;
    MyChoice__secONd_range_check(dst);
}
inline MyChoice__secONd_range_check(MyChoice__secONd_vc)
{
    assert(((MyChoice__secONd_vc >= 0) && (MyChoice__secONd_vc <= 10000)));
}
inline MyChoice_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyChoice_first_PRESENT);
        MyChoice__first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == MyChoice_secONd_PRESENT);
        MyChoice__secONd_assign_value(dst.data.secONd, src.data.secONd);
    ::  else;
        skip;
    fi;
}
inline Mychoice_selection_assign_value(dst, src)
{
    dst = src;
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
inline T_Runtime_Error__noerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__noerror_range_check(dst);
}
inline T_Runtime_Error__noerror_range_check(T_Runtime_Error__noerror_vc)
{
    assert(((T_Runtime_Error__noerror_vc >= 0) && (T_Runtime_Error__noerror_vc <= -1)));
}
inline T_Runtime_Error__encodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__encodeerror_range_check(dst);
}
inline T_Runtime_Error__encodeerror_range_check(T_Runtime_Error__encodeerror_vc)
{
    assert((T_Runtime_Error__encodeerror_vc <= 2147483647));
}
inline T_Runtime_Error__decodeerror_assign_value(dst, src)
{
    dst = src;
    T_Runtime_Error__decodeerror_range_check(dst);
}
inline T_Runtime_Error__decodeerror_range_check(T_Runtime_Error__decodeerror_vc)
{
    assert((T_Runtime_Error__decodeerror_vc <= 2147483647));
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
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 3)));
}
inline PID_assign_value(dst, src)
{
    dst = src;
    PID_range_check(dst);
}
inline PID_range_check(PID_vc)
{
    assert(((((PID_vc == PID_actuator) || (PID_vc == PID_controller)) || (PID_vc == PID_environ)) || (PID_vc == PID_env)));
}
inline Environ_test_p1_assign_value(dst, src)
{
    dst = src;
    Environ_test_p1_range_check(dst);
}
inline Environ_test_p1_range_check(Environ_test_p1_vc)
{
    assert(((Environ_test_p1_vc >= 1) && (Environ_test_p1_vc <= 8)));
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
