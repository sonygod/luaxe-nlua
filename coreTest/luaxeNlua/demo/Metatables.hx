package ;

import luaxe.Lua;

class Metatables {

	public static function main()
	{
		var mt:luaxe.lib.Metatable = {};

		mt.__index = function(m, i) {
			return "Yo! Index: " + i;
		}

		mt.__tostring = function(a) {
			return "Me as string! x = " + a.x;
		}

		// Use "setmetatableDEF":
		var t:Dynamic = Lua.setmetatabledef({}, mt);

		trace(t.hello);
		// prints: Yo! Index: hello

		trace(t);
		// prints: Me as string! x = Yo! Index: x

		trace( Lua.getmetatable(t) );
		// prints:
		// { __tostring: function: 0x0005ac10, __index: function: 0x0005abb8 }

		// Let fix indexing:
		mt.__index = function(m, i) {
			return "Yo! Index: " + i;
		}

		// And add computation like for 2D-vectors:
		mt.__add = function(a, b) {
			return Lua.setmetatabledef({ x : a.x + b.x }, mt);
		}

		var a:Dynamic = Lua.setmetatabledef({ x : 1 }, mt);
		var b:Dynamic = Lua.setmetatabledef({ x : 2 }, mt);

		trace(a + b);
		// prints: Me as string! x = 3
	}
}