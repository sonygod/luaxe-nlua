/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

class Array<T> implements ArrayAccess<T> {	

	public var length(get,never) : Int;

	public function get_length():Int
	{
		var len = 0;
		untyped __lua__(
		"for k in pairs(self) do
			len = math.max(len, k+1)
		end");
		return len;
	}

	public function new(?arg:Dynamic) : Void {
		untyped __lua__(
		"if(arg)then return setmetatable(arg or{},Array_Array)end"
		);
	};

	@:keep public function concat( a : Array<T>) : Array<T> {
		var result = untyped __lua__("{}");
		untyped __lua__(
		"for k,v in pairs(self) do
			result[k] = v
		end
    	for i=0,#a do
    	    result[#result+1] = a[i]
    	end");
    	return luaxe.Lua.setmetatable(result, Array);
	}

	@:keep public function copy() : Array<T> {
		var result = untyped __lua__("{}");
		untyped __lua__(
		"for k,v in pairs(self) do
			result[k] = v
		end");
		return luaxe.Lua.setmetatable(result, Array);
	}

	@:keep @:runtime public function iterator() : Iterator<T> {
		var result:Dynamic = {};
		result.cur = 0;
		result.arr = this;
		result.hasNext = function():Bool {
			return result.arr[result.cur] != null;
		}
		result.next = function():T {
			result.cur++;
			return cast result.arr[cast (result.cur - 1)];
		}
		return result;
	}

	@:keep public function insert( pos : Int, x : T ) : Void {
		var len = length;
		for(i in -1...len-pos) this[len-i] = this[len-i-1];
		this[pos] = x;
	};


	@:keep public function join( sep : String ) : String {
		var t = untyped __lua__("{}");
		untyped __lua__(
		'for i=0, #self do
			t[i] = tostring(self[i] or "")
		end');
		return (untyped __lua__('table.concat'))(t,sep,0);
	}

	@:keep public function toString() : String {
		var s = "[ ";
    	untyped __lua__(
    	"function prv(v)
    		s = s + v
    	end
    	local first = true
    	for key, value in pairs (self) do
    		prv(first and value or (\", \" + value))
    		first = false
    	end");
    	return s + " ]";
	}

	@:keep public static function __tostring(a:Dynamic)
	return a.toString();

	@:runtime public function pop() : Null<T> {
		var length = (untyped __hash__)(this);
		var last = untyped this[length];
		untyped this[length] = null;
		return last;
	}

	@:keep @:runtime public function push(elem:T) : Int {
		var length = (untyped __hash__)(this);
		if (untyped this[0]) length = length + 1;
		untyped this[length] = elem;
		return length;
	}

	@:keep public function unshift(x : T) : Void {
		var len = length;
		for(i in 0...len) this[len-i] = this[len-i-1];
		this[0] = x;
	}

	@:keep public function indexOf(x : T, ?fromIndex:Null<Int>) : Int {
		if(fromIndex == null) fromIndex = 0;
		for(i in fromIndex...length) if(x == this[i]) return i;
		return -1;
	}

	@:keep public function lastIndexOf(x : T, ?fromIndex:Int) : Int {
		if(fromIndex == null) fromIndex = length;
		for(i in 0...fromIndex) if(x == this[fromIndex-i]) return fromIndex-i;
		return -1;
	}

	@:keep public function remove(x : T) : Bool {
		var result = indexOf(x);
		if(result == -1)
		{
			return false;
		} else {
			var len = length;
			for(i in result...len-1) this[i] = this[i+1];
			this[len] = cast null;
			return true;
		}
	}

	@:keep public function reverse() : Void{
		untyped __lua__(
		"local length = #self
		if(length < 2) then return end
		for i = 0,length/2,1 do
			local temp = self[i]
			self[i] = self[length-i]
			self[length-i] = temp
		end");
	};

	@:keep @:runtime public function shift() : Null<T> {
		var result = this[0];
		var len = length;
		for(i in 0...len) this[i] = this[i+1];
		this[len-2] = cast null;
		return result;
	}

	public function slice( pos : Int, ?ends : Int ) : Array<T> {
		var result = untyped __lua__("{}");
		untyped __lua__(
		"for i = pos,(ends or #self)-1 do
			result[i] = self[i]
		end");
		return luaxe.Lua.setmetatable(result, Array);
	}

	public function sort(fun:T->T->Int) : Void {
		untyped __lua__(
		"local isSorted = false
		while isSorted == false do
			movedElements = 0
			for x = 0, table.getn(self) - 1, 1 do
				if fun(self[x], self[x + 1]) > 0 then
					movedElements = movedElements + 1
					testedElement = self[x]
					self[x] = self[x + 1]
					self[x + 1] = testedElement
				end
			end
			if movedElements == 0 then
				isSorted = true
			end
		end");
	}

	public function splice( a : Int, b : Int ) : Array<T> {
		var result = untyped __lua__("{}");
		untyped __lua__(
		"for i = a,b do
			result[i] = self[i]
		end
		for i = a,b-a do
			self[i] = self[i+a+1]
		end
		for i = b,table.getn(self) do
			self[i] = nil
		end");
		return luaxe.Lua.setmetatable(result, Array);
	}

	public function pairs()
	return untyped __call__("pairs", this);

	public function map<S>( f : T -> S ) : Array<S> {
		var result = untyped __lua__("{}");
		untyped __lua__("for k,v in pairs(self) do result[k] = f(v) end");
		return luaxe.Lua.setmetatable(result, Array);
	}

	public function filter( f : T -> Bool ) : Array<T> {
		var result = [];
		for(i in this) if(f(i)) result.push(i);
		return result;
	}
}