#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_myparam int
#define Actuator_Context_myseq_camelCase int
#define Actuator_Context_myseq_lowercase int
#define Actuator_Context_mysecondseq_camelCase int
#define Actuator_Context_mysecondseq_lowercase int
#define Actuator_Context_mychoice_camelCaseAlternative int
#define Actuator_Context_mychoice_lowercase_alternative int
#define Actuator_Context_mysecondchoice_camelCaseAlternative int
#define Actuator_Context_mysecondchoice_lowercase_alternative int
#define Actuator_Mychoice_Selection int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_param int
#define Controller_Mychoice_Selection int
#define MyInteger int
#define MySeq_camelCase int
#define MySeq_lowercase int
#define MyChoice_camelCaseAlternative int
#define MyChoice_lowercase_alternative int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID_Range int
#define PID int
#define TimerData_timer_enabled bool
#define TimerData_interval int
#define Actuator_States_wait 0
#define Actuator_Context_state_wait 0
#define Actuator_Context_sender_actuator 0
#define Actuator_Context_sender_controller 1
#define Actuator_Context_sender_env 2
#define Actuator_Context_offspring_actuator 0
#define Actuator_Context_offspring_controller 1
#define Actuator_Context_offspring_env 2
#define Actuator_Context_mychoice_NONE 0
#define Actuator_Context_mychoice_camelCaseAlternative_PRESENT 1
#define Actuator_context_mychoice_selection_camelCaseAlternative_PRESENT 1
#define Actuator_Context_mychoice_lowercase_alternative_PRESENT 2
#define Actuator_context_mychoice_selection_lowercase_alternative_PRESENT 2
#define Actuator_Context_mysecondchoice_NONE 0
#define Actuator_Context_mysecondchoice_camelCaseAlternative_PRESENT 1
#define Actuator_context_mysecondchoice_selection_camelCaseAlternative_PRESENT 1
#define Actuator_Context_mysecondchoice_lowercase_alternative_PRESENT 2
#define Actuator_context_mysecondchoice_selection_lowercase_alternative_PRESENT 2
#define Actuator_Mychoice_Selection_camelCaseAlternative_present 1
#define Actuator_Mychoice_Selection_lowercase_alternative_present 2
#define Controller_States_wait 0
#define Controller_States_reached 1
#define Controller_Context_state_wait 0
#define Controller_Context_state_reached 1
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Mychoice_Selection_camelCaseAlternative_present 1
#define Controller_Mychoice_Selection_lowercase_alternative_present 2
#define MyChoice_NONE 0
#define MyChoice_camelCaseAlternative_PRESENT 1
#define Mychoice_selection_camelCaseAlternative_PRESENT 1
#define MyChoice_lowercase_alternative_PRESENT 2
#define Mychoice_selection_lowercase_alternative_PRESENT 2
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context_mychoice_data {
    Actuator_Context_mychoice_camelCaseAlternative camelCaseAlternative;
    Actuator_Context_mychoice_lowercase_alternative lowercase_alternative;
}

typedef Actuator_Context_mysecondchoice_data {
    Actuator_Context_mysecondchoice_camelCaseAlternative camelCaseAlternative;
    Actuator_Context_mysecondchoice_lowercase_alternative lowercase_alternative;
}

typedef Actuator_Context_mysecondseq {
    Actuator_Context_mysecondseq_camelCase camelCase;
    Actuator_Context_mysecondseq_lowercase lowercase;
}

typedef Actuator_Context_myseq {
    Actuator_Context_myseq_camelCase camelCase;
    Actuator_Context_myseq_lowercase lowercase;
}

typedef AggregateTimerData_actuator {
    bit dummy;
}

typedef AggregateTimerData_controller {
    bit dummy;
}

typedef AggregateTimerData_dummy_entry {
    bit dummy;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_param param;
}

typedef MyChoice_data {
    MyChoice_camelCaseAlternative camelCaseAlternative;
    MyChoice_lowercase_alternative lowercase_alternative;
}

