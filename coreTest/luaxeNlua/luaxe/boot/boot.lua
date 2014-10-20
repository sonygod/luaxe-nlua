-- boot
Object = {}
null = nil
trace = Debug.Log
undefined = { } -- unique special value for (mostly) internal use.
function _G.___ternar(cond,any,elses)
	if(cond)then return any end
	return elses
end
function ___inherit(to, base)
	-- copy all fields from parent
    for k, v in pairs(base) do
        to[k] = v
    end
   
end
function __new__(obj, ...)
	return obj.new(...)
end

