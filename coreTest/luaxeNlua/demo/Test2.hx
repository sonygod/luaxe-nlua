package ;

import unityengine.Debug;
/**
 * Test2
 * @author sonygod
 */
@:native("test2014")
class Test2 extends Test1 
{

	public function new() 
	{
		super();
		
	}
	
	override public function test() 
	{
		super.test();
		
		
		Debug.Log("fuck");
	}
	
}