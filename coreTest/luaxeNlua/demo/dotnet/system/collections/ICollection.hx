package dotnet.system.collections;

@:native("System.Collections.ICollection")
extern interface ICollection extends IEnumerable {

  function CopyTo(array:Dynamic, index:Int) : Void;
}

