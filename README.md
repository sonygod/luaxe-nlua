luaxe-nlua
==========

LuaXe
=====

https://github.com/PeyTy/LuaXe


```

Nlua
=====

https://github.com/NLua/NLua




luaxe_Nlua
====

current vesion base LuaXe and Nlua   for **unity**

there no any haxe api only for unity dll extern.



useage
-----

    -D lua
    
    -lib luaxe
    
    -dce full
    
    --macro luaxe.LuaGenerator.use()


-----

sample
====
haxe code


    package ;
    
    class Main
    {
    public static function main()
    {
     
     trace("Lua Rocks!");
       
    }
    }


lua code 


    import 'System'
    import 'UnityEngine'
    import 'Assembly-CSharp'
    
    function exec()
    
    Main_Main = {};
    ___inherit(Main_Main, Object);
    Main_Main.__name__ = "Main_Main";
    Main_Main.__index = Main_Main;
    	function Main_Main.main()
    		_G.print("Main.hx:11: " + ("Lua Rocks!"))
    	end
    	
    Main_Main.__props__ = {};
    end
    ___hxClasses = {Main_Main = Main_Main,}
    Object = {}
    null = nil
    trace = Debug.Log
    undefined = { } 
    function _G.___ternar(cond,any,elses)
    	if(cond)then return any end
    	return elses
    end
    function ___inherit(to, base)
    for k, v in pairs(base) do
    to[k] = v
    end
       
    end
    function __new__(obj, ...)
    	return obj.new(...)
    end
    
    
    exec(); exec = nil
    Main_Main.main();



note
===

current version is not support oop because NLua is not 

support _____super_______ key word



Links
=====
https://github.com/frabbit/hx2python
https://bitbucket.org/AndrewVernon/hx2dart
http://api.haxe.org/

