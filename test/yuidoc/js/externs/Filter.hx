package ;



/**
*	Base class that all filters should inherit from.
*
*/
@:native ("Filter")
extern class Filter {

	
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
	*	Returns a clone of this Filter instance.
	*
	*/
	public function clone ():Filter;
	
	/**
	*	@method getBounds
	*	Returns a rectangle with values indicating the margins required to draw the filter.
	*	For example, a filter that will extend the drawing area 4 pixels to the left, and 7 pixels to the right
	*	(but no pixels up or down) would return a rectangle with (x=-4, y=0, width=11, height=0).
	*
	*/
	public function getBounds ():Rectangle;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method new
	*	Base class that all filters should inherit from.
	*
	*/
	public function new ():Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;

}