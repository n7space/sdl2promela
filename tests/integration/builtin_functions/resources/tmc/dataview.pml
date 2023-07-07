#define Actuator_States int
#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_sender int
#define Actuator_Context_offspring int
#define Actuator_Context_my_union_speed int
#define Actuator_Context_my_union_accel int
#define Actuator_Context_my_union_det int
#define Actuator_Context_my_bool bool
#define Actuator_Context_my_array_elem int
#define Actuator_Context_my_derived_array_elem int
#define Actuator_Context_my_int int
#define Actuator_Context_my_struct_mass int
#define Actuator_Context_my_struct_charge int
#define Actuator_Context_my_enum int
#define Actuator_Context_my_fixed_elem int
#define Actuator_Context_my_derived_fixed_elem int
#define Actuator_Myunion_Selection int
#define Controller_States int
#define Controller_Context_state int
#define Controller_Context_init_done bool
#define Controller_Context_sender int
#define Controller_Context_offspring int
#define Controller_Context_error int
#define Controller_Context_reached int
#define Controller_Context_my_union_speed int
#define Controller_Context_my_union_accel int
#define Controller_Context_my_bool bool
#define Controller_Context_my_arr_elem int
#define Controller_Context_my_int int
#define Controller_Context_my_struct_mass int
#define Controller_Context_my_struct_charge int
#define Controller_Context_my_enum int
#define Controller_Context_my_fixed_elem int
#define Controller_Context_my_derived_array_elem int
#define Controller_Context_my_derived_fixed_elem int
#define Controller_Myunion_Selection int
#define MyInteger int
#define MyBoolean bool
#define MyArray_elem int
#define MyDerivedArray_elem int
#define MyUnion_speed int
#define MyUnion_accel int
#define MyEnum int
#define MyStruct_mass int
#define MyStruct_charge int
#define MyFixed_elem int
#define MyDerivedFixed_elem int
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
#define Actuator_Context_my_union_NONE 0
#define Actuator_Context_my_union_speed_PRESENT 1
#define Actuator_context_my_union_selection_speed_PRESENT 1
#define Actuator_Context_my_union_accel_PRESENT 2
#define Actuator_context_my_union_selection_accel_PRESENT 2
#define Actuator_Context_my_union_det_speed_present 1
#define Actuator_Context_my_union_det_accel_present 2
#define Actuator_Context_my_enum_speed 0
#define Actuator_Context_my_enum_accel 1
#define Actuator_Myunion_Selection_speed_present 1
#define Actuator_Myunion_Selection_accel_present 2
#define Controller_States_checklengthb 0
#define Controller_States_checkexista 1
#define Controller_States_checklengtha 2
#define Controller_States_checklengthderivedfixed 3
#define Controller_States_checknumb 4
#define Controller_States_reached 5
#define Controller_States_error 6
#define Controller_States_checkvala 7
#define Controller_States_checktoenuma 8
#define Controller_States_checktoselectorb 9
#define Controller_States_checkvalb 10
#define Controller_States_checklengthderivedarray 11
#define Controller_States_checknuma 12
#define Controller_States_checktoenumb 13
#define Controller_States_checkpresentb 14
#define Controller_States_checktoselectora 15
#define Controller_States_checkexistb 16
#define Controller_States_checklengthfixed 17
#define Controller_States_checkpresenta 18
#define Controller_Context_state_checklengthb 0
#define Controller_Context_state_checkexista 1
#define Controller_Context_state_checklengtha 2
#define Controller_Context_state_checklengthderivedfixed 3
#define Controller_Context_state_checknumb 4
#define Controller_Context_state_reached 5
#define Controller_Context_state_error 6
#define Controller_Context_state_checkvala 7
#define Controller_Context_state_checktoenuma 8
#define Controller_Context_state_checktoselectorb 9
#define Controller_Context_state_checkvalb 10
#define Controller_Context_state_checklengthderivedarray 11
#define Controller_Context_state_checknuma 12
#define Controller_Context_state_checktoenumb 13
#define Controller_Context_state_checkpresentb 14
#define Controller_Context_state_checktoselectora 15
#define Controller_Context_state_checkexistb 16
#define Controller_Context_state_checklengthfixed 17
#define Controller_Context_state_checkpresenta 18
#define Controller_Context_sender_actuator 0
#define Controller_Context_sender_controller 1
#define Controller_Context_sender_env 2
#define Controller_Context_offspring_actuator 0
#define Controller_Context_offspring_controller 1
#define Controller_Context_offspring_env 2
#define Controller_Context_my_union_NONE 0
#define Controller_Context_my_union_speed_PRESENT 1
#define Controller_context_my_union_selection_speed_PRESENT 1
#define Controller_Context_my_union_accel_PRESENT 2
#define Controller_context_my_union_selection_accel_PRESENT 2
#define Controller_Context_my_enum_speed 0
#define Controller_Context_my_enum_accel 1
#define Controller_Myunion_Selection_speed_present 1
#define Controller_Myunion_Selection_accel_present 2
#define MyUnion_NONE 0
#define MyUnion_speed_PRESENT 1
#define Myunion_selection_speed_PRESENT 1
#define MyUnion_accel_PRESENT 2
#define Myunion_selection_accel_PRESENT 2
#define MyEnum_speed 0
#define MyEnum_accel 1
#define PID_actuator 0
#define PID_controller 1
#define PID_env 2
typedef Actuator_Context_my_array {
    Actuator_Context_my_array_elem data[6];
    int length;
}

