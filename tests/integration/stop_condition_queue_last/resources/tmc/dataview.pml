#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Mychoicedatatype_Selection int
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_param_integer MyInteger
#define Controller_Context_param_sequence MySequenceDataType
#define Controller_Context_param_choice MyChoiceDataType
#define Controller_Context_param_array MyArrayDataType
#define Controller_Context_param_optional MySequenceWithOptionalsDataType
#define Controller_Context_reached MyInteger
#define Controller_Mychoicedatatype_Selection int
#define MyInteger int
#define MySequenceDataType_x MyInteger
#define MySequenceDataType_y_elem MyInteger
#define MyChoiceDataType_first MyInteger
#define MyChoiceDataType_second MyInteger
#define MyArrayDataType_elem MyInteger
#define MySequenceWithOptionalsDataType_a MyInteger
#define MySequenceWithOptionalsDataType_b MyInteger
#define MySequenceWithOptionalsDataType_c MyInteger
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID int
#define Actuator_Event_msg_in_test_array_p1 MyArrayDataType
#define Actuator_Event_msg_in_test_choice_p1 MyChoiceDataType
#define Actuator_Event_msg_in_test_integer_p1 MyInteger
#define Actuator_Event_msg_in_test_optional_p1 MySequenceWithOptionalsDataType
#define Actuator_Event_msg_in_test_sequence_p1 MySequenceDataType
#define Controller_Event_msg_out_test_array_p1 MyArrayDataType
#define Controller_Event_msg_out_test_choice_p1 MyChoiceDataType
#define Controller_Event_msg_out_test_integer_p1 MyInteger
#define Controller_Event_msg_out_test_optional_p1 MySequenceWithOptionalsDataType
#define Controller_Event_msg_out_test_sequence_p1 MySequenceDataType
#define Observer_State_Kind int
#define Function_Event_actuator Actuator_Event
#define Function_Event_controller Controller_Event
#define Named_Function_Event_event Function_Event
#define Interface_Event_source PID
#define Interface_Event_dest PID
#define Interface_Event_event Function_Event
#define Observable_Event_input_event Interface_Event
#define Observable_Event_output_event Interface_Event
#define Observable_Event_unhandled_input Interface_Event
#define Events_Ty_elem Observable_Event
#define System_State_actuator_queue Events_Ty
#define System_State_controller_queue Events_Ty
#define System_State_actuator Actuator_Context
#define System_State_controller Controller_Context
#define Actuator_States_wait 0
#define Actuator_Mychoicedatatype_Selection_first_present 1
#define Actuator_Mychoicedatatype_Selection_second_present 2
#define Controller_States_afterinteger 0
#define Controller_States_afterarray 1
#define Controller_States_aftersequence 2
#define Controller_States_afterchoice 3
#define Controller_States_afteroptional 4
#define Controller_Mychoicedatatype_Selection_first_present 1
#define Controller_Mychoicedatatype_Selection_second_present 2
#define MyChoiceDataType_NONE 0
#define MyChoiceDataType_first_PRESENT 1
#define MyChoiceDataType_second_PRESENT 2
#define PID_env 0
#define PID_actuator 1
#define PID_controller 2
#define Actuator_Event_NONE 0
#define Actuator_Event_msg_in_NONE 0
#define Actuator_Event_msg_in_input_none_PRESENT 1
#define Actuator_Event_msg_in_test_array_PRESENT 2
#define Actuator_Event_msg_in_test_choice_PRESENT 3
#define Actuator_Event_msg_in_test_integer_PRESENT 4
#define Actuator_Event_msg_in_test_optional_PRESENT 5
#define Actuator_Event_msg_in_test_sequence_PRESENT 6
#define Actuator_Event_msg_in_PRESENT 1
#define Actuator_Event_msg_out_NONE 0
#define Actuator_Event_msg_out_result_PRESENT 1
#define Actuator_Event_msg_out_PRESENT 2
#define Controller_Event_NONE 0
#define Controller_Event_msg_in_NONE 0
#define Controller_Event_msg_in_input_none_PRESENT 1
#define Controller_Event_msg_in_result_PRESENT 2
#define Controller_Event_msg_in_PRESENT 1
#define Controller_Event_msg_out_NONE 0
#define Controller_Event_msg_out_test_array_PRESENT 1
#define Controller_Event_msg_out_test_choice_PRESENT 2
#define Controller_Event_msg_out_test_integer_PRESENT 3
#define Controller_Event_msg_out_test_optional_PRESENT 4
#define Controller_Event_msg_out_test_sequence_PRESENT 5
#define Controller_Event_msg_out_PRESENT 2
#define Observer_State_Kind_regular_state 0
#define Observer_State_Kind_error_state 1
#define Observer_State_Kind_ignore_state 2
#define Observer_State_Kind_success_state 3
#define Function_Event_NONE 0
#define Function_Event_actuator_PRESENT 1
#define Function_Event_controller_PRESENT 2
#define Observable_Event_NONE 0
#define Observable_Event_no_event_PRESENT 1
#define Observable_Event_system_startup_PRESENT 2
#define Observable_Event_input_event_PRESENT 3
#define Observable_Event_output_event_PRESENT 4
#define Observable_Event_unhandled_input_PRESENT 5
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
}

