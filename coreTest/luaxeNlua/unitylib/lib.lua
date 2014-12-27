import 'System'
import 'UnityEngine'
import 'Assembly-CSharp'

function init()
Array_Array = {};
___inherit(Array_Array, Object);
Array_Array.__name__ = "Array_Array";
Array_Array.__index = Array_Array;
	function Array_Array.__tostring(a)
		return a:toString();
	end
	function Array_Array:get_length()
		local len = 0
		for k in pairs(self) do
			len = math.max(len, k+1)
		end
		return len;
	end
	
	function Array_Array:concat(a)
		local result = {}
		for k,v in pairs(self) do
			result[k] = v
		end
    	for i=0,#a do
    	    result[#result+1] = a[i]
    	end
		return setmetatable(result, Array_Array);
	end
	
	function Array_Array:copy()
		local result = {}
		for k,v in pairs(self) do
			result[k] = v
		end
		return setmetatable(result, Array_Array);
	end
	
	function Array_Array:iterator()
		local result = setmetatable({  },Object)
		result.cur = 0
		result.arr = self
		result.hasNext = function()
			return result.arr[result.cur] ~= nil;
		end
		result.next = function()
			result.cur = result.cur + 1;
			return result.arr[result.cur - 1];
		end
		return result;
	end
	
	function Array_Array:insert(pos, x)
		local len = self:get_length()
		local _g1 = -1
		local _g = len - pos
		while (_g1 < _g) do
			local i = _g1; _g1 = _g1 + 1
			self[len - i] = self[len - i - 1]
		end
		self[pos] = x
	end
	
	function Array_Array:join(sep)
		local t = {}
		for i=0, #self do
			t[i] = tostring(self[i] or "")
		end
		return table.concat(t, sep, 0);
	end
	
	function Array_Array:toString()
		local s = "[ "
		function prv(v)
    		s = s + v
    	end
    	local first = true
    	for key, value in pairs (self) do
    		prv(first and value or (", " + value))
    		first = false
    	end
		return s + " ]";
	end
	
	function Array_Array:push(elem)
		local length = #self
		if (self[0]) then
			length = length + 1
		end
		self[length] = elem
		return length;
	end
	
	function Array_Array:unshift(x)
		local len = self:get_length()
		local _g = 0
		while (_g < len) do
			local i = _g; _g = _g + 1
			self[len - i] = self[len - i - 1]
		end
		self[0] = x
	end
	
	function Array_Array:indexOf(x, fromIndex)
		if (fromIndex == nil) then
			fromIndex = 0
		end
		local _g1 = fromIndex
		local _g = self:get_length()
		while (_g1 < _g) do
			local i = _g1; _g1 = _g1 + 1
			if (x == self[i]) then
				return i
			end
		end
		return -1;
	end
	
	function Array_Array:lastIndexOf(x, fromIndex)
		if (fromIndex == nil) then
			fromIndex = self:get_length()
		end
		local _g = 0
		while (_g < fromIndex) do
			local i = _g; _g = _g + 1
			if (x == self[fromIndex - i]) then
				return fromIndex - i
			end
		end
		return -1;
	end
	
	function Array_Array:remove(x)
		local result = self:indexOf(x)
		if (result == -1) then
			return false
		else
			local len = self:get_length()
			local _g1 = result
			local _g = len - 1
			while (_g1 < _g) do
				local i = _g1; _g1 = _g1 + 1
				self[i] = self[i + 1]
			end
			self[len] = nil
			return true;
		end
	end
	
	function Array_Array:reverse()
		local length = #self
		if(length < 2) then return end
		for i = 0,length/2,1 do
			local temp = self[i]
			self[i] = self[length-i]
			self[length-i] = temp
		end
	end
	
	function Array_Array:shift()
		local result = self[0]
		local len = self:get_length()
		local _g = 0
		while (_g < len) do
			local i = _g; _g = _g + 1
			self[i] = self[i + 1]
		end
		self[len - 2] = nil
		return result;
	end
	
	
Array_Array.__props__ = {};


end
___hxClasses = {AI_AI = AI_AI,Array_Array = Array_Array,}

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
	return nil -- TODO
end

function Reflect.isEnumValue(o)
	return false -- TODO
end

function Reflect.deleteField(o, f)
	return false -- TODO
end

function Reflect.copy(o)
	return nil -- TODO
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
	-- to-do
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



-- Std class http://api.haxe.org/Std.html
Std = {};
Std_Std = Std;
function Std.int( x, y ) -- Fix for tail-call generator bug, TODO fix
	local z = y or x
	return z > 0 and math.floor(z) or math.ceil(z)
end
-- TODO maybe Std.func = func is faster to call
--static function string(s:Dynamic):String
--Converts any value to a String.
--If s is of String, Int, Float or Bool, its value is returned.
--If s is an instance of a class and that class or one of its parent classes has a toString method, that method is called. If no such method is present, the result is unspecified.
--If s is an enum constructor without argument, the constructor's name is returned. If arguments exists, the constructor's name followed by the String representations of the arguments is returned.
--If s is a structure, the field names along with their values are returned. The field order and the operator separating field names and values are unspecified.
--If s is null, "null" is returned.
function Std.string( s )
	return s==nil and "null" or tostring(s)
end
--function instance<T, S>(value:T, c:Class<S>):S
--Checks if object value is an instance of class c.
--Compiles only if the class specified by c can be assigned to the type of value.
--This method checks if a downcast is possible. That is, if the runtime type of value is assignable to the class specified by c, value is returned. Otherwise null is returned.
--This method is not guaranteed to work with interfaces or core types such as String, Array and Date.
--If value is null, the result is null. If c is null, the result is unspecified.
function Std.instance( value, c )
	if(value == nil)then return nil end
	local mt = getmetatable(value)
	if(mt == c)then return value end
	while(mt ~= nil)do
		mt = mt.__super__
		if(mt == c and mt ~= Object)then return value end
	end
	return nil
end
--static function is(v:Dynamic, t:Dynamic):Bool
--Tells if a value v is of the type t. Returns false if v or t are null.
function Std.is( v, t )
	-- TODO: __ename__ Enums
	-- TODO basic types & funtions detection
	if(not(v or t))then return false end
	return Std.instance( v, t ) and true or false
end
js_Boot_Boot = js_Boot_Boot or {}
js_Boot_Boot.__instanceof = Std.is
__instanceof__ = Std.is
--static function parseInt(x:String):Null<Int>
--Converts a String to an Int.
--Leading whitespaces are ignored.
--If x starts with 0x or 0X, hexadecimal notation is recognized where the following digits may contain 0-9 and A-F.
--Otherwise x is read as decimal number with 0-9 being allowed characters. x may also start with a - to denote a negative value.
--In decimal mode, parsing continues until an invalid character is detected, in which case the result up to that point is returned. For hexadecimal notation, the effect of invalid characters is unspecified.
--Leading 0s that are not part of the 0x/0X hexadecimal notation are ignored, which means octal notation is not supported.
--If the input cannot be recognized, the result is null.
function Std.parseInt( x )
	return tonumber(x) -- TODO implement full specification
end
--static function parseFloat(x:String):Float
--Converts a String to a Float.
--The parsing rules for parseInt apply here as well, with the exception of invalid input resulting in a NaN value instead of null.
--Additionally, decimal notation may contain a single . to denote the start of the fractions.
function Std.parseFloat( x )
	return tonumber(x) -- TODO implement full specification
end
--static function random(x:Int):Int
--Return a random integer between 0 included and x excluded.
--If x <= 1, the result is always 0.
function Std.random( x )
	if x <= 1 then return 0 end
	return math.random(0,x-1)
end

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

init();init= nil
