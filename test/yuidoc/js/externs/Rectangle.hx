package ;



/**
*	Represents a rectangle as defined by the points (x, y) and (x+width, y+height).
*
*/
@:native ("Rectangle")
extern class Rectangle {

	
	/**
	*	@type Number
	*	Height.
	*
	*/
	public var height:Float;
	
	/**
	*	@type Number
	*	Width.
	*
	*/
	public var width:Float;
	
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
	*	Returns a clone of the Rectangle instance.
	*
	*/
	public function clone ():Rectangle;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method new
	*	Represents a rectangle as defined by the points (x, y) and (x+width, y+height).
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param width (Number)  
	*	@param height (Number)  
	*
	*/
	public function new (x:Float, y:Float, width:Float, height:Float):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;

}