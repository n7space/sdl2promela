#define Lock_States int
#define Lock_Context_state Lock_States
#define Lock_Context_init_done bool
#define Lock_Context_remotewantstoenter T_Boolean
#define Lock_Context_writesize T_UInt8
#define Lock_Context_myprocid T_ProcID
#define Lock_Context_remoteprocid T_ProcID
#define Lock_Context_turn T_ProcID
#define Lock_Context_mywritevalue T_WriteAccess
#define Lock_Context_writecount T_UInt8
#define Lock_Context_turnerror T_Boolean
#define Lock_Context_contentionerror T_Boolean
#define Lock_Context_writerequest T_WriteRequest
#define Lock_Context_startaddress T_UInt16
#define Sharedmemory_States int
#define Sharedmemory_Context_state Sharedmemory_States
#define Sharedmemory_Context_init_done bool
#define Sharedmemory_Context_membuffer T_MemBuffer
#define Sharedmemory_Context_writeaccess T_WriteAccess
#define T_UInt16 int
#define T_WriteAccess_write_address T_UInt16
#define T_WriteAccess_write_value T_UInt8
#define T_ByteArray_elem T_UInt8
#define T_MemBuffer T_ByteArray
#define T_WriteRequest_start_address T_UInt16
#define T_WriteRequest_values T_ByteArray
#define T_ProcID T_UInt8
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define PID int
#define Locka_Event_msg_in_remotesetsturn_p1 T_ProcID
#define Locka_Event_msg_in_remotewantstoenter_p1 T_Boolean
#define Locka_Event_msg_in_writerequest_p1 T_WriteRequest
#define Locka_Event_msg_out_memwrite_p1 T_WriteAccess
#define Locka_Event_msg_out_setturn_p1 T_ProcID
#define Locka_Event_msg_out_wanttoenter_p1 T_Boolean
#define Lockb_Event_msg_in_remotesetsturn_p1 T_ProcID
#define Lockb_Event_msg_in_remotewantstoenter_p1 T_Boolean
#define Lockb_Event_msg_in_writerequest_p1 T_WriteRequest
#define Lockb_Event_msg_out_memwrite_p1 T_WriteAccess
#define Lockb_Event_msg_out_setturn_p1 T_ProcID
#define Lockb_Event_msg_out_wanttoenter_p1 T_Boolean
#define Sharedmemory_Event_msg_in_memwritea_p1 T_WriteAccess
#define Sharedmemory_Event_msg_in_memwriteb_p1 T_WriteAccess
#define Testgui_Event_msg_out_writerequesta_p1 T_WriteRequest
#define Testgui_Event_msg_out_writerequestb_p1 T_WriteRequest
#define Observer_State_Kind int
#define Function_Event_locka Locka_Event
#define Function_Event_lockb Lockb_Event
#define Function_Event_sharedmemory Sharedmemory_Event
#define Function_Event_testgui Testgui_Event
#define Named_Function_Event_event Function_Event
#define Interface_Event_source PID
#define Interface_Event_dest PID
#define Interface_Event_event Function_Event
#define Observable_Event_input_event Interface_Event
#define Observable_Event_output_event Interface_Event
#define Observable_Event_unhandled_input Interface_Event
#define Events_Ty_elem Observable_Event
#define System_State_locka_queue Events_Ty
#define System_State_lockb_queue Events_Ty
#define System_State_sharedmemory_queue Events_Ty
#define System_State_locka Lock_Context
#define System_State_lockb Lock_Context
#define System_State_sharedmemory Sharedmemory_Context
#define Lock_States_wait_nocontention 0
#define Lock_States_writing 1
#define Lock_States_idle 2
#define Lock_States_wait_turn 3
#define Sharedmemory_States_idle 0
#define PID_env 0
#define PID_locka 1
#define PID_lockb 2
#define PID_sharedmemory 3
#define PID_testgui 4
#define Locka_Event_NONE 0
#define Locka_Event_msg_in_NONE 0
#define Locka_Event_msg_in_input_none_PRESENT 1
#define Locka_Event_msg_in_remotesetsturn_PRESENT 2
#define Locka_Event_msg_in_remotewantstoenter_PRESENT 3
#define Locka_Event_msg_in_writerequest_PRESENT 4
#define Locka_Event_msg_in_PRESENT 1
#define Locka_Event_msg_out_NONE 0
#define Locka_Event_msg_out_memwrite_PRESENT 1
#define Locka_Event_msg_out_setturn_PRESENT 2
#define Locka_Event_msg_out_wanttoenter_PRESENT 3
#define Locka_Event_msg_out_writeack_PRESENT 4
#define Locka_Event_msg_out_PRESENT 2
#define Lockb_Event_NONE 0
#define Lockb_Event_msg_in_NONE 0
#define Lockb_Event_msg_in_input_none_PRESENT 1
#define Lockb_Event_msg_in_remotesetsturn_PRESENT 2
#define Lockb_Event_msg_in_remotewantstoenter_PRESENT 3
#define Lockb_Event_msg_in_writerequest_PRESENT 4
#define Lockb_Event_msg_in_PRESENT 1
#define Lockb_Event_msg_out_NONE 0
#define Lockb_Event_msg_out_memwrite_PRESENT 1
#define Lockb_Event_msg_out_setturn_PRESENT 2
#define Lockb_Event_msg_out_wanttoenter_PRESENT 3
#define Lockb_Event_msg_out_writeack_PRESENT 4
#define Lockb_Event_msg_out_PRESENT 2
#define Sharedmemory_Event_NONE 0
#define Sharedmemory_Event_msg_in_NONE 0
#define Sharedmemory_Event_msg_in_input_none_PRESENT 1
#define Sharedmemory_Event_msg_in_memwritea_PRESENT 2
#define Sharedmemory_Event_msg_in_memwriteb_PRESENT 3
#define Sharedmemory_Event_msg_in_PRESENT 1
#define Testgui_Event_NONE 0
#define Testgui_Event_msg_in_NONE 0
#define Testgui_Event_msg_in_writeacka_PRESENT 1
#define Testgui_Event_msg_in_writeackb_PRESENT 2
#define Testgui_Event_msg_in_PRESENT 1
#define Testgui_Event_msg_out_NONE 0
#define Testgui_Event_msg_out_writerequesta_PRESENT 1
#define Testgui_Event_msg_out_writerequestb_PRESENT 2
#define Testgui_Event_msg_out_PRESENT 2
#define Observer_State_Kind_regular_state 0
#define Observer_State_Kind_error_state 1
#define Observer_State_Kind_ignore_state 2
#define Observer_State_Kind_success_state 3
#define Function_Event_NONE 0
#define Function_Event_locka_PRESENT 1
#define Function_Event_lockb_PRESENT 2
#define Function_Event_sharedmemory_PRESENT 3
#define Function_Event_testgui_PRESENT 4
#define Observable_Event_NONE 0
#define Observable_Event_no_event_PRESENT 1
#define Observable_Event_system_startup_PRESENT 2
#define Observable_Event_input_event_PRESENT 3
#define Observable_Event_output_event_PRESENT 4
#define Observable_Event_unhandled_input_PRESENT 5
typedef Locka_Event_msg_in_input_none {
    bit dummy;
}

