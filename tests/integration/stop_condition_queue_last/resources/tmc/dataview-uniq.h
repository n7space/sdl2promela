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
/*-- asn1SccMySequenceDataType --------------------------------------------*/


typedef struct {
    int nCount;
    asn1SccMyInteger arr[4];
} asn1SccMySequenceDataType_y;
typedef struct {
    asn1SccMyInteger x;
    asn1SccMySequenceDataType_y y;

} asn1SccMySequenceDataType;

#define ERR_MYSEQUENCEDATATYPE_Y		26  /*(SIZE(0..4))*/
#define ERR_MYSEQUENCEDATATYPE_Y_ELM_2		21  /**/
flag asn1SccMySequenceDataType_y_IsConstraintValid(const asn1SccMySequenceDataType_y* pVal, int* pErrCode);

#define ERR_MYSEQUENCEDATATYPE		31  /**/
#define ERR_MYSEQUENCEDATATYPE_X_2		11  /**/
flag asn1SccMySequenceDataType_IsConstraintValid(const asn1SccMySequenceDataType* pVal, int* pErrCode);

void asn1SccMySequenceDataType_y_Initialize(asn1SccMySequenceDataType_y* pVal);
void asn1SccMySequenceDataType_Initialize(asn1SccMySequenceDataType* pVal);

#define ERR_UPER_ENCODE_MYSEQUENCEDATATYPE		32  /**/
#define ERR_UPER_ENCODE_MYSEQUENCEDATATYPE_X_2		12  /**/
#define ERR_UPER_ENCODE_MYSEQUENCEDATATYPE_Y		27  /**/
#define ERR_UPER_ENCODE_MYSEQUENCEDATATYPE_Y_ELM_2		22  /**/
#define asn1SccMySequenceDataType_REQUIRED_BYTES_FOR_ENCODING       10
#define asn1SccMySequenceDataType_REQUIRED_BITS_FOR_ENCODING        73

