#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_first MyState
#define Controller_Context_second MyMusic
#define Controller_Context_third MyData
#define Controller_Context_fourth MyNested
#define Controller_Context_fifth MyTable
#define Controller_Context_sixth MyList
#define Controller_Context_seventh MyExtra
#define Controller_Context_eight MyDouble
#define Controller_Mymusic_Selection int
#define Controller_Mynested_Direction_Selection int
#define Controller_Mytable_Elem_Selection int
#define Controller_Mydouble_Elem_Nested_Elem_Param_Selection int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define MyInteger int
#define MyState_demo_elem int
#define MyState_dim int
#define MyMusic_snare int
#define MyMusic_kick int
#define MyMusic_ride int
#define MyData_raw MyMusic
#define MyData_n int
#define MyNested_direction_x int
#define MyNested_direction_y int
#define MyNested_force int
#define MyTable_elem_store int
#define MyTable_elem_restore int
#define MyList_elem MyMusic
#define MyExtra_elem MyNested
#define MyDouble_elem_dummy int
#define MyDouble_elem_nested_elem_param_a int
#define MyDouble_elem_nested_elem_param_b int
#define MyDouble_elem_nested_elem_nothing int
#define Controller_States_wait 0
#define Controller_Mymusic_Selection_snare_present 1
#define Controller_Mymusic_Selection_kick_present 2
#define Controller_Mymusic_Selection_ride_present 3
#define Controller_Mynested_Direction_Selection_x_present 1
#define Controller_Mynested_Direction_Selection_y_present 2
#define Controller_Mytable_Elem_Selection_store_present 1
#define Controller_Mytable_Elem_Selection_restore_present 2
#define Controller_Mydouble_Elem_Nested_Elem_Param_Selection_a_present 1
#define Controller_Mydouble_Elem_Nested_Elem_Param_Selection_b_present 2
#define MyMusic_NONE 0
#define MyMusic_snare_PRESENT 1
#define MyMusic_kick_PRESENT 2
#define MyMusic_ride_PRESENT 3
#define MyNested_direction_NONE 0
#define MyNested_direction_x_PRESENT 1
#define MyNested_direction_y_PRESENT 2
#define MyTable_elem_NONE 0
#define MyTable_elem_store_PRESENT 1
#define MyTable_elem_restore_PRESENT 2
#define MyDouble_elem_nested_elem_param_NONE 0
#define MyDouble_elem_nested_elem_param_a_PRESENT 1
#define MyDouble_elem_nested_elem_param_b_PRESENT 2
typedef MyDouble_elem_nested_elem_param_data {
    MyDouble_elem_nested_elem_param_a a;
    MyDouble_elem_nested_elem_param_b b;
}

typedef MyMusic_data {
    MyMusic_snare snare;
    MyMusic_kick kick;
    MyMusic_ride ride;
}

typedef MyNested_direction_data {
    MyNested_direction_x x;
    MyNested_direction_y y;
}

typedef MyState_demo {
    MyState_demo_elem data[16];
    int length;
}

typedef MyState_exist {
    bool dim;
}

typedef MyTable_elem_data {
    MyTable_elem_store store;
    MyTable_elem_restore restore;
}

typedef T_Null_Record {
    bit dummy;
}

typedef MyDouble_elem_nested_elem_param {
    MyDouble_elem_nested_elem_param_data data;
    int selection;
}

typedef MyMusic {
    MyMusic_data data;
    int selection;
}

typedef MyNested_direction {
    MyNested_direction_data data;
    int selection;
}

typedef MyState {
    MyState_demo demo;
    MyState_dim dim;
    MyState_exist exist;
}

typedef MyTable_elem {
    MyTable_elem_data data;
    int selection;
}

typedef MyData {
    MyData_raw raw;
    MyData_n n;
}

typedef MyDouble_elem_nested_elem {
    MyDouble_elem_nested_elem_param param;
    MyDouble_elem_nested_elem_nothing nothing;
}

typedef MyList {
    MyList_elem data[12];
    int length;
}

typedef MyNested {
    MyNested_direction direction;
    MyNested_force force;
}

typedef MyTable {
    MyTable_elem data[2];
}

typedef MyDouble_elem_nested {
    MyDouble_elem_nested_elem data[12];
    int length;
}

typedef MyExtra {
    MyExtra_elem data[12];
    int length;
}

typedef MyDouble_elem {
    MyDouble_elem_dummy dummy;
    MyDouble_elem_nested nested;
}

typedef MyDouble {
    MyDouble_elem data[12];
    int length;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_first first;
    Controller_Context_second second;
    Controller_Context_third third;
    Controller_Context_fourth fourth;
    Controller_Context_fifth fifth;
    Controller_Context_sixth sixth;
    Controller_Context_seventh seventh;
    Controller_Context_eight eight;
}

