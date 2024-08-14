/*
Code automatically generated by asn1scc tool
*/
#include <limits.h>
#include <string.h>
#include <math.h>

#include "asn1crt_encoding.h"
#include "asn1crt_encoding_uper.h"

#include "dataview-uniq.h"



flag asn1SccMyInteger_IsConstraintValid(const asn1SccMyInteger* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 10000UL);
    *pErrCode = ret ? 0 :  ERR_MYINTEGER;

	return ret;
}

void asn1SccMyInteger_Initialize(asn1SccMyInteger* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}

flag asn1SccMyInteger_Encode(const asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMyInteger_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintPosWholeNumber(pBitStrm, (*(pVal)), 0, 10000);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMyInteger_Decode(asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, pVal, 0, 10000);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYINTEGER;

	return ret  && asn1SccMyInteger_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccMyTestInteger_IsConstraintValid(const asn1SccMyTestInteger* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 3UL);
    *pErrCode = ret ? 0 :  ERR_MYTESTINTEGER;

	return ret;
}

void asn1SccMyTestInteger_Initialize(asn1SccMyTestInteger* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}

flag asn1SccMyTestInteger_Encode(const asn1SccMyTestInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMyTestInteger_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintPosWholeNumber(pBitStrm, (*(pVal)), 0, 3);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMyTestInteger_Decode(asn1SccMyTestInteger* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, pVal, 0, 3);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYTESTINTEGER;

	return ret  && asn1SccMyTestInteger_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccEnviron_test_p1_IsConstraintValid(const asn1SccEnviron_test_p1* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = asn1SccMyTestInteger_IsConstraintValid(pVal, pErrCode);

	return ret;
}

void asn1SccEnviron_test_p1_Initialize(asn1SccEnviron_test_p1* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}

flag asn1SccEnviron_test_p1_Encode(const asn1SccEnviron_test_p1* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccEnviron_test_p1_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    ret = asn1SccMyTestInteger_Encode(pVal, pBitStrm, pErrCode, FALSE);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccEnviron_test_p1_Decode(asn1SccEnviron_test_p1* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = asn1SccMyTestInteger_Decode(pVal, pBitStrm, pErrCode);

	return ret  && asn1SccEnviron_test_p1_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccMyTestParam_snare_IsConstraintValid(const asn1SccMyTestParam_snare* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 127UL);
    *pErrCode = ret ? 0 :  ERR_MYTESTPARAM_SNARE;

	return ret;
}

flag asn1SccMyTestParam_kick_IsConstraintValid(const asn1SccMyTestParam_kick* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 127UL);
    *pErrCode = ret ? 0 :  ERR_MYTESTPARAM_KICK;

	return ret;
}

flag asn1SccMyTestParam_ride_IsConstraintValid(const asn1SccMyTestParam_ride* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 127UL);
    *pErrCode = ret ? 0 :  ERR_MYTESTPARAM_RIDE;

	return ret;
}

flag asn1SccMyTestParam_IsConstraintValid(const asn1SccMyTestParam* pVal, int* pErrCode)
{
    flag ret = TRUE;
    if (pVal->kind == MyTestParam_snare_PRESENT) {
    	ret = asn1SccMyTestParam_snare_IsConstraintValid((&(pVal->u.snare)), pErrCode);
    }
    if (ret) {
        if (pVal->kind == MyTestParam_kick_PRESENT) {
        	ret = asn1SccMyTestParam_kick_IsConstraintValid((&(pVal->u.kick)), pErrCode);
        }
        if (ret) {
            if (pVal->kind == MyTestParam_ride_PRESENT) {
            	ret = asn1SccMyTestParam_ride_IsConstraintValid((&(pVal->u.ride)), pErrCode);
            }
        }   /*COVERAGE_IGNORE*/
    }   /*COVERAGE_IGNORE*/

	return ret;
}

void asn1SccMyTestParam_snare_Initialize(asn1SccMyTestParam_snare* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}
void asn1SccMyTestParam_kick_Initialize(asn1SccMyTestParam_kick* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}
void asn1SccMyTestParam_ride_Initialize(asn1SccMyTestParam_ride* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}
void asn1SccMyTestParam_Initialize(asn1SccMyTestParam* pVal)
{
	(void)pVal;


	pVal->kind = MyTestParam_snare_PRESENT;
	asn1SccMyTestParam_snare_Initialize((&(pVal->u.snare)));
}

