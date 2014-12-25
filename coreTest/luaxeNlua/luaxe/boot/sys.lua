-- contributed by github.com/insweater

Sys = {}
luaxe_Sys_Sys = Sys

function Sys.exit(code)
	os.exit(code)
end

function Sys.getEnv(s)
	return os.getenv(s)
end

function Sys.args()
	-- to-do
	return arg or {}
end

do
	local cl = os.clock
	function Sys.sleep(seconds)
		local t = cl()
		while cl() - t <= seconds do end
	end
end

function Sys.command(cmd, args)
	-- to-do
	local r = cmd
	for i, v in ipairs(args) do r = r .. " " .. tostring(v) end
	os.execute(r)
end

function Sys.print(v)
	print(v)
end

function Sys.println(v)
	print(v)
	print("\n")
end

-- to-do
function Sys.cpuTime() return nil end 
function Sys.environment() return nil end 
function Sys.executablePath() return nil end 
function Sys.getChar(echo) return nil end
function Sys.getCwd() return nil end
function Sys.putEnv(s, v) end
function Sys.setCwd(s) end
function Sys.setTimeLocale(loc) return nil end
function Sys.stderr() return nil end
function Sys.stdin() return nil end
function Sys.stdout() return nil end
function Sys.systemName() return nil end
function Sys.time() return 10 end
Sys = nil -- clean _G