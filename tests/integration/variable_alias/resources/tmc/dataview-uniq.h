#ifndef GENERATED_ASN1SCC_dataview_uniq_H
#define GENERATED_ASN1SCC_dataview_uniq_H
/*
Code automatically generated by asn1scc tool
*/
#include "asn1crt.h"
#include "asn1crt_encoding.h"


#ifdef  __cplusplus
extern "C" {
#endif


typedef asn1SccSint asn1SccT_Int32;


#define ERR_T_INT32		1  /*(-2147483648 .. 2147483647)*/
flag asn1SccT_Int32_IsConstraintValid(const asn1SccT_Int32* pVal, int* pErrCode);

void asn1SccT_Int32_Initialize(asn1SccT_Int32* pVal);

#define ERR_UPER_ENCODE_T_INT32		2  /**/
#define asn1SccT_Int32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_Int32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_Int32_Encode(const asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT32		3  /**/
flag asn1SccT_Int32_Decode(asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt32;


#define ERR_T_UINT32		6  /*(0 .. 4294967295)*/
flag asn1SccT_UInt32_IsConstraintValid(const asn1SccT_UInt32* pVal, int* pErrCode);

void asn1SccT_UInt32_Initialize(asn1SccT_UInt32* pVal);

#define ERR_UPER_ENCODE_T_UINT32		7  /**/
#define asn1SccT_UInt32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_UInt32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_UInt32_Encode(const asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT32		8  /**/
flag asn1SccT_UInt32_Decode(asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccT_Runtime_Error --------------------------------------------*/

typedef enum {
    T_Runtime_Error_NONE,
    T_Runtime_Error_noerror_PRESENT,
    T_Runtime_Error_encodeerror_PRESENT,
    T_Runtime_Error_decodeerror_PRESENT
} asn1SccT_Runtime_Error_selection;

typedef union {
    asn1SccT_UInt32 noerror;
    asn1SccT_Int32 encodeerror;
    asn1SccT_Int32 decodeerror;
} asn1SccT_Runtime_Error_unchecked_union;

typedef struct {
    asn1SccT_Runtime_Error_selection kind;

    asn1SccT_Runtime_Error_unchecked_union u;
} asn1SccT_Runtime_Error;

#define ERR_T_RUNTIME_ERROR		61  /**/
#define ERR_T_RUNTIME_ERROR_NOERROR_2		36  /**/
#define ERR_T_RUNTIME_ERROR_ENCODEERROR_2		46  /**/
#define ERR_T_RUNTIME_ERROR_DECODEERROR_2		56  /**/
flag asn1SccT_Runtime_Error_IsConstraintValid(const asn1SccT_Runtime_Error* pVal, int* pErrCode);

void asn1SccT_Runtime_Error_Initialize(asn1SccT_Runtime_Error* pVal);

#define ERR_UPER_ENCODE_T_RUNTIME_ERROR		62  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_NOERROR_2		37  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_ENCODEERROR_2		47  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_DECODEERROR_2		57  /**/
#define asn1SccT_Runtime_Error_REQUIRED_BYTES_FOR_ENCODING       5
#define asn1SccT_Runtime_Error_REQUIRED_BITS_FOR_ENCODING        34

flag asn1SccT_Runtime_Error_Encode(const asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_RUNTIME_ERROR		63  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_NOERROR_2		38  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_ENCODEERROR_2		48  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_DECODEERROR_2		58  /**/
flag asn1SccT_Runtime_Error_Decode(asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int8;


#define ERR_T_INT8		11  /*(-128 .. 127)*/
flag asn1SccT_Int8_IsConstraintValid(const asn1SccT_Int8* pVal, int* pErrCode);

void asn1SccT_Int8_Initialize(asn1SccT_Int8* pVal);

#define ERR_UPER_ENCODE_T_INT8		12  /**/
#define asn1SccT_Int8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Int8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_Int8_Encode(const asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT8		13  /**/
flag asn1SccT_Int8_Decode(asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt8;


#define ERR_T_UINT8		16  /*(0 .. 255)*/
flag asn1SccT_UInt8_IsConstraintValid(const asn1SccT_UInt8* pVal, int* pErrCode);

void asn1SccT_UInt8_Initialize(asn1SccT_UInt8* pVal);

#define ERR_UPER_ENCODE_T_UINT8		17  /**/
#define asn1SccT_UInt8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_UInt8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_UInt8_Encode(const asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT8		18  /**/
flag asn1SccT_UInt8_Decode(asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef flag asn1SccT_Boolean;


#define ERR_T_BOOLEAN		21  /**/
flag asn1SccT_Boolean_IsConstraintValid(const asn1SccT_Boolean* pVal, int* pErrCode);

void asn1SccT_Boolean_Initialize(asn1SccT_Boolean* pVal);

#define ERR_UPER_ENCODE_T_BOOLEAN		22  /**/
#define asn1SccT_Boolean_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Boolean_REQUIRED_BITS_FOR_ENCODING        1

flag asn1SccT_Boolean_Encode(const asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_BOOLEAN		23  /**/
flag asn1SccT_Boolean_Decode(asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccT_Null_Record --------------------------------------------*/
typedef struct {

} asn1SccT_Null_Record;

#define ERR_T_NULL_RECORD		26  /**/
flag asn1SccT_Null_Record_IsConstraintValid(const asn1SccT_Null_Record* pVal, int* pErrCode);

void asn1SccT_Null_Record_Initialize(asn1SccT_Null_Record* pVal);

#define asn1SccT_Null_Record_REQUIRED_BYTES_FOR_ENCODING       0
#define asn1SccT_Null_Record_REQUIRED_BITS_FOR_ENCODING        0

flag asn1SccT_Null_Record_Encode(const asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

flag asn1SccT_Null_Record_Decode(asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccMyInteger;


#define ERR_MYINTEGER		66  /*(0 .. 10000)*/
flag asn1SccMyInteger_IsConstraintValid(const asn1SccMyInteger* pVal, int* pErrCode);

void asn1SccMyInteger_Initialize(asn1SccMyInteger* pVal);

#define ERR_UPER_ENCODE_MYINTEGER		67  /**/
#define asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING       2
#define asn1SccMyInteger_REQUIRED_BITS_FOR_ENCODING        14

flag asn1SccMyInteger_Encode(const asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYINTEGER		68  /**/
flag asn1SccMyInteger_Decode(asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccMySeq --------------------------------------------*/
typedef struct {
    asn1SccMyInteger first;
    asn1SccMyInteger second;

} asn1SccMySeq;

#define ERR_MYSEQ		91  /**/
#define ERR_MYSEQ_FIRST_2		76  /**/
#define ERR_MYSEQ_SECOND_2		86  /**/
flag asn1SccMySeq_IsConstraintValid(const asn1SccMySeq* pVal, int* pErrCode);

void asn1SccMySeq_Initialize(asn1SccMySeq* pVal);

#define ERR_UPER_ENCODE_MYSEQ		92  /**/
#define ERR_UPER_ENCODE_MYSEQ_FIRST_2		77  /**/
#define ERR_UPER_ENCODE_MYSEQ_SECOND_2		87  /**/
#define asn1SccMySeq_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccMySeq_REQUIRED_BITS_FOR_ENCODING        28

flag asn1SccMySeq_Encode(const asn1SccMySeq* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYSEQ		93  /**/
#define ERR_UPER_DECODE_MYSEQ_FIRST_2		78  /**/
#define ERR_UPER_DECODE_MYSEQ_SECOND_2		88  /**/
flag asn1SccMySeq_Decode(asn1SccMySeq* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccMyUnion --------------------------------------------*/

typedef enum {
    MyUnion_NONE,
    MyUnion_left_PRESENT,
    MyUnion_right_PRESENT
} asn1SccMyUnion_selection;

typedef union {
    asn1SccMyInteger left;
    asn1SccMySeq right;
} asn1SccMyUnion_unchecked_union;

typedef struct {
    asn1SccMyUnion_selection kind;

    asn1SccMyUnion_unchecked_union u;
} asn1SccMyUnion;

#define ERR_MYUNION		151  /**/
#define ERR_MYUNION_LEFT_2		116  /**/
#define ERR_MYUNION_RIGHT_2		146  /**/
flag asn1SccMyUnion_IsConstraintValid(const asn1SccMyUnion* pVal, int* pErrCode);

void asn1SccMyUnion_Initialize(asn1SccMyUnion* pVal);

#define ERR_UPER_ENCODE_MYUNION		152  /**/
#define ERR_UPER_ENCODE_MYUNION_LEFT_2		117  /**/
#define ERR_UPER_ENCODE_MYUNION_RIGHT_2		147  /**/
#define asn1SccMyUnion_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccMyUnion_REQUIRED_BITS_FOR_ENCODING        29

flag asn1SccMyUnion_Encode(const asn1SccMyUnion* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYUNION		153  /**/
#define ERR_UPER_DECODE_MYUNION_LEFT_2		118  /**/
#define ERR_UPER_DECODE_MYUNION_RIGHT_2		148  /**/
flag asn1SccMyUnion_Decode(asn1SccMyUnion* pVal, BitStream* pBitStrm, int* pErrCode);


typedef struct {
    asn1SccMyInteger arr[2];
} asn1SccMyArray;

#define ERR_MYARRAY		106  /*(SIZE(2))*/
#define ERR_MYARRAY_ELM_2		101  /**/
flag asn1SccMyArray_IsConstraintValid(const asn1SccMyArray* pVal, int* pErrCode);

void asn1SccMyArray_Initialize(asn1SccMyArray* pVal);

#define ERR_UPER_ENCODE_MYARRAY		107  /**/
#define ERR_UPER_ENCODE_MYARRAY_ELM_2		102  /**/
#define asn1SccMyArray_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccMyArray_REQUIRED_BITS_FOR_ENCODING        28

flag asn1SccMyArray_Encode(const asn1SccMyArray* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYARRAY		108  /**/
#define ERR_UPER_DECODE_MYARRAY_ELM_2		103  /**/
flag asn1SccMyArray_Decode(asn1SccMyArray* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccPID_Range;


#define ERR_PID_RANGE		156  /*(0..4)*/
flag asn1SccPID_Range_IsConstraintValid(const asn1SccPID_Range* pVal, int* pErrCode);

void asn1SccPID_Range_Initialize(asn1SccPID_Range* pVal);

#define ERR_UPER_ENCODE_PID_RANGE		157  /**/
#define asn1SccPID_Range_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_Range_REQUIRED_BITS_FOR_ENCODING        3

flag asn1SccPID_Range_Encode(const asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID_RANGE		158  /**/
flag asn1SccPID_Range_Decode(asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode);
typedef enum {
    PID_taste_user_interface = 0,
    PID_timer_manager = 1,
    PID_actuator = 2,
    PID_controller = 3,
    PID_env = 4
} asn1SccPID;

// please use the following macros to avoid breaking code.
#define asn1SccPID_taste_user_interface PID_taste_user_interface
#define asn1SccPID_timer_manager PID_timer_manager
#define asn1SccPID_actuator PID_actuator
#define asn1SccPID_controller PID_controller
#define asn1SccPID_env PID_env

#define ERR_PID		161  /*taste-user-interface | timer-manager | actuator | controller | env*/
flag asn1SccPID_IsConstraintValid(const asn1SccPID* pVal, int* pErrCode);

void asn1SccPID_Initialize(asn1SccPID* pVal);

#define ERR_UPER_ENCODE_PID		162  /**/
#define asn1SccPID_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_REQUIRED_BITS_FOR_ENCODING        3

flag asn1SccPID_Encode(const asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID		163  /**/
flag asn1SccPID_Decode(asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode);


/* ================= Encoding/Decoding function prototypes =================
 * These functions are placed at the end of the file to make sure all types
 * have been declared first, in case of parameterized ACN encodings
 * ========================================================================= */



#ifdef  __cplusplus
}

#endif

#endif
