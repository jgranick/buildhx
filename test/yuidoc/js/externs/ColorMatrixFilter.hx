package ;



/**
*	Applies color transforms.
*
*/
@:native ("ColorMatrixFilter")
extern class ColorMatrixFilter {

	
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
	*	Returns a clone of this ColorMatrixFilter instance.
	*
	*/
	public function clone ():ColorMatrixFilter;
	
	/**
	*	@method initialize
	*	Allows you to carry out complex color operations such as modifying saturation, brightness, or inverting.
	*	@param matrix (Dynamic)  A 4x5 matrix describing the color operation to perform.
	*
	*/
	private function initialize (matrix:Dynamic):Dynamic;
	
	/**
	*	@method new
	*	Applies color transforms.
	*	@param blurX (Number)  
	*
	*/
	public function new (blurX:Float):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;

}