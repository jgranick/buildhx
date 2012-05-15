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
	*	@param ctx (null)  The 2D context to use as the source.
	*	@param x (null)  The x position to use for the source rect.
	*	@param y (null)  The y position to use for the source rect.
	*	@param width (null)  The width to use for the source rect.
	*	@param height (null)  The height to use for the source rect.
	*	@param targetCtx (null)  Optional. The 2D context to draw the result to. Defaults to the context passed to ctx.
	*	@param targetX (null)  Optional. The x position to draw the result to. Defaults to the value passed to x.
	*	@param targetY (null)  Optional. The y position to draw the result to. Defaults to the value passed to y.
	*
	*/
	public function applyFilter (ctx:Void, x:Void, y:Void, width:Void, height:Void, targetCtx:Void, targetX:Void, targetY:Void):Dynamic;
	
	/**
	*	@method clone
	*	Returns a clone of this ColorMatrixFilter instance.
	*
	*/
	public function clone ():ColorMatrixFilter;
	
	/**
	*	@method initialize
	*	Allows you to carry out complex color operations such as modifying saturation, brightness, or inverting.
	*	@param matrix (null)  A 4x5 matrix describing the color operation to perform.
	*
	*/
	private function initialize (matrix:Void):Dynamic;
	
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