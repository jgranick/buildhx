package ;



/**
*	BoxBlurFilter applies a box blur to DisplayObjects
*
*/
@:native ("BoxBlurFilter")
extern class BoxBlurFilter {

	
	/**
	*	@type Number
	*	Horizontal blur radius
	*
	*/
	public var blurX:Float;
	
	/**
	*	@type Number
	*	Number of blur iterations. For example, a value of 1 will produce a rough blur.
	*	A value of 2 will produce a smoother blur, but take twice as long to run.
	*
	*/
	public var quality:Float;
	
	/**
	*	@type Number
	*	Vertical blur radius
	*
	*/
	public var blurY:Float;

	
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
	*	@method getBounds
	*	Returns a rectangle with values indicating the margins required to draw the filter.
	*	For example, a filter that will extend the drawing area 4 pixels to the left, and 7 pixels to the right
	*	(but no pixels up or down) would return a rectangle with (x=-4, y=0, width=11, height=0).
	*
	*/
	public function getBounds ():Rectangle;
	
	/**
	*	@method new
	*	BoxBlurFilter applies a box blur to DisplayObjects
	*	@param blurX (Number)  
	*	@param blurY (Number)  
	*	@param quality (Number)  
	*
	*/
	public function new (blurX:Float, blurY:Float, quality:Float):Void;

}