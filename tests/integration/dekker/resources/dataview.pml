#define T_UInt8 int
#define T_UInt16 int
#define T_Boolean bool
#define T_WriteAccess__write_address int
#define T_WriteAccess__write_value int
#define T_ByteArray__elem int
#define T_MemBuffer__elem int
#define T_WriteRequest__start_address int
#define T_WriteRequest__values__elem int
#define T_ProcID int
#define T_UInt32 int
#define Lock_States int
#define Lock_Context__state int
#define Lock_Context__init_done bool
#define Lock_Context__remotewantstoenter bool
#define Lock_Context__writesize int
#define Lock_Context__myprocid int
#define Lock_Context__remoteprocid int
#define Lock_Context__turn int
#define Lock_Context__mywritevalue__write_address int
#define Lock_Context__mywritevalue__write_value int
#define Lock_Context__writecount int
#define Lock_Context__turnerror bool
#define Lock_Context__contentionerror bool
#define Lock_Context__writerequest__start_address int
#define Lock_Context__writerequest__values__elem int
#define Lock_Context__startaddress int
#define Lock_States_wait_turn 0
#define Lock_States_idle 1
#define Lock_States_writing 2
#define Lock_States_wait_nocontention 3
#define Lock_Context__state_wait_turn 0
#define Lock_Context__state_idle 1
#define Lock_Context__state_writing 2
#define Lock_Context__state_wait_nocontention 3
typedef Lock_Context__mywritevalue {
    Lock_Context__mywritevalue__write_address write_address;
    Lock_Context__mywritevalue__write_value write_value;
}

typedef Lock_Context__writerequest__values {
    Lock_Context__writerequest__values__elem data[64];
    int length;
}

typedef T_ByteArray {
    T_ByteArray__elem data[64];
    int length;
}

typedef T_MemBuffer {
    T_MemBuffer__elem data[64];
}

typedef T_Null_Record {
    bit dummy;
}

typedef T_WriteAccess {
    T_WriteAccess__write_address write_address;
    T_WriteAccess__write_value write_value;
}

typedef T_WriteRequest__values {
    T_WriteRequest__values__elem data[64];
    int length;
}

typedef Lock_Context__writerequest {
    Lock_Context__writerequest__start_address start_address;
    Lock_Context__writerequest__values values;
}

typedef T_WriteRequest {
    T_WriteRequest__start_address start_address;
    T_WriteRequest__values values;
}