flag asn1SccMySequenceDataType_Encode(const asn1SccMySequenceDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYSEQUENCEDATATYPE		33  /**/
#define ERR_UPER_DECODE_MYSEQUENCEDATATYPE_X_2		13  /**/
#define ERR_UPER_DECODE_MYSEQUENCEDATATYPE_Y		28  /**/
#define ERR_UPER_DECODE_MYSEQUENCEDATATYPE_Y_ELM_2		23  /**/
flag asn1SccMySequenceDataType_Decode(asn1SccMySequenceDataType* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccMyChoiceDataType --------------------------------------------*/

typedef enum {
    MyChoiceDataType_NONE,
    MyChoiceDataType_first_PRESENT,
    MyChoiceDataType_second_PRESENT
} asn1SccMyChoiceDataType_selection;

typedef union {
    asn1SccMyInteger first;
    asn1SccMyInteger second;
} asn1SccMyChoiceDataType_unchecked_union;

typedef struct {
    asn1SccMyChoiceDataType_selection kind;

    asn1SccMyChoiceDataType_unchecked_union u;
} asn1SccMyChoiceDataType;

#define ERR_MYCHOICEDATATYPE		56  /**/
#define ERR_MYCHOICEDATATYPE_FIRST_2		41  /**/
#define ERR_MYCHOICEDATATYPE_SECOND_2		51  /**/
flag asn1SccMyChoiceDataType_IsConstraintValid(const asn1SccMyChoiceDataType* pVal, int* pErrCode);

void asn1SccMyChoiceDataType_Initialize(asn1SccMyChoiceDataType* pVal);

#define ERR_UPER_ENCODE_MYCHOICEDATATYPE		57  /**/
#define ERR_UPER_ENCODE_MYCHOICEDATATYPE_FIRST_2		42  /**/
#define ERR_UPER_ENCODE_MYCHOICEDATATYPE_SECOND_2		52  /**/
#define asn1SccMyChoiceDataType_REQUIRED_BYTES_FOR_ENCODING       2
#define asn1SccMyChoiceDataType_REQUIRED_BITS_FOR_ENCODING        15

flag asn1SccMyChoiceDataType_Encode(const asn1SccMyChoiceDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYCHOICEDATATYPE		58  /**/
#define ERR_UPER_DECODE_MYCHOICEDATATYPE_FIRST_2		43  /**/
#define ERR_UPER_DECODE_MYCHOICEDATATYPE_SECOND_2		53  /**/
flag asn1SccMyChoiceDataType_Decode(asn1SccMyChoiceDataType* pVal, BitStream* pBitStrm, int* pErrCode);


typedef struct {
    int nCount;
    asn1SccMyInteger arr[3];
} asn1SccMyArrayDataType;

#define ERR_MYARRAYDATATYPE		71  /*(SIZE(1..3))*/
#define ERR_MYARRAYDATATYPE_ELM_2		66  /**/
flag asn1SccMyArrayDataType_IsConstraintValid(const asn1SccMyArrayDataType* pVal, int* pErrCode);

void asn1SccMyArrayDataType_Initialize(asn1SccMyArrayDataType* pVal);

#define ERR_UPER_ENCODE_MYARRAYDATATYPE		72  /**/
#define ERR_UPER_ENCODE_MYARRAYDATATYPE_ELM_2		67  /**/
#define asn1SccMyArrayDataType_REQUIRED_BYTES_FOR_ENCODING       6
#define asn1SccMyArrayDataType_REQUIRED_BITS_FOR_ENCODING        44

flag asn1SccMyArrayDataType_Encode(const asn1SccMyArrayDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYARRAYDATATYPE		73  /**/
#define ERR_UPER_DECODE_MYARRAYDATATYPE_ELM_2		68  /**/
flag asn1SccMyArrayDataType_Decode(asn1SccMyArrayDataType* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccMySequenceWithOptionalsDataType --------------------------------------------*/
typedef struct {
    unsigned long b:1;
    unsigned long c:1;
} asn1SccMySequenceWithOptionalsDataType_exist;
typedef struct {
    asn1SccMyInteger a;
    asn1SccMyInteger b;
    asn1SccMyInteger c;

    asn1SccMySequenceWithOptionalsDataType_exist exist;

} asn1SccMySequenceWithOptionalsDataType;

#define ERR_MYSEQUENCEWITHOPTIONALSDATATYPE		106  /**/
#define ERR_MYSEQUENCEWITHOPTIONALSDATATYPE_A_2		81  /**/
#define ERR_MYSEQUENCEWITHOPTIONALSDATATYPE_B_2		91  /**/
#define ERR_MYSEQUENCEWITHOPTIONALSDATATYPE_C_2		101  /**/
flag asn1SccMySequenceWithOptionalsDataType_IsConstraintValid(const asn1SccMySequenceWithOptionalsDataType* pVal, int* pErrCode);

void asn1SccMySequenceWithOptionalsDataType_Initialize(asn1SccMySequenceWithOptionalsDataType* pVal);

#define ERR_UPER_ENCODE_MYSEQUENCEWITHOPTIONALSDATATYPE		107  /**/
#define ERR_UPER_ENCODE_MYSEQUENCEWITHOPTIONALSDATATYPE_A_2		82  /**/
#define ERR_UPER_ENCODE_MYSEQUENCEWITHOPTIONALSDATATYPE_B_2		92  /**/
#define ERR_UPER_ENCODE_MYSEQUENCEWITHOPTIONALSDATATYPE_C_2		102  /**/
#define asn1SccMySequenceWithOptionalsDataType_REQUIRED_BYTES_FOR_ENCODING       6
#define asn1SccMySequenceWithOptionalsDataType_REQUIRED_BITS_FOR_ENCODING        44

flag asn1SccMySequenceWithOptionalsDataType_Encode(const asn1SccMySequenceWithOptionalsDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_MYSEQUENCEWITHOPTIONALSDATATYPE		108  /**/
#define ERR_UPER_DECODE_MYSEQUENCEWITHOPTIONALSDATATYPE_A_2		83  /**/
#define ERR_UPER_DECODE_MYSEQUENCEWITHOPTIONALSDATATYPE_B_2		93  /**/
#define ERR_UPER_DECODE_MYSEQUENCEWITHOPTIONALSDATATYPE_C_2		103  /**/
flag asn1SccMySequenceWithOptionalsDataType_Decode(asn1SccMySequenceWithOptionalsDataType* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int32;


#define ERR_T_INT32		111  /*(-2147483648 .. 2147483647)*/
flag asn1SccT_Int32_IsConstraintValid(const asn1SccT_Int32* pVal, int* pErrCode);

void asn1SccT_Int32_Initialize(asn1SccT_Int32* pVal);

#define ERR_UPER_ENCODE_T_INT32		112  /**/
#define asn1SccT_Int32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_Int32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_Int32_Encode(const asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT32		113  /**/
flag asn1SccT_Int32_Decode(asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt32;


#define ERR_T_UINT32		116  /*(0 .. 4294967295)*/
flag asn1SccT_UInt32_IsConstraintValid(const asn1SccT_UInt32* pVal, int* pErrCode);

void asn1SccT_UInt32_Initialize(asn1SccT_UInt32* pVal);

#define ERR_UPER_ENCODE_T_UINT32		117  /**/
#define asn1SccT_UInt32_REQUIRED_BYTES_FOR_ENCODING       4
#define asn1SccT_UInt32_REQUIRED_BITS_FOR_ENCODING        32

flag asn1SccT_UInt32_Encode(const asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT32		118  /**/
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

#define ERR_T_RUNTIME_ERROR		171  /**/
#define ERR_T_RUNTIME_ERROR_NOERROR_2		146  /**/
#define ERR_T_RUNTIME_ERROR_ENCODEERROR_2		156  /**/
#define ERR_T_RUNTIME_ERROR_DECODEERROR_2		166  /**/
flag asn1SccT_Runtime_Error_IsConstraintValid(const asn1SccT_Runtime_Error* pVal, int* pErrCode);

void asn1SccT_Runtime_Error_Initialize(asn1SccT_Runtime_Error* pVal);

#define ERR_UPER_ENCODE_T_RUNTIME_ERROR		172  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_NOERROR_2		147  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_ENCODEERROR_2		157  /**/
#define ERR_UPER_ENCODE_T_RUNTIME_ERROR_DECODEERROR_2		167  /**/
#define asn1SccT_Runtime_Error_REQUIRED_BYTES_FOR_ENCODING       5
#define asn1SccT_Runtime_Error_REQUIRED_BITS_FOR_ENCODING        34

flag asn1SccT_Runtime_Error_Encode(const asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_RUNTIME_ERROR		173  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_NOERROR_2		148  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_ENCODEERROR_2		158  /**/
#define ERR_UPER_DECODE_T_RUNTIME_ERROR_DECODEERROR_2		168  /**/
flag asn1SccT_Runtime_Error_Decode(asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccSint asn1SccT_Int8;


#define ERR_T_INT8		121  /*(-128 .. 127)*/
flag asn1SccT_Int8_IsConstraintValid(const asn1SccT_Int8* pVal, int* pErrCode);

void asn1SccT_Int8_Initialize(asn1SccT_Int8* pVal);

#define ERR_UPER_ENCODE_T_INT8		122  /**/
#define asn1SccT_Int8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Int8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_Int8_Encode(const asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_INT8		123  /**/
flag asn1SccT_Int8_Decode(asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccT_UInt8;


#define ERR_T_UINT8		126  /*(0 .. 255)*/
flag asn1SccT_UInt8_IsConstraintValid(const asn1SccT_UInt8* pVal, int* pErrCode);

void asn1SccT_UInt8_Initialize(asn1SccT_UInt8* pVal);

#define ERR_UPER_ENCODE_T_UINT8		127  /**/
#define asn1SccT_UInt8_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_UInt8_REQUIRED_BITS_FOR_ENCODING        8

flag asn1SccT_UInt8_Encode(const asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_UINT8		128  /**/
flag asn1SccT_UInt8_Decode(asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode);
typedef flag asn1SccT_Boolean;


#define ERR_T_BOOLEAN		131  /**/
flag asn1SccT_Boolean_IsConstraintValid(const asn1SccT_Boolean* pVal, int* pErrCode);

void asn1SccT_Boolean_Initialize(asn1SccT_Boolean* pVal);

#define ERR_UPER_ENCODE_T_BOOLEAN		132  /**/
#define asn1SccT_Boolean_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccT_Boolean_REQUIRED_BITS_FOR_ENCODING        1

flag asn1SccT_Boolean_Encode(const asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_T_BOOLEAN		133  /**/
flag asn1SccT_Boolean_Decode(asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode);
/*-- asn1SccT_Null_Record --------------------------------------------*/
typedef struct {

} asn1SccT_Null_Record;

#define ERR_T_NULL_RECORD		136  /**/
flag asn1SccT_Null_Record_IsConstraintValid(const asn1SccT_Null_Record* pVal, int* pErrCode);

void asn1SccT_Null_Record_Initialize(asn1SccT_Null_Record* pVal);

#define asn1SccT_Null_Record_REQUIRED_BYTES_FOR_ENCODING       0
#define asn1SccT_Null_Record_REQUIRED_BITS_FOR_ENCODING        0

flag asn1SccT_Null_Record_Encode(const asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

flag asn1SccT_Null_Record_Decode(asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode);
typedef asn1SccUint asn1SccPID_Range;


#define ERR_PID_RANGE		176  /*(0..4)*/
flag asn1SccPID_Range_IsConstraintValid(const asn1SccPID_Range* pVal, int* pErrCode);

void asn1SccPID_Range_Initialize(asn1SccPID_Range* pVal);

#define ERR_UPER_ENCODE_PID_RANGE		177  /**/
#define asn1SccPID_Range_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_Range_REQUIRED_BITS_FOR_ENCODING        3

flag asn1SccPID_Range_Encode(const asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID_RANGE		178  /**/
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

#define ERR_PID		181  /*taste-user-interface | timer-manager | actuator | controller | env*/
flag asn1SccPID_IsConstraintValid(const asn1SccPID* pVal, int* pErrCode);

void asn1SccPID_Initialize(asn1SccPID* pVal);

#define ERR_UPER_ENCODE_PID		182  /**/
#define asn1SccPID_REQUIRED_BYTES_FOR_ENCODING       1
#define asn1SccPID_REQUIRED_BITS_FOR_ENCODING        3

flag asn1SccPID_Encode(const asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints);

#define ERR_UPER_DECODE_PID		183  /**/
flag asn1SccPID_Decode(asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode);


/* ================= Encoding/Decoding function prototypes =================
 * These functions are placed at the end of the file to make sure all types
 * have been declared first, in case of parameterized ACN encodings
 * ========================================================================= */



#ifdef  __cplusplus
}

#endif

#endif
