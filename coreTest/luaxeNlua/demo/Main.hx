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
	
	public var MButton:Dynamic;
	public function new() {
		
	untyped __call__(SetMain, this);
	}
	@:keep	  function Awake() {
			
		trace("unity Awake............................." );
		

	var v1 = new Vector3(1, 1, 1);
	var v2 = new Vector3(1, 1, 1);
	v1.x = 100;
	Debug.Log(v1.x + "---- " + v2.x);
	 //untyped =button1.MouseUp:Add(handleClick)
	 
	
	 if(MButton!=null){
	 untyped __lua__("self.MButton.Click:Add(self.handleClick)");
	 }else {
		 trace("MButton was not defined");
	 }
	 
	
	 var aa = new Array<Int>();
	 
	 for (i in 0...10) {
		 
		 aa.push(i);
	 }
	 
	 for (i in aa) {
		  trace("数组【1】="+aa[i]);
	 }
	 
	
	 
	}
	
	
	 @:keep	public  function handleClick(control:Dynamic, mouseevent:Dynamic) {
		 
		 
		 trace(control.name);
	 }
	
	 @:keep	public  function OnDestroy() {
		
		 trace("OnDestory");
	 }
	
    @:keep	public  function Start() {
		trace("unity start.............................");
	}
	
    @:keep	public  function Update() {
	
	
	
	}
public static function main()
	{
		
	mMain =	new Main();
	
	}
}
