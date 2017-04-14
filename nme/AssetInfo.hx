package nme;

import nme.utils.WeakRef;

@:nativeProperty
class AssetInfo
{
   public var path:String;
   public var className:String;
   public var type:AssetType;
   public var cache:WeakRef<Dynamic>;
   public var isResource:Bool;

   public function new(inPath:String, inType:AssetType, inIsResource:Bool, ?inClassName:String,?id:String)
   {
      path = inPath;
      type = inType;
      className = inClassName;
      isResource = inIsResource;
      //trace('$inPath $inType $inIsResource $inClassName');
      #if !flash
      if (type==AssetType.FONT && isResource)
         new nme.text.Font("",null,null, path,id);
      #end
   }

   public function toString()
   {
      return '{path:$path className:$className type:$type isResource:$isResource cached:' + (cache!=null) +'}';
   }


   public function uncache()
   {
      cache = null;
   }

   public function getCache() : Dynamic
   {
      if (cache==null)
         return null;
      var val = cache.get();
      if (val==null)
         cache = null;
      return val;
   }

   public function setCache(inVal:Dynamic, inWeak:Bool)
   {
      cache = new WeakRef<Dynamic>(inVal,inWeak);
   }
}


