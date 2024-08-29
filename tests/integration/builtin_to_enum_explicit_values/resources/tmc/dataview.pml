#define Actuator_States int
#define Actuator_Context__state int
#define Actuator_Context__init_done bool
#define Actuator_Context__sender int
#define Actuator_Context__offspring int
#define Actuator_Context__mem_base__db_memory int
#define Actuator_Context__mem_base__spare_memory int
#define Actuator_Context__mem_id int
#define Actuator_Alpha_Memory_Base_Selection int
#define Actuator_T_Runtime_Error_Selection int
#define Controller_States int
#define Controller_Context__state int
#define Controller_Context__init_done bool
#define Controller_Context__sender int
#define Controller_Context__offspring int
#define Controller_Context__mem_base__db_memory int
#define Controller_Context__mem_base__spare_memory int
#define Controller_Context__mem_id int
#define Controller_Alpha_Memory_Base_Selection int
#define Controller_T_Runtime_Error_Selection int
#define MyInteger int
#define ALPHA_MEMORY_IDENTIFIER int
#define ALPHA_MEMORY_BASE__db_memory int
#define ALPHA_MEMORY_BASE__spare_memory int
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
#define Actuator_Context__sender_actuator 0
#define Actuator_Context__sender_controller 1
#define Actuator_Context__sender_environ 2
#define Actuator_Context__sender_env 3
#define Actuator_Context__offspring_actuator 0
#define Actuator_Context__offspring_controller 1
#define Actuator_Context__offspring_environ 2
#define Actuator_Context__offspring_env 3
#define Actuator_Context__mem_base_NONE 0
#define Actuator_Context__mem_base_ram_memory_PRESENT 1
#define Actuator_context__mem_base_selection_ram_memory_PRESENT 1
#define Actuator_Context__mem_base_db_memory_PRESENT 2
#define Actuator_context__mem_base_selection_db_memory_PRESENT 2
#define Actuator_Context__mem_base_spare_memory_PRESENT 3
#define Actuator_context__mem_base_selection_spare_memory_PRESENT 3
#define Actuator_Context__mem_id_ram_memory 1
#define Actuator_Context__mem_id_db_memory 2
#define Actuator_Context__mem_id_spare_memory 100
#define Actuator_Alpha_Memory_Base_Selection_ram_memory_present 1
#define Actuator_Alpha_Memory_Base_Selection_db_memory_present 2
#define Actuator_Alpha_Memory_Base_Selection_spare_memory_present 3
#define Actuator_T_Runtime_Error_Selection_noerror_present 1
#define Actuator_T_Runtime_Error_Selection_encodeerror_present 2
#define Actuator_T_Runtime_Error_Selection_decodeerror_present 3
#define Controller_States_waitforspare 0
#define Controller_States_error 1
#define Controller_States_waitforram 2
#define Controller_States_waitfordb 3
#define Controller_Context__state_waitforspare 0
#define Controller_Context__state_error 1
#define Controller_Context__state_waitforram 2
#define Controller_Context__state_waitfordb 3
#define Controller_Context__sender_actuator 0
#define Controller_Context__sender_controller 1
#define Controller_Context__sender_environ 2
#define Controller_Context__sender_env 3
#define Controller_Context__offspring_actuator 0
#define Controller_Context__offspring_controller 1
#define Controller_Context__offspring_environ 2
#define Controller_Context__offspring_env 3
#define Controller_Context__mem_base_NONE 0
#define Controller_Context__mem_base_ram_memory_PRESENT 1
#define Controller_context__mem_base_selection_ram_memory_PRESENT 1
#define Controller_Context__mem_base_db_memory_PRESENT 2
#define Controller_context__mem_base_selection_db_memory_PRESENT 2
#define Controller_Context__mem_base_spare_memory_PRESENT 3
#define Controller_context__mem_base_selection_spare_memory_PRESENT 3
#define Controller_Context__mem_id_ram_memory 1
#define Controller_Context__mem_id_db_memory 2
#define Controller_Context__mem_id_spare_memory 100
#define Controller_Alpha_Memory_Base_Selection_ram_memory_present 1
#define Controller_Alpha_Memory_Base_Selection_db_memory_present 2
#define Controller_Alpha_Memory_Base_Selection_spare_memory_present 3
#define Controller_T_Runtime_Error_Selection_noerror_present 1
#define Controller_T_Runtime_Error_Selection_encodeerror_present 2
#define Controller_T_Runtime_Error_Selection_decodeerror_present 3
#define ALPHA_MEMORY_IDENTIFIER_ram_memory 1
#define ALPHA_MEMORY_IDENTIFIER_db_memory 2
#define ALPHA_MEMORY_IDENTIFIER_spare_memory 100
#define ALPHA_MEMORY_BASE_NONE 0
#define ALPHA_MEMORY_BASE_ram_memory_PRESENT 1
#define Alpha_memory_base_selection_ram_memory_PRESENT 1
#define ALPHA_MEMORY_BASE_db_memory_PRESENT 2
#define Alpha_memory_base_selection_db_memory_PRESENT 2
#define ALPHA_MEMORY_BASE_spare_memory_PRESENT 3
#define Alpha_memory_base_selection_spare_memory_PRESENT 3
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
typedef ALPHA_EMPTY {
    bit dummy;
}

