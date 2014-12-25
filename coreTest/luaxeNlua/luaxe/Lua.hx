package luaxe;

// TODO http://developer.coronalabs.com/reference/index/assert
// inline + fallback to Haxe

class Lua
{
	inline static public function eval(code:String):Dynamic
	#if lua return (untyped __global__(dostring, code)); #else return null; #end

	inline static public function setmetatable<T>(obj:T, mt:Class<Dynamic>):T
	#if lua return (untyped __call__("setmetatable",obj,mt)); #else return null; #end

	/* TODO: doc */
	inline static public function setmetatabledef<T>(obj:T, mt:luaxe.lib.Metatable):T
	#if lua return (untyped __call__("setmetatable",obj,mt)); #else return null; #end

	inline static public function getmetatable<T>(obj:T):luaxe.lib.Metatable
	#if lua return (untyped __call__("getmetatable",obj)); #else return null; #end

	inline static public function hash(obj:Dynamic):Int
	#if lua return cast untyped __hash__(obj); #else return 0; #end
}

/*
	LuaArray
	Wrap any Lua array to safely index for [0]
*/
abstract LuaArray<T>(Dynamic)
{
	public function new() this = cast untyped __lua__("{}");

	@:arrayAccess public inline function getFromOne(k:Int):T {
		return this[k + 1];
	}

	@:arrayAccess public inline function arrayWriteFromOne(k:Int, v:T) {
		this[k + 1] = v;
	}

	public var length(get, never):Int;

	public inline function get_length():Int
	{
		return cast untyped __hash__(this);
	}
}