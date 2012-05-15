package ;



/**
*	Applies color transforms.
*
*/
@:native ("ColorFilter")
extern class ColorFilter {

	
	/**
	*	@type Number
	*	Alpha channel multiplier.
	*
	*/
	public var redMultiplier:Float;
	
	/**
	*	@type Number
	*	Alpha channel offset (added to value).
	*
	*/
	public var alphaOffset:Float;
	
	/**
	*	@type Number
	*	Blue channel multiplier.
	*
	*/
	public var blueMultiplier:Float;
	
	/**
	*	@type Number
	*	Blue channel offset (added to value).
	*
	*/
	public var blueOffset:Float;
	
	/**
	*	@type Number
	*	Green channel multiplier.
	*
	*/
	public var greenMultiplier:Float;
	
	/**
	*	@type Number
	*	Green channel offset (added to value).
	*
	*/
	public var greenOffset:Float;
	
	/**
	*	@type Number
	*	Red channel offset (added to value).
	*
	*/
	public var redOffset:Float;

	
	/**
	*	@method applyFilter
	*	Applies the filter to the specified context.
	*	@param ctx (Dynamic)  The 2D context to use as the source.
	*	@param x (Dynamic)  The x position to use for the source rect.
	*	@param y (Dynamic)  The y position to use for the source rect.
	*	@param width (Dynamic)  The width to use for the source rect.
	*	@param height (Dynamic)  The height to use for the source rect.
	*	@param targetCtx (Dynamic)  Optional. The 2D context to draw the result to. Defaults to the context passed to ctx.
	*	@param targetX (Dynamic)  Optional. The x position to draw the result to. Defaults to the value passed to x.
	*	@param targetY (Dynamic)  Optional. The y position to draw the result to. Defaults to the value passed to y.
	*
	*/
	public function applyFilter (ctx:Dynamic, x:Dynamic, y:Dynamic, width:Dynamic, height:Dynamic, targetCtx:Dynamic, targetX:Dynamic, targetY:Dynamic):Dynamic;
	
	/**
	*	@method clone
	*	Returns a clone of this ColorFilter instance.
	*
	*/
	public function clone ():ColorFilter;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method new
	*	Applies color transforms.
	*	@param redMultiplier (Number)  
	*	@param greenMultiplier (Number)  
	*	@param blueMultiplier (Number)  
	*	@param alphaMultiplier (Number)  
	*	@param redOffset (Number)  
	*	@param greenOffset (Number)  
	*	@param blueOffset (Number)  
	*	@param alphaOffset (Number)  
	*
	*/
	public function new (redMultiplier:Float, greenMultiplier:Float, blueMultiplier:Float, alphaMultiplier:Float, redOffset:Float, greenOffset:Float, blueOffset:Float, alphaOffset:Float):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;

}