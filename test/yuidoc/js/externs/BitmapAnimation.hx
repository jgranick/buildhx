package ;

import js.w3c.html5.Canvas2DContext;



/**
*	Displays frames or sequences of frames (ie. animations) from a sprite sheet image. A sprite sheet is a series of images
*	(usually animation frames) combined into a single image. For example, an animation
*	consisting of 8 100x100 images could be combined into a 400x200 sprite sheet (4 frames across by 2 high).
*	You can display individual frames, play frames as an animation, and even sequence animations
*	together. See the SpriteSheet class for more information on setting up frames and animations.
*
*/
@:native ("BitmapAnimation")
extern class BitmapAnimation extends DisplayObject {

	
	/**
	*	@type Boolean
	*	Prevents the animation from advancing each tick automatically. For example, you could create a sprite
	*	sheet of icons, set paused to true, and display the appropriate icon by setting currentFrame.
	*
	*/
	public var paused:Bool;
	
	/**
	*	@type Function
	*	Specifies a function to call whenever any animation reaches its end. It will be called with two
	*	params: the first will be a reference to this instance, the second will be the name of the animation
	*	that just ended.
	*
	*/
	public var onAnimationEnd:Dynamic;
	
	/**
	*	@type Number
	*	Specifies the current frame index within the current playing animation. When playing normally, this will
	*	increase successively from 0 to n-1, where n is the number of frames in the current animation.
	*
	*/
	public var currentAnimationFrame:Float;
	
	/**
	*	@type Number
	*	The frame that will be drawn when draw is called. Note that with some SpriteSheet data, this
	*	will advance non-sequentially. READ-ONLY.
	*
	*/
	public var currentFrame:Float;
	
	/**
	*	@type Number
	*	When used in conjunction with animations having an frequency greater than 1, this lets you offset which tick the playhead will
	*	advance on. For example, you could create two BitmapAnimations, both playing an animation with a frequency of 2, but one
	*	having offset set to 1. Both instances would advance every second tick, but they would advance on alternating
	*	ticks (effectively, one instance would advance on odd ticks, the other on even ticks).
	*
	*/
	public var offset:Float;
	
	/**
	*	@type SpriteSheet
	*	The SpriteSheet instance to play back. This includes the source image, frame dimensions, and frame
	*	data. See SpriteSheet for more information.
	*
	*/
	public var spriteSheet:SpriteSheet;
	
	/**
	*	@type String
	*	Returns the currently playing animation. READ-ONLY.
	*
	*/
	public var currentAnimation:String;
	
	private var _advanceCount:Float;
	
	private var _animation:Dynamic;
	
	private var DisplayObject_cloneProps:Dynamic;
	
	private var DisplayObject_draw:Dynamic;
	
	private var DisplayObject_initialize:Dynamic;

	
	/**
	*	@method _goto
	*	Moves the playhead to the specified frame number or animation.
	*	@param frameOrAnimation (String|Number)  The frame number or animation that the playhead should move to.
	*
	*/
	private function _goto (frameOrAnimation:Dynamic):Dynamic;
	
	/**
	*	@method _normalizeCurrentFrame
	*	Normalizes the current frame, advancing animations and dispatching callbacks as appropriate.
	*
	*/
	private function _normalizeCurrentFrame ():Dynamic;
	
	/**
	*	@method _tick
	*	Advances the currentFrame if paused is not true. This is called automatically when the Stage ticks.
	*
	*/
	//private function _tick ():Dynamic;
	
	/**
	*	@method advance
	*	Advances the playhead. This occurs automatically each tick by default.
	*
	*/
	public function advance ():Dynamic;
	
	/**
	*	@method cache
	*	Because the content of a Bitmap is already in a simple format, cache is unnecessary for Bitmap instances.
	*	You should not cache Bitmap instances as it can degrade performance.
	*
	*/
	//public function cache ():Dynamic;
	
	/**
	*	@method clone
	*	Returns a clone of the Point instance.
	*
	*/
	//public function clone ():Point;
	
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
	*	@method gotoAndPlay
	*	Sets paused to false and plays the specified animation name, named frame, or frame number.
	*	@param frameOrAnimation (String|Number)  The frame number or animation name that the playhead should move to
	*	and begin playing.
	*
	*/
	public function gotoAndPlay (frameOrAnimation:Dynamic):Dynamic;
	
	/**
	*	@method gotoAndStop
	*	Sets paused to true and seeks to the specified animation name, named frame, or frame number.
	*	@param frameOrAnimation (String|Number)  The frame number or animation name that the playhead should move to
	*	and stop.
	*
	*/
	public function gotoAndStop (frameOrAnimation:Dynamic):Dynamic;
	
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
	*	Displays frames or sequences of frames (ie. animations) from a sprite sheet image. A sprite sheet is a series of images
	*	(usually animation frames) combined into a single image. For example, an animation
	*	consisting of 8 100x100 images could be combined into a 400x200 sprite sheet (4 frames across by 2 high).
	*	You can display individual frames, play frames as an animation, and even sequence animations
	*	together. See the SpriteSheet class for more information on setting up frames and animations.
	*	@param spriteSheet (SpriteSheet)  
	*
	*/
	public function new (spriteSheet:SpriteSheet):Void;
	
	/**
	*	@method play
	*	TODO: Doc.
	*
	*/
	public function play ():Dynamic;
	
	/**
	*	@method stop
	*	TODO: Doc.
	*
	*/
	public function stop ():Dynamic;
	
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
	
	//private function cloneProps (o:Text):Dynamic;

}