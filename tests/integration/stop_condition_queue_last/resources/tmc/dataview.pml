#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Mychoicedatatype_Selection int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_param_integer int
#define Controller_Context_param_sequence_x int
#define Controller_Context_param_sequence_y_elem int
#define Controller_Context_param_choice_first int
#define Controller_Context_param_choice_second int
#define Controller_Context_param_array_elem int
#define Controller_Context_param_optional_a int
#define Controller_Context_param_optional_b int
#define Controller_Context_param_optional_c int
#define Controller_Context_reached int
#define Controller_Mychoicedatatype_Selection int
#define MyInteger int
#define MySequenceDataType_x int
#define MySequenceDataType_y_elem int
#define MyChoiceDataType_first int
#define MyChoiceDataType_second int
#define MyArrayDataType_elem int
#define MySequenceWithOptionalsDataType_a int
#define MySequenceWithOptionalsDataType_b int
#define MySequenceWithOptionalsDataType_c int
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
#define Actuator_Mychoicedatatype_Selection_first_present 1
#define Actuator_Mychoicedatatype_Selection_second_present 2
#define Controller_States_afterinteger 0
#define Controller_States_afteroptional 1
#define Controller_States_afterarray 2
#define Controller_States_aftersequence 3
#define Controller_States_afterchoice 4
#define Controller_Context_state_afterinteger 0
#define Controller_Context_state_afteroptional 1
#define Controller_Context_state_afterarray 2
#define Controller_Context_state_aftersequence 3
#define Controller_Context_state_afterchoice 4
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Context_param_choice_NONE 0
#define Controller_Context_param_choice_first_PRESENT 1
#define Controller_context_param_choice_selection_first_PRESENT 1
#define Controller_Context_param_choice_second_PRESENT 2
#define Controller_context_param_choice_selection_second_PRESENT 2
#define Controller_Mychoicedatatype_Selection_first_present 1
#define Controller_Mychoicedatatype_Selection_second_present 2
#define MyChoiceDataType_NONE 0
#define MyChoiceDataType_first_PRESENT 1
#define Mychoicedatatype_selection_first_PRESENT 1
#define MyChoiceDataType_second_PRESENT 2
#define Mychoicedatatype_selection_second_PRESENT 2
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
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

typedef Controller_Context_param_array {
    Controller_Context_param_array_elem data[3];
    int length;
}

typedef Controller_Context_param_choice_data {
    Controller_Context_param_choice_first first;
    Controller_Context_param_choice_second second;
}

typedef Controller_Context_param_optional_exist {
    bool b;
    bool c;
}

typedef Controller_Context_param_sequence_y {
    Controller_Context_param_sequence_y_elem data[4];
    int length;
}

typedef MyArrayDataType {
    MyArrayDataType_elem data[3];
    int length;
}

typedef MyChoiceDataType_data {
    MyChoiceDataType_first first;
    MyChoiceDataType_second second;
}

typedef MySequenceDataType_y {
    MySequenceDataType_y_elem data[4];
    int length;
}

