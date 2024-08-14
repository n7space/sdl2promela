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
    ret = ((-1024LL <= (*(pVal))) && ((*(pVal)) <= 1024LL));
    *pErrCode = ret ? 0 :  ERR_MYINTEGER;

	return ret;
}

void asn1SccMyInteger_Initialize(asn1SccMyInteger* pVal)
{
	(void)pVal;


	(*(pVal)) = 0LL;
}

flag asn1SccMyInteger_Encode(const asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMyInteger_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintWholeNumber(pBitStrm, (*(pVal)), -1024, 1024);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMyInteger_Decode(asn1SccMyInteger* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, pVal, -1024, 1024);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYINTEGER;

	return ret  && asn1SccMyInteger_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccMyBooleanResult_IsConstraintValid(const asn1SccMyBooleanResult* pVal, int* pErrCode)
{
    flag ret = TRUE;
	(void)pVal;
    ret = TRUE;
    *pErrCode = 0;

	return ret;
}

void asn1SccMyBooleanResult_Initialize(asn1SccMyBooleanResult* pVal)
{
	(void)pVal;


	(*(pVal)) = FALSE;
}

flag asn1SccMyBooleanResult_Encode(const asn1SccMyBooleanResult* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMyBooleanResult_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_AppendBit(pBitStrm,(*(pVal)));
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMyBooleanResult_Decode(asn1SccMyBooleanResult* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_ReadBit(pBitStrm, pVal);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYBOOLEANRESULT;

	return ret  && asn1SccMyBooleanResult_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccBinaryBooleanTestParam_oper_IsConstraintValid(const asn1SccBinaryBooleanTestParam_oper* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((((((((*(pVal)) == BinaryBooleanTestParam_oper_o_and)) || (((*(pVal)) == BinaryBooleanTestParam_oper_o_or)))) || (((*(pVal)) == BinaryBooleanTestParam_oper_o_xor)))) || (((*(pVal)) == BinaryBooleanTestParam_oper_o_implies)));
    *pErrCode = ret ? 0 :  ERR_BINARYBOOLEANTESTPARAM_OPER;

	return ret;
}

flag asn1SccBinaryBooleanTestParam_IsConstraintValid(const asn1SccBinaryBooleanTestParam* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = asn1SccBinaryBooleanTestParam_oper_IsConstraintValid((&(pVal->oper)), pErrCode);
    if (ret) {
        ret = asn1SccMyBooleanResult_IsConstraintValid((&(pVal->left)), pErrCode);
        if (ret) {
            ret = asn1SccMyBooleanResult_IsConstraintValid((&(pVal->right)), pErrCode);
        }   /*COVERAGE_IGNORE*/
    }   /*COVERAGE_IGNORE*/

	return ret;
}

void asn1SccBinaryBooleanTestParam_oper_Initialize(asn1SccBinaryBooleanTestParam_oper* pVal)
{
	(void)pVal;


	(*(pVal)) = BinaryBooleanTestParam_oper_o_and;
}
void asn1SccBinaryBooleanTestParam_Initialize(asn1SccBinaryBooleanTestParam* pVal)
{
	(void)pVal;



	/*set oper */
	asn1SccBinaryBooleanTestParam_oper_Initialize((&(pVal->oper)));
	/*set left */
	asn1SccMyBooleanResult_Initialize((&(pVal->left)));
	/*set right */
	asn1SccMyBooleanResult_Initialize((&(pVal->right)));
}

flag asn1SccBinaryBooleanTestParam_Encode(const asn1SccBinaryBooleanTestParam* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccBinaryBooleanTestParam_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    /*Encode oper */
	    switch(pVal->oper)
	    {
	        case BinaryBooleanTestParam_oper_o_and:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 0, 0, 3);
	        	break;
	        case BinaryBooleanTestParam_oper_o_or:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 1, 0, 3);
	        	break;
	        case BinaryBooleanTestParam_oper_o_xor:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 2, 0, 3);
	        	break;
	        case BinaryBooleanTestParam_oper_o_implies:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 3, 0, 3);
	        	break;
	        default:                    /*COVERAGE_IGNORE*/
	    	    *pErrCode = ERR_UPER_ENCODE_BINARYBOOLEANTESTPARAM_OPER; /*COVERAGE_IGNORE*/
	    	    ret = FALSE;            /*COVERAGE_IGNORE*/
	    }
	    if (ret) {
	        /*Encode left */
	        ret = asn1SccMyBooleanResult_Encode((&(pVal->left)), pBitStrm, pErrCode, FALSE);
	        if (ret) {
	            /*Encode right */
	            ret = asn1SccMyBooleanResult_Encode((&(pVal->right)), pBitStrm, pErrCode, FALSE);
	        }   /*COVERAGE_IGNORE*/
	    }   /*COVERAGE_IGNORE*/
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccBinaryBooleanTestParam_Decode(asn1SccBinaryBooleanTestParam* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	/*Decode oper */
	{
	    asn1SccSint enumIndex;
	    ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &enumIndex, 0, 3);
	    *pErrCode = ret ? 0 : ERR_UPER_DECODE_BINARYBOOLEANTESTPARAM_OPER;
	    if (ret) {
	        switch(enumIndex)
	        {
	            case 0:
	                pVal->oper = BinaryBooleanTestParam_oper_o_and;
	                break;
	            case 1:
	                pVal->oper = BinaryBooleanTestParam_oper_o_or;
	                break;
	            case 2:
	                pVal->oper = BinaryBooleanTestParam_oper_o_xor;
	                break;
	            case 3:
	                pVal->oper = BinaryBooleanTestParam_oper_o_implies;
	                break;
	            default:                        /*COVERAGE_IGNORE*/
		            *pErrCode = ERR_UPER_DECODE_BINARYBOOLEANTESTPARAM_OPER;     /*COVERAGE_IGNORE*/
		            ret = FALSE;                /*COVERAGE_IGNORE*/
	        }
	    } else {
	        pVal->oper = BinaryBooleanTestParam_oper_o_and;             /*COVERAGE_IGNORE*/
	    }
	}
	if (ret) {
	    /*Decode left */
	    ret = asn1SccMyBooleanResult_Decode((&(pVal->left)), pBitStrm, pErrCode);
	    if (ret) {
	        /*Decode right */
	        ret = asn1SccMyBooleanResult_Decode((&(pVal->right)), pBitStrm, pErrCode);
	    }   /*COVERAGE_IGNORE*/
	}   /*COVERAGE_IGNORE*/

	return ret  && asn1SccBinaryBooleanTestParam_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccUnaryBooleanTestParam_IsConstraintValid(const asn1SccUnaryBooleanTestParam* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = asn1SccMyBooleanResult_IsConstraintValid((&(pVal->expr)), pErrCode);

	return ret;
}

