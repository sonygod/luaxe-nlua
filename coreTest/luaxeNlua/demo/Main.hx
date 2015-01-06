package  ;

import luaxe.Lua;
import unityengine.*;
import dotnet.system.collections.*;
import unityHelper.*;
using Reflect;

using unityHelper.TypeCheck;

import  unityHelper.Luanet;
@:noExtends
class Main 
{
	public static var mMain:Main;

	
	
	public var current:LuaMonoBehaviour;
	public function new() {
	
	untyped __call__(SetMain, this);
	
	}
	
    @:keep private function Awake():Void {	
		
		trace("中文支持");
		
		
	var a =	 Luanet.ctype(Transform);
	
	
	current.getTypedComponent(Transform).localPosition= new Vector3(10, 10, 0);

    var list =	current.getComponentsInChildrenOfType(Transform);
	
	  untyped  oo = untyped(list.GetEnumerator());


    while (untyped(oo.MoveNext())) {

      trace(untyped(oo.Current.name));

    }
	

	
	
	var aa :DfList<GameObject> = untyped (__lua__("newList(self.current.gameObject)"));
	trace(current.gameObject);
	aa.Add(current.gameObject);
	 
	trace(aa.Count);

	var bb :DfList<Int> = untyped (__lua__("newList(1)"));
	
	bb.Add(2);
	
	trace("init--"+Time.time);
	for (i in 0...1000) {
		bb.Add(i);
	}
	
	trace(bb.First());
	
     bb.Dequeue();
	 
	 trace(bb.First());
	 
	 trace(bb.Last());
	 
	 bb.Pop();
	 
	 trace(bb.Last());
	 
	 trace("before" + Time.time);
	 current.UnityCoroutine(new WaitForSeconds(2), delay);
	 
		}
		
		 @:keep public   function delay() {
        trace("delay"+Time.time );

    }
	@:keep private function Start():Void {
		
		trace("finish--"+Time.time);
		trace("删除开始");
		current.Test(current.gameObject);
	//	current.LuaDestoryFunction();
		}
    @:keep  private function Update():Void { }
	private function FixedUpdate():Void { }
	private function LateUpdate():Void { }
	private function OnAnimatorIK():Void { }
	private function OnAnimatorMove():Void { }
	private function OnApplicationFocus():Void { }
	private function OnApplicationPause():Void { }
	private function OnApplicationQuit():Void { }
	private function OnAudioFilterRead():Void { }
	private function OnBecameInvisible():Void { }
	private function OnBecameVisible():Void { }
	private function OnCollisionEnter():Void { }
	private function OnCollisionEnter2D():Void { }
	private function OnCollisionExit():Void { }
	private function OnCollisionExit2D():Void { }
	private function OnCollisionStay():Void { }
	private function OnCollisionStay2D():Void { }
	private function OnConnectedToServer():Void { }
	private function OnControllerColliderHit():Void { }
	@:keep private function OnDestroy():Void { 
		
		trace("lua 删除");
		}
	private function OnDisable():Void { }
	private function OnDisconnectedFromServer():Void { }
	private function OnDrawGizmos():Void { }
	private function OnDrawGizmosSelected():Void { }
	private function OnEnable():Void { }
	private function OnFailedToConnect():Void { }
	private function OnFailedToConnectToMasterServer():Void { }
	private function OnGUI():Void { }
	private function OnJointBreak():Void { }
	private function OnLevelWasLoaded():Void { }
	private function OnMasterServerEvent():Void { }
	private function OnMouseDown():Void { }
	private function OnMouseDrag():Void { }
	private function OnMouseEnter():Void { }
	private function OnMouseExit():Void { }
	private function OnMouseOver():Void { }
	private function OnMouseUp():Void { }
	private function OnMouseUpAsButton():Void { }
	private function OnNetworkInstantiate():Void { }
	private function OnParticleCollision():Void { }
	private function OnPlayerConnected():Void { }
	private function OnPlayerDisconnected():Void { }
	private function OnPostRender():Void { }
	private function OnPreCull():Void { }
	private function OnPreRender():Void { }
	private function OnRenderImage():Void { }
	private function OnRenderObject():Void { }
	private function OnSerializeNetworkView():Void { }
	private function OnServerInitialized():Void { }
	private function OnTriggerEnter():Void { }
	private function OnTriggerEnter2D():Void { }
	private function OnTriggerExit():Void { }
	private function OnTriggerExit2D():Void { }
	private function OnTriggerStay():Void { }
	private function OnTriggerStay2D():Void { }
	private function OnValidate():Void { }
	private function OnWillRenderObject():Void { }
	private function Reset():Void { }
	

	
	public static function main()
		{
			
		mMain =	new Main();
		
		}
}