typedef MySequenceWithOptionalsDataType_exist {
    bool b;
    bool c;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef Controller_Context_param_choice {
    Controller_Context_param_choice_data data;
    int selection;
}

typedef Controller_Context_param_optional {
    Controller_Context_param_optional_a a;
    Controller_Context_param_optional_b b;
    Controller_Context_param_optional_c c;
    Controller_Context_param_optional_exist exist;
}

typedef Controller_Context_param_sequence {
    Controller_Context_param_sequence_x x;
    Controller_Context_param_sequence_y y;
}

typedef MyChoiceDataType {
    MyChoiceDataType_data data;
    int selection;
}

typedef MySequenceDataType {
    MySequenceDataType_x x;
    MySequenceDataType_y y;
}

typedef MySequenceWithOptionalsDataType {
    MySequenceWithOptionalsDataType_a a;
    MySequenceWithOptionalsDataType_b b;
    MySequenceWithOptionalsDataType_c c;
    MySequenceWithOptionalsDataType_exist exist;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_param_integer param_integer;
    Controller_Context_param_sequence param_sequence;
    Controller_Context_param_choice param_choice;
    Controller_Context_param_array param_array;
    Controller_Context_param_optional param_optional;
    Controller_Context_reached reached;
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
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
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
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((((((Controller_States_vc == Controller_States_afterinteger) || (Controller_States_vc == Controller_States_afteroptional)) || (Controller_States_vc == Controller_States_afterarray)) || (Controller_States_vc == Controller_States_aftersequence)) || (Controller_States_vc == Controller_States_afterchoice)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert((((((Controller_Context_state_vc == Controller_Context_state_afterinteger) || (Controller_Context_state_vc == Controller_Context_state_afteroptional)) || (Controller_Context_state_vc == Controller_Context_state_afterarray)) || (Controller_Context_state_vc == Controller_Context_state_aftersequence)) || (Controller_Context_state_vc == Controller_Context_state_afterchoice)));
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
inline Controller_Context_param_integer_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_integer_range_check(dst);
}
inline Controller_Context_param_integer_range_check(Controller_Context_param_integer_vc)
{
    assert(((Controller_Context_param_integer_vc >= 0) && (Controller_Context_param_integer_vc <= 10000)));
}
inline Controller_Context_param_sequence_x_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_sequence_x_range_check(dst);
}
inline Controller_Context_param_sequence_x_range_check(Controller_Context_param_sequence_x_vc)
{
    assert(((Controller_Context_param_sequence_x_vc >= 0) && (Controller_Context_param_sequence_x_vc <= 10000)));
}
inline Controller_Context_param_sequence_y_elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_sequence_y_elem_range_check(dst);
}
inline Controller_Context_param_sequence_y_elem_range_check(Controller_Context_param_sequence_y_elem_vc)
{
    assert(((Controller_Context_param_sequence_y_elem_vc >= 0) && (Controller_Context_param_sequence_y_elem_vc <= 10000)));
}
inline Controller_Context_param_sequence_y_elem_init_value(dst)
{
    Controller_Context_param_sequence_y_elem_assign_value(dst, 0);
}
inline Controller_Context_param_sequence_y_assign_value(dst, src)
{
    int i_2;
    for(i_2 : 0 .. (src.length - 1))
    {
        Controller_Context_param_sequence_y_elem_assign_value(dst.data[i_2], src.data[i_2]);
    }
    for(i_2 : src.length .. 3)
    {
        Controller_Context_param_sequence_y_elem_init_value(dst.data[i_2]);
    }
    dst.length = src.length;
}
inline Controller_Context_param_sequence_y_size_check(Controller_Context_param_sequence_y_sc)
{
    assert(((Controller_Context_param_sequence_y_sc >= 0) && (Controller_Context_param_sequence_y_sc <= 4)));
}
inline Controller_Context_param_sequence_assign_value(dst, src)
{
    Controller_Context_param_sequence_x_assign_value(dst.x, src.x);
    Controller_Context_param_sequence_y_assign_value(dst.y, src.y);
}
inline Controller_Context_param_choice_first_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_choice_first_range_check(dst);
}
inline Controller_Context_param_choice_first_range_check(Controller_Context_param_choice_first_vc)
{
    assert(((Controller_Context_param_choice_first_vc >= 0) && (Controller_Context_param_choice_first_vc <= 10000)));
}
inline Controller_Context_param_choice_second_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_choice_second_range_check(dst);
}
inline Controller_Context_param_choice_second_range_check(Controller_Context_param_choice_second_vc)
{
    assert(((Controller_Context_param_choice_second_vc >= 0) && (Controller_Context_param_choice_second_vc <= 10000)));
}
inline Controller_Context_param_choice_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Controller_Context_param_choice_first_PRESENT);
        Controller_Context_param_choice_first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == Controller_Context_param_choice_second_PRESENT);
        Controller_Context_param_choice_second_assign_value(dst.data.second, src.data.second);
    ::  else;
        skip;
    fi;
}
inline Controller_context_param_choice_selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_param_array_elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_array_elem_range_check(dst);
}
inline Controller_Context_param_array_elem_range_check(Controller_Context_param_array_elem_vc)
{
    assert(((Controller_Context_param_array_elem_vc >= 0) && (Controller_Context_param_array_elem_vc <= 10000)));
}
inline Controller_Context_param_array_elem_init_value(dst)
{
    Controller_Context_param_array_elem_assign_value(dst, 0);
}
inline Controller_Context_param_array_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        Controller_Context_param_array_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 2)
    {
        Controller_Context_param_array_elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline Controller_Context_param_array_size_check(Controller_Context_param_array_sc)
{
    assert(((Controller_Context_param_array_sc >= 1) && (Controller_Context_param_array_sc <= 3)));
}
inline Controller_Context_param_optional_a_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_optional_a_range_check(dst);
}
inline Controller_Context_param_optional_a_range_check(Controller_Context_param_optional_a_vc)
{
    assert(((Controller_Context_param_optional_a_vc >= 0) && (Controller_Context_param_optional_a_vc <= 10000)));
}
inline Controller_Context_param_optional_b_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_optional_b_range_check(dst);
}
inline Controller_Context_param_optional_b_range_check(Controller_Context_param_optional_b_vc)
{
    assert(((Controller_Context_param_optional_b_vc >= 0) && (Controller_Context_param_optional_b_vc <= 10000)));
}
inline Controller_Context_param_optional_c_assign_value(dst, src)
{
    dst = src;
    Controller_Context_param_optional_c_range_check(dst);
}
inline Controller_Context_param_optional_c_range_check(Controller_Context_param_optional_c_vc)
{
    assert(((Controller_Context_param_optional_c_vc >= 0) && (Controller_Context_param_optional_c_vc <= 10000)));
}
inline Controller_Context_param_optional_assign_value(dst, src)
{
    Controller_Context_param_optional_a_assign_value(dst.a, src.a);
    Controller_Context_param_optional_b_assign_value(dst.b, src.b);
    Controller_Context_param_optional_c_assign_value(dst.c, src.c);
    dst.exist.b = src.exist.b;
    dst.exist.c = src.exist.c;
}
inline Controller_Context_reached_assign_value(dst, src)
{
    dst = src;
    Controller_Context_reached_range_check(dst);
}
inline Controller_Context_reached_range_check(Controller_Context_reached_vc)
{
    assert(((Controller_Context_reached_vc >= 0) && (Controller_Context_reached_vc <= 10000)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_param_integer_assign_value(dst.param_integer, src.param_integer);
    Controller_Context_param_sequence_assign_value(dst.param_sequence, src.param_sequence);
    Controller_Context_param_choice_assign_value(dst.param_choice, src.param_choice);
    Controller_Context_param_array_assign_value(dst.param_array, src.param_array);
    Controller_Context_param_optional_assign_value(dst.param_optional, src.param_optional);
    Controller_Context_reached_assign_value(dst.reached, src.reached);
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
inline MyInteger_assign_value(dst, src)
{
    dst = src;
    MyInteger_range_check(dst);
}
inline MyInteger_range_check(MyInteger_vc)
{
    assert(((MyInteger_vc >= 0) && (MyInteger_vc <= 10000)));
}
inline MySequenceDataType_x_assign_value(dst, src)
{
    dst = src;
    MySequenceDataType_x_range_check(dst);
}
inline MySequenceDataType_x_range_check(MySequenceDataType_x_vc)
{
    assert(((MySequenceDataType_x_vc >= 0) && (MySequenceDataType_x_vc <= 10000)));
}
inline MySequenceDataType_y_elem_assign_value(dst, src)
{
    dst = src;
    MySequenceDataType_y_elem_range_check(dst);
}
inline MySequenceDataType_y_elem_range_check(MySequenceDataType_y_elem_vc)
{
    assert(((MySequenceDataType_y_elem_vc >= 0) && (MySequenceDataType_y_elem_vc <= 10000)));
}
inline MySequenceDataType_y_elem_init_value(dst)
{
    MySequenceDataType_y_elem_assign_value(dst, 0);
}
inline MySequenceDataType_y_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        MySequenceDataType_y_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 3)
    {
        MySequenceDataType_y_elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline MySequenceDataType_y_size_check(MySequenceDataType_y_sc)
{
    assert(((MySequenceDataType_y_sc >= 0) && (MySequenceDataType_y_sc <= 4)));
}
inline MySequenceDataType_assign_value(dst, src)
{
    MySequenceDataType_x_assign_value(dst.x, src.x);
    MySequenceDataType_y_assign_value(dst.y, src.y);
}
inline MyChoiceDataType_first_assign_value(dst, src)
{
    dst = src;
    MyChoiceDataType_first_range_check(dst);
}
inline MyChoiceDataType_first_range_check(MyChoiceDataType_first_vc)
{
    assert(((MyChoiceDataType_first_vc >= 0) && (MyChoiceDataType_first_vc <= 10000)));
}
inline MyChoiceDataType_second_assign_value(dst, src)
{
    dst = src;
    MyChoiceDataType_second_range_check(dst);
}
inline MyChoiceDataType_second_range_check(MyChoiceDataType_second_vc)
{
    assert(((MyChoiceDataType_second_vc >= 0) && (MyChoiceDataType_second_vc <= 10000)));
}
inline MyChoiceDataType_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyChoiceDataType_first_PRESENT);
        MyChoiceDataType_first_assign_value(dst.data.first, src.data.first);
    ::  (dst.selection == MyChoiceDataType_second_PRESENT);
        MyChoiceDataType_second_assign_value(dst.data.second, src.data.second);
    ::  else;
        skip;
    fi;
}
inline Mychoicedatatype_selection_assign_value(dst, src)
{
    dst = src;
}
inline MyArrayDataType_elem_assign_value(dst, src)
{
    dst = src;
    MyArrayDataType_elem_range_check(dst);
}
inline MyArrayDataType_elem_range_check(MyArrayDataType_elem_vc)
{
    assert(((MyArrayDataType_elem_vc >= 0) && (MyArrayDataType_elem_vc <= 10000)));
}
inline MyArrayDataType_elem_init_value(dst)
{
    MyArrayDataType_elem_assign_value(dst, 0);
}
inline MyArrayDataType_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. (src.length - 1))
    {
        MyArrayDataType_elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
    for(i_0 : src.length .. 2)
    {
        MyArrayDataType_elem_init_value(dst.data[i_0]);
    }
    dst.length = src.length;
}
inline MyArrayDataType_size_check(MyArrayDataType_sc)
{
    assert(((MyArrayDataType_sc >= 1) && (MyArrayDataType_sc <= 3)));
}
inline MySequenceWithOptionalsDataType_a_assign_value(dst, src)
{
    dst = src;
    MySequenceWithOptionalsDataType_a_range_check(dst);
}
inline MySequenceWithOptionalsDataType_a_range_check(MySequenceWithOptionalsDataType_a_vc)
{
    assert(((MySequenceWithOptionalsDataType_a_vc >= 0) && (MySequenceWithOptionalsDataType_a_vc <= 10000)));
}
inline MySequenceWithOptionalsDataType_b_assign_value(dst, src)
{
    dst = src;
    MySequenceWithOptionalsDataType_b_range_check(dst);
}
inline MySequenceWithOptionalsDataType_b_range_check(MySequenceWithOptionalsDataType_b_vc)
{
    assert(((MySequenceWithOptionalsDataType_b_vc >= 0) && (MySequenceWithOptionalsDataType_b_vc <= 10000)));
}
inline MySequenceWithOptionalsDataType_c_assign_value(dst, src)
{
    dst = src;
    MySequenceWithOptionalsDataType_c_range_check(dst);
}
inline MySequenceWithOptionalsDataType_c_range_check(MySequenceWithOptionalsDataType_c_vc)
{
    assert(((MySequenceWithOptionalsDataType_c_vc >= 0) && (MySequenceWithOptionalsDataType_c_vc <= 10000)));
}
inline MySequenceWithOptionalsDataType_assign_value(dst, src)
{
    MySequenceWithOptionalsDataType_a_assign_value(dst.a, src.a);
    MySequenceWithOptionalsDataType_b_assign_value(dst.b, src.b);
    MySequenceWithOptionalsDataType_c_assign_value(dst.c, src.c);
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