typedef Locka_Event_msg_in_remotesetsturn {
    Locka_Event_msg_in_remotesetsturn_p1 p1;
}

typedef Locka_Event_msg_in_remotewantstoenter {
    Locka_Event_msg_in_remotewantstoenter_p1 p1;
}

typedef Locka_Event_msg_out_setturn {
    Locka_Event_msg_out_setturn_p1 p1;
}

typedef Locka_Event_msg_out_wanttoenter {
    Locka_Event_msg_out_wanttoenter_p1 p1;
}

typedef Locka_Event_msg_out_writeack {
    bit dummy;
}

typedef Lockb_Event_msg_in_input_none {
    bit dummy;
}

typedef Lockb_Event_msg_in_remotesetsturn {
    Lockb_Event_msg_in_remotesetsturn_p1 p1;
}

typedef Lockb_Event_msg_in_remotewantstoenter {
    Lockb_Event_msg_in_remotewantstoenter_p1 p1;
}

typedef Lockb_Event_msg_out_setturn {
    Lockb_Event_msg_out_setturn_p1 p1;
}

typedef Lockb_Event_msg_out_wanttoenter {
    Lockb_Event_msg_out_wanttoenter_p1 p1;
}

typedef Lockb_Event_msg_out_writeack {
    bit dummy;
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

typedef Sharedmemory_Event_msg_in_input_none {
    bit dummy;
}

typedef T_ByteArray {
    T_ByteArray_elem data[64];
    int length;
}

typedef T_Null_Record {
    bit dummy;
}

typedef T_WriteAccess {
    T_WriteAccess_write_address write_address;
    T_WriteAccess_write_value write_value;
}

typedef T_WriteRequest {
    T_WriteRequest_start_address start_address;
    T_WriteRequest_values values;
}

typedef Testgui_Event_msg_in_writeacka {
    bit dummy;
}

typedef Testgui_Event_msg_in_writeackb {
    bit dummy;
}

typedef Testgui_Event_msg_out_writerequesta {
    Testgui_Event_msg_out_writerequesta_p1 p1;
}

typedef Testgui_Event_msg_out_writerequestb {
    Testgui_Event_msg_out_writerequestb_p1 p1;
}

typedef Lock_Context {
    Lock_Context_state state;
    Lock_Context_init_done init_done;
    Lock_Context_remotewantstoenter remotewantstoenter;
    Lock_Context_writesize writesize;
    Lock_Context_myprocid myprocid;
    Lock_Context_remoteprocid remoteprocid;
    Lock_Context_turn turn;
    Lock_Context_mywritevalue mywritevalue;
    Lock_Context_writecount writecount;
    Lock_Context_turnerror turnerror;
    Lock_Context_contentionerror contentionerror;
    Lock_Context_writerequest writerequest;
    Lock_Context_startaddress startaddress;
}

typedef Locka_Event_msg_in_writerequest {
    Locka_Event_msg_in_writerequest_p1 p1;
}

typedef Locka_Event_msg_out_memwrite {
    Locka_Event_msg_out_memwrite_p1 p1;
}

typedef Lockb_Event_msg_in_writerequest {
    Lockb_Event_msg_in_writerequest_p1 p1;
}

typedef Lockb_Event_msg_out_memwrite {
    Lockb_Event_msg_out_memwrite_p1 p1;
}

typedef Sharedmemory_Context {
    Sharedmemory_Context_state state;
    Sharedmemory_Context_init_done init_done;
    Sharedmemory_Context_membuffer membuffer;
    Sharedmemory_Context_writeaccess writeaccess;
}

typedef Sharedmemory_Event_msg_in_memwritea {
    Sharedmemory_Event_msg_in_memwritea_p1 p1;
}

typedef Sharedmemory_Event_msg_in_memwriteb {
    Sharedmemory_Event_msg_in_memwriteb_p1 p1;
}

typedef Testgui_Event_msg_in_data {
    Testgui_Event_msg_in_writeacka writeacka;
    Testgui_Event_msg_in_writeackb writeackb;
}

typedef Testgui_Event_msg_out_data {
    Testgui_Event_msg_out_writerequesta writerequesta;
    Testgui_Event_msg_out_writerequestb writerequestb;
}

typedef Locka_Event_msg_in_data {
    Locka_Event_msg_in_input_none input_none;
    Locka_Event_msg_in_remotesetsturn remotesetsturn;
    Locka_Event_msg_in_remotewantstoenter remotewantstoenter;
    Locka_Event_msg_in_writerequest writerequest;
}

typedef Locka_Event_msg_out_data {
    Locka_Event_msg_out_memwrite memwrite;
    Locka_Event_msg_out_setturn setturn;
    Locka_Event_msg_out_wanttoenter wanttoenter;
    Locka_Event_msg_out_writeack writeack;
}

typedef Lockb_Event_msg_in_data {
    Lockb_Event_msg_in_input_none input_none;
    Lockb_Event_msg_in_remotesetsturn remotesetsturn;
    Lockb_Event_msg_in_remotewantstoenter remotewantstoenter;
    Lockb_Event_msg_in_writerequest writerequest;
}

typedef Lockb_Event_msg_out_data {
    Lockb_Event_msg_out_memwrite memwrite;
    Lockb_Event_msg_out_setturn setturn;
    Lockb_Event_msg_out_wanttoenter wanttoenter;
    Lockb_Event_msg_out_writeack writeack;
}

typedef Sharedmemory_Event_msg_in_data {
    Sharedmemory_Event_msg_in_input_none input_none;
    Sharedmemory_Event_msg_in_memwritea memwritea;
    Sharedmemory_Event_msg_in_memwriteb memwriteb;
}

typedef Testgui_Event_msg_in {
    Testgui_Event_msg_in_data data;
    int selection;
}

typedef Testgui_Event_msg_out {
    Testgui_Event_msg_out_data data;
    int selection;
}

typedef Locka_Event_msg_in {
    Locka_Event_msg_in_data data;
    int selection;
}

typedef Locka_Event_msg_out {
    Locka_Event_msg_out_data data;
    int selection;
}

typedef Lockb_Event_msg_in {
    Lockb_Event_msg_in_data data;
    int selection;
}

typedef Lockb_Event_msg_out {
    Lockb_Event_msg_out_data data;
    int selection;
}

typedef Sharedmemory_Event_msg_in {
    Sharedmemory_Event_msg_in_data data;
    int selection;
}

typedef Testgui_Event_data {
    Testgui_Event_msg_in msg_in;
    Testgui_Event_msg_out msg_out;
}

typedef Locka_Event_data {
    Locka_Event_msg_in msg_in;
    Locka_Event_msg_out msg_out;
}

typedef Lockb_Event_data {
    Lockb_Event_msg_in msg_in;
    Lockb_Event_msg_out msg_out;
}

typedef Sharedmemory_Event_data {
    Sharedmemory_Event_msg_in msg_in;
}

typedef Testgui_Event {
    Testgui_Event_data data;
    int selection;
}

typedef Locka_Event {
    Locka_Event_data data;
    int selection;
}

typedef Lockb_Event {
    Lockb_Event_data data;
    int selection;
}

typedef Sharedmemory_Event {
    Sharedmemory_Event_data data;
    int selection;
}

typedef Function_Event_data {
    Function_Event_locka locka;
    Function_Event_lockb lockb;
    Function_Event_sharedmemory sharedmemory;
    Function_Event_testgui testgui;
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
    System_State_locka_queue locka_queue;
    System_State_lockb_queue lockb_queue;
    System_State_sharedmemory_queue sharedmemory_queue;
    System_State_locka locka;
    System_State_lockb lockb;
    System_State_sharedmemory sharedmemory;
}

Observable_Event nothing;
inline Lock_States_assign_value(dst, src)
{
    dst = src;
}
inline Lock_Context_state_assign_value(dst, src)
{
    Lock_States_assign_value(dst, src);
}
inline Lock_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Lock_Context_remotewantstoenter_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Lock_Context_writesize_assign_value(dst, src)
{
    T_UInt8_assign_value(dst, src);
}
inline Lock_Context_myprocid_assign_value(dst, src)
{
    T_ProcID_assign_value(dst, src);
}
inline Lock_Context_remoteprocid_assign_value(dst, src)
{
    T_ProcID_assign_value(dst, src);
}
inline Lock_Context_turn_assign_value(dst, src)
{
    T_ProcID_assign_value(dst, src);
}
inline Lock_Context_mywritevalue_assign_value(dst, src)
{
    T_WriteAccess_assign_value(dst, src);
}
inline Lock_Context_writecount_assign_value(dst, src)
{
    T_UInt8_assign_value(dst, src);
}
inline Lock_Context_turnerror_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Lock_Context_contentionerror_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Lock_Context_writerequest_assign_value(dst, src)
{
    T_WriteRequest_assign_value(dst, src);
}
inline Lock_Context_startaddress_assign_value(dst, src)
{
    T_UInt16_assign_value(dst, src);
}
inline Lock_Context_assign_value(dst, src)
{
    Lock_Context_state_assign_value(dst.state, src.state);
    Lock_Context_init_done_assign_value(dst.init_done, src.init_done);
    Lock_Context_remotewantstoenter_assign_value(dst.remotewantstoenter, src.remotewantstoenter);
    Lock_Context_writesize_assign_value(dst.writesize, src.writesize);
    Lock_Context_myprocid_assign_value(dst.myprocid, src.myprocid);
    Lock_Context_remoteprocid_assign_value(dst.remoteprocid, src.remoteprocid);
    Lock_Context_turn_assign_value(dst.turn, src.turn);
    Lock_Context_mywritevalue_assign_value(dst.mywritevalue, src.mywritevalue);
    Lock_Context_writecount_assign_value(dst.writecount, src.writecount);
    Lock_Context_turnerror_assign_value(dst.turnerror, src.turnerror);
    Lock_Context_contentionerror_assign_value(dst.contentionerror, src.contentionerror);
    Lock_Context_writerequest_assign_value(dst.writerequest, src.writerequest);
    Lock_Context_startaddress_assign_value(dst.startaddress, src.startaddress);
}
inline Sharedmemory_States_assign_value(dst, src)
{
    dst = src;
}
inline Sharedmemory_Context_state_assign_value(dst, src)
{
    Sharedmemory_States_assign_value(dst, src);
}
inline Sharedmemory_Context_init_done_assign_value(dst, src)
{
    dst = src;
}
inline Sharedmemory_Context_membuffer_assign_value(dst, src)
{
    T_MemBuffer_assign_value(dst, src);
}
inline Sharedmemory_Context_writeaccess_assign_value(dst, src)
{
    T_WriteAccess_assign_value(dst, src);
}
inline Sharedmemory_Context_assign_value(dst, src)
{
    Sharedmemory_Context_state_assign_value(dst.state, src.state);
    Sharedmemory_Context_init_done_assign_value(dst.init_done, src.init_done);
    Sharedmemory_Context_membuffer_assign_value(dst.membuffer, src.membuffer);
    Sharedmemory_Context_writeaccess_assign_value(dst.writeaccess, src.writeaccess);
}
inline T_UInt16_assign_value(dst, src)
{
    dst = src;
}
inline T_WriteAccess_write_address_assign_value(dst, src)
{
    T_UInt16_assign_value(dst, src);
}
inline T_WriteAccess_write_value_assign_value(dst, src)
{
    T_UInt8_assign_value(dst, src);
}
inline T_WriteAccess_assign_value(dst, src)
{
    T_WriteAccess_write_address_assign_value(dst.write_address, src.write_address);
    T_WriteAccess_write_value_assign_value(dst.write_value, src.write_value);
}
inline T_ByteArray_elem_assign_value(dst, src)
{
    T_UInt8_assign_value(dst, src);
}
inline T_ByteArray_assign_value(dst, src)
{
    int i;
    for(i : 0 .. 63)
    {
        T_ByteArray_elem_assign_value(dst.data[i], src.data[i]);
    }
    dst.length = src.length;
}
inline T_MemBuffer_assign_value(dst, src)
{
    T_ByteArray_assign_value(dst, src);
}
inline T_WriteRequest_start_address_assign_value(dst, src)
{
    T_UInt16_assign_value(dst, src);
}
inline T_WriteRequest_values_assign_value(dst, src)
{
    T_ByteArray_assign_value(dst, src);
}
inline T_WriteRequest_assign_value(dst, src)
{
    T_WriteRequest_start_address_assign_value(dst.start_address, src.start_address);
    T_WriteRequest_values_assign_value(dst.values, src.values);
}
inline T_ProcID_assign_value(dst, src)
{
    T_UInt8_assign_value(dst, src);
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
inline PID_assign_value(dst, src)
{
    dst = src;
}
inline Locka_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Locka_Event_msg_in_remotesetsturn_p1_assign_value(dst, src)
{
    T_ProcID_assign_value(dst, src);
}
inline Locka_Event_msg_in_remotesetsturn_assign_value(dst, src)
{
    Locka_Event_msg_in_remotesetsturn_p1_assign_value(dst.p1, src.p1);
}
inline Locka_Event_msg_in_remotewantstoenter_p1_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Locka_Event_msg_in_remotewantstoenter_assign_value(dst, src)
{
    Locka_Event_msg_in_remotewantstoenter_p1_assign_value(dst.p1, src.p1);
}
inline Locka_Event_msg_in_writerequest_p1_assign_value(dst, src)
{
    T_WriteRequest_assign_value(dst, src);
}
inline Locka_Event_msg_in_writerequest_assign_value(dst, src)
{
    Locka_Event_msg_in_writerequest_p1_assign_value(dst.p1, src.p1);
}
inline Locka_Event_msg_in_assign_value(dst, src)
{
    Locka_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Locka_Event_msg_in_remotesetsturn_assign_value(dst.data.remotesetsturn, src.data.remotesetsturn);
    Locka_Event_msg_in_remotewantstoenter_assign_value(dst.data.remotewantstoenter, src.data.remotewantstoenter);
    Locka_Event_msg_in_writerequest_assign_value(dst.data.writerequest, src.data.writerequest);
    dst.selection = src.selection;
}
inline Locka_Event_msg_out_memwrite_p1_assign_value(dst, src)
{
    T_WriteAccess_assign_value(dst, src);
}
inline Locka_Event_msg_out_memwrite_assign_value(dst, src)
{
    Locka_Event_msg_out_memwrite_p1_assign_value(dst.p1, src.p1);
}
inline Locka_Event_msg_out_setturn_p1_assign_value(dst, src)
{
    T_ProcID_assign_value(dst, src);
}
inline Locka_Event_msg_out_setturn_assign_value(dst, src)
{
    Locka_Event_msg_out_setturn_p1_assign_value(dst.p1, src.p1);
}
inline Locka_Event_msg_out_wanttoenter_p1_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Locka_Event_msg_out_wanttoenter_assign_value(dst, src)
{
    Locka_Event_msg_out_wanttoenter_p1_assign_value(dst.p1, src.p1);
}
inline Locka_Event_msg_out_writeack_assign_value(dst, src)
{
    skip;
}
inline Locka_Event_msg_out_assign_value(dst, src)
{
    Locka_Event_msg_out_memwrite_assign_value(dst.data.memwrite, src.data.memwrite);
    Locka_Event_msg_out_setturn_assign_value(dst.data.setturn, src.data.setturn);
    Locka_Event_msg_out_wanttoenter_assign_value(dst.data.wanttoenter, src.data.wanttoenter);
    Locka_Event_msg_out_writeack_assign_value(dst.data.writeack, src.data.writeack);
    dst.selection = src.selection;
}
inline Locka_Event_assign_value(dst, src)
{
    Locka_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Locka_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Lockb_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Lockb_Event_msg_in_remotesetsturn_p1_assign_value(dst, src)
{
    T_ProcID_assign_value(dst, src);
}
inline Lockb_Event_msg_in_remotesetsturn_assign_value(dst, src)
{
    Lockb_Event_msg_in_remotesetsturn_p1_assign_value(dst.p1, src.p1);
}
inline Lockb_Event_msg_in_remotewantstoenter_p1_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Lockb_Event_msg_in_remotewantstoenter_assign_value(dst, src)
{
    Lockb_Event_msg_in_remotewantstoenter_p1_assign_value(dst.p1, src.p1);
}
inline Lockb_Event_msg_in_writerequest_p1_assign_value(dst, src)
{
    T_WriteRequest_assign_value(dst, src);
}
inline Lockb_Event_msg_in_writerequest_assign_value(dst, src)
{
    Lockb_Event_msg_in_writerequest_p1_assign_value(dst.p1, src.p1);
}
inline Lockb_Event_msg_in_assign_value(dst, src)
{
    Lockb_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Lockb_Event_msg_in_remotesetsturn_assign_value(dst.data.remotesetsturn, src.data.remotesetsturn);
    Lockb_Event_msg_in_remotewantstoenter_assign_value(dst.data.remotewantstoenter, src.data.remotewantstoenter);
    Lockb_Event_msg_in_writerequest_assign_value(dst.data.writerequest, src.data.writerequest);
    dst.selection = src.selection;
}
inline Lockb_Event_msg_out_memwrite_p1_assign_value(dst, src)
{
    T_WriteAccess_assign_value(dst, src);
}
inline Lockb_Event_msg_out_memwrite_assign_value(dst, src)
{
    Lockb_Event_msg_out_memwrite_p1_assign_value(dst.p1, src.p1);
}
inline Lockb_Event_msg_out_setturn_p1_assign_value(dst, src)
{
    T_ProcID_assign_value(dst, src);
}
inline Lockb_Event_msg_out_setturn_assign_value(dst, src)
{
    Lockb_Event_msg_out_setturn_p1_assign_value(dst.p1, src.p1);
}
inline Lockb_Event_msg_out_wanttoenter_p1_assign_value(dst, src)
{
    T_Boolean_assign_value(dst, src);
}
inline Lockb_Event_msg_out_wanttoenter_assign_value(dst, src)
{
    Lockb_Event_msg_out_wanttoenter_p1_assign_value(dst.p1, src.p1);
}
inline Lockb_Event_msg_out_writeack_assign_value(dst, src)
{
    skip;
}
inline Lockb_Event_msg_out_assign_value(dst, src)
{
    Lockb_Event_msg_out_memwrite_assign_value(dst.data.memwrite, src.data.memwrite);
    Lockb_Event_msg_out_setturn_assign_value(dst.data.setturn, src.data.setturn);
    Lockb_Event_msg_out_wanttoenter_assign_value(dst.data.wanttoenter, src.data.wanttoenter);
    Lockb_Event_msg_out_writeack_assign_value(dst.data.writeack, src.data.writeack);
    dst.selection = src.selection;
}
inline Lockb_Event_assign_value(dst, src)
{
    Lockb_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Lockb_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Sharedmemory_Event_msg_in_input_none_assign_value(dst, src)
{
    skip;
}
inline Sharedmemory_Event_msg_in_memwritea_p1_assign_value(dst, src)
{
    T_WriteAccess_assign_value(dst, src);
}
inline Sharedmemory_Event_msg_in_memwritea_assign_value(dst, src)
{
    Sharedmemory_Event_msg_in_memwritea_p1_assign_value(dst.p1, src.p1);
}
inline Sharedmemory_Event_msg_in_memwriteb_p1_assign_value(dst, src)
{
    T_WriteAccess_assign_value(dst, src);
}
inline Sharedmemory_Event_msg_in_memwriteb_assign_value(dst, src)
{
    Sharedmemory_Event_msg_in_memwriteb_p1_assign_value(dst.p1, src.p1);
}
inline Sharedmemory_Event_msg_in_assign_value(dst, src)
{
    Sharedmemory_Event_msg_in_input_none_assign_value(dst.data.input_none, src.data.input_none);
    Sharedmemory_Event_msg_in_memwritea_assign_value(dst.data.memwritea, src.data.memwritea);
    Sharedmemory_Event_msg_in_memwriteb_assign_value(dst.data.memwriteb, src.data.memwriteb);
    dst.selection = src.selection;
}
inline Sharedmemory_Event_assign_value(dst, src)
{
    Sharedmemory_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    dst.selection = src.selection;
}
inline Testgui_Event_msg_in_writeacka_assign_value(dst, src)
{
    skip;
}
inline Testgui_Event_msg_in_writeackb_assign_value(dst, src)
{
    skip;
}
inline Testgui_Event_msg_in_assign_value(dst, src)
{
    Testgui_Event_msg_in_writeacka_assign_value(dst.data.writeacka, src.data.writeacka);
    Testgui_Event_msg_in_writeackb_assign_value(dst.data.writeackb, src.data.writeackb);
    dst.selection = src.selection;
}
inline Testgui_Event_msg_out_writerequesta_p1_assign_value(dst, src)
{
    T_WriteRequest_assign_value(dst, src);
}
inline Testgui_Event_msg_out_writerequesta_assign_value(dst, src)
{
    Testgui_Event_msg_out_writerequesta_p1_assign_value(dst.p1, src.p1);
}
inline Testgui_Event_msg_out_writerequestb_p1_assign_value(dst, src)
{
    T_WriteRequest_assign_value(dst, src);
}
inline Testgui_Event_msg_out_writerequestb_assign_value(dst, src)
{
    Testgui_Event_msg_out_writerequestb_p1_assign_value(dst.p1, src.p1);
}
inline Testgui_Event_msg_out_assign_value(dst, src)
{
    Testgui_Event_msg_out_writerequesta_assign_value(dst.data.writerequesta, src.data.writerequesta);
    Testgui_Event_msg_out_writerequestb_assign_value(dst.data.writerequestb, src.data.writerequestb);
    dst.selection = src.selection;
}
inline Testgui_Event_assign_value(dst, src)
{
    Testgui_Event_msg_in_assign_value(dst.data.msg_in, src.data.msg_in);
    Testgui_Event_msg_out_assign_value(dst.data.msg_out, src.data.msg_out);
    dst.selection = src.selection;
}
inline Observer_State_Kind_assign_value(dst, src)
{
    dst = src;
}
inline Function_Event_locka_assign_value(dst, src)
{
    Locka_Event_assign_value(dst, src);
}
inline Function_Event_lockb_assign_value(dst, src)
{
    Lockb_Event_assign_value(dst, src);
}
inline Function_Event_sharedmemory_assign_value(dst, src)
{
    Sharedmemory_Event_assign_value(dst, src);
}
inline Function_Event_testgui_assign_value(dst, src)
{
    Testgui_Event_assign_value(dst, src);
}
inline Function_Event_assign_value(dst, src)
{
    Function_Event_locka_assign_value(dst.data.locka, src.data.locka);
    Function_Event_lockb_assign_value(dst.data.lockb, src.data.lockb);
    Function_Event_sharedmemory_assign_value(dst.data.sharedmemory, src.data.sharedmemory);
    Function_Event_testgui_assign_value(dst.data.testgui, src.data.testgui);
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
inline System_State_locka_queue_assign_value(dst, src)
{
    Events_Ty_assign_value(dst, src);
}
inline System_State_lockb_queue_assign_value(dst, src)
{
    Events_Ty_assign_value(dst, src);
}
inline System_State_sharedmemory_queue_assign_value(dst, src)
{
    Events_Ty_assign_value(dst, src);
}
inline System_State_locka_assign_value(dst, src)
{
    Lock_Context_assign_value(dst, src);
}
inline System_State_lockb_assign_value(dst, src)
{
    Lock_Context_assign_value(dst, src);
}
inline System_State_sharedmemory_assign_value(dst, src)
{
    Sharedmemory_Context_assign_value(dst, src);
}
inline System_State_assign_value(dst, src)
{
    System_State_locka_queue_assign_value(dst.locka_queue, src.locka_queue);
    System_State_lockb_queue_assign_value(dst.lockb_queue, src.lockb_queue);
    System_State_sharedmemory_queue_assign_value(dst.sharedmemory_queue, src.sharedmemory_queue);
    System_State_locka_assign_value(dst.locka, src.locka);
    System_State_lockb_assign_value(dst.lockb, src.lockb);
    System_State_sharedmemory_assign_value(dst.sharedmemory, src.sharedmemory);
}
inline nothing_init()
{
    d_step {
        nothing.selection = Observable_Event_no_event_PRESENT;
    }
}
