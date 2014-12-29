package ;
import luaxe.Lua;
import unityengine.*;
import unityHelper.LuaMonoBehaviour;
using Reflect;
using unityHelper.TypeCheck;

@:noExtends
class Main 
{
	public static var mMain:Main;

	
	public var current:LuaMonoBehaviour;
	public function new() {
	
	untyped __call__(SetMain, this);
	}
	@:keep	  function Awake() {
		
		
	 
	  
	 current.callLua(delay);
	  
	 current.SetTimeout(delay, 2);

	 current.LuaDestoryFunction();
	   
	 current.StopLuaCoroutine();
	 current.StopAllCoroutines();
		
	 current.UnityCoroutine(new WaitForSeconds(2), delay);
	}
	
	@:keep	  function Start() {

	}
	
	@:keep	  function Update() {

	}
	@:keep public 	function delay() {
		trace("delay " );
		
	}
	@:keep public 	function delay2():Void {
		trace("delay " );
			
		
	}

	
public static function main()
	{
		
	mMain =	new Main();
	
	}
}
