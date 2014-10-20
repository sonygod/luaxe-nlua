package luaxe.lib;

@:native("coroutine") @dotpath extern class LuaCoroutine
{
	function create(f:Void->Void):Thread;
	function resume(co:Thread, val:Dynamic):Dynamic;
	function running():Thread;
	function status(co:Thread):String;
	function wrap(f:Void->Void):Dynamic;
	function yield(v:Dynamic):Void;
}