typedef Lock_Context {
    Lock_Context__state state;
    Lock_Context__init_done init_done;
    Lock_Context__remotewantstoenter remotewantstoenter;
    Lock_Context__writesize writesize;
    Lock_Context__myprocid myprocid;
    Lock_Context__remoteprocid remoteprocid;
    Lock_Context__turn turn;
    Lock_Context__mywritevalue mywritevalue;
    Lock_Context__writecount writecount;
    Lock_Context__turnerror turnerror;
    Lock_Context__contentionerror contentionerror;
    Lock_Context__writerequest writerequest;
    Lock_Context__startaddress startaddress;
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
inline T_UInt16_assign_value(dst, src)
{
    dst = src;
    T_UInt16_range_check(dst);
}
inline T_UInt16_range_check(T_UInt16_vc)
{
    assert(((T_UInt16_vc >= 0) && (T_UInt16_vc <= 65535)));
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
inline T_WriteAccess__write_address_assign_value(dst, src)
{
    dst = src;
    T_WriteAccess__write_address_range_check(dst);
}
inline T_WriteAccess__write_address_range_check(T_WriteAccess__write_address_vc)
{
    assert(((T_WriteAccess__write_address_vc >= 0) && (T_WriteAccess__write_address_vc <= 65535)));
}
inline T_WriteAccess__write_value_assign_value(dst, src)
{
    dst = src;
    T_WriteAccess__write_value_range_check(dst);
}
inline T_WriteAccess__write_value_range_check(T_WriteAccess__write_value_vc)
{
    assert(((T_WriteAccess__write_value_vc >= 0) && (T_WriteAccess__write_value_vc <= 255)));
}
inline T_WriteAccess_assign_value(dst, src)
{
    T_WriteAccess__write_address_assign_value(dst.write_address, src.write_address);
    T_WriteAccess__write_value_assign_value(dst.write_value, src.write_value);
}
inline T_ByteArray__elem_assign_value(dst, src)
{
    dst = src;
    T_ByteArray__elem_range_check(dst);
}
inline T_ByteArray__elem_range_check(T_ByteArray__elem_vc)
{
    assert(((T_ByteArray__elem_vc >= 0) && (T_ByteArray__elem_vc <= 255)));
}
inline T_ByteArray__elem_init_value(dst)
{
    T_ByteArray__elem_assign_value(dst, 0);
}
inline T_ByteArray_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. (src.length - 1))
    {
        T_ByteArray__elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
    for(i_0 : src.length .. 63)
    {
        T_ByteArray__elem_init_value(dst.data[i_0]);
    }
    dst.length = src.length;
}
inline T_ByteArray_size_check(T_ByteArray_sc)
{
    assert(((T_ByteArray_sc >= 1) && (T_ByteArray_sc <= 64)));
}
inline T_MemBuffer__elem_assign_value(dst, src)
{
    dst = src;
    T_MemBuffer__elem_range_check(dst);
}
inline T_MemBuffer__elem_range_check(T_MemBuffer__elem_vc)
{
    assert(((T_MemBuffer__elem_vc >= 0) && (T_MemBuffer__elem_vc <= 255)));
}
inline T_MemBuffer__elem_init_value(dst)
{
    T_MemBuffer__elem_assign_value(dst, 0);
}
inline T_MemBuffer_assign_value(dst, src)
{
    int i_0;
    for(i_0 : 0 .. 63)
    {
        T_MemBuffer__elem_assign_value(dst.data[i_0], src.data[i_0]);
    }
}
inline T_WriteRequest__start_address_assign_value(dst, src)
{
    dst = src;
    T_WriteRequest__start_address_range_check(dst);
}
inline T_WriteRequest__start_address_range_check(T_WriteRequest__start_address_vc)
{
    assert(((T_WriteRequest__start_address_vc >= 0) && (T_WriteRequest__start_address_vc <= 65535)));
}
inline T_WriteRequest__values__elem_assign_value(dst, src)
{
    dst = src;
    T_WriteRequest__values__elem_range_check(dst);
}
inline T_WriteRequest__values__elem_range_check(T_WriteRequest__values__elem_vc)
{
    assert(((T_WriteRequest__values__elem_vc >= 0) && (T_WriteRequest__values__elem_vc <= 255)));
}
inline T_WriteRequest__values__elem_init_value(dst)
{
    T_WriteRequest__values__elem_assign_value(dst, 0);
}
inline T_WriteRequest__values_assign_value(dst, src)
{
    int i_1;
    for(i_1 : 0 .. (src.length - 1))
    {
        T_WriteRequest__values__elem_assign_value(dst.data[i_1], src.data[i_1]);
    }
    for(i_1 : src.length .. 63)
    {
        T_WriteRequest__values__elem_init_value(dst.data[i_1]);
    }
    dst.length = src.length;
}
inline T_WriteRequest__values_size_check(T_WriteRequest__values_sc)
{
    assert(((T_WriteRequest__values_sc >= 1) && (T_WriteRequest__values_sc <= 64)));
}
inline T_WriteRequest_assign_value(dst, src)
{
    T_WriteRequest__start_address_assign_value(dst.start_address, src.start_address);
    T_WriteRequest__values_assign_value(dst.values, src.values);
}
inline T_ProcID_assign_value(dst, src)
{
    dst = src;
    T_ProcID_range_check(dst);
}
inline T_ProcID_range_check(T_ProcID_vc)
{
    assert(((T_ProcID_vc >= 0) && (T_ProcID_vc <= 1)));
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
inline T_Null_Record_assign_value(dst, src)
{
    skip;
}
inline Lock_States_assign_value(dst, src)
{
    dst = src;
    Lock_States_range_check(dst);
}
inline Lock_States_range_check(Lock_States_vc)
{
    assert(((((Lock_States_vc == Lock_States_wait_turn) || (Lock_States_vc == Lock_States_idle)) || (Lock_States_vc == Lock_States_writing)) || (Lock_States_vc == Lock_States_wait_nocontention)));
}
inline Lock_Context__state_assign_value(dst, src)
{
    dst = src;
    Lock_Context__state_range_check(dst);
}
inline Lock_Context__state_range_check(Lock_Context__state_vc)
{
    assert(((((Lock_Context__state_vc == Lock_Context__state_wait_turn) || (Lock_Context__state_vc == Lock_Context__state_idle)) || (Lock_Context__state_vc == Lock_Context__state_writing)) || (Lock_Context__state_vc == Lock_Context__state_wait_nocontention)));
}
inline Lock_Context__init_done_assign_value(dst, src)
{
    dst = src;
    Lock_Context__init_done_range_check(dst);
}
inline Lock_Context__init_done_range_check(Lock_Context__init_done_vc)
{
    assert(true);
}
inline Lock_Context__remotewantstoenter_assign_value(dst, src)
{
    dst = src;
    Lock_Context__remotewantstoenter_range_check(dst);
}
inline Lock_Context__remotewantstoenter_range_check(Lock_Context__remotewantstoenter_vc)
{
    assert(true);
}
inline Lock_Context__writesize_assign_value(dst, src)
{
    dst = src;
    Lock_Context__writesize_range_check(dst);
}
inline Lock_Context__writesize_range_check(Lock_Context__writesize_vc)
{
    assert(((Lock_Context__writesize_vc >= 0) && (Lock_Context__writesize_vc <= 255)));
}
inline Lock_Context__myprocid_assign_value(dst, src)
{
    dst = src;
    Lock_Context__myprocid_range_check(dst);
}
inline Lock_Context__myprocid_range_check(Lock_Context__myprocid_vc)
{
    assert(((Lock_Context__myprocid_vc >= 0) && (Lock_Context__myprocid_vc <= 1)));
}
inline Lock_Context__remoteprocid_assign_value(dst, src)
{
    dst = src;
    Lock_Context__remoteprocid_range_check(dst);
}
inline Lock_Context__remoteprocid_range_check(Lock_Context__remoteprocid_vc)
{
    assert(((Lock_Context__remoteprocid_vc >= 0) && (Lock_Context__remoteprocid_vc <= 1)));
}
inline Lock_Context__turn_assign_value(dst, src)
{
    dst = src;
    Lock_Context__turn_range_check(dst);
}
inline Lock_Context__turn_range_check(Lock_Context__turn_vc)
{
    assert(((Lock_Context__turn_vc >= 0) && (Lock_Context__turn_vc <= 1)));
}
inline Lock_Context__mywritevalue__write_address_assign_value(dst, src)
{
    dst = src;
    Lock_Context__mywritevalue__write_address_range_check(dst);
}
inline Lock_Context__mywritevalue__write_address_range_check(Lock_Context__mywritevalue__write_address_vc)
{
    assert(((Lock_Context__mywritevalue__write_address_vc >= 0) && (Lock_Context__mywritevalue__write_address_vc <= 65535)));
}
inline Lock_Context__mywritevalue__write_value_assign_value(dst, src)
{
    dst = src;
    Lock_Context__mywritevalue__write_value_range_check(dst);
}
inline Lock_Context__mywritevalue__write_value_range_check(Lock_Context__mywritevalue__write_value_vc)
{
    assert(((Lock_Context__mywritevalue__write_value_vc >= 0) && (Lock_Context__mywritevalue__write_value_vc <= 255)));
}
inline Lock_Context__mywritevalue_assign_value(dst, src)
{
    Lock_Context__mywritevalue__write_address_assign_value(dst.write_address, src.write_address);
    Lock_Context__mywritevalue__write_value_assign_value(dst.write_value, src.write_value);
}
inline Lock_Context__writecount_assign_value(dst, src)
{
    dst = src;
    Lock_Context__writecount_range_check(dst);
}
inline Lock_Context__writecount_range_check(Lock_Context__writecount_vc)
{
    assert(((Lock_Context__writecount_vc >= 0) && (Lock_Context__writecount_vc <= 255)));
}
inline Lock_Context__turnerror_assign_value(dst, src)
{
    dst = src;
    Lock_Context__turnerror_range_check(dst);
}
inline Lock_Context__turnerror_range_check(Lock_Context__turnerror_vc)
{
    assert(true);
}
inline Lock_Context__contentionerror_assign_value(dst, src)
{
    dst = src;
    Lock_Context__contentionerror_range_check(dst);
}
inline Lock_Context__contentionerror_range_check(Lock_Context__contentionerror_vc)
{
    assert(true);
}
inline Lock_Context__writerequest__start_address_assign_value(dst, src)
{
    dst = src;
    Lock_Context__writerequest__start_address_range_check(dst);
}
inline Lock_Context__writerequest__start_address_range_check(Lock_Context__writerequest__start_address_vc)
{
    assert(((Lock_Context__writerequest__start_address_vc >= 0) && (Lock_Context__writerequest__start_address_vc <= 65535)));
}
inline Lock_Context__writerequest__values__elem_assign_value(dst, src)
{
    dst = src;
    Lock_Context__writerequest__values__elem_range_check(dst);
}
inline Lock_Context__writerequest__values__elem_range_check(Lock_Context__writerequest__values__elem_vc)
{
    assert(((Lock_Context__writerequest__values__elem_vc >= 0) && (Lock_Context__writerequest__values__elem_vc <= 255)));
}
inline Lock_Context__writerequest__values__elem_init_value(dst)
{
    Lock_Context__writerequest__values__elem_assign_value(dst, 0);
}
inline Lock_Context__writerequest__values_assign_value(dst, src)
{
    int i_2;
    for(i_2 : 0 .. (src.length - 1))
    {
        Lock_Context__writerequest__values__elem_assign_value(dst.data[i_2], src.data[i_2]);
    }
    for(i_2 : src.length .. 63)
    {
        Lock_Context__writerequest__values__elem_init_value(dst.data[i_2]);
    }
    dst.length = src.length;
}
inline Lock_Context__writerequest__values_size_check(Lock_Context__writerequest__values_sc)
{
    assert(((Lock_Context__writerequest__values_sc >= 1) && (Lock_Context__writerequest__values_sc <= 64)));
}
inline Lock_Context__writerequest_assign_value(dst, src)
{
    Lock_Context__writerequest__start_address_assign_value(dst.start_address, src.start_address);
    Lock_Context__writerequest__values_assign_value(dst.values, src.values);
}
inline Lock_Context__startaddress_assign_value(dst, src)
{
    dst = src;
    Lock_Context__startaddress_range_check(dst);
}
inline Lock_Context__startaddress_range_check(Lock_Context__startaddress_vc)
{
    assert(((Lock_Context__startaddress_vc >= 0) && (Lock_Context__startaddress_vc <= 65535)));
}
inline Lock_Context_assign_value(dst, src)
{
    Lock_Context__state_assign_value(dst.state, src.state);
    Lock_Context__init_done_assign_value(dst.init_done, src.init_done);
    Lock_Context__remotewantstoenter_assign_value(dst.remotewantstoenter, src.remotewantstoenter);
    Lock_Context__writesize_assign_value(dst.writesize, src.writesize);
    Lock_Context__myprocid_assign_value(dst.myprocid, src.myprocid);
    Lock_Context__remoteprocid_assign_value(dst.remoteprocid, src.remoteprocid);
    Lock_Context__turn_assign_value(dst.turn, src.turn);
    Lock_Context__mywritevalue_assign_value(dst.mywritevalue, src.mywritevalue);
    Lock_Context__writecount_assign_value(dst.writecount, src.writecount);
    Lock_Context__turnerror_assign_value(dst.turnerror, src.turnerror);
    Lock_Context__contentionerror_assign_value(dst.contentionerror, src.contentionerror);
    Lock_Context__writerequest_assign_value(dst.writerequest, src.writerequest);
    Lock_Context__startaddress_assign_value(dst.startaddress, src.startaddress);
}
inline global_dataview_init()
{
    d_step {
        skip;
    }
}
