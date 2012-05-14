package ;

@:native ("Point")
extern class Point {

	public var x:Float;
	public var y:Float;

	private function initialize ():Dynamic;
	public function clone ():Point;
	public function toString ():String;

}