package ;

@:native ("Rectangle")
extern class Rectangle {

	public var height:Float;
	public var width:Float;
	public var x:Float;
	public var y:Float;

	public function clone ():Rectangle;
	public function initialize ():Dynamic;
	public function toString ():String;

}