typedef Actuator_Context_my_derived_array {
    Actuator_Context_my_derived_array_elem data[3];
    int length;
}

typedef Actuator_Context_my_derived_fixed {
    Actuator_Context_my_derived_fixed_elem data[2];
}

typedef Actuator_Context_my_fixed {
    Actuator_Context_my_fixed_elem data[2];
}

typedef Actuator_Context_my_struct_exist {
    bool charge;
}

typedef Actuator_Context_my_union_data {
    Actuator_Context_my_union_speed speed;
    Actuator_Context_my_union_accel accel;
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

typedef Controller_Context_my_arr {
    Controller_Context_my_arr_elem data[6];
    int length;
}

typedef Controller_Context_my_derived_array {
    Controller_Context_my_derived_array_elem data[3];
    int length;
}

typedef Controller_Context_my_derived_fixed {
    Controller_Context_my_derived_fixed_elem data[2];
}

typedef Controller_Context_my_fixed {
    Controller_Context_my_fixed_elem data[2];
}

typedef Controller_Context_my_struct_exist {
    bool charge;
}

typedef Controller_Context_my_union_data {
    Controller_Context_my_union_speed speed;
    Controller_Context_my_union_accel accel;
}

typedef MyArray {
    MyArray_elem data[6];
    int length;
}

typedef MyDerivedArray {
    MyDerivedArray_elem data[3];
    int length;
}

typedef MyDerivedFixed {
    MyDerivedFixed_elem data[2];
}

typedef MyFixed {
    MyFixed_elem data[2];
}

typedef MyStruct_exist {
    bool charge;
}

typedef MyUnion_data {
    MyUnion_speed speed;
    MyUnion_accel accel;
}

typedef T_Null_Record {
    bit dummy;
}

typedef TimerData {
    TimerData_timer_enabled timer_enabled;
    TimerData_interval interval;
}

typedef Actuator_Context_my_struct {
    Actuator_Context_my_struct_mass mass;
    Actuator_Context_my_struct_charge charge;
    Actuator_Context_my_struct_exist exist;
}

typedef Actuator_Context_my_union {
    Actuator_Context_my_union_data data;
    int selection;
}

typedef AggregateTimerData {
    AggregateTimerData_actuator actuator;
    AggregateTimerData_controller controller;
    AggregateTimerData_dummy_entry dummy_entry;
}

typedef Controller_Context_my_struct {
    Controller_Context_my_struct_mass mass;
    Controller_Context_my_struct_charge charge;
    Controller_Context_my_struct_exist exist;
}

typedef Controller_Context_my_union {
    Controller_Context_my_union_data data;
    int selection;
}

typedef MyStruct {
    MyStruct_mass mass;
    MyStruct_charge charge;
    MyStruct_exist exist;
}

typedef MyUnion {
    MyUnion_data data;
    int selection;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_sender sender;
    Actuator_Context_offspring offspring;
    Actuator_Context_my_union my_union;
    Actuator_Context_my_union_det my_union_det;
    Actuator_Context_my_bool my_bool;
    Actuator_Context_my_array my_array;
    Actuator_Context_my_derived_array my_derived_array;
    Actuator_Context_my_int my_int;
    Actuator_Context_my_struct my_struct;
    Actuator_Context_my_enum my_enum;
    Actuator_Context_my_fixed my_fixed;
    Actuator_Context_my_derived_fixed my_derived_fixed;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_sender sender;
    Controller_Context_offspring offspring;
    Controller_Context_error error;
    Controller_Context_reached reached;
    Controller_Context_my_union my_union;
    Controller_Context_my_bool my_bool;
    Controller_Context_my_arr my_arr;
    Controller_Context_my_int my_int;
    Controller_Context_my_struct my_struct;
    Controller_Context_my_enum my_enum;
    Controller_Context_my_fixed my_fixed;
    Controller_Context_my_derived_array my_derived_array;
    Controller_Context_my_derived_fixed my_derived_fixed;
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
inline Actuator_Context_my_union_speed_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_union_speed_range_check(dst);
}
inline Actuator_Context_my_union_speed_range_check(Actuator_Context_my_union_speed_vc)
{
    assert(((Actuator_Context_my_union_speed_vc >= 0) && (Actuator_Context_my_union_speed_vc <= 10000)));
}
inline Actuator_Context_my_union_accel_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_union_accel_range_check(dst);
}
inline Actuator_Context_my_union_accel_range_check(Actuator_Context_my_union_accel_vc)
{
    assert(((Actuator_Context_my_union_accel_vc >= 0) && (Actuator_Context_my_union_accel_vc <= 10000)));
}
inline Actuator_Context_my_union_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context_my_union_speed_PRESENT);
        Actuator_Context_my_union_speed_assign_value(dst.data.speed, src.data.speed);
    ::  (dst.selection == Actuator_Context_my_union_accel_PRESENT);
        Actuator_Context_my_union_accel_assign_value(dst.data.accel, src.data.accel);
    ::  else;
        skip;
    fi;
}
inline Actuator_context_my_union_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context_my_union_det_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_union_det_range_check(dst);
}
inline Actuator_Context_my_union_det_range_check(Actuator_Context_my_union_det_vc)
{
    assert(((Actuator_Context_my_union_det_vc == Actuator_Context_my_union_det_speed_present) || (Actuator_Context_my_union_det_vc == Actuator_Context_my_union_det_accel_present)));
}
inline Actuator_Context_my_bool_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_bool_range_check(dst);
}
inline Actuator_Context_my_bool_range_check(Actuator_Context_my_bool_vc)
{
    assert(true);
}
inline Actuator_Context_my_array_elem_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_array_elem_range_check(dst);
}
inline Actuator_Context_my_array_elem_range_check(Actuator_Context_my_array_elem_vc)
{
    assert(((Actuator_Context_my_array_elem_vc >= 0) && (Actuator_Context_my_array_elem_vc <= 10000)));
}
inline Actuator_Context_my_array_elem_init_value(dst)
{
    Actuator_Context_my_array_elem_assign_value(dst, 0);
}
inline Actuator_Context_my_array_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        Actuator_Context_my_array_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 5)
    {
        Actuator_Context_my_array_elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline Actuator_Context_my_array_size_check(Actuator_Context_my_array_sc)
{
    assert(((Actuator_Context_my_array_sc >= 1) && (Actuator_Context_my_array_sc <= 6)));
}
inline Actuator_Context_my_derived_array_elem_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_derived_array_elem_range_check(dst);
}
inline Actuator_Context_my_derived_array_elem_range_check(Actuator_Context_my_derived_array_elem_vc)
{
    assert(((Actuator_Context_my_derived_array_elem_vc >= 0) && (Actuator_Context_my_derived_array_elem_vc <= 10000)));
}
inline Actuator_Context_my_derived_array_elem_init_value(dst)
{
    Actuator_Context_my_derived_array_elem_assign_value(dst, 0);
}
inline Actuator_Context_my_derived_array_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        Actuator_Context_my_derived_array_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 2)
    {
        Actuator_Context_my_derived_array_elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline Actuator_Context_my_derived_array_size_check(Actuator_Context_my_derived_array_sc)
{
    assert(((Actuator_Context_my_derived_array_sc >= 1) && (Actuator_Context_my_derived_array_sc <= 3)));
}
inline Actuator_Context_my_int_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_int_range_check(dst);
}
inline Actuator_Context_my_int_range_check(Actuator_Context_my_int_vc)
{
    assert(((Actuator_Context_my_int_vc >= 0) && (Actuator_Context_my_int_vc <= 10000)));
}
inline Actuator_Context_my_struct_mass_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_struct_mass_range_check(dst);
}
inline Actuator_Context_my_struct_mass_range_check(Actuator_Context_my_struct_mass_vc)
{
    assert(((Actuator_Context_my_struct_mass_vc >= 0) && (Actuator_Context_my_struct_mass_vc <= 10000)));
}
inline Actuator_Context_my_struct_charge_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_struct_charge_range_check(dst);
}
inline Actuator_Context_my_struct_charge_range_check(Actuator_Context_my_struct_charge_vc)
{
    assert(((Actuator_Context_my_struct_charge_vc >= 0) && (Actuator_Context_my_struct_charge_vc <= 10000)));
}
inline Actuator_Context_my_struct_assign_value(dst, src)
{
    Actuator_Context_my_struct_mass_assign_value(dst.mass, src.mass);
    Actuator_Context_my_struct_charge_assign_value(dst.charge, src.charge);
    dst.exist.charge = src.exist.charge;
}
inline Actuator_Context_my_enum_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_enum_range_check(dst);
}
inline Actuator_Context_my_enum_range_check(Actuator_Context_my_enum_vc)
{
    assert(((Actuator_Context_my_enum_vc == Actuator_Context_my_enum_speed) || (Actuator_Context_my_enum_vc == Actuator_Context_my_enum_accel)));
}
inline Actuator_Context_my_fixed_elem_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_fixed_elem_range_check(dst);
}
inline Actuator_Context_my_fixed_elem_range_check(Actuator_Context_my_fixed_elem_vc)
{
    assert(((Actuator_Context_my_fixed_elem_vc >= 0) && (Actuator_Context_my_fixed_elem_vc <= 10000)));
}
inline Actuator_Context_my_fixed_elem_init_value(dst)
{
    Actuator_Context_my_fixed_elem_assign_value(dst, 0);
}
inline Actuator_Context_my_fixed_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. 1)
    {
        Actuator_Context_my_fixed_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
}
inline Actuator_Context_my_derived_fixed_elem_assign_value(dst, src)
{
    dst = src;
    Actuator_Context_my_derived_fixed_elem_range_check(dst);
}
inline Actuator_Context_my_derived_fixed_elem_range_check(Actuator_Context_my_derived_fixed_elem_vc)
{
    assert(((Actuator_Context_my_derived_fixed_elem_vc >= 0) && (Actuator_Context_my_derived_fixed_elem_vc <= 10000)));
}
inline Actuator_Context_my_derived_fixed_elem_init_value(dst)
{
    Actuator_Context_my_derived_fixed_elem_assign_value(dst, 0);
}
inline Actuator_Context_my_derived_fixed_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. 1)
    {
        Actuator_Context_my_derived_fixed_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context_state_assign_value(dst.state, src.state);
    Actuator_Context_init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context_sender_assign_value(dst.sender, src.sender);
    Actuator_Context_offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context_my_union_assign_value(dst.my_union, src.my_union);
    Actuator_Context_my_union_det_assign_value(dst.my_union_det, src.my_union_det);
    Actuator_Context_my_bool_assign_value(dst.my_bool, src.my_bool);
    Actuator_Context_my_array_assign_value(dst.my_array, src.my_array);
    Actuator_Context_my_derived_array_assign_value(dst.my_derived_array, src.my_derived_array);
    Actuator_Context_my_int_assign_value(dst.my_int, src.my_int);
    Actuator_Context_my_struct_assign_value(dst.my_struct, src.my_struct);
    Actuator_Context_my_enum_assign_value(dst.my_enum, src.my_enum);
    Actuator_Context_my_fixed_assign_value(dst.my_fixed, src.my_fixed);
    Actuator_Context_my_derived_fixed_assign_value(dst.my_derived_fixed, src.my_derived_fixed);
}
inline Actuator_Myunion_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Myunion_Selection_range_check(dst);
}
inline Actuator_Myunion_Selection_range_check(Actuator_Myunion_Selection_vc)
{
    assert(((Actuator_Myunion_Selection_vc == Actuator_Myunion_Selection_speed_present) || (Actuator_Myunion_Selection_vc == Actuator_Myunion_Selection_accel_present)));
}
inline Controller_States_assign_value(dst, src)
{
    dst = src;
    Controller_States_range_check(dst);
}
inline Controller_States_range_check(Controller_States_vc)
{
    assert((((((((((((((((((((Controller_States_vc == Controller_States_checklengthb) || (Controller_States_vc == Controller_States_checkexista)) || (Controller_States_vc == Controller_States_checklengtha)) || (Controller_States_vc == Controller_States_checklengthderivedfixed)) || (Controller_States_vc == Controller_States_checknumb)) || (Controller_States_vc == Controller_States_reached)) || (Controller_States_vc == Controller_States_error)) || (Controller_States_vc == Controller_States_checkvala)) || (Controller_States_vc == Controller_States_checktoenuma)) || (Controller_States_vc == Controller_States_checktoselectorb)) || (Controller_States_vc == Controller_States_checkvalb)) || (Controller_States_vc == Controller_States_checklengthderivedarray)) || (Controller_States_vc == Controller_States_checknuma)) || (Controller_States_vc == Controller_States_checktoenumb)) || (Controller_States_vc == Controller_States_checkpresentb)) || (Controller_States_vc == Controller_States_checktoselectora)) || (Controller_States_vc == Controller_States_checkexistb)) || (Controller_States_vc == Controller_States_checklengthfixed)) || (Controller_States_vc == Controller_States_checkpresenta)));
}
inline Controller_Context_state_assign_value(dst, src)
{
    dst = src;
    Controller_Context_state_range_check(dst);
}
inline Controller_Context_state_range_check(Controller_Context_state_vc)
{
    assert((((((((((((((((((((Controller_Context_state_vc == Controller_Context_state_checklengthb) || (Controller_Context_state_vc == Controller_Context_state_checkexista)) || (Controller_Context_state_vc == Controller_Context_state_checklengtha)) || (Controller_Context_state_vc == Controller_Context_state_checklengthderivedfixed)) || (Controller_Context_state_vc == Controller_Context_state_checknumb)) || (Controller_Context_state_vc == Controller_Context_state_reached)) || (Controller_Context_state_vc == Controller_Context_state_error)) || (Controller_Context_state_vc == Controller_Context_state_checkvala)) || (Controller_Context_state_vc == Controller_Context_state_checktoenuma)) || (Controller_Context_state_vc == Controller_Context_state_checktoselectorb)) || (Controller_Context_state_vc == Controller_Context_state_checkvalb)) || (Controller_Context_state_vc == Controller_Context_state_checklengthderivedarray)) || (Controller_Context_state_vc == Controller_Context_state_checknuma)) || (Controller_Context_state_vc == Controller_Context_state_checktoenumb)) || (Controller_Context_state_vc == Controller_Context_state_checkpresentb)) || (Controller_Context_state_vc == Controller_Context_state_checktoselectora)) || (Controller_Context_state_vc == Controller_Context_state_checkexistb)) || (Controller_Context_state_vc == Controller_Context_state_checklengthfixed)) || (Controller_Context_state_vc == Controller_Context_state_checkpresenta)));
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
inline Controller_Context_error_assign_value(dst, src)
{
    dst = src;
    Controller_Context_error_range_check(dst);
}
inline Controller_Context_error_range_check(Controller_Context_error_vc)
{
    assert(((Controller_Context_error_vc >= 0) && (Controller_Context_error_vc <= 10000)));
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
inline Controller_Context_my_union_speed_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_union_speed_range_check(dst);
}
inline Controller_Context_my_union_speed_range_check(Controller_Context_my_union_speed_vc)
{
    assert(((Controller_Context_my_union_speed_vc >= 0) && (Controller_Context_my_union_speed_vc <= 10000)));
}
inline Controller_Context_my_union_accel_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_union_accel_range_check(dst);
}
inline Controller_Context_my_union_accel_range_check(Controller_Context_my_union_accel_vc)
{
    assert(((Controller_Context_my_union_accel_vc >= 0) && (Controller_Context_my_union_accel_vc <= 10000)));
}
inline Controller_Context_my_union_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Controller_Context_my_union_speed_PRESENT);
        Controller_Context_my_union_speed_assign_value(dst.data.speed, src.data.speed);
    ::  (dst.selection == Controller_Context_my_union_accel_PRESENT);
        Controller_Context_my_union_accel_assign_value(dst.data.accel, src.data.accel);
    ::  else;
        skip;
    fi;
}
inline Controller_context_my_union_selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_my_bool_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_bool_range_check(dst);
}
inline Controller_Context_my_bool_range_check(Controller_Context_my_bool_vc)
{
    assert(true);
}
inline Controller_Context_my_arr_elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_arr_elem_range_check(dst);
}
inline Controller_Context_my_arr_elem_range_check(Controller_Context_my_arr_elem_vc)
{
    assert(((Controller_Context_my_arr_elem_vc >= 0) && (Controller_Context_my_arr_elem_vc <= 10000)));
}
inline Controller_Context_my_arr_elem_init_value(dst)
{
    Controller_Context_my_arr_elem_assign_value(dst, 0);
}
inline Controller_Context_my_arr_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        Controller_Context_my_arr_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 5)
    {
        Controller_Context_my_arr_elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline Controller_Context_my_arr_size_check(Controller_Context_my_arr_sc)
{
    assert(((Controller_Context_my_arr_sc >= 1) && (Controller_Context_my_arr_sc <= 6)));
}
inline Controller_Context_my_int_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_int_range_check(dst);
}
inline Controller_Context_my_int_range_check(Controller_Context_my_int_vc)
{
    assert(((Controller_Context_my_int_vc >= 0) && (Controller_Context_my_int_vc <= 10000)));
}
inline Controller_Context_my_struct_mass_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_struct_mass_range_check(dst);
}
inline Controller_Context_my_struct_mass_range_check(Controller_Context_my_struct_mass_vc)
{
    assert(((Controller_Context_my_struct_mass_vc >= 0) && (Controller_Context_my_struct_mass_vc <= 10000)));
}
inline Controller_Context_my_struct_charge_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_struct_charge_range_check(dst);
}
inline Controller_Context_my_struct_charge_range_check(Controller_Context_my_struct_charge_vc)
{
    assert(((Controller_Context_my_struct_charge_vc >= 0) && (Controller_Context_my_struct_charge_vc <= 10000)));
}
inline Controller_Context_my_struct_assign_value(dst, src)
{
    Controller_Context_my_struct_mass_assign_value(dst.mass, src.mass);
    Controller_Context_my_struct_charge_assign_value(dst.charge, src.charge);
    dst.exist.charge = src.exist.charge;
}
inline Controller_Context_my_enum_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_enum_range_check(dst);
}
inline Controller_Context_my_enum_range_check(Controller_Context_my_enum_vc)
{
    assert(((Controller_Context_my_enum_vc == Controller_Context_my_enum_speed) || (Controller_Context_my_enum_vc == Controller_Context_my_enum_accel)));
}
inline Controller_Context_my_fixed_elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_fixed_elem_range_check(dst);
}
inline Controller_Context_my_fixed_elem_range_check(Controller_Context_my_fixed_elem_vc)
{
    assert(((Controller_Context_my_fixed_elem_vc >= 0) && (Controller_Context_my_fixed_elem_vc <= 10000)));
}
inline Controller_Context_my_fixed_elem_init_value(dst)
{
    Controller_Context_my_fixed_elem_assign_value(dst, 0);
}
inline Controller_Context_my_fixed_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. 1)
    {
        Controller_Context_my_fixed_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
}
inline Controller_Context_my_derived_array_elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_derived_array_elem_range_check(dst);
}
inline Controller_Context_my_derived_array_elem_range_check(Controller_Context_my_derived_array_elem_vc)
{
    assert(((Controller_Context_my_derived_array_elem_vc >= 0) && (Controller_Context_my_derived_array_elem_vc <= 10000)));
}
inline Controller_Context_my_derived_array_elem_init_value(dst)
{
    Controller_Context_my_derived_array_elem_assign_value(dst, 0);
}
inline Controller_Context_my_derived_array_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        Controller_Context_my_derived_array_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 2)
    {
        Controller_Context_my_derived_array_elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline Controller_Context_my_derived_array_size_check(Controller_Context_my_derived_array_sc)
{
    assert(((Controller_Context_my_derived_array_sc >= 1) && (Controller_Context_my_derived_array_sc <= 3)));
}
inline Controller_Context_my_derived_fixed_elem_assign_value(dst, src)
{
    dst = src;
    Controller_Context_my_derived_fixed_elem_range_check(dst);
}
inline Controller_Context_my_derived_fixed_elem_range_check(Controller_Context_my_derived_fixed_elem_vc)
{
    assert(((Controller_Context_my_derived_fixed_elem_vc >= 0) && (Controller_Context_my_derived_fixed_elem_vc <= 10000)));
}
inline Controller_Context_my_derived_fixed_elem_init_value(dst)
{
    Controller_Context_my_derived_fixed_elem_assign_value(dst, 0);
}
inline Controller_Context_my_derived_fixed_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. 1)
    {
        Controller_Context_my_derived_fixed_elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_sender_assign_value(dst.sender, src.sender);
    Controller_Context_offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context_error_assign_value(dst.error, src.error);
    Controller_Context_reached_assign_value(dst.reached, src.reached);
    Controller_Context_my_union_assign_value(dst.my_union, src.my_union);
    Controller_Context_my_bool_assign_value(dst.my_bool, src.my_bool);
    Controller_Context_my_arr_assign_value(dst.my_arr, src.my_arr);
    Controller_Context_my_int_assign_value(dst.my_int, src.my_int);
    Controller_Context_my_struct_assign_value(dst.my_struct, src.my_struct);
    Controller_Context_my_enum_assign_value(dst.my_enum, src.my_enum);
    Controller_Context_my_fixed_assign_value(dst.my_fixed, src.my_fixed);
    Controller_Context_my_derived_array_assign_value(dst.my_derived_array, src.my_derived_array);
    Controller_Context_my_derived_fixed_assign_value(dst.my_derived_fixed, src.my_derived_fixed);
}
inline Controller_Myunion_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Myunion_Selection_range_check(dst);
}
inline Controller_Myunion_Selection_range_check(Controller_Myunion_Selection_vc)
{
    assert(((Controller_Myunion_Selection_vc == Controller_Myunion_Selection_speed_present) || (Controller_Myunion_Selection_vc == Controller_Myunion_Selection_accel_present)));
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
inline MyBoolean_assign_value(dst, src)
{
    dst = src;
    MyBoolean_range_check(dst);
}
inline MyBoolean_range_check(MyBoolean_vc)
{
    assert(true);
}
inline MyArray_elem_assign_value(dst, src)
{
    dst = src;
    MyArray_elem_range_check(dst);
}
inline MyArray_elem_range_check(MyArray_elem_vc)
{
    assert(((MyArray_elem_vc >= 0) && (MyArray_elem_vc <= 10000)));
}
inline MyArray_elem_init_value(dst)
{
    MyArray_elem_assign_value(dst, 0);
}
inline MyArray_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. (src.length - 1))
    {
        MyArray_elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
    for(i_0 : src.length .. 5)
    {
        MyArray_elem_init_value(dst.data[i_0]);
    }
    dst.length = src.length;
}
inline MyArray_size_check(MyArray_sc)
{
    assert(((MyArray_sc >= 1) && (MyArray_sc <= 6)));
}
inline MyDerivedArray_elem_assign_value(dst, src)
{
    dst = src;
    MyDerivedArray_elem_range_check(dst);
}
inline MyDerivedArray_elem_range_check(MyDerivedArray_elem_vc)
{
    assert(((MyDerivedArray_elem_vc >= 0) && (MyDerivedArray_elem_vc <= 10000)));
}
inline MyDerivedArray_elem_init_value(dst)
{
    MyDerivedArray_elem_assign_value(dst, 0);
}
inline MyDerivedArray_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. (src.length - 1))
    {
        MyDerivedArray_elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
    for(i_0 : src.length .. 2)
    {
        MyDerivedArray_elem_init_value(dst.data[i_0]);
    }
    dst.length = src.length;
}
inline MyDerivedArray_size_check(MyDerivedArray_sc)
{
    assert(((MyDerivedArray_sc >= 1) && (MyDerivedArray_sc <= 3)));
}
inline MyUnion_speed_assign_value(dst, src)
{
    dst = src;
    MyUnion_speed_range_check(dst);
}
inline MyUnion_speed_range_check(MyUnion_speed_vc)
{
    assert(((MyUnion_speed_vc >= 0) && (MyUnion_speed_vc <= 10000)));
}
inline MyUnion_accel_assign_value(dst, src)
{
    dst = src;
    MyUnion_accel_range_check(dst);
}
inline MyUnion_accel_range_check(MyUnion_accel_vc)
{
    assert(((MyUnion_accel_vc >= 0) && (MyUnion_accel_vc <= 10000)));
}
inline MyUnion_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == MyUnion_speed_PRESENT);
        MyUnion_speed_assign_value(dst.data.speed, src.data.speed);
    ::  (dst.selection == MyUnion_accel_PRESENT);
        MyUnion_accel_assign_value(dst.data.accel, src.data.accel);
    ::  else;
        skip;
    fi;
}
inline Myunion_selection_assign_value(dst, src)
{
    dst = src;
}
inline MyEnum_assign_value(dst, src)
{
    dst = src;
    MyEnum_range_check(dst);
}
inline MyEnum_range_check(MyEnum_vc)
{
    assert(((MyEnum_vc == MyEnum_speed) || (MyEnum_vc == MyEnum_accel)));
}
inline MyStruct_mass_assign_value(dst, src)
{
    dst = src;
    MyStruct_mass_range_check(dst);
}
inline MyStruct_mass_range_check(MyStruct_mass_vc)
{
    assert(((MyStruct_mass_vc >= 0) && (MyStruct_mass_vc <= 10000)));
}
inline MyStruct_charge_assign_value(dst, src)
{
    dst = src;
    MyStruct_charge_range_check(dst);
}
inline MyStruct_charge_range_check(MyStruct_charge_vc)
{
    assert(((MyStruct_charge_vc >= 0) && (MyStruct_charge_vc <= 10000)));
}
inline MyStruct_assign_value(dst, src)
{
    MyStruct_mass_assign_value(dst.mass, src.mass);
    MyStruct_charge_assign_value(dst.charge, src.charge);
    dst.exist.charge = src.exist.charge;
}
inline MyFixed_elem_assign_value(dst, src)
{
    dst = src;
    MyFixed_elem_range_check(dst);
}
inline MyFixed_elem_range_check(MyFixed_elem_vc)
{
    assert(((MyFixed_elem_vc >= 0) && (MyFixed_elem_vc <= 10000)));
}
inline MyFixed_elem_init_value(dst)
{
    MyFixed_elem_assign_value(dst, 0);
}
inline MyFixed_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. 1)
    {
        MyFixed_elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
}
inline MyDerivedFixed_elem_assign_value(dst, src)
{
    dst = src;
    MyDerivedFixed_elem_range_check(dst);
}
inline MyDerivedFixed_elem_range_check(MyDerivedFixed_elem_vc)
{
    assert(((MyDerivedFixed_elem_vc >= 0) && (MyDerivedFixed_elem_vc <= 10000)));
}
inline MyDerivedFixed_elem_init_value(dst)
{
    MyDerivedFixed_elem_assign_value(dst, 0);
}
inline MyDerivedFixed_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. 1)
    {
        MyDerivedFixed_elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
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
