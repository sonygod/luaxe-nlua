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