typedef MySeq {
    MySeq_camelCase camelCase;
    MySeq_lowercase lowercase;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef Actuator_Context_mychoice {
    Actuator_Context_mychoice_data data;
    int selection;
}

typedef Actuator_Context_mysecondchoice {
    Actuator_Context_mysecondchoice_data data;
    int selection;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef MyChoice {
    MyChoice_data data;
    int selection;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_myparam myparam;
    Actuator_Context_myseq myseq;
    Actuator_Context_mysecondseq mysecondseq;
    Actuator_Context_mychoice mychoice;
    Actuator_Context_mysecondchoice mysecondchoice;
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
inline Actuator_Context_state_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_state_range_check(dst);
}
inline Actuator_Context_state_range_check(Actuator_Context_state_vc)
{
    assert((Actuator_Context_state_vc == Actuator_Context_state_wait));
}
inline Actuator_Context_init_done_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_init_done_range_check(dst);
}
inline Actuator_Context_init_done_range_check(Actuator_Context_init_done_vc)
{
    assert(true);
}
inline Actuator_Context_sender_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_sender_range_check(dst);
}
inline Actuator_Context_sender_range_check(Actuator_Context_sender_vc)
{
    assert((((Actuator_Context_sender_vc == Actuator_Context_sender_actuator) || (Actuator_Context_sender_vc == Actuator_Context_sender_controller)) || (Actuator_Context_sender_vc == Actuator_Context_sender_env)));
}
inline Actuator_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_offspring_range_check(dst);
}
inline Actuator_Context_offspring_range_check(Actuator_Context_offspring_vc)
{
    assert((((Actuator_Context_offspring_vc == Actuator_Context_offspring_actuator) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_controller)) || (Actuator_Context_offspring_vc == Actuator_Context_offspring_env)));
}
inline Actuator_Context_myparam_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_myparam_range_check(dst);
}
inline Actuator_Context_myparam_range_check(Actuator_Context_myparam_vc)
{
    assert(((Actuator_Context_myparam_vc >= 0) && (Actuator_Context_myparam_vc <= 10000)));
}
inline Actuator_Context_myseq_camelCase_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_myseq_camelCase_range_check(dst);
}
inline Actuator_Context_myseq_camelCase_range_check(Actuator_Context_myseq_camelCase_vc)
{
    assert(((Actuator_Context_myseq_camelCase_vc >= 0) && (Actuator_Context_myseq_camelCase_vc <= 10000)));
}
inline Actuator_Context_myseq_lowercase_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_myseq_lowercase_range_check(dst);
}
inline Actuator_Context_myseq_lowercase_range_check(Actuator_Context_myseq_lowercase_vc)
{
    assert(((Actuator_Context_myseq_lowercase_vc >= 0) && (Actuator_Context_myseq_lowercase_vc <= 10000)));
}
inline Actuator_Context_myseq_assign_value(dst, src)
{
    Actuator_Context_myseq_camelCase_assign_value(dst.camelCase, src.camelCase);
    Actuator_Context_myseq_lowercase_assign_value(dst.lowercase, src.lowercase);
}
inline Actuator_Context_mysecondseq_camelCase_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_mysecondseq_camelCase_range_check(dst);
}
inline Actuator_Context_mysecondseq_camelCase_range_check(Actuator_Context_mysecondseq_camelCase_vc)
{
    assert(((Actuator_Context_mysecondseq_camelCase_vc >= 0) && (Actuator_Context_mysecondseq_camelCase_vc <= 10000)));
}
inline Actuator_Context_mysecondseq_lowercase_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_mysecondseq_lowercase_range_check(dst);
}
inline Actuator_Context_mysecondseq_lowercase_range_check(Actuator_Context_mysecondseq_lowercase_vc)
{
    assert(((Actuator_Context_mysecondseq_lowercase_vc >= 0) && (Actuator_Context_mysecondseq_lowercase_vc <= 10000)));
}
inline Actuator_Context_mysecondseq_assign_value(dst, src)
{
    Actuator_Context_mysecondseq_camelCase_assign_value(dst.camelCase, src.camelCase);
    Actuator_Context_mysecondseq_lowercase_assign_value(dst.lowercase, src.lowercase);
}
inline Actuator_Context_mychoice_camelCaseAlternative_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_mychoice_camelCaseAlternative_range_check(dst);
}
inline Actuator_Context_mychoice_camelCaseAlternative_range_check(Actuator_Context_mychoice_camelCaseAlternative_vc)
{
    assert(((Actuator_Context_mychoice_camelCaseAlternative_vc >= 0) && (Actuator_Context_mychoice_camelCaseAlternative_vc <= 10000)));
}
inline Actuator_Context_mychoice_lowercase_alternative_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_mychoice_lowercase_alternative_range_check(dst);
}
inline Actuator_Context_mychoice_lowercase_alternative_range_check(Actuator_Context_mychoice_lowercase_alternative_vc)
{
    assert(((Actuator_Context_mychoice_lowercase_alternative_vc >= 0) && (Actuator_Context_mychoice_lowercase_alternative_vc <= 10000)));
}
inline Actuator_Context_mychoice_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context_mychoice_camelCaseAlternative_PRESENT);
        Actuator_Context_mychoice_camelCaseAlternative_assign_value(dst.data.camelCaseAlternative, src.data.camelCaseAlternative);
    ::  (dst.selection == Actuator_Context_mychoice_lowercase_alternative_PRESENT);
        Actuator_Context_mychoice_lowercase_alternative_assign_value(dst.data.lowercase_alternative, src.data.lowercase_alternative);
    ::  else;
        skip;
    fi;
}
inline Actuator_context_mychoice_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_mysecondchoice_camelCaseAlternative_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_mysecondchoice_camelCaseAlternative_range_check(dst);
}
inline Actuator_Context_mysecondchoice_camelCaseAlternative_range_check(Actuator_Context_mysecondchoice_camelCaseAlternative_vc)
{
    assert(((Actuator_Context_mysecondchoice_camelCaseAlternative_vc >= 0) && (Actuator_Context_mysecondchoice_camelCaseAlternative_vc <= 10000)));
}
inline Actuator_Context_mysecondchoice_lowercase_alternative_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_mysecondchoice_lowercase_alternative_range_check(dst);
}
inline Actuator_Context_mysecondchoice_lowercase_alternative_range_check(Actuator_Context_mysecondchoice_lowercase_alternative_vc)
{
    assert(((Actuator_Context_mysecondchoice_lowercase_alternative_vc >= 0) && (Actuator_Context_mysecondchoice_lowercase_alternative_vc <= 10000)));
}
inline Actuator_Context_mysecondchoice_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context_mysecondchoice_camelCaseAlternative_PRESENT);
        Actuator_Context_mysecondchoice_camelCaseAlternative_assign_value(dst.data.camelCaseAlternative, src.data.camelCaseAlternative);
    ::  (dst.selection == Actuator_Context_mysecondchoice_lowercase_alternative_PRESENT);
        Actuator_Context_mysecondchoice_lowercase_alternative_assign_value(dst.data.lowercase_alternative, src.data.lowercase_alternative);
    ::  else;
        skip;
    fi;
}
inline Actuator_context_mysecondchoice_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_myparam_assign_value(dst.myparam, src.myparam);
    Actuator_Context_myseq_assign_value(dst.myseq, src.myseq);
    Actuator_Context_mysecondseq_assign_value(dst.mysecondseq, src.mysecondseq);
    Actuator_Context_mychoice_assign_value(dst.mychoice, src.mychoice);
    Actuator_Context_mysecondchoice_assign_value(dst.mysecondchoice, src.mysecondchoice);
}
inline Actuator_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Mychoice_Selection_range_check(dst);
}
inline Actuator_Mychoice_Selection_range_check(Actuator_Mychoice_Selection_vc)
{
    assert(((Actuator_Mychoice_Selection_vc == Actuator_Mychoice_Selection_camelCaseAlternative_present) || (Actuator_Mychoice_Selection_vc == Actuator_Mychoice_Selection_lowercase_alternative_present)));
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert(((Controller_States_vc == Controller_States_wait) || (Controller_States_vc == Controller_States_reached)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert(((Controller_Context_state_vc == Controller_Context_state_wait) || (Controller_Context_state_vc == Controller_Context_state_reached)));
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
    Controller_Context_init_done_range_check(dst);
}
inline Controller_Context_init_done_range_check(Controller_Context_init_done_vc)
{
    assert(true);
}
inline Controller_Context_sender_assign_value(dst, src)
{
    dst = src;
    Controller_Context_sender_range_check(dst);
}
inline Controller_Context_sender_range_check(Controller_Context_sender_vc)
{
    assert((((Controller_Context_sender_vc == Controller_Context_sender_actuator) || (Controller_Context_sender_vc == Controller_Context_sender_controller)) || (Controller_Context_sender_vc == Controller_Context_sender_env)));
}
inline Controller_Context_offspring_assign_value(dst, src)
{
    dst = src;
    Controller_Context_offspring_range_check(dst);
}
inline Controller_Context_offspring_range_check(Controller_Context_offspring_vc)
{
    assert((((Controller_Context_offspring_vc == Controller_Context_offspring_actuator) || (Controller_Context_offspring_vc == Controller_Context_offspring_controller)) || (Controller_Context_offspring_vc == Controller_Context_offspring_env)));
}
inline Controller_Context_param_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_range_check(dst);
}
inline Controller_Context_param_range_check(Controller_Context_param_vc)
{
    assert(((Controller_Context_param_vc >= 0) && (Controller_Context_param_vc <= 10000)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_param_assign_value(dst.param, src.param);
}
inline Controller_Mychoice_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Mychoice_Selection_range_check(dst);
}
inline Controller_Mychoice_Selection_range_check(Controller_Mychoice_Selection_vc)
{
    assert(((Controller_Mychoice_Selection_vc == Controller_Mychoice_Selection_camelCaseAlternative_present) || (Controller_Mychoice_Selection_vc == Controller_Mychoice_Selection_lowercase_alternative_present)));
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
inline MySeq_camelCase_assign_value(dst, src)
{
    dst = src;
    MySeq_camelCase_range_check(dst);
}
inline MySeq_camelCase_range_check(MySeq_camelCase_vc)
{
    assert(((MySeq_camelCase_vc >= 0) && (MySeq_camelCase_vc <= 10000)));
}
inline MySeq_lowercase_assign_value(dst, src)
{
    dst = src;
    MySeq_lowercase_range_check(dst);
}
inline MySeq_lowercase_range_check(MySeq_lowercase_vc)
{
    assert(((MySeq_lowercase_vc >= 0) && (MySeq_lowercase_vc <= 10000)));
}
inline MySeq_assign_value(dst, src)
{
    MySeq_camelCase_assign_value(dst.camelCase, src.camelCase);
    MySeq_lowercase_assign_value(dst.lowercase, src.lowercase);
}
inline MyChoice_camelCaseAlternative_assign_value(dst, src)
{
    dst = src;
    MyChoice_camelCaseAlternative_range_check(dst);
}
inline MyChoice_camelCaseAlternative_range_check(MyChoice_camelCaseAlternative_vc)
{
    assert(((MyChoice_camelCaseAlternative_vc >= 0) && (MyChoice_camelCaseAlternative_vc <= 10000)));
}
inline MyChoice_lowercase_alternative_assign_value(dst, src)
{
    dst = src;
    MyChoice_lowercase_alternative_range_check(dst);
}
inline MyChoice_lowercase_alternative_range_check(MyChoice_lowercase_alternative_vc)
{
    assert(((MyChoice_lowercase_alternative_vc >= 0) && (MyChoice_lowercase_alternative_vc <= 10000)));
}
inline MyChoice_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyChoice_camelCaseAlternative_PRESENT);
        MyChoice_camelCaseAlternative_assign_value(dst.data.camelCaseAlternative, src.data.camelCaseAlternative);
    ::  (dst.selection == MyChoice_lowercase_alternative_PRESENT);
        MyChoice_lowercase_alternative_assign_value(dst.data.lowercase_alternative, src.data.lowercase_alternative);
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
    assert(((T_Int32_vc >= -2147483648) && (T_Int32_vc <= 2147483647)));
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
inline PID_Range_assign_value(dst, src)
{
    dst = src;
    PID_Range_range_check(dst);
}
inline PID_Range_range_check(PID_Range_vc)
{
    assert(((PID_Range_vc >= 0) && (PID_Range_vc <= 2)));
}
inline PID_assign_value(dst, src)
{
    dst = src;
    PID_range_check(dst);
}
inline PID_range_check(PID_vc)
{
    assert((((PID_vc == PID_actuator) || (PID_vc == PID_controller)) || (PID_vc == PID_env)));
}
inline TimerData_timer_enabled_assign_value(dst, src)
{
    dst = src;
    TimerData_timer_enabled_range_check(dst);
}
inline TimerData_timer_enabled_range_check(TimerData_timer_enabled_vc)
{
    assert(true);
}
inline TimerData_interval_assign_value(dst, src)
{
    dst = src;
    TimerData_interval_range_check(dst);
}
inline TimerData_interval_range_check(TimerData_interval_vc)
{
    assert(((TimerData_interval_vc >= 0) && (TimerData_interval_vc <= 50000)));
}
inline TimerData_assign_value(dst, src)
{
    TimerData_timer_enabled_assign_value(dst.timer_enabled, src.timer_enabled);
    TimerData_interval_assign_value(dst.interval, src.interval);
}
inline AggregateTimerData_actuator_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_controller_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_dummy_entry_assign_value(dst, src)
{
    skip;
}
inline AggregateTimerData_assign_value(dst, src)
{
    AggregateTimerData_actuator_assign_value(dst.actuator, src.actuator);
    AggregateTimerData_controller_assign_value(dst.controller, src.controller);
    AggregateTimerData_dummy_entry_assign_value(dst.dummy_entry, src.dummy_entry);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
