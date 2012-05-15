package createjs.tween;



/**
*	Returns a new Tween instance. See Tween.get for param documentation.
*
*/
@:native ("Tween")
extern class Tween {

	
	/**
	*	@type Boolean
	*	Causes this tween to continue playing when a global pause is active. For example, if TweenJS is using Ticker,
	*	then setting this to true (the default) will cause this tween to be paused when Ticker.setPaused(true) is called.
	*	See Tween.tick() for more info. Can be set via the props param.
	*
	*/
	public var ignoreGlobalPause:Bool;
	
	/**
	*	@type Boolean
	*	If true, the tween will loop when it reaches the end. Can be set via the props param.
	*
	*/
	public var loop:Bool;
	
	/**
	*	@type Number
	*	Constant defining the loop actionsMode for use with setPosition.
	*
	*/
	public static var LOOP:Float;
	
	/**
	*	@type Number
	*	Constant defining the none actionsMode for use with setPosition.
	*
	*/
	public static var NONE:Float;
	
	/**
	*	@type Number
	*	Constant defining the reverse actionsMode for use with setPosition.
	*
	*/
	public static var REVERSE:Float;
	
	/**
	*	@type Number
	*	Normalized position.
	*
	*/
	private var _prevPos:Float;
	
	/**
	*	@type Number
	*	Raw position.
	*
	*/
	private var _prevPosition:Float;
	
	/**
	*	@type Number
	*	Read-only property specifying the total duration of this tween in milliseconds (or ticks if useTicks is true).
	*	This value is automatically updated as you modify the tween.
	*
	*/
	public var duration:Float;
	
	/**
	*	@type Number
	*	The position within the current step.
	*
	*/
	private var _stepPosition:Float;
	
	/**
	*	@type Object
	*	Allows you to specify data that will be used by installed plugins. Each plugin uses this differently, but in general
	*	you specify data by setting it to a property of pluginData with the same name as the plugin class.<br/>
	*	Ex. myTween.pluginData.PluginClassName = data;<br/>
	*	<br/>
	*	Also, most plugins support a property to enable or disable them. This is typically the plugin class name followed by "_enabled".<br/>
	*	Ex. myTween.pluginData.PluginClassName_enabled = false;<br/>
	*	<br/>
	*	Some plugins also store instance data in this object, usually in a property named _PluginClassName.
	*	See the documentation for individual plugins for more details.
	*
	*/
	public var pluginData:Dynamic;
	
	/**
	*	@type Object
	*	Constant returned by plugins to tell the tween not to use default assignment.
	*
	*/
	public static var IGNORE:Dynamic;
	
	private var _actions:Array <Dynamic>;
	
	private var _curQueueProps:Dynamic;
	
	private var _initQueueProps:Dynamic;
	
	private var _paused:Bool;
	
	private var _steps:Array <Dynamic>;
	
	private var _target:Dynamic;
	
	private var _useTicks:Bool;
	
	public static var _listeners:Array<Tween>;
	
	public static var _plugins:Dynamic;

	
	/**
	*	@method _register
	*	Registers or unregisters a tween with the ticking system.
	*
	*/
	private static function _register ():Dynamic;
	
	/**
	*	@method call
	*	Queues an action to call the specified function. For example: myTween.wait(1000).call(myFunction); would call myFunction() after 1s.
	*	@param callback (Dynamic)  The function to call.
	*	@param params (Dynamic)  The parameters to call the function with. If this is omitted, then the function will be called with a single param pointing to this tween.
	*	@param scope (Dynamic)  The scope to call the function in. If omitted, it will be called in the target's scope.
	*
	*/
	public function call (_callback:Dynamic, params:Dynamic, scope:Dynamic):Dynamic;
	
	/**
	*	@method get
	*	Returns a new tween instance. This is functionally identical to using "new Tween(...)", but looks cleaner
	*	with the chained syntax of TweenJS.
	*	@param target (Dynamic)  The target object that will have its properties tweened.
	*	@param props (Loop:true, paused:true)  The configuration properties to apply to this tween instance (ex. ). All properties default to false. Supported props are:<UL>
	*	   <LI> loop: sets the loop property on this tween.</LI>
	*	   <LI> useTicks: uses ticks for all durations instead of milliseconds.</LI>
	*	   <LI> ignoreGlobalPause: sets the ignoreGlobalPause property on this tween.</LI>
	*	   <LI> override: if true, Tween.removeTweens(target) will be called to remove any other tweens with the same target.
	*	   <LI> paused: indicates whether to start the tween paused.</LI>
	*	   <LI> position: indicates the initial position for this timeline</LI>
	*	</UL>
	*
	*/
	public static function get (target:Dynamic, props:Loop:true, paused:true):Dynamic;
	
	/**
	*	@method installPlugin
	*	TODO: doc.
	*	@param plugin (Dynamic)  
	*	@param properties (Dynamic)  
	*
	*/
	public static function installPlugin (plugin:Dynamic, properties:Dynamic):Dynamic;
	
	/**
	*	@method new
	*	Returns a new Tween instance. See Tween.get for param documentation.
	*
	*/
	public function new ():Void;
	
	/**
	*	@method pause
	*	Queues an action to to pause the specified tween.
	*	@param tween (Dynamic)  The tween to play. If null, it pauses this tween.
	*
	*/
	public function pause (tween:Dynamic):Dynamic;
	
	/**
	*	@method play
	*	Queues an action to to play (unpause) the specified tween. This enables you to sequence multiple tweens. Ex. myTween.to({x:100},500).play(otherTween);
	*	@param tween (Dynamic)  The tween to play.
	*
	*/
	public function play (tween:Dynamic):Dynamic;
	
	/**
	*	@method removeTweens
	*	Removes all existing tweens for a target. This is called automatically by new tweens if the "override" prop is true.
	*	@param target (Dynamic)  The target object to remove existing tweens from.
	*
	*/
	public static function removeTweens (target:Dynamic):Dynamic;
	
	/**
	*	@method set
	*	Queues an action to set the specified props on the specified target. If target is null, it will use this tween's target. Ex. myTween.wait(1000).set({visible:false},foo);
	*	@param props (Visible:false)  The properties to set (ex. ).
	*	@param target (Dynamic)  The target to set the properties on. If omitted, they will be set on the tween's target.
	*
	*/
	public function set (props:Visible:false, target:Dynamic):Dynamic;
	
	/**
	*	@method setPaused
	*	Pauses or plays this tween.
	*	@param value (Dynamic)  Indicates whether the tween should be paused (true) or played (false).
	*
	*/
	public function setPaused (value:Dynamic):Dynamic;
	
	/**
	*	@method setPosition
	*	Advances the tween to a specified position.
	*	@param value (Dynamic)  The position to seek to in milliseconds (or ticks if useTicks is true).
	*	@param actionsMode (Dynamic)  Optional parameter specifying how actions are handled (ie. call, set, play, pause): Tween.NONE (0) - run no actions. Tween.LOOP (1) - if new position is less than old, then run all actions between old and duration, then all actions between 0 and new. Defaults to LOOP. Tween.REVERSE (2) - if new position is less than old, run all actions between them in reverse.
	*
	*/
	public function setPosition (value:Dynamic, actionsMode:Dynamic):Dynamic;
	
	/**
	*	@method tick
	*	Advances all tweens. This typically uses the Ticker class (when available), but you can call it manually if you prefer to use
	*	your own "heartbeat" implementation.
	*	@param delta (Dynamic)  The change in time in milliseconds since the last tick. Required unless all tweens have useTicks set to true.
	*	@param paused (Dynamic)  Indicates whether a global pause is in effect. Tweens with ignoreGlobalPause will ignore this, but all others will pause if this is true.
	*
	*/
	public static function tick (delta:Dynamic, paused:Dynamic):Dynamic;
	
	/**
	*	@method tick
	*	Advances this tween by the specified amount of time in milliseconds (or ticks if useTicks is true).
	*	This is normally called automatically by the Tween engine (via Tween.tick), but is exposed for advanced uses.
	*	@param delta (Dynamic)  The time to advance in milliseconds (or ticks if useTicks is true).
	*
	*/
	//public function tick (delta:Dynamic):Dynamic;
	
	/**
	*	@method to
	*	Queues a tween from the current values to the target properties. Set duration to 0 to jump to these value.
	*	Numeric properties will be tweened from their current value in the tween to the target value. Non-numeric
	*	properties will be set at the end of the specified duration.
	*	@param props (X:300)  An object specifying property target values for this tween (Ex.  would tween the x property of the target to 300).
	*	@param duration (Dynamic)  The duration of the wait in milliseconds (or in ticks if useTicks is true).
	*	@param ease (Dynamic)  The easing function to use for this tween.
	*
	*/
	public function to (props:X:300, duration:Dynamic, ease:Dynamic):Dynamic;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;
	
	/**
	*	@method wait
	*	Queues a wait (essentially an empty tween).
	*	@param duration (Dynamic)  The duration of the wait in milliseconds (or in ticks if useTicks is true).
	*
	*/
	public function wait (duration:Dynamic):Dynamic;
	
	private function _addAction ():Dynamic;
	
	private function _addStep ():Dynamic;
	
	private function _appendQueueProps ():Dynamic;
	
	private function _cloneProps ():Dynamic;
	
	private function _runActions ():Dynamic;
	
	private function _set ():Dynamic;
	
	private function _updateTargetProps ():Dynamic;
	
	private function clone ():Dynamic;
	
	private function initialize ():Dynamic;

}