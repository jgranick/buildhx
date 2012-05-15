package ;



/**
*	The Timeline class synchronizes multiple tweens and allows them to be controlled as a group.
*
*/
@:native ("Timeline")
extern class Timeline {

	
	/**
	*	@type Boolean
	*	Causes this timeline to continue playing when a global pause is active.
	*
	*/
	public var ignoreGlobalPause:Bool;
	
	/**
	*	@type Boolean
	*	If true, the timeline will loop when it reaches the end. Can be set via the props param.
	*
	*/
	public var loop:Bool;
	
	/**
	*	@type Number
	*	Read-only property specifying the total duration of this timeline in milliseconds (or ticks if useTicks is true).
	*	This value is usually automatically updated as you modify the timeline. See updateDuration for more information.
	*
	*/
	public var duration:Float;
	
	private var _labels:Array<String>;
	
	private var _paused:Bool;
	
	private var _prevPos:Float;
	
	private var _prevPosition:Float;
	
	private var _tweens:Array<Tween>;
	
	private var _useTicks:Bool;

	
	/**
	*	@method addLabel
	*	Defines labels for use with gotoAndPlay/Stop. Overwrites any previously set labels.
	*	@param o (LabelName:time)  An object defining labels for using gotoAndPlay/Stop in the form  where time is in ms (or ticks if useTicks is true).
	*
	*/
	public function addLabel (o:LabelName:time):Dynamic;
	
	/**
	*	@method addTween
	*	Adds one or more tweens (or timelines) to this timeline. The tweens will be paused (to remove them from the normal ticking system)
	*	and managed by this timeline. Adding a tween to multiple timelines will result in unexpected behaviour.
	*	@param tween (Dynamic)  The tween(s) to add. Accepts multiple arguments.
	*
	*/
	public function addTween (tween:Dynamic):Dynamic;
	
	/**
	*	@method gotoAndPlay
	*	Unpauses this timeline and jumps to the specified position or label.
	*	@param positionOrLabel (Dynamic)  The position in milliseconds (or ticks if useTicks is true) or label to jump to.
	*
	*/
	public function gotoAndPlay (positionOrLabel:Dynamic):Dynamic;
	
	/**
	*	@method gotoAndStop
	*	Pauses this timeline and jumps to the specified position or label.
	*	@param positionOrLabel (Dynamic)  The position in milliseconds (or ticks if useTicks is true) or label to jump to.
	*
	*/
	public function gotoAndStop (positionOrLabel:Dynamic):Dynamic;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method new
	*	The Timeline class synchronizes multiple tweens and allows them to be controlled as a group.
	*	@param tweens (null)  
	*	@param labels (null)  
	*	@param props (Loop:true)  
	*
	*/
	public function new (tweens:Void, labels:Void, props:Loop:true):Void;
	
	/**
	*	@method removeTween
	*	Removes one or more tweens from this timeline.
	*	@param tween (Dynamic)  The tween(s) to remove. Accepts multiple arguments.
	*
	*/
	public function removeTween (tween:Dynamic):Dynamic;
	
	/**
	*	@method setPaused
	*	Pauses or plays this timeline.
	*	@param value (Dynamic)  Indicates whether the tween should be paused (true) or played (false).
	*
	*/
	public function setPaused (value:Dynamic):Dynamic;
	
	/**
	*	@method setPosition
	*	Advances the timeline to the specified position.
	*	@param value (Dynamic)  The position to seek to in milliseconds (or ticks if useTicks is true).
	*	@param actionsMode (Dynamic)  Optional parameter specifying how actions are handled. See Tween.setPosition for more details.
	*
	*/
	public function setPosition (value:Dynamic, actionsMode:Dynamic):Dynamic;
	
	/**
	*	@method tick
	*	Advances this timeline by the specified amount of time in milliseconds (or ticks if useTicks is true).
	*	This is normally called automatically by the Tween engine (via Tween.tick), but is exposed for advanced uses.
	*	@param delta (Dynamic)  The time to advance in milliseconds (or ticks if useTicks is true).
	*
	*/
	public function tick (delta:Dynamic):Dynamic;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;
	
	/**
	*	@method updateDuration
	*	Recalculates the duration of the timeline.
	*	The duration is automatically updated when tweens are added or removed, but this method is useful 
	*	if you modify a tween after it was added to the timeline.
	*
	*/
	public function updateDuration ():Dynamic;
	
	private function _goto ():Dynamic;
	
	private function clone ():Dynamic;

}