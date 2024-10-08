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


typedef asn1SccSint asn1SccMyInteger;


#define ERR_MYINTEGER		1  /*(-1024..1024)*/
flag asn1SccMyInteger_IsConstraintValid(const asn1SccMyInteger* pVal, int* pErrCode);

void asn1SccMyInteger_Initialize(asn1SccMyInteger* pVal);

#define ERR_UPER_ENCODE_MYINTEGER		2  /**/
#define asn1SccMyInteger_REQUIRED_BYTES_FOR_ENCODING       2
#define asn1SccMyInteger_REQUIRED_BITS_FOR_ENCODING        12

flag asn1SccMyInteger_Encode(const asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYINTEGER		3  /**/
flag asn1SccMyInteger_Decode(asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccUnaryIntegerTestParam --------------------------------------------*/
typedef struct {
    asn1SccMyInteger expr;

} asn1SccUnaryIntegerTestParam;

#define ERR_UNARYINTEGERTESTPARAM		41  /**/
#define ERR_UNARYINTEGERTESTPARAM_EXPR_2		36  /**/
flag asn1SccUnaryIntegerTestParam_IsConstraintValid(const asn1SccUnaryIntegerTestParam* pVal, int* pErrCode);

void asn1SccUnaryIntegerTestParam_Initialize(asn1SccUnaryIntegerTestParam* pVal);

#define ERR_UPER_ENCODE_UNARYINTEGERTESTPARAM		42  /**/
#define ERR_UPER_ENCODE_UNARYINTEGERTESTPARAM_EXPR_2		37  /**/
#define asn1SccUnaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING       2
#define asn1SccUnaryIntegerTestParam_REQUIRED_BITS_FOR_ENCODING        12

flag asn1SccUnaryIntegerTestParam_Encode(const asn1SccUnaryIntegerTestParam* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_UNARYINTEGERTESTPARAM		43  /**/
#define ERR_UPER_DECODE_UNARYINTEGERTESTPARAM_EXPR_2		38  /**/
flag asn1SccUnaryIntegerTestParam_Decode(asn1SccUnaryIntegerTestParam* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccMyIntegerResult;


#define ERR_MYINTEGERRESULT		6  /*(-1048576..1048576)*/
flag asn1SccMyIntegerResult_IsConstraintValid(const asn1SccMyIntegerResult* pVal, int* pErrCode);

void asn1SccMyIntegerResult_Initialize(asn1SccMyIntegerResult* pVal);

#define ERR_UPER_ENCODE_MYINTEGERRESULT		7  /**/
#define asn1SccMyIntegerResult_REQUIRED_BYTES_FOR_ENCODING       3
#define asn1SccMyIntegerResult_REQUIRED_BITS_FOR_ENCODING        22

flag asn1SccMyIntegerResult_Encode(const asn1SccMyIntegerResult* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYINTEGERRESULT		8  /**/
flag asn1SccMyIntegerResult_Decode(asn1SccMyIntegerResult* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccBinaryIntegerTestParam --------------------------------------------*/
typedef enum {
    BinaryIntegerTestParam_oper_o_plus = 0,
    BinaryIntegerTestParam_oper_o_minus = 1,
    BinaryIntegerTestParam_oper_o_multiply = 2,
    BinaryIntegerTestParam_oper_o_divide = 3,
    BinaryIntegerTestParam_oper_o_modulo = 4,
    BinaryIntegerTestParam_oper_o_remainder = 5
} asn1SccBinaryIntegerTestParam_oper;

// please use the following macros to avoid breaking code.
#define asn1SccBinaryIntegerTestParam_oper_o_plus BinaryIntegerTestParam_oper_o_plus
#define asn1SccBinaryIntegerTestParam_oper_o_minus BinaryIntegerTestParam_oper_o_minus
#define asn1SccBinaryIntegerTestParam_oper_o_multiply BinaryIntegerTestParam_oper_o_multiply
#define asn1SccBinaryIntegerTestParam_oper_o_divide BinaryIntegerTestParam_oper_o_divide
#define asn1SccBinaryIntegerTestParam_oper_o_modulo BinaryIntegerTestParam_oper_o_modulo
#define asn1SccBinaryIntegerTestParam_oper_o_remainder BinaryIntegerTestParam_oper_o_remainder
typedef asn1SccSint asn1SccBinaryIntegerTestParam_left;

typedef asn1SccSint asn1SccBinaryIntegerTestParam_right;

typedef struct {
    asn1SccBinaryIntegerTestParam_oper oper;
    asn1SccBinaryIntegerTestParam_left left;
    asn1SccBinaryIntegerTestParam_right right;

} asn1SccBinaryIntegerTestParam;

#define ERR_BINARYINTEGERTESTPARAM_OPER		11  /*o-plus | o-minus | o-multiply | o-divide | o-modulo | o-remainder*/
flag asn1SccBinaryIntegerTestParam_oper_IsConstraintValid(const asn1SccBinaryIntegerTestParam_oper* pVal, int* pErrCode);

#define ERR_BINARYINTEGERTESTPARAM_LEFT		16  /*(-1024..1024)*/
flag asn1SccBinaryIntegerTestParam_left_IsConstraintValid(const asn1SccBinaryIntegerTestParam_left* pVal, int* pErrCode);

#define ERR_BINARYINTEGERTESTPARAM_RIGHT		21  /*(-1024..1024)*/
flag asn1SccBinaryIntegerTestParam_right_IsConstraintValid(const asn1SccBinaryIntegerTestParam_right* pVal, int* pErrCode);

#define ERR_BINARYINTEGERTESTPARAM		26  /**/
flag asn1SccBinaryIntegerTestParam_IsConstraintValid(const asn1SccBinaryIntegerTestParam* pVal, int* pErrCode);

void asn1SccBinaryIntegerTestParam_oper_Initialize(asn1SccBinaryIntegerTestParam_oper* pVal);
void asn1SccBinaryIntegerTestParam_left_Initialize(asn1SccBinaryIntegerTestParam_left* pVal);
void asn1SccBinaryIntegerTestParam_right_Initialize(asn1SccBinaryIntegerTestParam_right* pVal);
void asn1SccBinaryIntegerTestParam_Initialize(asn1SccBinaryIntegerTestParam* pVal);

#define ERR_UPER_ENCODE_BINARYINTEGERTESTPARAM		27  /**/
#define ERR_UPER_ENCODE_BINARYINTEGERTESTPARAM_OPER		12  /**/
#define ERR_UPER_ENCODE_BINARYINTEGERTESTPARAM_LEFT		17  /**/
#define ERR_UPER_ENCODE_BINARYINTEGERTESTPARAM_RIGHT		22  /**/
#define asn1SccBinaryIntegerTestParam_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccBinaryIntegerTestParam_REQUIRED_BITS_FOR_ENCODING        27

flag asn1SccBinaryIntegerTestParam_Encode(const asn1SccBinaryIntegerTestParam* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_BINARYINTEGERTESTPARAM		28  /**/
#define ERR_UPER_DECODE_BINARYINTEGERTESTPARAM_OPER		13  /**/
#define ERR_UPER_DECODE_BINARYINTEGERTESTPARAM_LEFT		18  /**/
#define ERR_UPER_DECODE_BINARYINTEGERTESTPARAM_RIGHT		23  /**/
flag asn1SccBinaryIntegerTestParam_Decode(asn1SccBinaryIntegerTestParam* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int32;


#define ERR_T_INT32		46  /*(-2147483648 .. 2147483647)*/
flag asn1SccT_Int32_IsConstraintValid(const asn1SccT_Int32* pVal, int* pErrCode);

void asn1SccT_Int32_Initialize(asn1SccT_Int32* pVal);

#define ERR_UPER_ENCODE_T_INT32		47  /**/
#define asn1SccT_Int32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_Int32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_Int32_Encode(const asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT32		48  /**/
flag asn1SccT_Int32_Decode(asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt32;


#define ERR_T_UINT32		51  /*(0 .. 4294967295)*/
flag asn1SccT_UInt32_IsConstraintValid(const asn1SccT_UInt32* pVal, int* pErrCode);

void asn1SccT_UInt32_Initialize(asn1SccT_UInt32* pVal);

#define ERR_UPER_ENCODE_T_UINT32		52  /**/
#define asn1SccT_UInt32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_UInt32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_UInt32_Encode(const asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT32		53  /**/
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

#define ERR_T_RUNTIME_ERROR		106  /**/
#define ERR_T_RUNTIME_ERROR_NOERROR_2		81  /**/
#define ERR_T_RUNTIME_ERROR_ENCODEERROR_2		91  /**/
#define ERR_T_RUNTIME_ERROR_DECODEERROR_2		101  /**/
flag asn1SccT_Runtime_Error_IsConstraintValid(const asn1SccT_Runtime_Error* pVal, int* pErrCode);

void asn1SccT_Runtime_Error_Initialize(asn1SccT_Runtime_Error* pVal);

#define ERR_UPER_ENCODE_T_RUNTIME_ERROR		107  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_NOERROR_2		82  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_ENCODEERROR_2		92  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_DECODEERROR_2		102  /**/
#define asn1SccT_Runtime_Error_REQUIRED_BYTES_FOR_ENCODING       5
#define asn1SccT_Runtime_Error_REQUIRED_BITS_FOR_ENCODING        34

flag asn1SccT_Runtime_Error_Encode(const asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_RUNTIME_ERROR		108  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_NOERROR_2		83  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_ENCODEERROR_2		93  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_DECODEERROR_2		103  /**/
flag asn1SccT_Runtime_Error_Decode(asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int8;


#define ERR_T_INT8		56  /*(-128 .. 127)*/
flag asn1SccT_Int8_IsConstraintValid(const asn1SccT_Int8* pVal, int* pErrCode);

void asn1SccT_Int8_Initialize(asn1SccT_Int8* pVal);

#define ERR_UPER_ENCODE_T_INT8		57  /**/
#define asn1SccT_Int8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Int8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_Int8_Encode(const asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT8		58  /**/
flag asn1SccT_Int8_Decode(asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt8;


#define ERR_T_UINT8		61  /*(0 .. 255)*/
flag asn1SccT_UInt8_IsConstraintValid(const asn1SccT_UInt8* pVal, int* pErrCode);

void asn1SccT_UInt8_Initialize(asn1SccT_UInt8* pVal);

#define ERR_UPER_ENCODE_T_UINT8		62  /**/
#define asn1SccT_UInt8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_UInt8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_UInt8_Encode(const asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT8		63  /**/
flag asn1SccT_UInt8_Decode(asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef flag asn1SccT_Boolean;


#define ERR_T_BOOLEAN		66  /**/
flag asn1SccT_Boolean_IsConstraintValid(const asn1SccT_Boolean* pVal, int* pErrCode);

void asn1SccT_Boolean_Initialize(asn1SccT_Boolean* pVal);

#define ERR_UPER_ENCODE_T_BOOLEAN		67  /**/
#define asn1SccT_Boolean_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Boolean_REQUIRED_BITS_FOR_ENCODING        1

flag asn1SccT_Boolean_Encode(const asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_BOOLEAN		68  /**/
flag asn1SccT_Boolean_Decode(asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccT_Null_Record --------------------------------------------*/
typedef struct {

} asn1SccT_Null_Record;

#define ERR_T_NULL_RECORD		71  /**/
flag asn1SccT_Null_Record_IsConstraintValid(const asn1SccT_Null_Record* pVal, int* pErrCode);

void asn1SccT_Null_Record_Initialize(asn1SccT_Null_Record* pVal);

#define asn1SccT_Null_Record_REQUIRED_BYTES_FOR_ENCODING       0
#define asn1SccT_Null_Record_REQUIRED_BITS_FOR_ENCODING        0

flag asn1SccT_Null_Record_Encode(const asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

flag asn1SccT_Null_Record_Decode(asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccPID_Range;


#define ERR_PID_RANGE		111  /*(0..4)*/
flag asn1SccPID_Range_IsConstraintValid(const asn1SccPID_Range* pVal, int* pErrCode);

void asn1SccPID_Range_Initialize(asn1SccPID_Range* pVal);

#define ERR_UPER_ENCODE_PID_RANGE		112  /**/
#define asn1SccPID_Range_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_Range_REQUIRED_BITS_FOR_ENCODING        3

flag asn1SccPID_Range_Encode(const asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID_RANGE		113  /**/
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

#define ERR_PID		116  /*taste-user-interface | timer-manager | actuator | controller | env*/
flag asn1SccPID_IsConstraintValid(const asn1SccPID* pVal, int* pErrCode);

void asn1SccPID_Initialize(asn1SccPID* pVal);

#define ERR_UPER_ENCODE_PID		117  /**/
#define asn1SccPID_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_REQUIRED_BITS_FOR_ENCODING        3

flag asn1SccPID_Encode(const asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID		118  /**/
flag asn1SccPID_Decode(asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode);


/* ================= Encoding/Decoding function prototypes =================
 * These functions are placed at the end of the file to make sure all types
 * have been declared first, in case of parameterized ACN encodings
 * ========================================================================= */



#ifdef  __cplusplus
}

#endif

#endif
