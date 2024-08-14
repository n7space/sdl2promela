#define Actuator_States int
#define Actuator_Context__state int
#define Actuator_Context__init_done bool
#define Actuator_Context__sender int
#define Actuator_Context__offspring int
#define Actuator_Mychoicedatatype_Selection int
#define Actuator_T_Runtime_Error_Selection int
#define Controller_States int
#define Controller_Context__state int
#define Controller_Context__init_done bool
#define Controller_Context__sender int
#define Controller_Context__offspring int
#define Controller_Context__param_integer int
#define Controller_Context__param_sequence__x int
#define Controller_Context__param_sequence__y__elem int
#define Controller_Context__param_choice__first int
#define Controller_Context__param_choice__second int
#define Controller_Context__param_array__elem int
#define Controller_Context__param_optional__a int
#define Controller_Context__param_optional__b int
#define Controller_Context__param_optional__c int
#define Controller_Context__reached int
#define Controller_Mychoicedatatype_Selection int
#define Controller_T_Runtime_Error_Selection int
#define Timer_manager_States int
#define Timer_manager_Context__state int
#define MyInteger int
#define MySequenceDataType__x int
#define MySequenceDataType__y__elem int
#define MyChoiceDataType__first int
#define MyChoiceDataType__second int
#define MyArrayDataType__elem int
#define MySequenceWithOptionalsDataType__a int
#define MySequenceWithOptionalsDataType__b int
#define MySequenceWithOptionalsDataType__c int
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
#define Actuator_Mychoicedatatype_Selection_first_present 1
#define Actuator_Mychoicedatatype_Selection_second_present 2
#define Actuator_T_Runtime_Error_Selection_noerror_present 1
#define Actuator_T_Runtime_Error_Selection_encodeerror_present 2
#define Actuator_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_afterarray 0
#define Controller_States_afterchoice 1
#define Controller_States_afteroptional 2
#define Controller_States_afterinteger 3
#define Controller_States_aftersequence 4
#define Controller_Context__state_afterarray 0
#define Controller_Context__state_afterchoice 1
#define Controller_Context__state_afteroptional 2
#define Controller_Context__state_afterinteger 3
#define Controller_Context__state_aftersequence 4
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
#define Controller_Context__param_choice_NONE 0
#define Controller_Context__param_choice_first_PRESENT 1
#define Controller_context__param_choice_selection_first_PRESENT 1
#define Controller_Context__param_choice_second_PRESENT 2
#define Controller_context__param_choice_selection_second_PRESENT 2
#define Controller_Mychoicedatatype_Selection_first_present 1
#define Controller_Mychoicedatatype_Selection_second_present 2
#define Controller_T_Runtime_Error_Selection_noerror_present 1
#define Controller_T_Runtime_Error_Selection_encodeerror_present 2
#define Controller_T_Runtime_Error_Selection_decodeerror_present 3
#define Timer_manager_States_wait 0
#define Timer_manager_Context__state_wait 0
#define MyChoiceDataType_NONE 0
#define MyChoiceDataType_first_PRESENT 1
#define Mychoicedatatype_selection_first_PRESENT 1
#define MyChoiceDataType_second_PRESENT 2
#define Mychoicedatatype_selection_second_PRESENT 2
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
    Controller_Context__param_array__elem data[3];
    int length;
}

typedef Controller_Context__param_choice_data {
    Controller_Context__param_choice__first first;
    Controller_Context__param_choice__second second;
}

typedef Controller_Context__param_optional_exist {
    bool b;
    bool c;
}

typedef Controller_Context__param_sequence__y {
    Controller_Context__param_sequence__y__elem data[4];
    int length;
}

typedef MyArrayDataType {
    MyArrayDataType__elem data[3];
    int length;
}

typedef MyChoiceDataType_data {
    MyChoiceDataType__first first;
    MyChoiceDataType__second second;
}

typedef MySequenceDataType__y {
    MySequenceDataType__y__elem data[4];
    int length;
}

