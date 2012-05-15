package ;



/**
*	The SpriteSheetBuilder allows you to generate sprite sheets at run time from any display object. This can allow
*	you to maintain your assets as vector graphics (for low file size), and render them at run time as sprite sheets
*	for better performance.
*	<br/><br/>
*	Sprite sheets can be built either synchronously, or asynchronously, so that large sprite sheets can be generated
*	without locking the UI.
*	<br/><br/>
*	Note that the "images" used in the generated sprite sheet are actually canvas elements, and that they will be sized
*	to the nearest power of 2 up to the value of maxWidth or maxHeight.
*
*/
@:native ("SpriteSheetBuilder")
extern class SpriteSheetBuilder {

	
	/**
	*	@type Number
	*	The maximum height for the images (not individual frames) in the generated sprite sheet. It is recommended to use
	*	a power of 2 for this value (ex. 1024, 2048, 4096). If the frames cannot all fit within the max dimensions, then
	*	additional images will be created as needed.
	*
	*/
	public var maxHeight:Float;
	
	/**
	*	@type Number
	*	The maximum width for the images (not individual frames) in the generated sprite sheet. It is recommended to use
	*	a power of 2 for this value (ex. 1024, 2048, 4096). If the frames cannot all fit within the max dimensions, then
	*	additional images will be created as needed.
	*
	*/
	public var maxWidth:Float;
	
	/**
	*	@type SpriteSheet
	*	The sprite sheet that was generated. This will be null before a build is completed successfully.
	*
	*/
	public var spriteSheet:SpriteSheet;
	
	private var _animations:Array <Dynamic>;
	
	private var _callback:Dynamic;
	
	private var _data:Array <Dynamic>;
	
	private var _frames:Array <Dynamic>;
	
	private var _index:Float;
	
	private var _nextFrameIndex:Float;
	
	private var _timerID:Float;
	
	private var _timeSlice:Float;

	
	/**
	*	@method addFrame
	*	Adds an animation that will be included in the created sprite sheet.
	*	@param name (String)  The name for the animation.
	*	@param frames (Array)  An array of frame indexes that comprise the animation. Ex. [3,6,5] would describe an animation
	*	that played frame indexes 3, 6, and 5 in that order.
	*	@param next (String)  Optional. Specifies the name of the animation to continue to after this animation ends. You can
	*	also pass false to have the animation stop when it ends. By default it will loop to the start of the same animation.
	*	@param frequency (Number)  Optional. Specifies a frame advance frequency for this animation. For example, a value
	*	of 2 would cause the animation to advance every second tick.
	*
	*/
	public function addFrame (name:String, frames:Array <Dynamic>, next:String, frequency:Float):Dynamic;
	
	/**
	*	@method addMovieClip
	*	This will take a MovieClip, and add its frames and labels to this builder. Labels will be added as an animation
	*	running from the label index to the next label. For example, if there is a label named "foo" at frame 0 and a label
	*	named "bar" at frame 10, in a MovieClip with 15 frames, it will add an animation named "foo" that runs from frame
	*	index 0 to 9, and an animation named "bar" that runs from frame index 10 to 14.
	*	<br/><br/>
	*	Note that this will iterate through the full MovieClip with actionsEnabled set to false, ending on the last frame.
	*	@param source (MovieClip)  The source MovieClip to add to the sprite sheet.
	*	@param sourceRect (Rectangle)  Optional. A rectangle defining the portion of the source to draw to the frame. If
	*	not specified, it will look for a getBounds method, frameBounds array, bounds property, or nominalBounds property
	*	on the source to use. If one is not found, the MovieClip will be skipped.
	*
	*/
	public function addMovieClip (source:MovieClip, sourceRect:Rectangle):Dynamic;
	
	/**
	*	@method build
	*	Builds a SpriteSheet instance based on the current frames.
	*
	*/
	public function build ():Dynamic;
	
	/**
	*	@method buildAsync
	*	Asynchronously builds a SpriteSheet instance based on the current frames. It will run 20 times per second, using
	*	an amount of time defined by timeSlice. When it is complete it will call the specified callback.
	*	@param callback (Function)  Optional. The function to call when the build operation completes. It will be called
	*	with a single parameter providing a reference back to the builder.
	*	@param timeSlice (Number)  Optional. A number from 0.01 to 1 that indicates what percentage of time the builder can use. This can be
	*	thought of as the number of seconds per second the builder will use. For example, with a timeSlice value of 0.3,
	*	the builder will run 20 times per second, using approximately 15ms per build (30% of available time, or 0.3s per second).
	*	Defaults to 0.3.
	*
	*/
	public function buildAsync (_callback:Dynamic, timeSlice:Float):Dynamic;
	
	/**
	*	@method clone
	*	SpriteSheetBuilder instances cannot be cloned.
	*
	*/
	public function clone ():Dynamic;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method new
	*	The SpriteSheetBuilder allows you to generate sprite sheets at run time from any display object. This can allow
	*	you to maintain your assets as vector graphics (for low file size), and render them at run time as sprite sheets
	*	for better performance.
	*	<br/><br/>
	*	Sprite sheets can be built either synchronously, or asynchronously, so that large sprite sheets can be generated
	*	without locking the UI.
	*	<br/><br/>
	*	Note that the "images" used in the generated sprite sheet are actually canvas elements, and that they will be sized
	*	to the nearest power of 2 up to the value of maxWidth or maxHeight.
	*
	*/
	public function new ():Void;
	
	/**
	*	@method stopAsync
	*	Stops the current asynchronous build.
	*
	*/
	public function stopAsync ():Dynamic;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;
	
	private function _drawNext ():Dynamic;
	
	private function _endBuild ():Dynamic;
	
	private function _fillRow ():Float;
	
	private function _run ():Dynamic;
	
	private function _startBuild ():Dynamic;

}