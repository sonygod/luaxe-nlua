
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
		Debug.Log("中文支持")
		local a = luanet.ctype(Transform)
		unityHelper_TypeCheck_TypeCheck.getTypedComponent(self.current, Transform).localPosition = Vector3(10, 10, 0)
		local list = unityHelper_TypeCheck_TypeCheck.getComponentsInChildrenOfType(self.current, Transform)
		oo = list:GetEnumerator()
		while (oo:MoveNext()) do
			Debug.Log(oo.Current.name)
		end
		local aa = newList(self.current.gameObject)
		Debug.Log(self.current.gameObject)
		aa:Add(self.current.gameObject)
		Debug.Log(aa:get_Count())
		local bb = newList(1)
		bb:Add(2)
		Debug.Log("init--" + Std_Std.string(Time.time))
		local _g = 0
		while (_g < 1000) do
			local i = _g; _g = _g + 1
			bb:Add(i)
		end
		Debug.Log(bb:First())
		bb:Dequeue()
		Debug.Log(bb:First())
		Debug.Log(bb:Last())
		bb:Pop()
		Debug.Log(bb:Last())
		Debug.Log("before" + Std_Std.string(Time.time))
		self.current:UnityCoroutine(WaitForSeconds(2), ___bind(self, self.delay))
	end
	
	function Main_Main:delay()
		Debug.Log("delay" + Std_Std.string(Time.time))
	end
	
	function Main_Main:Start()
		Debug.Log("finish--" + Std_Std.string(Time.time))
		Debug.Log("删除开始")
		self.current:Test(self.current.gameObject)
	end
	
	function Main_Main:Update() end
	
	function Main_Main:OnDestroy()
		Debug.Log("lua 删除")
	end
	
	
Main_Main.__props__ = {};


Type_Type = {};
___inherit(Type_Type, Object);
Type_Type.__name__ = "Type_Type";
Type_Type.__index = Type_Type;
	
Type_Type.__props__ = {};


unityHelper_TypeCheck_TypeCheck = {};
___inherit(unityHelper_TypeCheck_TypeCheck, Object);
unityHelper_TypeCheck_TypeCheck.__name__ = "unityHelper.TypeCheck_TypeCheck";
unityHelper_TypeCheck_TypeCheck.__index = unityHelper_TypeCheck_TypeCheck;
	function unityHelper_TypeCheck_TypeCheck.getTypedComponent(c, type)
		return c:GetComponent(luanet.ctype(type));
	end
	function unityHelper_TypeCheck_TypeCheck.getComponentsInChildrenOfType(c, type)
		return c:GetComponentsInChildren(luanet.ctype(type));
	end
	
unityHelper_TypeCheck_TypeCheck.__props__ = {};


end

exec(); exec = nil
Main_Main.main();
