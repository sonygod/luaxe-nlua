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

	 import 'System'
	import 'UnityEngine'
	import 'Assembly-CSharp'
	
	function exec()
	
	Main_Main = {};
	___inherit(Main_Main, Object);
	Main_Main.__name__ = "Main_Main";
	Main_Main.__index = Main_Main;
		
		function Main_Main.new()
			local self = setmetatable({ }, Main_Main)
			self.speed = 5
			SetMain(self)
			return self
		end
		
		function Main_Main:super()
			self.speed = 5
			SetMain(self)
		end
		
		function Main_Main.main()
			Main_Main.mMain = Main_Main.new()
		end
		
		
		function Main_Main:Awake()
			Reflect_Reflect.setField(self, "no", 1)
			Debug.Log("unity Awake............................." + self.cube.name)
		end
		
		function Main_Main:Start()
			Debug.Log("unity start.............................")
		end
		
		function Main_Main:Update()
			if (self.cube ~= nil) then
				self.cube.transform:RotateAround(self.cube.transform.position, Vector3.up, self.speed * Time.deltaTime)
			end
			if (Input.GetKey(KeyCode.W)) then
				self.speed = self.speed + 1
			end
			if (Input.GetKey(KeyCode.S)) then
				self.speed = self.speed - 1
			end
		end
		
		
	Main_Main.__props__ = {};
	
	
	end
	___hxClasses = {Main_Main = Main_Main,Reflect_Reflect = Reflect_Reflect,}
	
	null = nil
	trace = print
	undefined = { } 
	
	pcall(require, 'bit32')
	pcall(require, 'bit')
	if(bit == nil)then bit = bit32 end
	if(bit32 == nil)then bit32 = bit end
	
	
	
	function _G.___ternar(cond,any,elses)
		if(cond)then return any end
		return elses
	end
	
	function ___inherit(to, base)
	    for k, v in pairs(base) do
	        to[k] = v
	    end
	    to.__super__ = base
	end
	
	function __new__(obj, ...)
		return obj.new(...)
	end
	
	function __strict_eq__(obj, to)
		return (tostring(obj) == tostring(to))
	end
	
	__typeof__ = type;
	
	haxe_Log_Log = {};
	function haxe_Log_Log.trace(a, i)
		if(i and i.fileName and i.customParams)then
			print(i.fileName + ":" + i.lineNumber + ": " + a + "," + i.customParams:join(","))
		elseif(i and i.fileName)then
			print(i.fileName + ":" + i.lineNumber + ": " + a)
		else
			print(a)
			if(i) then print(i) end
		end
	end
	
	function haxe_Log_Log.clear()
	end
	
	function ___bind(o,m)
		if(not m)then return nil end;
		return function(...)
	    	local result = m(o, ...);
	    	return result;
	 	end
	end
	
	function __Array(r)
		return setmetatable(r, Array_Array)
	end
	
	function Array()
		return __Array({})
	end
	if(table.getn == nil)then table.getn = function(o)return #o end end
	if(loadstring == nil)then loadstring = function(o)return (function()return "" end) end end
	function table_print (tt, indent, done)
	  done = done or {}
	  indent = indent or 0
	  if type(tt) == "table" then
	    local sb = {}
	    for key, value in pairs (tt) do
	      table.insert(sb, string.rep (" ", indent)) 
	      if type (value) == "table" and not done [value] then
	        done [value] = true
	        table.insert(sb, "{\n");
	        table.insert(sb, table_print (value, indent + 2, done))
	        table.insert(sb, string.rep (" ", indent)) 
	        table.insert(sb, "}\n");
	      elseif "number" == type(key) then
	        table.insert(sb, string.format("\"%s\"\n", tostring(value)))
	      else
	        table.insert(sb, string.format(
	            "%s = \"%s\"\n", tostring (key), tostring(value)))
	       end
	    end
	    return table.concat(sb)
	  else
	    return tt .. "\n"
	  end
	end
	
	function to_string( tbl )
	    if  "nil"       == type( tbl ) then
	        return tostring(nil)
	    elseif  "table" == type( tbl ) then
	        return table_print(tbl)
	    elseif  "string" == type( tbl ) then
	        return tbl
	    else
	        return tostring(tbl)
	    end
	end
	Math = {}
	Math_Math = Math
	
	function Math.round(num)
		if num >= 0 then return math.floor(num+.5) 
		 else return math.ceil(num-.5) end
	end
	
	Math.NaN = 0/0;
	Math.NEGATIVE_INFINITY = -1.0 / 0.0
	Math.POSITIVE_INFINITY = 1.0 / 0.0
	Math.PI = math.pi
	
	Math.random, Math.abs, Math.min, Math.max = math.random, math.abs, math.min, math.max
	Math.sin, Math.cos, Math.exp, Math.log, Math.tan = math.sin, math.cos, math.exp, math.log
	Math.sqrt, Math.fround, Math.ffloor, Math.fceil = math.sqrt, Math.round, math.floor, math.ceil
	Math.acos, Math.asin, Math.atan, Math.atan2, Math.pow = math.acos, math.asin, math.atan, math.atan2, math.pow
	
	function Math.floor(num)
		return Math.round(math.floor(num))
	end
	
	function Math.ceil(num)
		return Math.round(math.ceil(num))
	end
	
	function Math.isNaN(num)
		return num == Math.NaN
	end
	
	function Math.isFinite(num)
		return num ~= Math.NEGATIVE_INFINITY and num ~= Math.POSITIVE_INFINITY and num ~= Math.NaN
	end
	
	function Math.get_NaN()return Math.NaN end
	function Math.get_POSITIVE_INFINITY()return Math.POSITIVE_INFINITY end
	function Math.get_NEGATIVE_INFINITY()return Math.NEGATIVE_INFINITY end
	local Reflect = {};
	Reflect_Reflect = Reflect;
	
	function Reflect.setField(o, f, v)
		if o and f then
			o[f] = v
		end
	end
	
	function Reflect.setProperty(o, f, v)
		if o then
			local t = "set_" .. f
			if o[t] then o[t](o, v)
			else Reflect.setField(o, f, v) end
		end
	end
	
	function Reflect.isFunction(f)
		if f == nil then return false end
		return type(f) == "function"
	end
	
	function Reflect.isObject(v)
		if v == nil then return false end
	
		local t = type(v)
		return t == "table" or t == "userdata"
	end
	
	function Reflect.hasField(o, f)
		if o == nil or f == nil then return false end
		return o[f] ~= nil
	end
	
	function Reflect.fields(o)
		if o == nil then return nil end
		local t = {}
		local ind = 0
		for i, v in pairs(o) do
			t[ind] = i;
			ind = ind + 1
		end
		return setmetatable(t, Array_Array)
	end
	
	function Reflect.field(o, f)
		if o == nil or f == nil then return nil end
		if o[f] == nil then return nil end
	
		return o[f]
	end
	
	function Reflect.getProperty(o, f)
		return nil 
	end
	
	function Reflect.isEnumValue(o)
		return false 
	end
	
	function Reflect.deleteField(o, f)
		return false 
	end
	
	function Reflect.copy(o)
		return nil 
	end
	
	function Reflect.callMethod(o, func, args)
		if o and func and args and o[func] then
			local a = args:copy()
			table.insert(a, 0, o)
			return o[func](o, unpack(a))
		end
		return nil
	end
	
	function Reflect.compare(a, b)
		if a == nil and b == nil then return 0 end
		if type(a) ~= type(b) then return nil end
	
		local ta, tb = type(a), type(b)
	
		if ta == "number" then
			if a < b then return -1
			elseif a > b then return 1
			else return 0 end
		elseif ta == "function" then
		elseif ta == "string" then
		else
			if a == b then return 0 else return nil end
		end
		return nil
	end
	
	String = {}
	String_String = String
	
	local __StringMeta = getmetatable('')
	function __StringMeta.__add(a,b) 
	  return tostring(a or (a == false and "false") or "null") .. tostring(b or (b == false and "false") or "null")
	end
	
	__StringMeta.__index = function (str, p)
		if (p == "length") then
			return string.len(str) 
		else
			return String[p]
		end
	end
	
	local __string_sub = string.sub
	local __string_byte = string.byte
	local __string_find = string.find
	
	String.fromCharCode = string.char 
	String.substring = string.sub 
	String.toLowerCase = string.lower 
	String.toUpperCase = string.upper 
	
	function String.new(string) 
		return string
	end
	
	function String:toString() 
		return self
	end
	
	function String:charAt(index) 
		return __string_sub(self, index+1, index+1)
	end
	
	function String:charCodeAt(index) 
		return __string_byte(__string_sub(self, index+1, index+1))
	end
	
	function String:indexOf(str, startIndex) 
		local r = string.find(self, str, startIndex, true)
	  return r and (r - 1) or -1
	end
	
	function String:lastIndexOf(str, startIndex) 
		local i, j
	    local k = 0
	    repeat
	        i = j
	        j, k = __string_find(self, str, k + 1, true)
	    until j == nil
	
	    return (i or 0) - 1
	end
	
	function String:split(d) 
	local t, ll
	local p = self
	  t={}
	  ll=0
	  if(#p == 1) then return {p} end
	    while true do
	      l=string.find(p,d,ll,true) 
	      if l~=nil then 
	        table.insert(t, string.sub(p,ll,l-1)) 
	        ll=l+1 
	      else
	        table.insert(t, string.sub(p,ll)) 
	        break 
	      end
	    end
	  return setmetatable(t, Array_Array)
	end
	
	function String:substr(pos, len) 
		return len and __string_sub(self, pos+1, pos+len)
	  or __string_sub(self, pos+1)
	end
	
	HxOverrides_HxOverrides = HxOverrides_HxOverrides or {}
	HxOverrides_HxOverrides.substr = String.substr
	HxOverrides_HxOverrides.cca = String.charCodeAt
	HxOverrides = HxOverrides_HxOverrides
	
	Object = {}
	Object.__index = Object;
	Object.__super__ = nil
	function Object.__tostring(o)
	    local s = "{ "
	    function prv(n,v)
	    	s = s + n + ": " + v
	    end
	    local first = true
	    for key, value in pairs (o) do
	    	prv(first and key or (", " + key),value)
	    	first = false
	    end	
	    return s + " }"
	end
	Date = {}
	Date.__index = Date
	Date_Date = Date
	
	function Date.now()
		local self = {
			d = os.date("*t")
		}
		self.buf = os.time(self.d)
		return setmetatable(self, Date)
	end
	
	function Date.fromTime(t)
		local self = {
			d = os.date(t)
		}
		self.buf = os.time(self.d)
		return setmetatable(self, Date)
	end
	
	function Date.new(year, month, day, hour, min, sec)
		if year == nil then return Date.now() end
		local self = {
			d = {year = year, day = day, month = month, hour = hour, min = min, sec = sec}
		}
		self.buf = os.time(self.d)
		return setmetatable(self, Date)
	end
	
	function Date:getDate()
		return self.d.day
	end
	
	function Date:getDay()
		return os.date("%w", self:getTime())
	end
	
	function Date:getHours()
		return self.d.hour
	end
	
	function Date:getMinutes()
		return self.d.min
	end
	
	function Date:getMonth()
		return self.d.month - 1
	end
	
	function Date:getSeconds()
		return self.d.sec
	end
	
	function Date:getTime()
		return self.buf
	end
	
	function Date:getFullYear()
		return self.d.year
	end
	
	function Date.__tostring(o)
		local m = tostring(o:getMonth())
		if string.len(m) == 1 then m = "0" .. m end
		return os.date("%Y-" .. m .. "-%d %H:%M:%S", o:getTime());
	end
	
	function Date.toString(o)
		return Date.__tostring(o)
	end
	
	function Date.fromString(dateString) 
		local pattern = "(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)"
	    local xyear, xmonth, xday, xhour, xminute = string.match(dateString, pattern)
	    local convertedTimestamp = os.time({year = xyear, month = xmonth, 
	        day = xday, hour = xhour, min = xminute, sec = xseconds})
	    print(convertedTimestamp)
	    print(type(convertedTimestamp))
	    return Date.fromTime(convertedTimestamp)
	end
	
	HxOverrides_HxOverrides.dateStr = Date.__tostring;
	HxOverrides_HxOverrides.strDate = Date.fromString;
	local EReg = {}
	EReg_EReg = EReg
	EReg.__index = EReg
	
	function EReg.new(def)
		local self = {}
		return setmetatable(self, EReg)
	end
	function EReg:match() return nil end
	function EReg:matched() return nil end
	function EReg:split() return nil end
	
	
	function setField(filedName,value)
		
	
	
	   Reflect_Reflect.setField(Main_Main, filedName, value)
		
	 end
	
	function SetMain(target)
		
		Main_Main=target;
		
	 end
	
	function Awake()
		
	Main_Main.mMain:Awake();
	end
	
	function Start()
	
	Debug.Log("start");
	
	 Main_Main.mMain:Start();
	end
	
	function Update()
		
	 Main_Main.mMain:Update();
	end
	
	
	exec(); exec = nil
	Main_Main.main();