void asn1SccUnaryBooleanTestParam_Initialize(asn1SccUnaryBooleanTestParam* pVal)
{
	(void)pVal;



	/*set expr */
	asn1SccMyBooleanResult_Initialize((&(pVal->expr)));
}

flag asn1SccUnaryBooleanTestParam_Encode(const asn1SccUnaryBooleanTestParam* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccUnaryBooleanTestParam_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    /*Encode expr */
	    ret = asn1SccMyBooleanResult_Encode((&(pVal->expr)), pBitStrm, pErrCode, FALSE);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccUnaryBooleanTestParam_Decode(asn1SccUnaryBooleanTestParam* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	/*Decode expr */
	ret = asn1SccMyBooleanResult_Decode((&(pVal->expr)), pBitStrm, pErrCode);

	return ret  && asn1SccUnaryBooleanTestParam_IsConstraintValid(pVal, pErrCode);
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
    ret = ((*(pVal)) <= 4UL);
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
	    BitStream_EncodeConstraintPosWholeNumber(pBitStrm, (*(pVal)), 0, 4);
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccPID_Range_Decode(asn1SccPID_Range* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;


	ret = BitStream_DecodeConstraintPosWholeNumber(pBitStrm, pVal, 0, 4);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_PID_RANGE;

	return ret  && asn1SccPID_Range_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccPID_IsConstraintValid(const asn1SccPID* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = ((((((((((*(pVal)) == PID_taste_user_interface)) || (((*(pVal)) == PID_timer_manager)))) || (((*(pVal)) == PID_actuator)))) || (((*(pVal)) == PID_controller)))) || (((*(pVal)) == PID_env)));
    *pErrCode = ret ? 0 :  ERR_PID;

	return ret;
}

void asn1SccPID_Initialize(asn1SccPID* pVal)
{
	(void)pVal;


	(*(pVal)) = PID_taste_user_interface;
}

flag asn1SccPID_Encode(const asn1SccPID* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccPID_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    switch((*(pVal)))
	    {
	        case PID_taste_user_interface:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 0, 0, 4);
	        	break;
	        case PID_timer_manager:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 1, 0, 4);
	        	break;
	        case PID_actuator:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 2, 0, 4);
	        	break;
	        case PID_controller:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 3, 0, 4);
	        	break;
	        case PID_env:
	            BitStream_EncodeConstraintWholeNumber(pBitStrm, 4, 0, 4);
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
	    ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &enumIndex, 0, 4);
	    *pErrCode = ret ? 0 : ERR_UPER_DECODE_PID;
	    if (ret) {
	        switch(enumIndex)
	        {
	            case 0:
	                (*(pVal)) = PID_taste_user_interface;
	                break;
	            case 1:
	                (*(pVal)) = PID_timer_manager;
	                break;
	            case 2:
	                (*(pVal)) = PID_actuator;
	                break;
	            case 3:
	                (*(pVal)) = PID_controller;
	                break;
	            case 4:
	                (*(pVal)) = PID_env;
	                break;
	            default:                        /*COVERAGE_IGNORE*/
		            *pErrCode = ERR_UPER_DECODE_PID;     /*COVERAGE_IGNORE*/
		            ret = FALSE;                /*COVERAGE_IGNORE*/
	        }
	    } else {
	        (*(pVal)) = PID_taste_user_interface;             /*COVERAGE_IGNORE*/
	    }
	}

	return ret  && asn1SccPID_IsConstraintValid(pVal, pErrCode);
}