inline Controller_States_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context_state_assign_value(dst.state, src.state);
    Controller_Context_init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context_first_assign_value(dst.first, src.first);
    Controller_Context_second_assign_value(dst.second, src.second);
    Controller_Context_third_assign_value(dst.third, src.third);
    Controller_Context_fourth_assign_value(dst.fourth, src.fourth);
    Controller_Context_fifth_assign_value(dst.fifth, src.fifth);
    Controller_Context_sixth_assign_value(dst.sixth, src.sixth);
    Controller_Context_seventh_assign_value(dst.seventh, src.seventh);
    Controller_Context_eight_assign_value(dst.eight, src.eight);
}
inline Controller_Mymusic_Selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Mynested_Direction_Selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Mytable_Elem_Selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Mydouble_Elem_Nested_Elem_Param_Selection_assign_value(dst, src)
{
    dst = src;
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
inline MyInteger_assign_value(dst, src)
{
    dst = src;
}
inline MyState_demo_elem_assign_value(dst, src)
{
    dst = src;
}
inline MyState_demo_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 15)
    {
        MyState_demo_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline MyState_dim_assign_value(dst, src)
{
    dst = src;
}
inline MyState_assign_value(dst, src)
{
    MyState_demo_assign_value(dst.demo, src.demo);
    MyState_dim_assign_value(dst.dim, src.dim);
    dst.MyState_exist.dim = src.MyState_exist.dim;
}
inline MyMusic_snare_assign_value(dst, src)
{
    dst = src;
}
inline MyMusic_kick_assign_value(dst, src)
{
    dst = src;
}
inline MyMusic_ride_assign_value(dst, src)
{
    dst = src;
}
inline MyMusic_assign_value(dst, src)
{
    MyMusic_snare_assign_value(dst.snare, src.snare);
    MyMusic_kick_assign_value(dst.kick, src.kick);
    MyMusic_ride_assign_value(dst.ride, src.ride);
    dst.selection = src.selection;
}
inline MyData_n_assign_value(dst, src)
{
    dst = src;
}
inline MyData_assign_value(dst, src)
{
    MyData_raw_assign_value(dst.raw, src.raw);
    MyData_n_assign_value(dst.n, src.n);
}
inline MyNested_direction_x_assign_value(dst, src)
{
    dst = src;
}
inline MyNested_direction_y_assign_value(dst, src)
{
    dst = src;
}
inline MyNested_direction_assign_value(dst, src)
{
    MyNested_direction_x_assign_value(dst.x, src.x);
    MyNested_direction_y_assign_value(dst.y, src.y);
    dst.selection = src.selection;
}
inline MyNested_force_assign_value(dst, src)
{
    dst = src;
}
inline MyNested_assign_value(dst, src)
{
    MyNested_direction_assign_value(dst.direction, src.direction);
    MyNested_force_assign_value(dst.force, src.force);
}
inline MyTable_elem_store_assign_value(dst, src)
{
    dst = src;
}
inline MyTable_elem_restore_assign_value(dst, src)
{
    dst = src;
}
inline MyTable_elem_assign_value(dst, src)
{
    MyTable_elem_store_assign_value(dst.store, src.store);
    MyTable_elem_restore_assign_value(dst.restore, src.restore);
    dst.selection = src.selection;
}
inline MyTable_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 1)
    {
        MyTable_assign_value(dst.data[i], src.data[i]);
    }
}
inline MyList_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 11)
    {
        MyList_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline MyExtra_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 11)
    {
        MyExtra_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline MyDouble_elem_dummy_assign_value(dst, src)
{
    dst = src;
}
inline MyDouble_elem_nested_elem_param_a_assign_value(dst, src)
{
    dst = src;
}
inline MyDouble_elem_nested_elem_param_b_assign_value(dst, src)
{
    dst = src;
}
inline MyDouble_elem_nested_elem_param_assign_value(dst, src)
{
    MyDouble_elem_nested_elem_param_a_assign_value(dst.a, src.a);
    MyDouble_elem_nested_elem_param_b_assign_value(dst.b, src.b);
    dst.selection = src.selection;
}
inline MyDouble_elem_nested_elem_nothing_assign_value(dst, src)
{
    dst = src;
}
inline MyDouble_elem_nested_elem_assign_value(dst, src)
{
    MyDouble_elem_nested_elem_param_assign_value(dst.param, src.param);
    MyDouble_elem_nested_elem_nothing_assign_value(dst.nothing, src.nothing);
}
inline MyDouble_elem_nested_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 11)
    {
        MyDouble_elem_nested_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline MyDouble_elem_assign_value(dst, src)
{
    MyDouble_elem_dummy_assign_value(dst.dummy, src.dummy);
    MyDouble_elem_nested_assign_value(dst.nested, src.nested);
}
inline MyDouble_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 11)
    {
        MyDouble_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
