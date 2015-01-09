
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
		_G.print("Main.hx:28: " + ("中文支持"))
		local a = unityHelper_Luanet_luanet.ctype(unityengine_Transform_Transform)
		unityHelper_TypeCheck_TypeCheck.getTypedComponent(self.current, unityengine_Transform_Transform).localPosition = Vector3(10, 10, 0)
		local list = unityHelper_TypeCheck_TypeCheck.getComponentsInChildrenOfType(self.current, unityengine_Transform_Transform)
		oo = list:GetEnumerator()
		while (oo:MoveNext()) do
			_G.print("Main.hx:43: " + (oo.Current.name))
		end
		local aa = newList(self.current.gameObject)
		_G.print("Main.hx:51: " + (self.current.gameObject))
		aa:Add(self.current.gameObject)
		_G.print("Main.hx:54: " + (aa:get_Count()))
		local bb = newList(1)
		bb:Add(2)
		_G.print("Main.hx:60: " + ("init--" + Std_Std.string(unityengine_Time_Time.time)))
		local _g = 0
		while (_g < 1000) do
			local i = _g; _g = _g + 1
			bb:Add(i)
		end
		_G.print("Main.hx:65: " + (bb:First()))
		bb:Dequeue()
		_G.print("Main.hx:69: " + (bb:First()))
		_G.print("Main.hx:71: " + (bb:Last()))
		bb:Pop()
		_G.print("Main.hx:75: " + (bb:Last()))
		_G.print("Main.hx:77: " + ("before" + Std_Std.string(unityengine_Time_Time.time)))
		self.current:UnityCoroutine(unityengine_WaitForSeconds_WaitForSeconds(2), ___bind(self, self.delay))
	end
	
	function Main_Main:delay()
		_G.print("Main.hx:83: " + ("delay" + Std_Std.string(unityengine_Time_Time.time)))
	end
	
	function Main_Main:Start()
		_G.print("Main.hx:88: " + ("finish--" + Std_Std.string(unityengine_Time_Time.time)))
		_G.print("Main.hx:89: " + ("删除开始"))
		self.current:Test(self.current.gameObject)
	end
	
	function Main_Main:Update() end
	
	function Main_Main:OnDestroy()
		_G.print("Main.hx:114: " + ("lua 删除"))
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
		return c:GetComponent(unityHelper_Luanet_luanet.ctype(type));
	end
	function unityHelper_TypeCheck_TypeCheck.getComponentsInChildrenOfType(c, type)
		return c:GetComponentsInChildren(unityHelper_Luanet_luanet.ctype(type));
	end
	
unityHelper_TypeCheck_TypeCheck.__props__ = {};


end

exec(); exec = nil
Main_Main.main();
