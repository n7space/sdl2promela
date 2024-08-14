#ifndef ASN1SCC_ASN1CRT_ENCODING_H_
#define ASN1SCC_ASN1CRT_ENCODING_H_

#include "asn1crt.h"

#ifdef  __cplusplus
extern "C" {
#endif

flag OctetString_equal(int len1, int len2, const byte arr1[], const byte arr2[]);

/* Byte stream functions */

void BitStream_AttachBuffer2(BitStream* pBitStrm, unsigned char* buf, long count, void* pushDataPrm, void* fetchDataPrm);
asn1SccSint ByteStream_GetLength(ByteStream* pStrm);

#ifdef ASN1SCC_STREAMING

void fetchData(BitStream* pBitStrm, void* param);
void pushData(BitStream* pBitStrm, void* param);

void bitstream_fetch_data_if_required(BitStream* pStrm);
void bitstream_push_data_if_required(BitStream* pStrm);

#else

#define bitstream_fetch_data_if_required(pStrm) ((void)pStrm)
#define bitstream_push_data_if_required(pStrm) ((void)pStrm)

#endif

/* Bit stream functions */

void BitStream_AppendNBitZero(BitStream* pBitStrm, int nbits);
void BitStream_EncodeNonNegativeInteger(BitStream* pBitStrm, asn1SccUint v);
void BitStream_AppendNBitOne(BitStream* pBitStrm, int nbits);
void BitStream_EncodeNonNegativeIntegerNeg(BitStream* pBitStrm, asn1SccUint v, flag negate);
flag BitStream_DecodeNonNegativeInteger(BitStream* pBitStrm, asn1SccUint* v, int nBits);
flag BitStream_ReadPartialByte(BitStream* pBitStrm, byte *v, byte nbits);
void BitStream_AppendPartialByte(BitStream* pBitStrm, byte v, byte nbits, flag negate);

void BitStream_Init(BitStream* pBitStrm, unsigned char* buf, long count);
void BitStream_AttachBuffer(BitStream* pBitStrm, unsigned char* buf, long count);
void BitStream_AppendBit(BitStream* pBitStrm, flag v);
void BitStream_AppendByte(BitStream* pBitStrm, byte v, flag negate);

asn1SccSint BitStream_GetLength(BitStream* pBitStrm);
void BitStream_AppendBitOne(BitStream* pBitStrm);
flag BitStream_PeekBit(BitStream* pBitStrm);
flag BitStream_ReadBit(BitStream* pBitStrm, flag* v);
flag BitStream_ReadByte(BitStream* pBitStrm, byte* v);

/* Integer functions */
void BitStream_EncodeConstraintWholeNumber(BitStream* pBitStrm, asn1SccSint v, asn1SccSint min, asn1SccSint max);
void BitStream_EncodeConstraintPosWholeNumber(BitStream* pBitStrm, asn1SccUint v, asn1SccUint min, asn1SccUint max);


flag BitStream_DecodeConstraintWholeNumber(BitStream* pBitStrm, asn1SccSint* v, asn1SccSint min, asn1SccSint max);
flag BitStream_DecodeConstraintPosWholeNumber(BitStream* pBitStrm, asn1SccUint* v, asn1SccUint min, asn1SccUint max);





int GetNumberOfBitsForNonNegativeInteger(asn1SccUint v);

void CalculateMantissaAndExponent(asn1Real d, int* exp, asn1SccUint64* mantissa);
asn1Real GetDoubleByMantissaAndExp(asn1SccUint mantissa, int exp);

int GetLengthInBytesOfSInt(asn1SccSint v);
int GetLengthInBytesOfUInt(asn1SccUint64 v);

void BitStream_EncodeReal(BitStream* pBitStrm, asn1Real v);
flag BitStream_DecodeReal(BitStream* pBitStrm, asn1Real* v);




/*
Checks if the bit pattern is (immediatelly) present in the bit stream.

bit_terminated_pattern: the bit pattern to check
bit_terminated_pattern_size_in_bits: the size of the bit pattern in bits

example: the bit pattern 'FFF'H is passed as follows
bit_terminated_pattern (byte[]){0xFF, 0xF0}
bit_terminated_pattern_size_in_bits = 12

returns
0 = Error - end of bit stream. The bit stream does not contains at least bit_terminated_pattern_size_in_bits
1 = when bit pattern doesn't match.
2 = when bit pattern matches.
In this case the bit_pattern is consumed (i.e. the currentByte and currentBit are moved)

*/


#ifdef  __cplusplus
}
#endif

#endif