flag asn1SccMyTestParam_Encode(const asn1SccMyTestParam* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMyTestParam_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    switch(pVal->kind)
	    {
	    case MyTestParam_snare_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 0, 0, 2);
	    	BitStream_EncodeConstraintPosWholeNumber(pBitStrm, pVal->u.snare, 0, 127);
	    	break;
	    case MyTestParam_kick_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 1, 0, 2);
	    	BitStream_EncodeConstraintPosWholeNumber(pBitStrm, pVal->u.kick, 0, 127);
	    	break;
	    case MyTestParam_ride_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 2, 0, 2);
	    	BitStream_EncodeConstraintPosWholeNumber(pBitStrm, pVal->u.ride, 0, 127);
	    	break;
	    default:                            /*COVERAGE_IGNORE*/
	        *pErrCode = ERR_UPER_ENCODE_MYTESTPARAM;         /*COVERAGE_IGNORE*/
	        ret = FALSE;                    /*COVERAGE_IGNORE*/
	    }
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMyTestParam_Decode(asn1SccMyTestParam* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;

	asn1SccSint asn1SccMyTestParam_index_tmp;

	ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &asn1SccMyTestParam_index_tmp, 0, 2);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYTESTPARAM;
	if (ret) {
	    switch(asn1SccMyTestParam_index_tmp)
	    {
	    case 0:
	    	pVal->kind = MyTestParam_snare_PRESENT;
	    	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, (&(pVal->u.snare)), 0, 127);
	    	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYTESTPARAM_SNARE;
	    	break;
	    case 1:
	    	pVal->kind = MyTestParam_kick_PRESENT;
	    	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, (&(pVal->u.kick)), 0, 127);
	    	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYTESTPARAM_KICK;
	    	break;
	    case 2:
	    	pVal->kind = MyTestParam_ride_PRESENT;
	    	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, (&(pVal->u.ride)), 0, 127);
	    	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYTESTPARAM_RIDE;
	    	break;
	    default:                        /*COVERAGE_IGNORE*/
	        *pErrCode = ERR_UPER_DECODE_MYTESTPARAM;     /*COVERAGE_IGNORE*/
	        ret = FALSE;                /*COVERAGE_IGNORE*/
	    }
	}  /*COVERAGE_IGNORE*/

	return ret  && asn1SccMyTestParam_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccT_Int32_IsConstraintValid(const asn1SccT_Int32* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((-2147483648LL <= (*(pVal))) && ((*(pVal)) <= 2147483647LL));
    *pErrCode = ret ? 0 :  ERR_T_INT32;

	return ret;
}

void asn1SccT_Int32_Initialize(asn1SccT_Int32* pVal)
{
	(void)pVal;


	(*(pVal)) = 0LL;
}

flag asn1SccT_Int32_Encode(const asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccT_Int32_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintWholeNumber(pBitStrm, (*(pVal)), -2147483648LL, 2147483647LL);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccT_Int32_Decode(asn1SccT_Int32* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, pVal, -2147483648LL, 2147483647LL);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_T_INT32;

	return ret  && asn1SccT_Int32_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccT_UInt32_IsConstraintValid(const asn1SccT_UInt32* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 4294967295UL);
    *pErrCode = ret ? 0 :  ERR_T_UINT32;

	return ret;
}

void asn1SccT_UInt32_Initialize(asn1SccT_UInt32* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}