typedef Actuator_Event_msg_in_input_none {
    bit dummy;
}

typedef Actuator_Event_msg_in_test_integer {
    Actuator_Event_msg_in_test_integer_p1 p1;
}

typedef Actuator_Event_msg_out_result {
    bit dummy;
}

typedef Controller_Event_msg_in_input_none {
    bit dummy;
}

typedef Controller_Event_msg_in_result {
    bit dummy;
}

typedef Controller_Event_msg_out_test_integer {
    Controller_Event_msg_out_test_integer_p1 p1;
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

typedef Named_Function_Event_id {
    byte data[80];
    int length;
}

typedef Observable_Event_no_event {
    bit dummy;
}

typedef Observable_Event_system_startup {
    bit dummy;
}

typedef T_Null_Record {
    bit dummy;
}

typedef Actuator_Event_msg_in_test_array {
    Actuator_Event_msg_in_test_array_p1 p1;
}

typedef Actuator_Event_msg_out_data {
    Actuator_Event_msg_out_result result;
}

typedef Controller_Event_msg_in_data {
    Controller_Event_msg_in_input_none input_none;
    Controller_Event_msg_in_result result;
}

typedef Controller_Event_msg_out_test_array {
    Controller_Event_msg_out_test_array_p1 p1;
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

typedef Actuator_Event_msg_in_test_choice {
    Actuator_Event_msg_in_test_choice_p1 p1;
}

typedef Actuator_Event_msg_in_test_optional {
    Actuator_Event_msg_in_test_optional_p1 p1;
}

typedef Actuator_Event_msg_in_test_sequence {
    Actuator_Event_msg_in_test_sequence_p1 p1;
}

typedef Actuator_Event_msg_out {
    Actuator_Event_msg_out_data data;
    int selection;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_param_integer param_integer;
    Controller_Context_param_sequence param_sequence;
    Controller_Context_param_choice param_choice;
    Controller_Context_param_array param_array;
    Controller_Context_param_optional param_optional;
    Controller_Context_reached reached;
}

typedef Controller_Event_msg_in {
    Controller_Event_msg_in_data data;
    int selection;
}

typedef Controller_Event_msg_out_test_choice {
    Controller_Event_msg_out_test_choice_p1 p1;
}

typedef Controller_Event_msg_out_test_optional {
    Controller_Event_msg_out_test_optional_p1 p1;
}

typedef Controller_Event_msg_out_test_sequence {
    Controller_Event_msg_out_test_sequence_p1 p1;
}

typedef Actuator_Event_msg_in_data {
    Actuator_Event_msg_in_input_none input_none;
    Actuator_Event_msg_in_test_array test_array;
    Actuator_Event_msg_in_test_choice test_choice;
    Actuator_Event_msg_in_test_integer test_integer;
    Actuator_Event_msg_in_test_optional test_optional;
    Actuator_Event_msg_in_test_sequence test_sequence;
}

typedef Controller_Event_msg_out_data {
    Controller_Event_msg_out_test_array test_array;
    Controller_Event_msg_out_test_choice test_choice;
    Controller_Event_msg_out_test_integer test_integer;
    Controller_Event_msg_out_test_optional test_optional;
    Controller_Event_msg_out_test_sequence test_sequence;
}

typedef Actuator_Event_msg_in {
    Actuator_Event_msg_in_data data;
    int selection;
}

typedef Controller_Event_msg_out {
    Controller_Event_msg_out_data data;
    int selection;
}

typedef Actuator_Event_data {
    Actuator_Event_msg_in msg_in;
    Actuator_Event_msg_out msg_out;
}

typedef Controller_Event_data {
    Controller_Event_msg_in msg_in;
    Controller_Event_msg_out msg_out;
}

typedef Actuator_Event {
    Actuator_Event_data data;
    int selection;
}

typedef Controller_Event {
    Controller_Event_data data;
    int selection;
}

typedef Function_Event_data {
    Function_Event_actuator actuator;
    Function_Event_controller controller;
}

typedef Function_Event {
    Function_Event_data data;
    int selection;
}

typedef Interface_Event {
    Interface_Event_source source;
    Interface_Event_dest dest;
    Interface_Event_event event;
}

typedef Named_Function_Event {
    Named_Function_Event_id id;
    Named_Function_Event_event event;
}

typedef Observable_Event_data {
    Observable_Event_no_event no_event;
    Observable_Event_system_startup system_startup;
    Observable_Event_input_event input_event;
    Observable_Event_output_event output_event;
    Observable_Event_unhandled_input unhandled_input;
}

typedef Observable_Event {
    Observable_Event_data data;
    int selection;
}

typedef Events_Ty {
    Events_Ty_elem data[10];
    int length;
}

typedef System_State {
    System_State_actuator_queue actuator_queue;
    System_State_controller_queue controller_queue;
    System_State_actuator actuator;
    System_State_controller controller;
}

Observable_Event nothing;
inline Actuator_States_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_States_range_check(Actuator_States_value_check)
{
    assert((Actuator_States_value_check == Actuator_States_wait));
}
inline Actuator_Context_state_assign_value(dst, src)
{
    Actuator_States_assign_value(dst, src);
}
inline Actuator_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
}
inline Actuator_Mychoicedatatype_Selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Mychoicedatatype_Selection_range_check(Actuator_Mychoicedatatype_Selection_value_check)
{
    assert(((Actuator_Mychoicedatatype_Selection_value_check == Actuator_Mychoicedatatype_Selection_first_present) || (Actuator_Mychoicedatatype_Selection_value_check == Actuator_Mychoicedatatype_Selection_second_present)));
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
}
inline Controller_States_range_check(Controller_States_value_check)
{
    assert((((((Controller_States_value_check == Controller_States_afterinteger) || (Controller_States_value_check == Controller_States_afterarray)) || (Controller_States_value_check == Controller_States_aftersequence)) || (Controller_States_value_check == Controller_States_afterchoice)) || (Controller_States_value_check == Controller_States_afteroptional)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    Controller_States_assign_value(dst, src);
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_param_integer_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_param_sequence_assign_value(dst, src)
{
    MySequenceDataType_assign_value(dst, src);
}
inline Controller_Context_param_choice_assign_value(dst, src)
{
    MyChoiceDataType_assign_value(dst, src);
}
inline Controller_Context_param_array_assign_value(dst, src)
{
    MyArrayDataType_assign_value(dst, src);
}
inline Controller_Context_param_optional_assign_value(dst, src)
{
    MySequenceWithOptionalsDataType_assign_value(dst, src);
}
inline Controller_Context_reached_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
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
}
inline Controller_Mychoicedatatype_Selection_range_check(Controller_Mychoicedatatype_Selection_value_check)
{
    assert(((Controller_Mychoicedatatype_Selection_value_check == Controller_Mychoicedatatype_Selection_first_present) || (Controller_Mychoicedatatype_Selection_value_check == Controller_Mychoicedatatype_Selection_second_present)));
}
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyInteger_range_check(MyInteger_value_check)
{
    assert(((MyInteger_value_check >= 0) && (MyInteger_value_check <= 10000)));
}
inline MySequenceDataType_x_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MySequenceDataType_y_elem_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MySequenceDataType_y_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 3)
    {
        MySequenceDataType_y_elem_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline MySequenceDataType_y_range_check(MySequenceDataType_y_size_check)
{
    assert(((MySequenceDataType_y_size_check >= 0) && (MySequenceDataType_y_size_check <= 4)));
}
inline MySequenceDataType_assign_value(dst, src)
{
    MySequenceDataType_x_assign_value(dst.x, src.x);
    MySequenceDataType_y_assign_value(dst.y, src.y);
}
inline MyChoiceDataType_first_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyChoiceDataType_second_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyChoiceDataType_assign_value(dst, src)
{
    MyChoiceDataType_first_assign_value(dst.data.first, src.data.first);
    MyChoiceDataType_second_assign_value(dst.data.second, src.data.second);
    dst.selection = src.selection;
}
inline MyArrayDataType_elem_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MyArrayDataType_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 2)
    {
        MyArrayDataType_elem_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline MyArrayDataType_range_check(MyArrayDataType_size_check)
{
    assert(((MyArrayDataType_size_check >= 1) && (MyArrayDataType_size_check <= 3)));
}
inline MySequenceWithOptionalsDataType_a_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MySequenceWithOptionalsDataType_b_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline MySequenceWithOptionalsDataType_c_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
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
}
inline T_Int32_range_check(T_Int32_value_check)
{
    assert(((T_Int32_value_check >= -2147483648) && (T_Int32_value_check <= 2147483647)));
}
inline T_UInt32_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt32_range_check(T_UInt32_value_check)
{
    assert(((T_UInt32_value_check >= 0) && (T_UInt32_value_check <= -1)));
}
inline T_Int8_assign_value(dst, src)
{
    dst = src;
}
inline T_Int8_range_check(T_Int8_value_check)
{
    assert(((T_Int8_value_check >= -128) && (T_Int8_value_check <= 127)));
}
inline T_UInt8_assign_value(dst, src)
{
    dst = src;
}
inline T_UInt8_range_check(T_UInt8_value_check)
{
    assert(((T_UInt8_value_check >= 0) && (T_UInt8_value_check <= 255)));
}
inline T_Boolean_assign_value(dst, src)
{
    dst = src;
}
inline T_Null_Record_assign_value(dst, src)
{
    skip;
}
inline PID_assign_value(dst, src)
{
    dst = src;
}
inline PID_range_check(PID_value_check)
{
    assert((((PID_value_check == PID_env) || (PID_value_check == PID_actuator)) || (PID_value_check == PID_controller)));
}
inline Actuator_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Actuator_Event_msg_in_test_array_p1_assign_value(dst, src)
{
    MyArrayDataType_assign_value(dst, src);
}
inline Actuator_Event_msg_in_test_array_assign_value(dst, src)
{
    Actuator_Event_msg_in_test_array_p1_assign_value(dst.p1, src.p1);
}
inline Actuator_Event_msg_in_test_choice_p1_assign_value(dst, src)
{
    MyChoiceDataType_assign_value(dst, src);
}
inline Actuator_Event_msg_in_test_choice_assign_value(dst, src)
{
    Actuator_Event_msg_in_test_choice_p1_assign_value(dst.p1, src.p1);
}
inline Actuator_Event_msg_in_test_integer_p1_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Actuator_Event_msg_in_test_integer_assign_value(dst, src)
{
    Actuator_Event_msg_in_test_integer_p1_assign_value(dst.p1, src.p1);
}
inline Actuator_Event_msg_in_test_optional_p1_assign_value(dst, src)
{
    MySequenceWithOptionalsDataType_assign_value(dst, src);
}
inline Actuator_Event_msg_in_test_optional_assign_value(dst, src)
{
    Actuator_Event_msg_in_test_optional_p1_assign_value(dst.p1, src.p1);
}
inline Actuator_Event_msg_in_test_sequence_p1_assign_value(dst, src)
{
    MySequenceDataType_assign_value(dst, src);
}
inline Actuator_Event_msg_in_test_sequence_assign_value(dst, src)
{
    Actuator_Event_msg_in_test_sequence_p1_assign_value(dst.p1, src.p1);
}
inline Actuator_Event_msg_in_assign_value(dst, src)
{
    Actuator_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Actuator_Event_msg_in_test_array_assign_value(dst.data.test_array, src.data.test_array);
    Actuator_Event_msg_in_test_choice_assign_value(dst.data.test_choice, src.data.test_choice);
    Actuator_Event_msg_in_test_integer_assign_value(dst.data.test_integer, src.data.test_integer);
    Actuator_Event_msg_in_test_optional_assign_value(dst.data.test_optional, src.data.test_optional);
    Actuator_Event_msg_in_test_sequence_assign_value(dst.data.test_sequence, src.data.test_sequence);
    dst.selection = src.selection;
}
inline Actuator_Event_msg_out_result_assign_value(dst, src)
{
    skip;
}
inline Actuator_Event_msg_out_assign_value(dst, src)
{
    Actuator_Event_msg_out_result_assign_value(dst.data.result, src.data.result);
    dst.selection = src.selection;
}
inline Actuator_Event_assign_value(dst, src)
{
    Actuator_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Actuator_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Controller_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Controller_Event_msg_in_result_assign_value(dst, src)
{
    skip;
}
inline Controller_Event_msg_in_assign_value(dst, src)
{
    Controller_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Controller_Event_msg_in_result_assign_value(dst.data.result, src.data.result);
    dst.selection = src.selection;
}
inline Controller_Event_msg_out_test_array_p1_assign_value(dst, src)
{
    MyArrayDataType_assign_value(dst, src);
}
inline Controller_Event_msg_out_test_array_assign_value(dst, src)
{
    Controller_Event_msg_out_test_array_p1_assign_value(dst.p1, src.p1);
}
inline Controller_Event_msg_out_test_choice_p1_assign_value(dst, src)
{
    MyChoiceDataType_assign_value(dst, src);
}
inline Controller_Event_msg_out_test_choice_assign_value(dst, src)
{
    Controller_Event_msg_out_test_choice_p1_assign_value(dst.p1, src.p1);
}
inline Controller_Event_msg_out_test_integer_p1_assign_value(dst, src)
{
    MyInteger_assign_value(dst, src);
}
inline Controller_Event_msg_out_test_integer_assign_value(dst, src)
{
    Controller_Event_msg_out_test_integer_p1_assign_value(dst.p1, src.p1);
}
inline Controller_Event_msg_out_test_optional_p1_assign_value(dst, src)
{
    MySequenceWithOptionalsDataType_assign_value(dst, src);
}
inline Controller_Event_msg_out_test_optional_assign_value(dst, src)
{
    Controller_Event_msg_out_test_optional_p1_assign_value(dst.p1, src.p1);
}
inline Controller_Event_msg_out_test_sequence_p1_assign_value(dst, src)
{
    MySequenceDataType_assign_value(dst, src);
}
inline Controller_Event_msg_out_test_sequence_assign_value(dst, src)
{
    Controller_Event_msg_out_test_sequence_p1_assign_value(dst.p1, src.p1);
}
inline Controller_Event_msg_out_assign_value(dst, src)
{
    Controller_Event_msg_out_test_array_assign_value(dst.data.test_array, src.data.test_array);
    Controller_Event_msg_out_test_choice_assign_value(dst.data.test_choice, src.data.test_choice);
    Controller_Event_msg_out_test_integer_assign_value(dst.data.test_integer, src.data.test_integer);
    Controller_Event_msg_out_test_optional_assign_value(dst.data.test_optional, src.data.test_optional);
    Controller_Event_msg_out_test_sequence_assign_value(dst.data.test_sequence, src.data.test_sequence);
    dst.selection = src.selection;
}
inline Controller_Event_assign_value(dst, src)
{
    Controller_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Controller_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Observer_State_Kind_assign_value(dst, src)
{
    dst = src;
}
inline Observer_State_Kind_range_check(Observer_State_Kind_value_check)
{
    assert(((((Observer_State_Kind_value_check == Observer_State_Kind_regular_state) || (Observer_State_Kind_value_check == Observer_State_Kind_error_state)) || (Observer_State_Kind_value_check == Observer_State_Kind_ignore_state)) || (Observer_State_Kind_value_check == Observer_State_Kind_success_state)));
}
inline Function_Event_actuator_assign_value(dst, src)
{
    Actuator_Event_assign_value(dst, src);
}
inline Function_Event_controller_assign_value(dst, src)
{
    Controller_Event_assign_value(dst, src);
}
inline Function_Event_assign_value(dst, src)
{
    Function_Event_actuator_assign_value(dst.data.actuator, src.data.actuator);
    Function_Event_controller_assign_value(dst.data.controller, src.data.controller);
    dst.selection = src.selection;
}
inline Named_Function_Event_id_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 79)
    {
        dst.data[i] = src.data[i];
    }
    dst.length = src.length;
}
inline Named_Function_Event_id_range_check(Named_Function_Event_id_size_check)
{
    assert(((Named_Function_Event_id_size_check >= 1) && (Named_Function_Event_id_size_check <= 80)));
}
inline Named_Function_Event_event_assign_value(dst, src)
{
    Function_Event_assign_value(dst, src);
}
inline Named_Function_Event_assign_value(dst, src)
{
    Named_Function_Event_id_assign_value(dst.id, src.id);
    Named_Function_Event_event_assign_value(dst.event, src.event);
}
inline Interface_Event_source_assign_value(dst, src)
{
    PID_assign_value(dst, src);
}
inline Interface_Event_dest_assign_value(dst, src)
{
    PID_assign_value(dst, src);
}
inline Interface_Event_event_assign_value(dst, src)
{
    Function_Event_assign_value(dst, src);
}
inline Interface_Event_assign_value(dst, src)
{
    Interface_Event_source_assign_value(dst.source, src.source);
    Interface_Event_dest_assign_value(dst.dest, src.dest);
    Interface_Event_event_assign_value(dst.event, src.event);
}
inline Observable_Event_no_event_assign_value(dst, src)
{
    skip;
}
inline Observable_Event_system_startup_assign_value(dst, src)
{
    skip;
}
inline Observable_Event_input_event_assign_value(dst, src)
{
    Interface_Event_assign_value(dst, src);
}
inline Observable_Event_output_event_assign_value(dst, src)
{
    Interface_Event_assign_value(dst, src);
}
inline Observable_Event_unhandled_input_assign_value(dst, src)
{
    Interface_Event_assign_value(dst, src);
}
inline Observable_Event_assign_value(dst, src)
{
    Observable_Event_no_event_assign_value(dst.data.no_event, src.data.no_event);
    Observable_Event_system_startup_assign_value(dst.data.system_startup, src.data.system_startup);
    Observable_Event_input_event_assign_value(dst.data.input_event, src.data.input_event);
    Observable_Event_output_event_assign_value(dst.data.output_event, src.data.output_event);
    Observable_Event_unhandled_input_assign_value(dst.data.unhandled_input, src.data.unhandled_input);
    dst.selection = src.selection;
}
inline Events_Ty_elem_assign_value(dst, src)
{
    Observable_Event_assign_value(dst, src);
}
inline Events_Ty_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 9)
    {
        Events_Ty_elem_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline Events_Ty_range_check(Events_Ty_size_check)
{
    assert(((Events_Ty_size_check >= 0) && (Events_Ty_size_check <= 10)));
}
inline System_State_actuator_queue_assign_value(dst, src)
{
    Events_Ty_assign_value(dst, src);
}
inline System_State_controller_queue_assign_value(dst, src)
{
    Events_Ty_assign_value(dst, src);
}
inline System_State_actuator_assign_value(dst, src)
{
    Actuator_Context_assign_value(dst, src);
}
inline System_State_controller_assign_value(dst, src)
{
    Controller_Context_assign_value(dst, src);
}
inline System_State_assign_value(dst, src)
{
    System_State_actuator_queue_assign_value(dst.actuator_queue, src.actuator_queue);
    System_State_controller_queue_assign_value(dst.controller_queue, src.controller_queue);
    System_State_actuator_assign_value(dst.actuator, src.actuator);
    System_State_controller_assign_value(dst.controller, src.controller);
}
inline nothing_init()
{
    d_step {
        nothing.selection = Observable_Event_no_event_PRESENT;
    }
}
