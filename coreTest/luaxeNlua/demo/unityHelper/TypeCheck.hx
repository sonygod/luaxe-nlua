package unityHelper ;
import unityengine.MonoBehaviour;
import unityHelper.Luanet;
import unityengine.*;
/**
 * TypeCheck
 * @author sonygod
 */
class TypeCheck 
{

	public static function isNull(target:Dynamic):Bool {
		
		return target.ToString() == "null";
	}
	 public static function getTypedComponent<T>(c:Component, type:Class<T>):T {
          return cast c.GetComponent(untyped(Luanet.ctype(type)));
  }

  public static function getComponentsInChildrenOfType<T>(c:Component, type:Class<T>) {
    return cast (c.GetComponentsInChildren(untyped(Luanet.ctype(type))));
  }
 
	
   
	
	
}