flag asn1SccT_UInt32_Encode(const asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccT_UInt32_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintPosWholeNumber(pBitStrm, (*(pVal)), 0, 4294967295LL);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccT_UInt32_Decode(asn1SccT_UInt32* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, pVal, 0, 4294967295LL);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_T_UINT32;

	return ret  && asn1SccT_UInt32_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccT_Runtime_Error_IsConstraintValid(const asn1SccT_Runtime_Error* pVal, int* pErrCode)
{
    flag ret = TRUE;
    if (pVal->kind == T_Runtime_Error_noerror_PRESENT) {
    	ret = asn1SccT_UInt32_IsConstraintValid((&(pVal->u.noerror)), pErrCode);
    }
    if (ret) {
        if (pVal->kind == T_Runtime_Error_encodeerror_PRESENT) {
        	ret = asn1SccT_Int32_IsConstraintValid((&(pVal->u.encodeerror)), pErrCode);
        }
        if (ret) {
            if (pVal->kind == T_Runtime_Error_decodeerror_PRESENT) {
            	ret = asn1SccT_Int32_IsConstraintValid((&(pVal->u.decodeerror)), pErrCode);
            }
        }   /*COVERAGE_IGNORE*/
    }   /*COVERAGE_IGNORE*/

	return ret;
}

void asn1SccT_Runtime_Error_Initialize(asn1SccT_Runtime_Error* pVal)
{
	(void)pVal;


	pVal->kind = T_Runtime_Error_noerror_PRESENT;
	pVal->u.noerror = 0UL;
}

flag asn1SccT_Runtime_Error_Encode(const asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccT_Runtime_Error_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    switch(pVal->kind)
	    {
	    case T_Runtime_Error_noerror_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 0, 0, 2);
	    	ret = asn1SccT_UInt32_Encode((&(pVal->u.noerror)), pBitStrm, pErrCode, FALSE);
	    	break;
	    case T_Runtime_Error_encodeerror_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 1, 0, 2);
	    	ret = asn1SccT_Int32_Encode((&(pVal->u.encodeerror)), pBitStrm, pErrCode, FALSE);
	    	break;
	    case T_Runtime_Error_decodeerror_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 2, 0, 2);
	    	ret = asn1SccT_Int32_Encode((&(pVal->u.decodeerror)), pBitStrm, pErrCode, FALSE);
	    	break;
	    default:                            /*COVERAGE_IGNORE*/
	        *pErrCode = ERR_UPER_ENCODE_T_RUNTIME_ERROR;         /*COVERAGE_IGNORE*/
	        ret = FALSE;                    /*COVERAGE_IGNORE*/
	    }
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccT_Runtime_Error_Decode(asn1SccT_Runtime_Error* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;

	asn1SccSint asn1SccT_Runtime_Error_index_tmp;

	ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &asn1SccT_Runtime_Error_index_tmp, 0, 2);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_T_RUNTIME_ERROR;
	if (ret) {
	    switch(asn1SccT_Runtime_Error_index_tmp)
	    {
	    case 0:
	    	pVal->kind = T_Runtime_Error_noerror_PRESENT;
	    	ret = asn1SccT_UInt32_Decode((&(pVal->u.noerror)), pBitStrm, pErrCode);
	    	break;
	    case 1:
	    	pVal->kind = T_Runtime_Error_encodeerror_PRESENT;
	    	ret = asn1SccT_Int32_Decode((&(pVal->u.encodeerror)), pBitStrm, pErrCode);
	    	break;
	    case 2:
	    	pVal->kind = T_Runtime_Error_decodeerror_PRESENT;
	    	ret = asn1SccT_Int32_Decode((&(pVal->u.decodeerror)), pBitStrm, pErrCode);
	    	break;
	    default:                        /*COVERAGE_IGNORE*/
	        *pErrCode = ERR_UPER_DECODE_T_RUNTIME_ERROR;     /*COVERAGE_IGNORE*/
	        ret = FALSE;                /*COVERAGE_IGNORE*/
	    }
	}  /*COVERAGE_IGNORE*/

	return ret  && asn1SccT_Runtime_Error_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccT_Int8_IsConstraintValid(const asn1SccT_Int8* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((-128LL <= (*(pVal))) && ((*(pVal)) <= 127LL));
    *pErrCode = ret ? 0 :  ERR_T_INT8;

	return ret;
}

void asn1SccT_Int8_Initialize(asn1SccT_Int8* pVal)
{
	(void)pVal;


	(*(pVal)) = 0LL;
}

flag asn1SccT_Int8_Encode(const asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccT_Int8_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintWholeNumber(pBitStrm, (*(pVal)), -128, 127);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccT_Int8_Decode(asn1SccT_Int8* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, pVal, -128, 127);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_T_INT8;

	return ret  && asn1SccT_Int8_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccT_UInt8_IsConstraintValid(const asn1SccT_UInt8* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 255UL);
    *pErrCode = ret ? 0 :  ERR_T_UINT8;

	return ret;
}

void asn1SccT_UInt8_Initialize(asn1SccT_UInt8* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}

