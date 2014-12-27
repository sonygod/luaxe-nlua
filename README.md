LuaXe for unity
=====

![lua](https://cloud.githubusercontent.com/assets/3642643/5304500/5051797e-7c04-11e4-9c33-9c7290194a04.png)

<a href="http://peyty.github.io#donate"><img src="http://peyty.github.io/images/donate.png"></a>
<a href="http://peyty.github.io#hireme"><img src="http://peyty.github.io/images/hireme.png"></a>



Links
=====
https://github.com/PeyTy/LuaXe
https://github.com/frabbit/hx2python
<br>https://bitbucket.org/AndrewVernon/hx2dart
<br>http://api.haxe.org/

--------------------------------------------------------------

unity usage
====

-lib luaxe
-lib HUGS
-dce full
-D unity

and use **NLuaUnity** and **HUGS** lib

https://github.com/Mervill/Unity3D-NLua

**Note**: current version not support haxe **Enum** keyword

中文支持
====
广州青翼工作室

QQ群：109165684

example
===
Main.hx

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


and test.cs

		using System.IO;
		using System.Reflection;
		using UnityEngine;
		using System.Collections;
		
		using NLua;
		
		public class TestBehaviour : MonoBehaviour
		{
		
		 
		
		    Lua env;
		
		    public GameObject cube;
		
		    void Awake()
		    {
		        env = new Lua();
		        env.LoadCLRPackage();
		
		        env["this"] = this; // Give the script access to the gameobject.
		        env["transform"] = transform;
		
		        //System.Object[] result = new System.Object[0];
		
		        StartCoroutine(writeFile("file://" + Application.streamingAssetsPath + "/luahaxe.lua"));
		    }
		
		    void Start()
		    {
		       Call("Start");//here may not excute
		    }
		
		    void Update()
		    {
		      Call("Update");
		    }
		
		    void OnGUI()
		    {
		     //   Call("OnGUI");
		    }
		    public string GetTextWithoutBOM(byte[] bytes)
		    {
		        MemoryStream memoryStream = new MemoryStream(bytes);
		        StreamReader streamReader = new StreamReader(memoryStream, true);
		
		        string result = streamReader.ReadToEnd();
		
		        memoryStream = null;
		        streamReader = null;
		
		        return result;
		    }
		    private IEnumerator writeFile(string loadFile)
		    {
		        WWW loadDB = new WWW(loadFile);
		
		        yield return loadDB;
		
		        if (loadDB.error == null)
		        {
		
		             env.DoString(LuaLib.lib);//==reqire("lib")
		            string s = GetTextWithoutBOM(loadDB.bytes);//for 中文支持
		
		           // Debug.Log(s);
		            try
		            {
		                //result = env.DoString(source);
		                env.DoString(s);
		            }
		            catch (NLua.Exceptions.LuaException e)
		            {
		                Debug.LogError(FormatException(e), gameObject);
		            }
		        }
		
		       
		        foreach (FieldInfo fieldInfo in this.GetType().GetFields())
		        {
		            Call("setField", fieldInfo.Name, fieldInfo.GetValue(this));
		        }
		       
		
		        
		
		        Call("Awake");//here for real Awake lua
		        Call("Start");
		       
		
		
		    }
		    public System.Object[] Call(string function, params System.Object[] args)
		    {
		        System.Object[] result = new System.Object[0];
		        if (env == null) return result;
		        LuaFunction lf = env.GetFunction(function);
		        if (lf == null) return result;
		        try
		        {
		            // Note: calling a function that does not
		            // exist does not throw an exception.
		            if (args != null)
		            {
		                result = lf.Call(args);
		            }
		            else
		            {
		                result = lf.Call();
		            }
		        }
		        catch (NLua.Exceptions.LuaException e)
		        {
		            Debug.LogError(FormatException(e), gameObject);
		        }
		        return result;
		    }
		
		    public System.Object[] Call(string function)
		    {
		        return Call(function, null);
		    }
		
		    public static string FormatException(NLua.Exceptions.LuaException e)
		    {
		        string source = (string.IsNullOrEmpty(e.Source)) ? "<no source>" : e.Source.Substring(0, e.Source.Length - 2);
		        return string.Format("{0}\nLua (at {2})", e.Message, string.Empty, source);
		    }
		}


and the Main.lua 

	
    function exec()
    
    Main_Main = {};
    ___inherit(Main_Main, Object);
    Main_Main.__name__ = "Main_Main";
    Main_Main.__index = Main_Main;
    	
    	function Main_Main.new()
    		local self = setmetatable({ }, Main_Main)
    		SetMain(self)
    		return self
    	end
    	
    	function Main_Main:super()
    		SetMain(self)
    	end
    	
    	function Main_Main.main()
    		Main_Main.mMain = Main_Main.new()
    	end
    	
    	function Main_Main:Awake()
    		Debug.Log("unity Awake.............................")
    		local v1 = Vector3(1, 1, 1)
    		local v2 = Vector3(1, 1, 1)
    		v1.x = 100
    		Debug.Log(Std_Std.string(v1.x) + "---- " + Std_Std.string(v2.x))
    		if (self.MButton ~= nil) then
    			self.MButton.Click:Add(self.handleClick)
    		else
    			Debug.Log("MButton was not defined")
    		end
    		local aa = Array()
    		local _g = 0
    		while (_g < 10) do
    			local i = _g; _g = _g + 1
    			aa:push(i)
    		end
    		local _g1 = 0
    		while (_g1 < aa:get_length()) do
    			local i1 = aa[_g1]
    			_g1 = _g1 + 1;
    			Debug.Log("数组【1】=" + aa[i1])
    		end
    	end
    	
    	function Main_Main:handleClick(control, mouseevent)
    		Debug.Log(control.name)
    	end
    	
    	function Main_Main:OnDestroy()
    		Debug.Log("OnDestory")
    	end
    	
    	function Main_Main:Start()
    		Debug.Log("unity start.............................")
    	end
    	
    	function Main_Main:Update() end
    	
    	
    Main_Main.__props__ = {};
    
    
    end
    
    exec(); exec = nil
    Main_Main.main();





