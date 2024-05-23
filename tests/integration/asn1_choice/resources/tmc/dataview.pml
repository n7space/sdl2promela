#define Actuator_States int
#define Actuator_Context__state int
#define Actuator_Context__init_done bool
#define Actuator_Context__sender int
#define Actuator_Context__offspring int
#define Actuator_Context__work_param__snare int
#define Actuator_Context__work_param__kick int
#define Actuator_Context__work_param__ride int
#define Actuator_Context__result_param int
#define Actuator_Mytestparam_Selection int
#define Actuator_T_Runtime_Error_Selection int
#define Controller_States int
#define Controller_Context__state int
#define Controller_Context__init_done bool
#define Controller_Context__sender int
#define Controller_Context__offspring int
#define Controller_Context__test_param int
#define Controller_Context__work_param__snare int
#define Controller_Context__work_param__kick int
#define Controller_Context__work_param__ride int
#define Controller_Context__result_param int
#define Controller_Context__expected int
#define Controller_Context__error int
#define Controller_Mytestparam_Selection int
#define Controller_T_Runtime_Error_Selection int
#define MyInteger int
#define MyTestInteger int
#define MyTestParam__snare int
#define MyTestParam__kick int
#define MyTestParam__ride int
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
#define Actuator_Context__state_wait 0
#define Actuator_Context__sender_actuator 0
#define Actuator_Context__sender_controller 1
#define Actuator_Context__sender_environ 2
#define Actuator_Context__sender_env 3
#define Actuator_Context__offspring_actuator 0
#define Actuator_Context__offspring_controller 1
#define Actuator_Context__offspring_environ 2
#define Actuator_Context__offspring_env 3
#define Actuator_Context__work_param_NONE 0
#define Actuator_Context__work_param_snare_PRESENT 1
#define Actuator_context__work_param_selection_snare_PRESENT 1
#define Actuator_Context__work_param_kick_PRESENT 2
#define Actuator_context__work_param_selection_kick_PRESENT 2
#define Actuator_Context__work_param_ride_PRESENT 3
#define Actuator_context__work_param_selection_ride_PRESENT 3
#define Actuator_Mytestparam_Selection_snare_present 1
#define Actuator_Mytestparam_Selection_kick_present 2
#define Actuator_Mytestparam_Selection_ride_present 3
#define Actuator_T_Runtime_Error_Selection_noerror_present 1
#define Actuator_T_Runtime_Error_Selection_encodeerror_present 2
#define Actuator_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_operation 0
#define Controller_States_wait 1
#define Controller_Context__state_operation 0
#define Controller_Context__state_wait 1
#define Controller_Context__sender_actuator 0
#define Controller_Context__sender_controller 1
#define Controller_Context__sender_environ 2
#define Controller_Context__sender_env 3
#define Controller_Context__offspring_actuator 0
#define Controller_Context__offspring_controller 1
#define Controller_Context__offspring_environ 2
#define Controller_Context__offspring_env 3
#define Controller_Context__work_param_NONE 0
#define Controller_Context__work_param_snare_PRESENT 1
#define Controller_context__work_param_selection_snare_PRESENT 1
#define Controller_Context__work_param_kick_PRESENT 2
#define Controller_context__work_param_selection_kick_PRESENT 2
#define Controller_Context__work_param_ride_PRESENT 3
#define Controller_context__work_param_selection_ride_PRESENT 3
#define Controller_Mytestparam_Selection_snare_present 1
#define Controller_Mytestparam_Selection_kick_present 2
#define Controller_Mytestparam_Selection_ride_present 3
#define Controller_T_Runtime_Error_Selection_noerror_present 1
#define Controller_T_Runtime_Error_Selection_encodeerror_present 2
#define Controller_T_Runtime_Error_Selection_decodeerror_present 3
#define MyTestParam_NONE 0
#define MyTestParam_snare_PRESENT 1
#define Mytestparam_selection_snare_PRESENT 1
#define MyTestParam_kick_PRESENT 2
#define Mytestparam_selection_kick_PRESENT 2
#define MyTestParam_ride_PRESENT 3
#define Mytestparam_selection_ride_PRESENT 3
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
typedef Actuator_Context__work_param_data {
    Actuator_Context__work_param__snare snare;
    Actuator_Context__work_param__kick kick;
    Actuator_Context__work_param__ride ride;
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

typedef Controller_Context__work_param_data {
    Controller_Context__work_param__snare snare;
    Controller_Context__work_param__kick kick;
    Controller_Context__work_param__ride ride;
}

typedef MyTestParam_data {
    MyTestParam__snare snare;
    MyTestParam__kick kick;
    MyTestParam__ride ride;
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

typedef Actuator_Context__work_param {
    Actuator_Context__work_param_data data;
    int selection;
}

typedef AggregateTimerData {
    AggregateTimerData__actuator actuator;
    AggregateTimerData__controller controller;
    AggregateTimerData__dummy_entry dummy_entry;
}

typedef Controller_Context__work_param {
    Controller_Context__work_param_data data;
    int selection;
}

typedef MyTestParam {
    MyTestParam_data data;
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
    Actuator_Context__work_param work_param;
    Actuator_Context__result_param result_param;
}

typedef Controller_Context {
    Controller_Context__state state;
    Controller_Context__init_done init_done;
    Controller_Context__sender sender;
    Controller_Context__offspring offspring;
    Controller_Context__test_param test_param;
    Controller_Context__work_param work_param;
    Controller_Context__result_param result_param;
    Controller_Context__expected expected;
    Controller_Context__error error;
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
inline Actuator_Context__work_param__snare_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__work_param__snare_range_check(dst);
}
inline Actuator_Context__work_param__snare_range_check(Actuator_Context__work_param__snare_vc)
{
    assert(((Actuator_Context__work_param__snare_vc >= 0) && (Actuator_Context__work_param__snare_vc <= 127)));
}
inline Actuator_Context__work_param__kick_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__work_param__kick_range_check(dst);
}
inline Actuator_Context__work_param__kick_range_check(Actuator_Context__work_param__kick_vc)
{
    assert(((Actuator_Context__work_param__kick_vc >= 0) && (Actuator_Context__work_param__kick_vc <= 127)));
}
inline Actuator_Context__work_param__ride_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__work_param__ride_range_check(dst);
}
inline Actuator_Context__work_param__ride_range_check(Actuator_Context__work_param__ride_vc)
{
    assert(((Actuator_Context__work_param__ride_vc >= 0) && (Actuator_Context__work_param__ride_vc <= 127)));
}
inline Actuator_Context__work_param_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context__work_param_snare_PRESENT);
        Actuator_Context__work_param__snare_assign_value(dst.data.snare, src.data.snare);
    ::  (dst.selection == Actuator_Context__work_param_kick_PRESENT);
        Actuator_Context__work_param__kick_assign_value(dst.data.kick, src.data.kick);
    ::  (dst.selection == Actuator_Context__work_param_ride_PRESENT);
        Actuator_Context__work_param__ride_assign_value(dst.data.ride, src.data.ride);
    ::  else;
        skip;
    fi;
}
inline Actuator_context__work_param_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context__result_param_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__result_param_range_check(dst);
}
inline Actuator_Context__result_param_range_check(Actuator_Context__result_param_vc)
{
    assert(((Actuator_Context__result_param_vc >= 0) && (Actuator_Context__result_param_vc <= 10000)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context__state_assign_value(dst.state, src.state);
    Actuator_Context__init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context__sender_assign_value(dst.sender, src.sender);
    Actuator_Context__offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context__work_param_assign_value(dst.work_param, src.work_param);
    Actuator_Context__result_param_assign_value(dst.result_param, src.result_param);
}
inline Actuator_Mytestparam_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Mytestparam_Selection_range_check(dst);
}
inline Actuator_Mytestparam_Selection_range_check(Actuator_Mytestparam_Selection_vc)
{
    assert((((Actuator_Mytestparam_Selection_vc == Actuator_Mytestparam_Selection_snare_present) || (Actuator_Mytestparam_Selection_vc == Actuator_Mytestparam_Selection_kick_present)) || (Actuator_Mytestparam_Selection_vc == Actuator_Mytestparam_Selection_ride_present)));
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
    assert(((Controller_States_vc == Controller_States_operation) || (Controller_States_vc == Controller_States_wait)));
}
inline Controller_Context__state_assign_value(dst, src)
{
    dst = src;
    Controller_Context__state_range_check(dst);
}
inline Controller_Context__state_range_check(Controller_Context__state_vc)
{
    assert(((Controller_Context__state_vc == Controller_Context__state_operation) || (Controller_Context__state_vc == Controller_Context__state_wait)));
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
    assert(((Controller_Context__test_param_vc >= 0) && (Controller_Context__test_param_vc <= 3)));
}
inline Controller_Context__work_param__snare_assign_value(dst, src)
{
    dst = src;
    Controller_Context__work_param__snare_range_check(dst);
}
inline Controller_Context__work_param__snare_range_check(Controller_Context__work_param__snare_vc)
{
    assert(((Controller_Context__work_param__snare_vc >= 0) && (Controller_Context__work_param__snare_vc <= 127)));
}
inline Controller_Context__work_param__kick_assign_value(dst, src)
{
    dst = src;
    Controller_Context__work_param__kick_range_check(dst);
}
inline Controller_Context__work_param__kick_range_check(Controller_Context__work_param__kick_vc)
{
    assert(((Controller_Context__work_param__kick_vc >= 0) && (Controller_Context__work_param__kick_vc <= 127)));
}
inline Controller_Context__work_param__ride_assign_value(dst, src)
{
    dst = src;
    Controller_Context__work_param__ride_range_check(dst);
}
inline Controller_Context__work_param__ride_range_check(Controller_Context__work_param__ride_vc)
{
    assert(((Controller_Context__work_param__ride_vc >= 0) && (Controller_Context__work_param__ride_vc <= 127)));
}
inline Controller_Context__work_param_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Controller_Context__work_param_snare_PRESENT);
        Controller_Context__work_param__snare_assign_value(dst.data.snare, src.data.snare);
    ::  (dst.selection == Controller_Context__work_param_kick_PRESENT);
        Controller_Context__work_param__kick_assign_value(dst.data.kick, src.data.kick);
    ::  (dst.selection == Controller_Context__work_param_ride_PRESENT);
        Controller_Context__work_param__ride_assign_value(dst.data.ride, src.data.ride);
    ::  else;
        skip;
    fi;
}
inline Controller_context__work_param_selection_assign_value(dst, src)
{
    dst = src;
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
    Controller_Context__work_param_assign_value(dst.work_param, src.work_param);
    Controller_Context__result_param_assign_value(dst.result_param, src.result_param);
    Controller_Context__expected_assign_value(dst.expected, src.expected);
    Controller_Context__error_assign_value(dst.error, src.error);
}
inline Controller_Mytestparam_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Mytestparam_Selection_range_check(dst);
}
inline Controller_Mytestparam_Selection_range_check(Controller_Mytestparam_Selection_vc)
{
    assert((((Controller_Mytestparam_Selection_vc == Controller_Mytestparam_Selection_snare_present) || (Controller_Mytestparam_Selection_vc == Controller_Mytestparam_Selection_kick_present)) || (Controller_Mytestparam_Selection_vc == Controller_Mytestparam_Selection_ride_present)));
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
    assert(((MyTestInteger_vc >= 0) && (MyTestInteger_vc <= 3)));
}
inline MyTestParam__snare_assign_value(dst, src)
{
    dst = src;
    MyTestParam__snare_range_check(dst);
}
inline MyTestParam__snare_range_check(MyTestParam__snare_vc)
{
    assert(((MyTestParam__snare_vc >= 0) && (MyTestParam__snare_vc <= 127)));
}
inline MyTestParam__kick_assign_value(dst, src)
{
    dst = src;
    MyTestParam__kick_range_check(dst);
}
inline MyTestParam__kick_range_check(MyTestParam__kick_vc)
{
    assert(((MyTestParam__kick_vc >= 0) && (MyTestParam__kick_vc <= 127)));
}
inline MyTestParam__ride_assign_value(dst, src)
{
    dst = src;
    MyTestParam__ride_range_check(dst);
}
inline MyTestParam__ride_range_check(MyTestParam__ride_vc)
{
    assert(((MyTestParam__ride_vc >= 0) && (MyTestParam__ride_vc <= 127)));
}
inline MyTestParam_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyTestParam_snare_PRESENT);
        MyTestParam__snare_assign_value(dst.data.snare, src.data.snare);
    ::  (dst.selection == MyTestParam_kick_PRESENT);
        MyTestParam__kick_assign_value(dst.data.kick, src.data.kick);
    ::  (dst.selection == MyTestParam_ride_PRESENT);
        MyTestParam__ride_assign_value(dst.data.ride, src.data.ride);
    ::  else;
        skip;
    fi;
}
inline Mytestparam_selection_assign_value(dst, src)
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
    assert(((Environ_test_p1_vc >= 0) && (Environ_test_p1_vc <= 3)));
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
