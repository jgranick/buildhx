package ;



/**
*	A Shape allows you to display vector art in the display list. It composites a Graphics instance which exposes all of the vector
*	drawing methods. The Graphics instance can be shared between multiple Shape instances to display the same vector graphics with different
*	positions or transforms. If the vector art will not change between draws, you may want to use the cache() method to reduce the rendering cost.
*
*/
@:native ("Shape")
extern class Shape extends DisplayObject {

	
	/**
	*	@type Graphics
	*	The graphics instance to display.
	*
	*/
	public var graphics:Graphics;
	
	private var DisplayObject_draw:Dynamic;
	
	private var DisplayObject_initialize:Dynamic;

	
	/**
	*	@method clone
	*	Returns a clone of this Shape. Some properties that are specific to this instance's current context are reverted to 
	*	their defaults (for example .parent).
	*	@param recursive (Boolean)  If true, this Shape's Graphics instance will also be cloned. If false, the Graphics instance 
	*	will be shared with the new Shape.
	*
	*/
	//public function clone (recursive:Bool):Dynamic;
	
	/**
	*	@method draw
	*	Draws the Shape into the specified context ignoring it's visible, alpha, shadow, and transform.
	*	Returns true if the draw was handled (useful for overriding functionality).
	*	NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	*	@param ctx (CanvasRenderingContext2D)  The canvas 2D context object to draw into.
	*	@param ignoreCache (Boolean)  Indicates whether the draw operation should ignore any current cache. 
	*	For example, used for drawing the cache (to prevent it from simply drawing an existing cache back
	*	into itself).
	*
	*/
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	
	/**
	*	@method initialize!~YUIDOC_LINE~!param  graphics
	*	Initialization method.
	*
	*/
	private function initialize!~YUIDOC_LINE~!param  graphics ():Dynamic;
	
	/**
	*	@method isVisible
	*	Returns true or false indicating whether the Shape would be visible if drawn to a canvas.
	*	This does not account for whether it would be visible within the boundaries of the stage.
	*	NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	*
	*/
	//public function isVisible ():Bool;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	//public function toString ():String;

}