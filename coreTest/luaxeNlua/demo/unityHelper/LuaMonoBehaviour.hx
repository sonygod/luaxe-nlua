package unityHelper;

import unityengine.*;

/**
 * LuaMonoBehaviour
 * @author sonygod
 * 
 * same function as LuaMonoBehaviour.cs
 */
extern class   LuaMonoBehaviour extends MonoBehaviour 
{

	public function new():Void;
	public function StopLuaCoroutine():Void;
	public function LuaDestoryFunction():Void;
	public function callLua(func:Dynamic):Void;
	public function UnityCoroutine(ins:YieldInstruction , func:Dynamic ):Void;
	public function Test(target:GameObject):Void;
	
}