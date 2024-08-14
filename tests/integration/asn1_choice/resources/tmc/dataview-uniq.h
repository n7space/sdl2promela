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
typedef asn1SccUint asn1SccMyTestInteger;


#define ERR_MYTESTINTEGER		6  /*(0 .. 3)*/
flag asn1SccMyTestInteger_IsConstraintValid(const asn1SccMyTestInteger* pVal, int* pErrCode);

void asn1SccMyTestInteger_Initialize(asn1SccMyTestInteger* pVal);

#define ERR_UPER_ENCODE_MYTESTINTEGER		7  /**/
#define asn1SccMyTestInteger_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccMyTestInteger_REQUIRED_BITS_FOR_ENCODING        2

flag asn1SccMyTestInteger_Encode(const asn1SccMyTestInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYTESTINTEGER		8  /**/
flag asn1SccMyTestInteger_Decode(asn1SccMyTestInteger* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccMyTestInteger asn1SccEnviron_test_p1;


#define ERR_ENVIRON_TEST_P1_2		111  /**/
flag asn1SccEnviron_test_p1_IsConstraintValid(const asn1SccEnviron_test_p1* pVal, int* pErrCode);

void asn1SccEnviron_test_p1_Initialize(asn1SccEnviron_test_p1* pVal);

#define ERR_UPER_ENCODE_ENVIRON_TEST_P1_2		112  /**/
#define asn1SccEnviron_test_p1_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccEnviron_test_p1_REQUIRED_BITS_FOR_ENCODING        2

flag asn1SccEnviron_test_p1_Encode(const asn1SccEnviron_test_p1* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_ENVIRON_TEST_P1_2		113  /**/
flag asn1SccEnviron_test_p1_Decode(asn1SccEnviron_test_p1* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccMyTestParam --------------------------------------------*/
typedef asn1SccUint asn1SccMyTestParam_snare;

typedef asn1SccUint asn1SccMyTestParam_kick;

typedef asn1SccUint asn1SccMyTestParam_ride;


typedef enum {
    MyTestParam_NONE,
    MyTestParam_snare_PRESENT,
    MyTestParam_kick_PRESENT,
    MyTestParam_ride_PRESENT
} asn1SccMyTestParam_selection;

typedef union {
    asn1SccMyTestParam_snare snare;
    asn1SccMyTestParam_kick kick;
    asn1SccMyTestParam_ride ride;
} asn1SccMyTestParam_unchecked_union;

typedef struct {
    asn1SccMyTestParam_selection kind;

    asn1SccMyTestParam_unchecked_union u;
} asn1SccMyTestParam;

#define ERR_MYTESTPARAM_SNARE		11  /*(0..127)*/
flag asn1SccMyTestParam_snare_IsConstraintValid(const asn1SccMyTestParam_snare* pVal, int* pErrCode);

#define ERR_MYTESTPARAM_KICK		16  /*(0..127)*/
flag asn1SccMyTestParam_kick_IsConstraintValid(const asn1SccMyTestParam_kick* pVal, int* pErrCode);

#define ERR_MYTESTPARAM_RIDE		21  /*(0..127)*/
flag asn1SccMyTestParam_ride_IsConstraintValid(const asn1SccMyTestParam_ride* pVal, int* pErrCode);

#define ERR_MYTESTPARAM		26  /**/
flag asn1SccMyTestParam_IsConstraintValid(const asn1SccMyTestParam* pVal, int* pErrCode);

void asn1SccMyTestParam_snare_Initialize(asn1SccMyTestParam_snare* pVal);
void asn1SccMyTestParam_kick_Initialize(asn1SccMyTestParam_kick* pVal);
void asn1SccMyTestParam_ride_Initialize(asn1SccMyTestParam_ride* pVal);
void asn1SccMyTestParam_Initialize(asn1SccMyTestParam* pVal);

#define ERR_UPER_ENCODE_MYTESTPARAM		27  /**/
#define ERR_UPER_ENCODE_MYTESTPARAM_SNARE		12  /**/
#define ERR_UPER_ENCODE_MYTESTPARAM_KICK		17  /**/
#define ERR_UPER_ENCODE_MYTESTPARAM_RIDE		22  /**/
#define asn1SccMyTestParam_REQUIRED_BYTES_FOR_ENCODING       2
#define asn1SccMyTestParam_REQUIRED_BITS_FOR_ENCODING        9

flag asn1SccMyTestParam_Encode(const asn1SccMyTestParam* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYTESTPARAM		28  /**/
#define ERR_UPER_DECODE_MYTESTPARAM_SNARE		13  /**/
#define ERR_UPER_DECODE_MYTESTPARAM_KICK		18  /**/
#define ERR_UPER_DECODE_MYTESTPARAM_RIDE		23  /**/
flag asn1SccMyTestParam_Decode(asn1SccMyTestParam* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int32;


#define ERR_T_INT32		31  /*(-2147483648 .. 2147483647)*/
flag asn1SccT_Int32_IsConstraintValid(const asn1SccT_Int32* pVal, int* pErrCode);

void asn1SccT_Int32_Initialize(asn1SccT_Int32* pVal);

#define ERR_UPER_ENCODE_T_INT32		32  /**/
#define asn1SccT_Int32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_Int32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_Int32_Encode(const asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT32		33  /**/
flag asn1SccT_Int32_Decode(asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt32;


#define ERR_T_UINT32		36  /*(0 .. 4294967295)*/
flag asn1SccT_UInt32_IsConstraintValid(const asn1SccT_UInt32* pVal, int* pErrCode);

void asn1SccT_UInt32_Initialize(asn1SccT_UInt32* pVal);

#define ERR_UPER_ENCODE_T_UINT32		37  /**/
#define asn1SccT_UInt32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_UInt32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_UInt32_Encode(const asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT32		38  /**/
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

#define ERR_T_RUNTIME_ERROR		91  /**/
#define ERR_T_RUNTIME_ERROR_NOERROR_2		66  /**/
#define ERR_T_RUNTIME_ERROR_ENCODEERROR_2		76  /**/
#define ERR_T_RUNTIME_ERROR_DECODEERROR_2		86  /**/
flag asn1SccT_Runtime_Error_IsConstraintValid(const asn1SccT_Runtime_Error* pVal, int* pErrCode);

void asn1SccT_Runtime_Error_Initialize(asn1SccT_Runtime_Error* pVal);

#define ERR_UPER_ENCODE_T_RUNTIME_ERROR		92  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_NOERROR_2		67  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_ENCODEERROR_2		77  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_DECODEERROR_2		87  /**/
#define asn1SccT_Runtime_Error_REQUIRED_BYTES_FOR_ENCODING       5
#define asn1SccT_Runtime_Error_REQUIRED_BITS_FOR_ENCODING        34

flag asn1SccT_Runtime_Error_Encode(const asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_RUNTIME_ERROR		93  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_NOERROR_2		68  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_ENCODEERROR_2		78  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_DECODEERROR_2		88  /**/
flag asn1SccT_Runtime_Error_Decode(asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int8;


#define ERR_T_INT8		41  /*(-128 .. 127)*/
flag asn1SccT_Int8_IsConstraintValid(const asn1SccT_Int8* pVal, int* pErrCode);

void asn1SccT_Int8_Initialize(asn1SccT_Int8* pVal);

#define ERR_UPER_ENCODE_T_INT8		42  /**/
#define asn1SccT_Int8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Int8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_Int8_Encode(const asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT8		43  /**/
flag asn1SccT_Int8_Decode(asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt8;


#define ERR_T_UINT8		46  /*(0 .. 255)*/
flag asn1SccT_UInt8_IsConstraintValid(const asn1SccT_UInt8* pVal, int* pErrCode);

void asn1SccT_UInt8_Initialize(asn1SccT_UInt8* pVal);

#define ERR_UPER_ENCODE_T_UINT8		47  /**/
#define asn1SccT_UInt8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_UInt8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_UInt8_Encode(const asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT8		48  /**/
flag asn1SccT_UInt8_Decode(asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef flag asn1SccT_Boolean;


#define ERR_T_BOOLEAN		51  /**/
flag asn1SccT_Boolean_IsConstraintValid(const asn1SccT_Boolean* pVal, int* pErrCode);

void asn1SccT_Boolean_Initialize(asn1SccT_Boolean* pVal);

#define ERR_UPER_ENCODE_T_BOOLEAN		52  /**/
#define asn1SccT_Boolean_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Boolean_REQUIRED_BITS_FOR_ENCODING        1

flag asn1SccT_Boolean_Encode(const asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_BOOLEAN		53  /**/
flag asn1SccT_Boolean_Decode(asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccT_Null_Record --------------------------------------------*/
typedef struct {

} asn1SccT_Null_Record;

#define ERR_T_NULL_RECORD		56  /**/
flag asn1SccT_Null_Record_IsConstraintValid(const asn1SccT_Null_Record* pVal, int* pErrCode);

void asn1SccT_Null_Record_Initialize(asn1SccT_Null_Record* pVal);

#define asn1SccT_Null_Record_REQUIRED_BYTES_FOR_ENCODING       0
#define asn1SccT_Null_Record_REQUIRED_BITS_FOR_ENCODING        0

flag asn1SccT_Null_Record_Encode(const asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

flag asn1SccT_Null_Record_Decode(asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccPID_Range;


#define ERR_PID_RANGE		96  /*(0..3)*/
flag asn1SccPID_Range_IsConstraintValid(const asn1SccPID_Range* pVal, int* pErrCode);

void asn1SccPID_Range_Initialize(asn1SccPID_Range* pVal);

#define ERR_UPER_ENCODE_PID_RANGE		97  /**/
#define asn1SccPID_Range_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_Range_REQUIRED_BITS_FOR_ENCODING        2

flag asn1SccPID_Range_Encode(const asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID_RANGE		98  /**/
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

#define ERR_PID		101  /*actuator | controller | environ | env*/
flag asn1SccPID_IsConstraintValid(const asn1SccPID* pVal, int* pErrCode);

void asn1SccPID_Initialize(asn1SccPID* pVal);

#define ERR_UPER_ENCODE_PID		102  /**/
#define asn1SccPID_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_REQUIRED_BITS_FOR_ENCODING        2

flag asn1SccPID_Encode(const asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID		103  /**/
flag asn1SccPID_Decode(asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode);


/* ================= Encoding/Decoding function prototypes =================
 * These functions are placed at the end of the file to make sure all types
 * have been declared first, in case of parameterized ACN encodings
 * ========================================================================= */



#ifdef  __cplusplus
}

#endif

#endif
