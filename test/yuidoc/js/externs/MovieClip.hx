package ;

import js.w3c.html5.Canvas2DContext;



/**
*	The MovieClip class associates a TweenJS Timeline with an EaselJS Container. It allows you to create objects which
*	encapsulate timeline animations, state changes, and synched actions. Due to the complexities inherent in correctly
*	setting up a MovieClip, it is largely intended for tool output and is not included in the main EaselJS library.
*	<br/><br/>
*	Currently MovieClip only works properly if it is tick based (as opposed to time based) though some concessions have
*	been made to support time based timelines in the future.
*
*/
@:native ("MovieClip")
extern class MovieClip extends Container {

	
	/**
	*	@type Boolean
	*	If true, actions in this MovieClip's tweens will be run when the playhead advances.
	*
	*/
	public var actionsEnabled:Bool;
	
	/**
	*	@type Boolean
	*	If true, the MovieClip's position will not advance when ticked.
	*
	*/
	public var paused:Bool;
	
	/**
	*	@type Boolean
	*	Indicates whether this MovieClip should loop when it reaches the end of its timeline.
	*
	*/
	public var loop:Bool;
	
	/**
	*	@type Number
	*	Specifies what the first frame to play in this movieclip, or the only frame to display if mode is SINGLE_FRAME.
	*
	*/
	public var startPosition:Float;
	
	/**
	*	@type Object
	*	List of display objects that are actively being managed by the MovieClip.
	*
	*/
	private var _managed:Dynamic;
	
	/**
	*	@type String
	*	Controls how this MovieClip advances its time. Must be one of 0 (INDEPENDENT), 1 (SINGLE_FRAME), or 2 (SYNCHED).
	*	See each constant for a description of the behaviour.
	*
	*/
	public var mode:String;
	
	/**
	*	@type String
	*	Read-only. The MovieClip will advance independently of its parent, even if its parent is paused.
	*	This is the default mode.
	*
	*/
	public static var INDEPENDENT:String;
	
	/**
	*	@type String
	*	Read-only. The MovieClip will be advanced only when it's parent advances and will be synched to the position of
	*	the parent MovieClip.
	*
	*/
	public static var SYNCHED:String;
	
	/**
	*	@type String
	*	Read-only. The MovieClip will only display a single frame (as determined by the startPosition property).
	*
	*/
	public static var SINGLE_FRAME:String;
	
	/**
	*	@type Timeline
	*	The TweenJS Timeline that is associated with this MovieClip. This is created automatically when the MovieClip
	*	instance is initialized.
	*
	*/
	public var timeline:Timeline;
	
	private var _prevPos:Float;
	
	private var _prevPosition:Float;
	
	private var _synchOffset:Float;
	
	private var Container__tick:Dynamic;
	
	private var Container_draw:Dynamic;

	
	/**
	*	@method _addManagedChild
	*	Adds a child to the timeline, and sets it up as a managed child.
	*
	*/
	private function _addManagedChild ():Dynamic;
	
	/**
	*	@method clone
	*	MovieClip instances cannot be cloned.
	*
	*/
	//public function clone ():Dynamic;
	
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
	*	Advances this movie clip to the specified position or label and sets paused to false.
	*	@param positionOrLabel (Dynamic)  
	*
	*/
	public function gotoAndPlay (positionOrLabel:Dynamic):Dynamic;
	
	/**
	*	@method gotoAndStop
	*	Advances this movie clip to the specified position or label and sets paused to true.
	*	@param positionOrLabel (Dynamic)  
	*
	*/
	public function gotoAndStop (positionOrLabel:Dynamic):Dynamic;
	
	/**
	*	@method initialize
	*	Initialization method called by the constructor.
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
	*	The MovieClip class associates a TweenJS Timeline with an EaselJS Container. It allows you to create objects which
	*	encapsulate timeline animations, state changes, and synched actions. Due to the complexities inherent in correctly
	*	setting up a MovieClip, it is largely intended for tool output and is not included in the main EaselJS library.
	*	<br/><br/>
	*	Currently MovieClip only works properly if it is tick based (as opposed to time based) though some concessions have
	*	been made to support time based timelines in the future.
	*	@param mode (String)  
	*	@param startPosition (Number)  
	*	@param loop (Boolean)  
	*	@param labels (Object)  
	*
	*/
	public function new (mode:String, startPosition:Float, loop:Bool, labels:Dynamic):Void;
	
	/**
	*	@method play
	*	Sets paused to false.
	*
	*/
	public function play ():Dynamic;
	
	/**
	*	@method stop
	*	Sets paused to true.
	*
	*/
	public function stop ():Dynamic;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	//public function toString ():String;
	
	//private function _tick ():Dynamic;
	
	private function _goto ():Dynamic;
	
	private function _reset ():Dynamic;
	
	private function _setState ():Dynamic;
	
	private function _updateTimeline ():Dynamic;

}