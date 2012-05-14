package ;

@:native ("Rectangle")
extern class Rectangle {

	public var height:Float;
	public var width:Float;
	public var x:Float;
	public var y:Float;

	private function initialize ():Dynamic;
	public function clone ():Rectangle;
	public function toString ():String;

}