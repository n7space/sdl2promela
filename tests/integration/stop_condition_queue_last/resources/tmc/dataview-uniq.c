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


flag asn1SccMySequenceDataType_y_IsConstraintValid(const asn1SccMySequenceDataType_y* pVal, int* pErrCode)
{
    flag ret = TRUE;
    int i1;
    ret = (pVal->nCount <= 4);
    *pErrCode = ret ? 0 :  ERR_MYSEQUENCEDATATYPE_Y;
    if (ret) {
        for(i1 = 0; ret && i1 < pVal->nCount; i1++)
        {
        	ret = asn1SccMyInteger_IsConstraintValid((&(pVal->arr[i1])), pErrCode);
        }
    }   /*COVERAGE_IGNORE*/

	return ret;
}

flag asn1SccMySequenceDataType_IsConstraintValid(const asn1SccMySequenceDataType* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = asn1SccMyInteger_IsConstraintValid((&(pVal->x)), pErrCode);
    if (ret) {
        ret = asn1SccMySequenceDataType_y_IsConstraintValid((&(pVal->y)), pErrCode);
    }   /*COVERAGE_IGNORE*/

	return ret;
}

void asn1SccMySequenceDataType_y_Initialize(asn1SccMySequenceDataType_y* pVal)
{
	(void)pVal;

    int i1;

	i1 = 0;
	while (i1< 4) {
	    pVal->arr[i1] = 0UL;
	    i1 = i1 + 1;
	}
	pVal->nCount = 0;
}
void asn1SccMySequenceDataType_Initialize(asn1SccMySequenceDataType* pVal)
{
	(void)pVal;



	/*set x */
	asn1SccMyInteger_Initialize((&(pVal->x)));
	/*set y */
	asn1SccMySequenceDataType_y_Initialize((&(pVal->y)));
}

