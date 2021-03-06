#ifndef NME_BYTE_ARRAY_H
#define NME_BYTE_ARRAY_H

#include <nme/Object.h>
#include <nme/QuickVec.h>
#include "Utils.h"
#include <hx/CFFI.h>

namespace nme
{


// If you put this structure on the stack, then you do not have to worry about GC.
// If you store this in a heap structure, then you will need to use GC roots for mValue...
struct ByteArray
{
   ByteArray(int inSize);
   ByteArray(const ByteArray &inRHS);
   ByteArray();
   ByteArray(value Value);
   ByteArray(const QuickVec<unsigned char>  &inValue);
   ByteArray(const char *inResourceName);

   void          Resize(int inSize);
   int           Size() const;
   unsigned char *Bytes();
   const unsigned char *Bytes() const;
   inline bool   Ok() const { return !val_is_null(mValue); }
   bool          LittleEndian();


   value mValue;

   static ByteArray FromFile(const OSChar *inFilename);
   #ifdef HX_WINDOWS
   static ByteArray FromFile(const char *inFilename);
   #endif
};

#ifdef ANDROID
ByteArray AndroidGetAssetBytes(const char *);

struct FileInfo
{
   int fd;
   off_t offset;
   off_t length;
};

FileInfo AndroidGetAssetFD(const char *);
#endif

}

#endif
