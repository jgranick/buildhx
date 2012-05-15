package ;



/**
*	Represents a point on a 2 dimensional x / y coordinate system.
*
*/
@:native ("Point")
extern class Point {

	
	/**
	*	@type Number
	*	X position.
	*
	*/
	public var x:Float;
	
	/**
	*	@type Number
	*	Y position.
	*
	*/
	public var y:Float;

	
	/**
	*	@method clone
	*	Returns a clone of the Point instance.
	*
	*/
	public function clone ():Point;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method new
	*	Represents a point on a 2 dimensional x / y coordinate system.
	*	@param x (Number)  
	*	@param y (Number)  
	*
	*/
	public function new (x:Float, y:Float):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;

}