typedef ALPHA_MEMORY_BASE__ram_memory {
    bit dummy;
}

typedef ALPHA_MEMORY_BASE_data {
    ALPHA_MEMORY_BASE__ram_memory ram_memory;
    ALPHA_MEMORY_BASE__db_memory db_memory;
    ALPHA_MEMORY_BASE__spare_memory spare_memory;
}

typedef Actuator_Context__mem_base__ram_memory {
    bit dummy;
}

typedef Actuator_Context__mem_base_data {
    Actuator_Context__mem_base__ram_memory ram_memory;
    Actuator_Context__mem_base__db_memory db_memory;
    Actuator_Context__mem_base__spare_memory spare_memory;
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

typedef Controller_Context__mem_base__ram_memory {
    bit dummy;
}

typedef Controller_Context__mem_base_data {
    Controller_Context__mem_base__ram_memory ram_memory;
    Controller_Context__mem_base__db_memory db_memory;
    Controller_Context__mem_base__spare_memory spare_memory;
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

typedef ALPHA_MEMORY_BASE {
    ALPHA_MEMORY_BASE_data data;
    int selection;
}

typedef Actuator_Context__mem_base {
    Actuator_Context__mem_base_data data;
    int selection;
}

typedef AggregateTimerData {
    AggregateTimerData__actuator actuator;
    AggregateTimerData__controller controller;
    AggregateTimerData__dummy_entry dummy_entry;
}

typedef Controller_Context__mem_base {
    Controller_Context__mem_base_data data;
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
    Actuator_Context__mem_base mem_base;
    Actuator_Context__mem_id mem_id;
}

typedef Controller_Context {
    Controller_Context__state state;
    Controller_Context__init_done init_done;
    Controller_Context__sender sender;
    Controller_Context__offspring offspring;
    Controller_Context__mem_base mem_base;
    Controller_Context__mem_id mem_id;
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
inline Actuator_Context__mem_base__ram_memory_assign_value(dst, src)
{
    skip;
}
inline Actuator_Context__mem_base__db_memory_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__mem_base__db_memory_range_check(dst);
}
inline Actuator_Context__mem_base__db_memory_range_check(Actuator_Context__mem_base__db_memory_vc)
{
    assert(((Actuator_Context__mem_base__db_memory_vc >= 0) && (Actuator_Context__mem_base__db_memory_vc <= 10000)));
}
inline Actuator_Context__mem_base__spare_memory_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__mem_base__spare_memory_range_check(dst);
}
inline Actuator_Context__mem_base__spare_memory_range_check(Actuator_Context__mem_base__spare_memory_vc)
{
    assert(((Actuator_Context__mem_base__spare_memory_vc >= 0) && (Actuator_Context__mem_base__spare_memory_vc <= 10000)));
}
inline Actuator_Context__mem_base_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Actuator_Context__mem_base_ram_memory_PRESENT);
        Actuator_Context__mem_base__ram_memory_assign_value(dst.data.ram_memory, src.data.ram_memory);
    ::  (dst.selection == Actuator_Context__mem_base_db_memory_PRESENT);
        Actuator_Context__mem_base__db_memory_assign_value(dst.data.db_memory, src.data.db_memory);
    ::  (dst.selection == Actuator_Context__mem_base_spare_memory_PRESENT);
        Actuator_Context__mem_base__spare_memory_assign_value(dst.data.spare_memory, src.data.spare_memory);
    ::  else;
        skip;
    fi;
}
inline Actuator_context__mem_base_selection_assign_value(dst, src)
{
    dst = src;
}
inline Actuator_Context__mem_id_assign_value(dst, src)
{
    dst = src;
    Actuator_Context__mem_id_range_check(dst);
}
inline Actuator_Context__mem_id_range_check(Actuator_Context__mem_id_vc)
{
    assert((((Actuator_Context__mem_id_vc == Actuator_Context__mem_id_ram_memory) || (Actuator_Context__mem_id_vc == Actuator_Context__mem_id_db_memory)) || (Actuator_Context__mem_id_vc == Actuator_Context__mem_id_spare_memory)));
}
inline Actuator_Context_assign_value(dst, src)
{
    Actuator_Context__state_assign_value(dst.state, src.state);
    Actuator_Context__init_done_assign_value(dst.init_done, src.init_done);
    Actuator_Context__sender_assign_value(dst.sender, src.sender);
    Actuator_Context__offspring_assign_value(dst.offspring, src.offspring);
    Actuator_Context__mem_base_assign_value(dst.mem_base, src.mem_base);
    Actuator_Context__mem_id_assign_value(dst.mem_id, src.mem_id);
}
inline Actuator_Alpha_Memory_Base_Selection_assign_value(dst, src)
{
    dst = src;
    Actuator_Alpha_Memory_Base_Selection_range_check(dst);
}
inline Actuator_Alpha_Memory_Base_Selection_range_check(Actuator_Alpha_Memory_Base_Selection_vc)
{
    assert((((Actuator_Alpha_Memory_Base_Selection_vc == Actuator_Alpha_Memory_Base_Selection_ram_memory_present) || (Actuator_Alpha_Memory_Base_Selection_vc == Actuator_Alpha_Memory_Base_Selection_db_memory_present)) || (Actuator_Alpha_Memory_Base_Selection_vc == Actuator_Alpha_Memory_Base_Selection_spare_memory_present)));
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
    assert(((((Controller_States_vc == Controller_States_waitforspare) || (Controller_States_vc == Controller_States_error)) || (Controller_States_vc == Controller_States_waitforram)) || (Controller_States_vc == Controller_States_waitfordb)));
}
inline Controller_Context__state_assign_value(dst, src)
{
    dst = src;
    Controller_Context__state_range_check(dst);
}
inline Controller_Context__state_range_check(Controller_Context__state_vc)
{
    assert(((((Controller_Context__state_vc == Controller_Context__state_waitforspare) || (Controller_Context__state_vc == Controller_Context__state_error)) || (Controller_Context__state_vc == Controller_Context__state_waitforram)) || (Controller_Context__state_vc == Controller_Context__state_waitfordb)));
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
inline Controller_Context__mem_base__ram_memory_assign_value(dst, src)
{
    skip;
}
inline Controller_Context__mem_base__db_memory_assign_value(dst, src)
{
    dst = src;
    Controller_Context__mem_base__db_memory_range_check(dst);
}
inline Controller_Context__mem_base__db_memory_range_check(Controller_Context__mem_base__db_memory_vc)
{
    assert(((Controller_Context__mem_base__db_memory_vc >= 0) && (Controller_Context__mem_base__db_memory_vc <= 10000)));
}
inline Controller_Context__mem_base__spare_memory_assign_value(dst, src)
{
    dst = src;
    Controller_Context__mem_base__spare_memory_range_check(dst);
}
inline Controller_Context__mem_base__spare_memory_range_check(Controller_Context__mem_base__spare_memory_vc)
{
    assert(((Controller_Context__mem_base__spare_memory_vc >= 0) && (Controller_Context__mem_base__spare_memory_vc <= 10000)));
}
inline Controller_Context__mem_base_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == Controller_Context__mem_base_ram_memory_PRESENT);
        Controller_Context__mem_base__ram_memory_assign_value(dst.data.ram_memory, src.data.ram_memory);
    ::  (dst.selection == Controller_Context__mem_base_db_memory_PRESENT);
        Controller_Context__mem_base__db_memory_assign_value(dst.data.db_memory, src.data.db_memory);
    ::  (dst.selection == Controller_Context__mem_base_spare_memory_PRESENT);
        Controller_Context__mem_base__spare_memory_assign_value(dst.data.spare_memory, src.data.spare_memory);
    ::  else;
        skip;
    fi;
}
inline Controller_context__mem_base_selection_assign_value(dst, src)
{
    dst = src;
}
inline Controller_Context__mem_id_assign_value(dst, src)
{
    dst = src;
    Controller_Context__mem_id_range_check(dst);
}
inline Controller_Context__mem_id_range_check(Controller_Context__mem_id_vc)
{
    assert((((Controller_Context__mem_id_vc == Controller_Context__mem_id_ram_memory) || (Controller_Context__mem_id_vc == Controller_Context__mem_id_db_memory)) || (Controller_Context__mem_id_vc == Controller_Context__mem_id_spare_memory)));
}
inline Controller_Context_assign_value(dst, src)
{
    Controller_Context__state_assign_value(dst.state, src.state);
    Controller_Context__init_done_assign_value(dst.init_done, src.init_done);
    Controller_Context__sender_assign_value(dst.sender, src.sender);
    Controller_Context__offspring_assign_value(dst.offspring, src.offspring);
    Controller_Context__mem_base_assign_value(dst.mem_base, src.mem_base);
    Controller_Context__mem_id_assign_value(dst.mem_id, src.mem_id);
}
inline Controller_Alpha_Memory_Base_Selection_assign_value(dst, src)
{
    dst = src;
    Controller_Alpha_Memory_Base_Selection_range_check(dst);
}
inline Controller_Alpha_Memory_Base_Selection_range_check(Controller_Alpha_Memory_Base_Selection_vc)
{
    assert((((Controller_Alpha_Memory_Base_Selection_vc == Controller_Alpha_Memory_Base_Selection_ram_memory_present) || (Controller_Alpha_Memory_Base_Selection_vc == Controller_Alpha_Memory_Base_Selection_db_memory_present)) || (Controller_Alpha_Memory_Base_Selection_vc == Controller_Alpha_Memory_Base_Selection_spare_memory_present)));
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
inline ALPHA_EMPTY_assign_value(dst, src)
{
    skip;
}
inline ALPHA_MEMORY_IDENTIFIER_assign_value(dst, src)
{
    dst = src;
    ALPHA_MEMORY_IDENTIFIER_range_check(dst);
}
inline ALPHA_MEMORY_IDENTIFIER_range_check(ALPHA_MEMORY_IDENTIFIER_vc)
{
    assert((((ALPHA_MEMORY_IDENTIFIER_vc == ALPHA_MEMORY_IDENTIFIER_ram_memory) || (ALPHA_MEMORY_IDENTIFIER_vc == ALPHA_MEMORY_IDENTIFIER_db_memory)) || (ALPHA_MEMORY_IDENTIFIER_vc == ALPHA_MEMORY_IDENTIFIER_spare_memory)));
}
inline ALPHA_MEMORY_BASE__ram_memory_assign_value(dst, src)
{
    skip;
}
inline ALPHA_MEMORY_BASE__db_memory_assign_value(dst, src)
{
    dst = src;
    ALPHA_MEMORY_BASE__db_memory_range_check(dst);
}
inline ALPHA_MEMORY_BASE__db_memory_range_check(ALPHA_MEMORY_BASE__db_memory_vc)
{
    assert(((ALPHA_MEMORY_BASE__db_memory_vc >= 0) && (ALPHA_MEMORY_BASE__db_memory_vc <= 10000)));
}
inline ALPHA_MEMORY_BASE__spare_memory_assign_value(dst, src)
{
    dst = src;
    ALPHA_MEMORY_BASE__spare_memory_range_check(dst);
}
inline ALPHA_MEMORY_BASE__spare_memory_range_check(ALPHA_MEMORY_BASE__spare_memory_vc)
{
    assert(((ALPHA_MEMORY_BASE__spare_memory_vc >= 0) && (ALPHA_MEMORY_BASE__spare_memory_vc <= 10000)));
}
inline ALPHA_MEMORY_BASE_assign_value(dst, src)
{
    dst.selection = src.selection;
    if
    ::  (dst.selection == ALPHA_MEMORY_BASE_ram_memory_PRESENT);
        ALPHA_MEMORY_BASE__ram_memory_assign_value(dst.data.ram_memory, src.data.ram_memory);
    ::  (dst.selection == ALPHA_MEMORY_BASE_db_memory_PRESENT);
        ALPHA_MEMORY_BASE__db_memory_assign_value(dst.data.db_memory, src.data.db_memory);
    ::  (dst.selection == ALPHA_MEMORY_BASE_spare_memory_PRESENT);
        ALPHA_MEMORY_BASE__spare_memory_assign_value(dst.data.spare_memory, src.data.spare_memory);
    ::  else;
        skip;
    fi;
}
inline Alpha_memory_base_selection_assign_value(dst, src)
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