flag asn1SccT_UInt8_Encode(const asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccT_UInt8_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintPosWholeNumber(pBitStrm, (*(pVal)), 0, 255);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccT_UInt8_Decode(asn1SccT_UInt8* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, pVal, 0, 255);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_T_UINT8;

	return ret  && asn1SccT_UInt8_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccT_Boolean_IsConstraintValid(const asn1SccT_Boolean* pVal, int* pErrCode)
{
    flag ret = TRUE;
	(void)pVal;
    ret = TRUE;
    *pErrCode = 0;

	return ret;
}

void asn1SccT_Boolean_Initialize(asn1SccT_Boolean* pVal)
{
	(void)pVal;


	(*(pVal)) = FALSE;
}

flag asn1SccT_Boolean_Encode(const asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccT_Boolean_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_AppendBit(pBitStrm,(*(pVal)));
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccT_Boolean_Decode(asn1SccT_Boolean* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_ReadBit(pBitStrm, pVal);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_T_BOOLEAN;

	return ret  && asn1SccT_Boolean_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccT_Null_Record_IsConstraintValid(const asn1SccT_Null_Record* pVal, int* pErrCode)
{
    flag ret = TRUE;
	(void)pVal;
    ret = TRUE;
    *pErrCode = 0;

	return ret;
}

void asn1SccT_Null_Record_Initialize(asn1SccT_Null_Record* pVal)
{
	(void)pVal;


}

flag asn1SccT_Null_Record_Encode(const asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;
	(void)pBitStrm;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccT_Null_Record_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccT_Null_Record_Decode(asn1SccT_Null_Record* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;
	(void)pBitStrm;



	return ret  && asn1SccT_Null_Record_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccPID_Range_IsConstraintValid(const asn1SccPID_Range* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((*(pVal)) <= 3UL);
    *pErrCode = ret ? 0 :  ERR_PID_RANGE;

	return ret;
}

void asn1SccPID_Range_Initialize(asn1SccPID_Range* pVal)
{
	(void)pVal;


	(*(pVal)) = 0UL;
}

flag asn1SccPID_Range_Encode(const asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccPID_Range_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintPosWholeNumber(pBitStrm, (*(pVal)), 0, 3);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccPID_Range_Decode(asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, pVal, 0, 3);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_PID_RANGE;

	return ret  && asn1SccPID_Range_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccPID_IsConstraintValid(const asn1SccPID* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((((((((*(pVal)) == PID_actuator)) || (((*(pVal)) == PID_controller)))) || (((*(pVal)) == PID_environ)))) || (((*(pVal)) == PID_env)));
    *pErrCode = ret ? 0 :  ERR_PID;

	return ret;
}

void asn1SccPID_Initialize(asn1SccPID* pVal)
{
	(void)pVal;


	(*(pVal)) = PID_actuator;
}

flag asn1SccPID_Encode(const asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccPID_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    switch((*(pVal)))
	    {
	        case PID_actuator:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 0, 0, 3);
	        	break;
	        case PID_controller:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 1, 0, 3);
	        	break;
	        case PID_environ:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 2, 0, 3);
	        	break;
	        case PID_env:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 3, 0, 3);
	        	break;
	        default:                    /*COVERAGE_IGNORE*/
	    	    *pErrCode = ERR_UPER_ENCODE_PID; /*COVERAGE_IGNORE*/
	    	    ret = FALSE;            /*COVERAGE_IGNORE*/
	    }
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccPID_Decode(asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	{
	    asn1SccSint enumIndex;
	    ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &enumIndex, 0, 3);
	    *pErrCode = ret ? 0 : ERR_UPER_DECODE_PID;
	    if (ret) {
	        switch(enumIndex)
	        {
	            case 0:
	                (*(pVal)) = PID_actuator;
	                break;
	            case 1:
	                (*(pVal)) = PID_controller;
	                break;
	            case 2:
	                (*(pVal)) = PID_environ;
	                break;
	            case 3:
	                (*(pVal)) = PID_env;
	                break;
	            default:                        /*COVERAGE_IGNORE*/
		            *pErrCode = ERR_UPER_DECODE_PID;     /*COVERAGE_IGNORE*/
		            ret = FALSE;                /*COVERAGE_IGNORE*/
	        }
	    } else {
	        (*(pVal)) = PID_actuator;             /*COVERAGE_IGNORE*/
	    }
	}

	return ret  && asn1SccPID_IsConstraintValid(pVal, pErrCode);
}


