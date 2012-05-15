package ;



/**
*	Displays frames or sequences of frames (ie. animations) from a sprite sheet image. A sprite sheet is a series of images
*	(usually animation frames) combined into a single image. For example, an animation
*	consisting of 8 100x100 images could be combined into a 400x200 sprite sheet (4 frames across by 2 high).
*	You can display individual frames, play frames as an animation, and even sequence animations
*	together. See the SpriteSheet class for more information on setting up frames and animations.
*
*/
@:native ("FBBitmapAnimation")
extern class FBBitmapAnimation extends DisplayObject {

	
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
	*	The frame that will be drawn when draw is called. Note that with some SpriteSheet data, this
	*	will advance non-sequentially. READ-ONLY.
	*
	*/
	public var currentFrame:Float;
	
	/**
	*	@type String
	*	Returns the currently playing animation. READ-ONLY.
	*
	*/
	public var currentAnimation:String;

	
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

}