

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