typedef MySequenceWithOptionalsDataType_exist {
    bool b;
    bool c;
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

typedef Controller_Context__param_choice {
    Controller_Context__param_choice_data data;
    int selection;
}

typedef Controller_Context__param_optional {
    Controller_Context__param_optional__a a;
    Controller_Context__param_optional__b b;
    Controller_Context__param_optional__c c;
    Controller_Context__param_optional_exist exist;
}

typedef Controller_Context__param_sequence {
    Controller_Context__param_sequence__x x;
    Controller_Context__param_sequence__y y;
}

typedef MyChoiceDataType {
    MyChoiceDataType_data data;
    int selection;
}

typedef MySequenceDataType {
    MySequenceDataType__x x;
    MySequenceDataType__y y;
}

typedef MySequenceWithOptionalsDataType {
    MySequenceWithOptionalsDataType__a a;
    MySequenceWithOptionalsDataType__b b;
    MySequenceWithOptionalsDataType__c c;
    MySequenceWithOptionalsDataType_exist exist;
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
    Controller_Context__param_integer param_integer;
    Controller_Context__param_sequence param_sequence;
    Controller_Context__param_choice param_choice;
    Controller_Context__param_array param_array;
    Controller_Context__param_optional param_optional;
    Controller_Context__reached reached;
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
inline Actuator_Mychoicedatatype_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Mychoicedatatype_Selection_range_check(dst);
}
inline Actuator_Mychoicedatatype_Selection_range_check(Actuator_Mychoicedatatype_Selection_vc)
{
    assert(((Actuator_Mychoicedatatype_Selection_vc == Actuator_Mychoicedatatype_Selection_first_present) || (Actuator_Mychoicedatatype_Selection_vc == Actuator_Mychoicedatatype_Selection_second_present)));
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
    assert((((((Controller_States_vc == Controller_States_afterarray) || (Controller_States_vc == Controller_States_afterchoice)) || (Controller_States_vc == Controller_States_afteroptional)) || (Controller_States_vc == Controller_States_afterinteger)) || (Controller_States_vc == Controller_States_aftersequence)));
}
inline Controller_Context__state_assign_value(dst, src)
{
    dst = src;
    Controller_Context__state_range_check(dst);
}
inline Controller_Context__state_range_check(Controller_Context__state_vc)
{
    assert((((((Controller_Context__state_vc == Controller_Context__state_afterarray) || (Controller_Context__state_vc == Controller_Context__state_afterchoice)) || (Controller_Context__state_vc == Controller_Context__state_afteroptional)) || (Controller_Context__state_vc == Controller_Context__state_afterinteger)) || (Controller_Context__state_vc == Controller_Context__state_aftersequence)));
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
inline Controller_Context__param_integer_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_integer_range_check(dst);
}
inline Controller_Context__param_integer_range_check(Controller_Context__param_integer_vc)
{
    assert(((Controller_Context__param_integer_vc >= 0) && (Controller_Context__param_integer_vc <= 10000)));
}
inline Controller_Context__param_sequence__x_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_sequence__x_range_check(dst);
}
inline Controller_Context__param_sequence__x_range_check(Controller_Context__param_sequence__x_vc)
{
    assert(((Controller_Context__param_sequence__x_vc >= 0) && (Controller_Context__param_sequence__x_vc <= 10000)));
}
inline Controller_Context__param_sequence__y__elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_sequence__y__elem_range_check(dst);
}
inline Controller_Context__param_sequence__y__elem_range_check(Controller_Context__param_sequence__y__elem_vc)
{
    assert(((Controller_Context__param_sequence__y__elem_vc >= 0) && (Controller_Context__param_sequence__y__elem_vc <= 10000)));
}
inline Controller_Context__param_sequence__y__elem_init_value(dst)
{
    Controller_Context__param_sequence__y__elem_assign_value(dst, 0);
}
inline Controller_Context__param_sequence__y_assign_value(dst, src)
{
    int i_2;
    for(i_2 : 0 .. (src.length - 1))
    {
        Controller_Context__param_sequence__y__elem_assign_value(dst.data[i_2], src.data[i_2]);
    }
    for(i_2 : src.length .. 3)
    {
        Controller_Context__param_sequence__y__elem_init_value(dst.data[i_2]);
    }
    dst.length = src.length;
}
inline Controller_Context__param_sequence__y_size_check(Controller_Context__param_sequence__y_sc)
{
    assert(((Controller_Context__param_sequence__y_sc >= 0) && (Controller_Context__param_sequence__y_sc <= 4)));
}
inline Controller_Context__param_sequence_assign_value(dst, src)
{
    Controller_Context__param_sequence__x_assign_value(dst.x, src.x);
    Controller_Context__param_sequence__y_assign_value(dst.y, src.y);
}
inline Controller_Context__param_choice__first_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_choice__first_range_check(dst);
}
inline Controller_Context__param_choice__first_range_check(Controller_Context__param_choice__first_vc)
{
    assert(((Controller_Context__param_choice__first_vc >= 0) && (Controller_Context__param_choice__first_vc <= 10000)));
}
inline Controller_Context__param_choice__second_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_choice__second_range_check(dst);
}
inline Controller_Context__param_choice__second_range_check(Controller_Context__param_choice__second_vc)
{
    assert(((Controller_Context__param_choice__second_vc >= 0) && (Controller_Context__param_choice__second_vc <= 10000)));
}
inline Controller_Context__param_choice_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Controller_Context__param_choice_first_PRESENT);
        Controller_Context__param_choice__first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == Controller_Context__param_choice_second_PRESENT);
        Controller_Context__param_choice__second_assign_value(dst.data.second, src.data.second);
    ::  else;
        skip;
    fi;
}
inline Controller_context__param_choice_selection_assign_value(dst, src)
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
    for(i_1 : 0 .. (src.length - 1))
    {
        Controller_Context__param_array__elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 2)
    {
        Controller_Context__param_array__elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline Controller_Context__param_array_size_check(Controller_Context__param_array_sc)
{
    assert(((Controller_Context__param_array_sc >= 1) && (Controller_Context__param_array_sc <= 3)));
}
inline Controller_Context__param_optional__a_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_optional__a_range_check(dst);
}
inline Controller_Context__param_optional__a_range_check(Controller_Context__param_optional__a_vc)
{
    assert(((Controller_Context__param_optional__a_vc >= 0) && (Controller_Context__param_optional__a_vc <= 10000)));
}
inline Controller_Context__param_optional__b_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_optional__b_range_check(dst);
}
inline Controller_Context__param_optional__b_range_check(Controller_Context__param_optional__b_vc)
{
    assert(((Controller_Context__param_optional__b_vc >= 0) && (Controller_Context__param_optional__b_vc <= 10000)));
}
inline Controller_Context__param_optional__c_assign_value(dst, src)
{
    dst = src;
    Controller_Context__param_optional__c_range_check(dst);
}
inline Controller_Context__param_optional__c_range_check(Controller_Context__param_optional__c_vc)
{
    assert(((Controller_Context__param_optional__c_vc >= 0) && (Controller_Context__param_optional__c_vc <= 10000)));
}
inline Controller_Context__param_optional_assign_value(dst, src)
{
    Controller_Context__param_optional__a_assign_value(dst.a, src.a);
    Controller_Context__param_optional__b_assign_value(dst.b, src.b);
    Controller_Context__param_optional__c_assign_value(dst.c, src.c);
    dst.exist.b = src.exist.b;
    dst.exist.c = src.exist.c;
}
inline Controller_Context__reached_assign_value(dst, src)
{
    dst = src;
    Controller_Context__reached_range_check(dst);
}
inline Controller_Context__reached_range_check(Controller_Context__reached_vc)
{
    assert(((Controller_Context__reached_vc >= 0) && (Controller_Context__reached_vc <= 10000)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context__state_assign_value(dst.state, src.state);
    Controller_Context__init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context__sender_assign_value(dst.sender, src.sender);
    Controller_Context__offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context__param_integer_assign_value(dst.param_integer, src.param_integer);
    Controller_Context__param_sequence_assign_value(dst.param_sequence, src.param_sequence);
    Controller_Context__param_choice_assign_value(dst.param_choice, src.param_choice);
    Controller_Context__param_array_assign_value(dst.param_array, src.param_array);
    Controller_Context__param_optional_assign_value(dst.param_optional, src.param_optional);
    Controller_Context__reached_assign_value(dst.reached, src.reached);
}
inline Controller_Mychoicedatatype_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Mychoicedatatype_Selection_range_check(dst);
}
inline Controller_Mychoicedatatype_Selection_range_check(Controller_Mychoicedatatype_Selection_vc)
{
    assert(((Controller_Mychoicedatatype_Selection_vc == Controller_Mychoicedatatype_Selection_first_present) || (Controller_Mychoicedatatype_Selection_vc == Controller_Mychoicedatatype_Selection_second_present)));
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
inline MySequenceDataType__x_assign_value(dst, src)
{
    dst = src;
    MySequenceDataType__x_range_check(dst);
}
inline MySequenceDataType__x_range_check(MySequenceDataType__x_vc)
{
    assert(((MySequenceDataType__x_vc >= 0) && (MySequenceDataType__x_vc <= 10000)));
}
inline MySequenceDataType__y__elem_assign_value(dst, src)
{
    dst = src;
    MySequenceDataType__y__elem_range_check(dst);
}
inline MySequenceDataType__y__elem_range_check(MySequenceDataType__y__elem_vc)
{
    assert(((MySequenceDataType__y__elem_vc >= 0) && (MySequenceDataType__y__elem_vc <= 10000)));
}
inline MySequenceDataType__y__elem_init_value(dst)
{
    MySequenceDataType__y__elem_assign_value(dst, 0);
}
inline MySequenceDataType__y_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        MySequenceDataType__y__elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 3)
    {
        MySequenceDataType__y__elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline MySequenceDataType__y_size_check(MySequenceDataType__y_sc)
{
    assert(((MySequenceDataType__y_sc >= 0) && (MySequenceDataType__y_sc <= 4)));
}
inline MySequenceDataType_assign_value(dst, src)
{
    MySequenceDataType__x_assign_value(dst.x, src.x);
    MySequenceDataType__y_assign_value(dst.y, src.y);
}
inline MyChoiceDataType__first_assign_value(dst, src)
{
    dst = src;
    MyChoiceDataType__first_range_check(dst);
}
inline MyChoiceDataType__first_range_check(MyChoiceDataType__first_vc)
{
    assert(((MyChoiceDataType__first_vc >= 0) && (MyChoiceDataType__first_vc <= 10000)));
}
inline MyChoiceDataType__second_assign_value(dst, src)
{
    dst = src;
    MyChoiceDataType__second_range_check(dst);
}
inline MyChoiceDataType__second_range_check(MyChoiceDataType__second_vc)
{
    assert(((MyChoiceDataType__second_vc >= 0) && (MyChoiceDataType__second_vc <= 10000)));
}
inline MyChoiceDataType_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyChoiceDataType_first_PRESENT);
        MyChoiceDataType__first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == MyChoiceDataType_second_PRESENT);
        MyChoiceDataType__second_assign_value(dst.data.second, src.data.second);
    ::  else;
        skip;
    fi;
}
inline Mychoicedatatype_selection_assign_value(dst, src)
{
    dst = src;
}
inline MyArrayDataType__elem_assign_value(dst, src)
{
    dst = src;
    MyArrayDataType__elem_range_check(dst);
}
inline MyArrayDataType__elem_range_check(MyArrayDataType__elem_vc)
{
    assert(((MyArrayDataType__elem_vc >= 0) && (MyArrayDataType__elem_vc <= 10000)));
}
inline MyArrayDataType__elem_init_value(dst)
{
    MyArrayDataType__elem_assign_value(dst, 0);
}
inline MyArrayDataType_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. (src.length - 1))
    {
        MyArrayDataType__elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
    for(i_0 : src.length .. 2)
    {
        MyArrayDataType__elem_init_value(dst.data[i_0]);
    }
    dst.length = src.length;
}
inline MyArrayDataType_size_check(MyArrayDataType_sc)
{
    assert(((MyArrayDataType_sc >= 1) && (MyArrayDataType_sc <= 3)));
}
inline MySequenceWithOptionalsDataType__a_assign_value(dst, src)
{
    dst = src;
    MySequenceWithOptionalsDataType__a_range_check(dst);
}
inline MySequenceWithOptionalsDataType__a_range_check(MySequenceWithOptionalsDataType__a_vc)
{
    assert(((MySequenceWithOptionalsDataType__a_vc >= 0) && (MySequenceWithOptionalsDataType__a_vc <= 10000)));
}
inline MySequenceWithOptionalsDataType__b_assign_value(dst, src)
{
    dst = src;
    MySequenceWithOptionalsDataType__b_range_check(dst);
}
inline MySequenceWithOptionalsDataType__b_range_check(MySequenceWithOptionalsDataType__b_vc)
{
    assert(((MySequenceWithOptionalsDataType__b_vc >= 0) && (MySequenceWithOptionalsDataType__b_vc <= 10000)));
}
inline MySequenceWithOptionalsDataType__c_assign_value(dst, src)
{
    dst = src;
    MySequenceWithOptionalsDataType__c_range_check(dst);
}
inline MySequenceWithOptionalsDataType__c_range_check(MySequenceWithOptionalsDataType__c_vc)
{
    assert(((MySequenceWithOptionalsDataType__c_vc >= 0) && (MySequenceWithOptionalsDataType__c_vc <= 10000)));
}
inline MySequenceWithOptionalsDataType_assign_value(dst, src)
{
    MySequenceWithOptionalsDataType__a_assign_value(dst.a, src.a);
    MySequenceWithOptionalsDataType__b_assign_value(dst.b, src.b);
    MySequenceWithOptionalsDataType__c_assign_value(dst.c, src.c);
    dst.exist.b = src.exist.b;
    dst.exist.c = src.exist.c;
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
