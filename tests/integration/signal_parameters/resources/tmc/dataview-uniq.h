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


typedef asn1SccUint asn1SccMyInteger;


#define ERR_MYINTEGER		1  /*(0 .. 10000)*/
flag asn1SccMyInteger_IsConstraintValid(const asn1SccMyInteger* pVal, int* pErrCode);

void asn1SccMyInteger_Initialize(asn1SccMyInteger* pVal);

#define ERR_UPER_ENCODE_MYINTEGER		2  /**/
#define asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING       2
#define asn1SccMyInteger_REQUIRED_BITS_FOR_ENCODING        14

flag asn1SccMyInteger_Encode(const asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYINTEGER		3  /**/
flag asn1SccMyInteger_Decode(asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccTestInteger;


#define ERR_TESTINTEGER		6  /*(0 .. 10)*/
flag asn1SccTestInteger_IsConstraintValid(const asn1SccTestInteger* pVal, int* pErrCode);

void asn1SccTestInteger_Initialize(asn1SccTestInteger* pVal);

#define ERR_UPER_ENCODE_TESTINTEGER		7  /**/
#define asn1SccTestInteger_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccTestInteger_REQUIRED_BITS_FOR_ENCODING        4

flag asn1SccTestInteger_Encode(const asn1SccTestInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_TESTINTEGER		8  /**/
flag asn1SccTestInteger_Decode(asn1SccTestInteger* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccTestInteger asn1SccEnviron_test_p1;


#define ERR_ENVIRON_TEST_P1_2		91  /**/
flag asn1SccEnviron_test_p1_IsConstraintValid(const asn1SccEnviron_test_p1* pVal, int* pErrCode);

void asn1SccEnviron_test_p1_Initialize(asn1SccEnviron_test_p1* pVal);

#define ERR_UPER_ENCODE_ENVIRON_TEST_P1_2		92  /**/
#define asn1SccEnviron_test_p1_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccEnviron_test_p1_REQUIRED_BITS_FOR_ENCODING        4

flag asn1SccEnviron_test_p1_Encode(const asn1SccEnviron_test_p1* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_ENVIRON_TEST_P1_2		93  /**/
flag asn1SccEnviron_test_p1_Decode(asn1SccEnviron_test_p1* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int32;


#define ERR_T_INT32		11  /*(-2147483648 .. 2147483647)*/
flag asn1SccT_Int32_IsConstraintValid(const asn1SccT_Int32* pVal, int* pErrCode);

void asn1SccT_Int32_Initialize(asn1SccT_Int32* pVal);

#define ERR_UPER_ENCODE_T_INT32		12  /**/
#define asn1SccT_Int32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_Int32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_Int32_Encode(const asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT32		13  /**/
flag asn1SccT_Int32_Decode(asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt32;


#define ERR_T_UINT32		16  /*(0 .. 4294967295)*/
flag asn1SccT_UInt32_IsConstraintValid(const asn1SccT_UInt32* pVal, int* pErrCode);

void asn1SccT_UInt32_Initialize(asn1SccT_UInt32* pVal);

#define ERR_UPER_ENCODE_T_UINT32		17  /**/
#define asn1SccT_UInt32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_UInt32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_UInt32_Encode(const asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT32		18  /**/
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

#define ERR_T_RUNTIME_ERROR		71  /**/
#define ERR_T_RUNTIME_ERROR_NOERROR_2		46  /**/
#define ERR_T_RUNTIME_ERROR_ENCODEERROR_2		56  /**/
#define ERR_T_RUNTIME_ERROR_DECODEERROR_2		66  /**/
flag asn1SccT_Runtime_Error_IsConstraintValid(const asn1SccT_Runtime_Error* pVal, int* pErrCode);

void asn1SccT_Runtime_Error_Initialize(asn1SccT_Runtime_Error* pVal);

#define ERR_UPER_ENCODE_T_RUNTIME_ERROR		72  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_NOERROR_2		47  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_ENCODEERROR_2		57  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_DECODEERROR_2		67  /**/
#define asn1SccT_Runtime_Error_REQUIRED_BYTES_FOR_ENCODING       5
#define asn1SccT_Runtime_Error_REQUIRED_BITS_FOR_ENCODING        34

flag asn1SccT_Runtime_Error_Encode(const asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_RUNTIME_ERROR		73  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_NOERROR_2		48  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_ENCODEERROR_2		58  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_DECODEERROR_2		68  /**/
flag asn1SccT_Runtime_Error_Decode(asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int8;


#define ERR_T_INT8		21  /*(-128 .. 127)*/
flag asn1SccT_Int8_IsConstraintValid(const asn1SccT_Int8* pVal, int* pErrCode);

void asn1SccT_Int8_Initialize(asn1SccT_Int8* pVal);

#define ERR_UPER_ENCODE_T_INT8		22  /**/
#define asn1SccT_Int8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Int8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_Int8_Encode(const asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT8		23  /**/
flag asn1SccT_Int8_Decode(asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt8;


#define ERR_T_UINT8		26  /*(0 .. 255)*/
flag asn1SccT_UInt8_IsConstraintValid(const asn1SccT_UInt8* pVal, int* pErrCode);

void asn1SccT_UInt8_Initialize(asn1SccT_UInt8* pVal);

#define ERR_UPER_ENCODE_T_UINT8		27  /**/
#define asn1SccT_UInt8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_UInt8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_UInt8_Encode(const asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT8		28  /**/
flag asn1SccT_UInt8_Decode(asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef flag asn1SccT_Boolean;


#define ERR_T_BOOLEAN		31  /**/
flag asn1SccT_Boolean_IsConstraintValid(const asn1SccT_Boolean* pVal, int* pErrCode);

void asn1SccT_Boolean_Initialize(asn1SccT_Boolean* pVal);

#define ERR_UPER_ENCODE_T_BOOLEAN		32  /**/
#define asn1SccT_Boolean_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Boolean_REQUIRED_BITS_FOR_ENCODING        1

flag asn1SccT_Boolean_Encode(const asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_BOOLEAN		33  /**/
flag asn1SccT_Boolean_Decode(asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccT_Null_Record --------------------------------------------*/
typedef struct {

} asn1SccT_Null_Record;

#define ERR_T_NULL_RECORD		36  /**/
flag asn1SccT_Null_Record_IsConstraintValid(const asn1SccT_Null_Record* pVal, int* pErrCode);

void asn1SccT_Null_Record_Initialize(asn1SccT_Null_Record* pVal);

#define asn1SccT_Null_Record_REQUIRED_BYTES_FOR_ENCODING       0
#define asn1SccT_Null_Record_REQUIRED_BITS_FOR_ENCODING        0

flag asn1SccT_Null_Record_Encode(const asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

flag asn1SccT_Null_Record_Decode(asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccPID_Range;


#define ERR_PID_RANGE		76  /*(0..3)*/
flag asn1SccPID_Range_IsConstraintValid(const asn1SccPID_Range* pVal, int* pErrCode);

void asn1SccPID_Range_Initialize(asn1SccPID_Range* pVal);

#define ERR_UPER_ENCODE_PID_RANGE		77  /**/
#define asn1SccPID_Range_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_Range_REQUIRED_BITS_FOR_ENCODING        2

flag asn1SccPID_Range_Encode(const asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID_RANGE		78  /**/
flag asn1SccPID_Range_Decode(asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode);
typedef enum {
    PID_actuator = 0,
    PID_controller = 1,
    PID_environ = 2,
    PID_env = 3
} asn1SccPID;

// please use the following macros to avoid breaking code.
#define asn1SccPID_actuator PID_actuator
#define asn1SccPID_controller PID_controller
#define asn1SccPID_environ PID_environ
#define asn1SccPID_env PID_env

#define ERR_PID		81  /*actuator | controller | environ | env*/
flag asn1SccPID_IsConstraintValid(const asn1SccPID* pVal, int* pErrCode);

void asn1SccPID_Initialize(asn1SccPID* pVal);

#define ERR_UPER_ENCODE_PID		82  /**/
#define asn1SccPID_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_REQUIRED_BITS_FOR_ENCODING        2

flag asn1SccPID_Encode(const asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID		83  /**/
flag asn1SccPID_Decode(asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode);


/* ================= Encoding/Decoding function prototypes =================
 * These functions are placed at the end of the file to make sure all types
 * have been declared first, in case of parameterized ACN encodings
 * ========================================================================= */



#ifdef  __cplusplus
}

#endif

#endif
