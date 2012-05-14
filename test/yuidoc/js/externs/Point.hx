package ;

@:native ("Point")
extern class Point {

	public var x:Float;
	public var y:Float;

	public function clone ():Point;
	public function initialize ():Dynamic;
	public function toString ():String;

}