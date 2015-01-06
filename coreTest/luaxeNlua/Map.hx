/*
* Copyright (C)2005-2013 Haxe Foundation
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

interface IMap<K, V>
{
	function exists(k:K):Bool;
	function get(k:K):Null<V>;
	function iterator():Iterator<V>;
	function keys():Iterator<K>;
	function remove(k:K):Bool;
	function set(k:K, v:V):Void;
	function toString():String;
}

abstract Map<K,V>(IMap<K,V>) {

	
	public function new() untyped this = {};

	public inline function set(key:K, value:V):V {
		
		  return null;
	}

	public inline function get(key:K):V return untyped this[key];

	@:arrayAccess @:noCompletion public inline function _get(key:K):V return untyped this[key];

	@:arrayAccess @:noCompletion public inline function _set(k:K, value:V):V {
		var v = value;
	
		return v;
	}

	public inline function exists(key:K):Bool return untyped this[key] != null;

	public function remove(key:Dynamic):Bool {
		return false;
	}

	public function keys():Iterator<K> {
		var l = 0;
		var a = untyped ("{}");
		var t:Dynamic = this;

		untyped __lua__('for k,v in pairs(t) do
			a[l] = k;
			l = l + 1;
		end');

		var i = 0;

		var ret:Dynamic = untyped ("{}");
		ret.next = function():K {
			i = i + 1;
			return a[i - 1];
		};
		ret.hasNext = function():Bool {
			return i < l;
		};

		return ret;
	}

	public function iterator():Iterator<V> {
		var l = 0;
		var a = untyped ("{}");
		var t:Dynamic = this;

		untyped __lua__('for k,v in pairs(t) do
			a[l] = v;
			l = l + 1;
		end');

		var i = 0;

		var ret:Dynamic = untyped ("{}");
		ret.next = function():K {
			i = i + 1;
			return a[i - 1];
		};
		ret.hasNext = function():Bool {
			return i < l;
		};

		return ret;
	}

	public inline function toString():String {
		return ""+this;
	}
}