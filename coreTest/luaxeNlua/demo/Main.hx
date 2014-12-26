package ;

import luaxe.Lua;
import unityengine.*;
using Reflect;
class Main 
{
	public static var mMain:Main;
	
	public var cube:GameObject;
	
	public var no:Int;
	
	public var speed:Int = 5;
	public function new() {
		
	untyped __call__(SetMain, this);
	}
	@:keep	  function Awake() {
			
		trace("unity Awake............................."+cube.name);
	}
	
    @:keep	public  function Start() {
		trace("unity start.............................");
	}
	
    @:keep	public  function Update() {
	
	if(cube!=null)
	cube.transform.RotateAround(cube.transform.position, Vector3.up, speed * Time.deltaTime);
	
	cube.transform.
	
	if (Input.GetKey(KeyCode.W) ){
		
		speed += 1;
	}
	
	if (Input.GetKey(KeyCode.S)) {
		
		speed -= 1;
	}
	
	}
public static function main()
	{
		
	mMain =	new Main();
	
	}
}
