package ;



/**
*	Encapsulates the properties required to define a shadow to apply to a DisplayObject via it's .shadow property.
*
*/
@:native ("Shadow")
extern class Shadow {

	
	/**
	*	@type Shadow
	*	An identity shadow object (all properties are set to 0). Read-only.
	*
	*/
	public static var identity:Shadow;

	
	/**
	*	@method clone
	*	Returns a clone of this Shadow instance.
	*
	*/
	public function clone ():Shadow;
	
	/**
	*	@method initialize
	*	Initialization method.
	*	@param color (String)  The color of the shadow.
	*	@param offsetX (Number)  The x offset of the shadow.
	*	@param offsetY (Number)  The y offset of the shadow.
	*	@param blur (Number)  The size of the blurring effect.
	*
	*/
	private function initialize (color:String, offsetX:Float, offsetY:Float, blur:Float):Dynamic;
	
	/**
	*	@method new
	*	Encapsulates the properties required to define a shadow to apply to a DisplayObject via it's .shadow property.
	*	@param color (String)  
	*	@param offsetX (Number)  
	*	@param offsetY (Number)  
	*	@param blur (Number)  
	*
	*/
	public function new (color:String, offsetX:Float, offsetY:Float, blur:Float):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;

}