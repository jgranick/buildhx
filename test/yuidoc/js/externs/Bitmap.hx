package ;

import js.w3c.html5.Canvas2DContext;



/**
*	A Bitmap represents an Image, Canvas, or Video in the display list.
*
*/
@:native ("Bitmap")
extern class Bitmap extends DisplayObject {

	
	/**
	*	@type Image | HTMLCanvasElement | HTMLVideoElement
	*	The image to render. This can be an Image, a Canvas, or a Video.
	*
	*/
	public var image:Dynamic;
	
	/**
	*	@type Rectangle
	*	Specifies an area of the source image to draw. If omitted, the whole image will be drawn.
	*
	*/
	public var sourceRect:Rectangle;
	
	private var DisplayObject_draw:Dynamic;
	
	private var DisplayObject_initialize:Dynamic;

	
	/**
	*	@method cache
	*	Because the content of a Bitmap is already in a simple format, cache is unnecessary for Bitmap instances.
	*	You should not cache Bitmap instances as it can degrade performance.
	*
	*/
	//public function cache ():Dynamic;
	
	/**
	*	@method clone
	*	Returns a clone of the Bitmap instance.
	*
	*/
	//public function clone ():Bitmap;
	
	/**
	*	@method draw
	*	Draws the display object into the specified context ignoring it's visible, alpha, shadow, and transform.
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
	*	@method initialize
	*	Initialization method.
	*
	*/
	//private function initialize ():Dynamic;
	
	/**
	*	@method isVisible
	*	Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	*	This does not account for whether it would be visible within the boundaries of the stage.
	*	NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	*
	*/
	//public function isVisible ():Bool;
	
	/**
	*	@method new
	*	A Bitmap represents an Image, Canvas, or Video in the display list.
	*	@param imageOrUri (Image | HTMLCanvasElement | HTMLVideoElement | String)  
	*
	*/
	public function new (imageOrUri:Dynamic):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	//public function toString ():String;
	
	/**
	*	@method uncache
	*	Because the content of a Bitmap is already in a simple format, cache is unnecessary for Bitmap instances.
	*	You should not cache Bitmap instances as it can degrade performance.
	*
	*/
	//public function uncache ():Dynamic;
	
	/**
	*	@method updateCache
	*	Because the content of a Bitmap is already in a simple format, cache is unnecessary for Bitmap instances.
	*	You should not cache Bitmap instances as it can degrade performance.
	*
	*/
	//public function updateCache ():Dynamic;

}