flag asn1SccMySequenceDataType_Encode(const asn1SccMySequenceDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	int i1;
	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMySequenceDataType_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    /*Encode x */
	    ret = asn1SccMyInteger_Encode((&(pVal->x)), pBitStrm, pErrCode, FALSE);
	    if (ret) {
	        /*Encode y */
	        BitStream_EncodeConstraintWholeNumber(pBitStrm, pVal->y.nCount, 0, 4);
	        for(i1=0; (i1 < (int)pVal->y.nCount) && ret; i1++)
	        {
	        	ret = asn1SccMyInteger_Encode((&(pVal->y.arr[i1])), pBitStrm, pErrCode, FALSE);
	        }
	    }   /*COVERAGE_IGNORE*/
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMySequenceDataType_Decode(asn1SccMySequenceDataType* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;

	int i1;
	asn1SccSint nCount;

	/*Decode x */
	ret = asn1SccMyInteger_Decode((&(pVal->x)), pBitStrm, pErrCode);
	if (ret) {
	    /*Decode y */
	    ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &nCount, 0, 4);
	    *pErrCode = ret ? 0 : ERR_UPER_DECODE_MYSEQUENCEDATATYPE_Y;
	    pVal->y.nCount = (long)nCount;
	    for(i1=0; (i1 < (int)pVal->y.nCount) && ret; i1++)
	    {
	    	ret = asn1SccMyInteger_Decode((&(pVal->y.arr[i1])), pBitStrm, pErrCode);
	    }
	}   /*COVERAGE_IGNORE*/

	return ret  && asn1SccMySequenceDataType_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccMyChoiceDataType_IsConstraintValid(const asn1SccMyChoiceDataType* pVal, int* pErrCode)
{
    flag ret = TRUE;
    if (pVal->kind == MyChoiceDataType_first_PRESENT) {
    	ret = asn1SccMyInteger_IsConstraintValid((&(pVal->u.first)), pErrCode);
    }
    if (ret) {
        if (pVal->kind == MyChoiceDataType_second_PRESENT) {
        	ret = asn1SccMyInteger_IsConstraintValid((&(pVal->u.second)), pErrCode);
        }
    }   /*COVERAGE_IGNORE*/

	return ret;
}

void asn1SccMyChoiceDataType_Initialize(asn1SccMyChoiceDataType* pVal)
{
	(void)pVal;


	pVal->kind = MyChoiceDataType_first_PRESENT;
	pVal->u.first = 0UL;
}

flag asn1SccMyChoiceDataType_Encode(const asn1SccMyChoiceDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMyChoiceDataType_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    switch(pVal->kind)
	    {
	    case MyChoiceDataType_first_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 0, 0, 1);
	    	ret = asn1SccMyInteger_Encode((&(pVal->u.first)), pBitStrm, pErrCode, FALSE);
	    	break;
	    case MyChoiceDataType_second_PRESENT:
	    	BitStream_EncodeConstraintWholeNumber(pBitStrm, 1, 0, 1);
	    	ret = asn1SccMyInteger_Encode((&(pVal->u.second)), pBitStrm, pErrCode, FALSE);
	    	break;
	    default:                            /*COVERAGE_IGNORE*/
	        *pErrCode = ERR_UPER_ENCODE_MYCHOICEDATATYPE;         /*COVERAGE_IGNORE*/
	        ret = FALSE;                    /*COVERAGE_IGNORE*/
	    }
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMyChoiceDataType_Decode(asn1SccMyChoiceDataType* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;

	asn1SccSint asn1SccMyChoiceDataType_index_tmp;

	ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &asn1SccMyChoiceDataType_index_tmp, 0, 1);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYCHOICEDATATYPE;
	if (ret) {
	    switch(asn1SccMyChoiceDataType_index_tmp)
	    {
	    case 0:
	    	pVal->kind = MyChoiceDataType_first_PRESENT;
	    	ret = asn1SccMyInteger_Decode((&(pVal->u.first)), pBitStrm, pErrCode);
	    	break;
	    case 1:
	    	pVal->kind = MyChoiceDataType_second_PRESENT;
	    	ret = asn1SccMyInteger_Decode((&(pVal->u.second)), pBitStrm, pErrCode);
	    	break;
	    default:                        /*COVERAGE_IGNORE*/
	        *pErrCode = ERR_UPER_DECODE_MYCHOICEDATATYPE;     /*COVERAGE_IGNORE*/
	        ret = FALSE;                /*COVERAGE_IGNORE*/
	    }
	}  /*COVERAGE_IGNORE*/

	return ret  && asn1SccMyChoiceDataType_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccMyArrayDataType_IsConstraintValid(const asn1SccMyArrayDataType* pVal, int* pErrCode)
{
    flag ret = TRUE;
    int i1;
    ret = ((1 <= pVal->nCount) && (pVal->nCount <= 3));
    *pErrCode = ret ? 0 :  ERR_MYARRAYDATATYPE;
    if (ret) {
        for(i1 = 0; ret && i1 < pVal->nCount; i1++)
        {
        	ret = asn1SccMyInteger_IsConstraintValid((&(pVal->arr[i1])), pErrCode);
        }
    }   /*COVERAGE_IGNORE*/

	return ret;
}

void asn1SccMyArrayDataType_Initialize(asn1SccMyArrayDataType* pVal)
{
	(void)pVal;

    int i1;

	i1 = 0;
	while (i1< 3) {
	    pVal->arr[i1] = 0UL;
	    i1 = i1 + 1;
	}
	pVal->nCount = 1;
}

flag asn1SccMyArrayDataType_Encode(const asn1SccMyArrayDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	int i1;
	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMyArrayDataType_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_EncodeConstraintWholeNumber(pBitStrm, pVal->nCount, 1, 3);
	    for(i1=0; (i1 < (int)pVal->nCount) && ret; i1++)
	    {
	    	ret = asn1SccMyInteger_Encode((&(pVal->arr[i1])), pBitStrm, pErrCode, FALSE);
	    }
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMyArrayDataType_Decode(asn1SccMyArrayDataType* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;

	int i1;
	asn1SccSint nCount;

	ret = BitStream_DecodeConstraintWholeNumber(pBitStrm, &nCount, 1, 3);
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYARRAYDATATYPE;
	pVal->nCount = (long)nCount;
	for(i1=0; (i1 < (int)pVal->nCount) && ret; i1++)
	{
		ret = asn1SccMyInteger_Decode((&(pVal->arr[i1])), pBitStrm, pErrCode);
	}

	return ret  && asn1SccMyArrayDataType_IsConstraintValid(pVal, pErrCode);
}


flag asn1SccMySequenceWithOptionalsDataType_IsConstraintValid(const asn1SccMySequenceWithOptionalsDataType* pVal, int* pErrCode)
{
    flag ret = TRUE;
    ret = asn1SccMyInteger_IsConstraintValid((&(pVal->a)), pErrCode);
    if (ret) {
        if (pVal->exist.b) {
        	ret = asn1SccMyInteger_IsConstraintValid((&(pVal->b)), pErrCode);
        }
        if (ret) {
            if (pVal->exist.c) {
            	ret = asn1SccMyInteger_IsConstraintValid((&(pVal->c)), pErrCode);
            }
        }   /*COVERAGE_IGNORE*/
    }   /*COVERAGE_IGNORE*/

	return ret;
}

void asn1SccMySequenceWithOptionalsDataType_Initialize(asn1SccMySequenceWithOptionalsDataType* pVal)
{
	(void)pVal;



	/*set a */
	asn1SccMyInteger_Initialize((&(pVal->a)));
	/*set b */
	pVal->exist.b = 1;
	asn1SccMyInteger_Initialize((&(pVal->b)));
	/*set c */
	pVal->exist.c = 1;
	asn1SccMyInteger_Initialize((&(pVal->c)));
}

flag asn1SccMySequenceWithOptionalsDataType_Encode(const asn1SccMySequenceWithOptionalsDataType* pVal, BitStream* pBitStrm, int* pErrCode, flag bCheckConstraints)
{
    flag ret = TRUE;


	*pErrCode = 0;
	ret = bCheckConstraints ? asn1SccMySequenceWithOptionalsDataType_IsConstraintValid(pVal, pErrCode) : TRUE ;
	if (ret && *pErrCode == 0) {
	    BitStream_AppendBit(pBitStrm,pVal->exist.b);
	    if (ret) {
	        BitStream_AppendBit(pBitStrm,pVal->exist.c);
	        if (ret) {
	            /*Encode a */
	            ret = asn1SccMyInteger_Encode((&(pVal->a)), pBitStrm, pErrCode, FALSE);
	            if (ret) {
	                /*Encode b */
	                if (pVal->exist.b) {
	                	ret = asn1SccMyInteger_Encode((&(pVal->b)), pBitStrm, pErrCode, FALSE);
	                }
	                if (ret) {
	                    /*Encode c */
	                    if (pVal->exist.c) {
	                    	ret = asn1SccMyInteger_Encode((&(pVal->c)), pBitStrm, pErrCode, FALSE);
	                    }
	                }   /*COVERAGE_IGNORE*/
	            }   /*COVERAGE_IGNORE*/
	        }   /*COVERAGE_IGNORE*/
	    }   /*COVERAGE_IGNORE*/
    } /*COVERAGE_IGNORE*/


    return ret;
}

flag asn1SccMySequenceWithOptionalsDataType_Decode(asn1SccMySequenceWithOptionalsDataType* pVal, BitStream* pBitStrm, int* pErrCode)
{
    flag ret = TRUE;
	*pErrCode = 0;

	flag presenceBit;

	ret = BitStream_ReadBit(pBitStrm, &presenceBit);
	pVal->exist.b = presenceBit == 0 ? 0 : 1;
	*pErrCode = ret ? 0 : ERR_UPER_DECODE_MYSEQUENCEWITHOPTIONALSDATATYPE;
	if (ret) {
	    ret = BitStream_ReadBit(pBitStrm, &presenceBit);
	    pVal->exist.c = presenceBit == 0 ? 0 : 1;
	    *pErrCode = ret ? 0 : ERR_UPER_DECODE_MYSEQUENCEWITHOPTIONALSDATATYPE;
	    if (ret) {
	        /*Decode a */
	        ret = asn1SccMyInteger_Decode((&(pVal->a)), pBitStrm, pErrCode);
	        if (ret) {
	            /*Decode b */
	            if (pVal->exist.b) {
	            	ret = asn1SccMyInteger_Decode((&(pVal->b)), pBitStrm, pErrCode);
	            }
	            if (ret) {
	                /*Decode c */
	                if (pVal->exist.c) {
	                	ret = asn1SccMyInteger_Decode((&(pVal->c)), pBitStrm, pErrCode);
	                }
	            }   /*COVERAGE_IGNORE*/
	        }   /*COVERAGE_IGNORE*/
	    }   /*COVERAGE_IGNORE*/
	}   /*COVERAGE_IGNORE*/

	return ret  && asn1SccMySequenceWithOptionalsDataType_IsConstraintValid(pVal, pErrCode);
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


