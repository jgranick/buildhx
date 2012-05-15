package ;



/**
*	The Ticker class uses a static interface (ex. Ticker.getPaused()) and should not be instantiated.
*	Provides a centralized tick or heartbeat broadcast at a set interval. Listeners can subscribe
*	to the tick event to be notified when a set time interval has elapsed.
*	Note that the interval that the tick event is called is a target interval, and may be broadcast
*	at a slower interval during times of high CPU load.
*
*/
@:native ("Ticker")
extern class Ticker {

	
	/**
	*	@type Boolean
	*	Indicates whether Ticker should use requestAnimationFrame if it is supported in the browser. If false, Ticker
	*	will use setTimeout. If you change this value, you must call setInterval or setFPS to reinitialize the Ticker.
	*
	*/
	public static var useRAF:Bool;
	
	/**
	*	@type Number
	*	Number of ticks that have passed
	*
	*/
	private var _ticks:Float;
	
	/**
	*	@type Number
	*	Number of ticks that have passed while Ticker has been paused
	*
	*/
	private var _pausedTickers:Float;
	
	/**
	*	@type Object
	*	Specifies the animation target to use with requestAnimationFrame if useRAF is true.
	*
	*/
	public static var animationTarget:Dynamic;
	
	private var _inited:Bool;
	
	private var _interval:Float;
	
	private var _lastTime:Float;
	
	private var _listeners:Array<Object>;
	
	private var _pauseable:Array<Boolean>;
	
	private var _paused:Bool;
	
	private var _pausedTime:Float;
	
	private var _rafActive:Bool;
	
	private var _startTime:Float;
	
	private var _tickTimes:Array<Float>;
	
	private var _timeoutID:Float;
	
	private var _times:Array<Float>;

	
	/**
	*	@method addListener
	*	Adds a listener for the tick event. The listener must be either an object exposing a .tick() method,
	*	or a function. The listener will be called once each tick / interval. The interval is specified via the 
	*	.setInterval(ms) method.
	*	The tick method or function is passed two parameters: the elapsed time between the 
	*	previous tick and the current one, and a boolean indicating whether Ticker is paused.
	*	@param o (Object)  The object or function to add as a listener.
	*	@param pauseable (Boolean)  If false, the listener will continue to have tick called 
	*	even when Ticker is paused via Ticker.pause(). Default is true.
	*
	*/
	public static function addListener (o:Dynamic, pauseable:Bool):Dynamic;
	
	/**
	*	@method getFPS
	*	Returns the target frame rate in frames per second (FPS). For example, with an 
	*	interval of 40, getFPS() will return 25 (1000ms per second divided by 40 ms per tick = 25fps).
	*
	*/
	public static function getFPS ():Float;
	
	/**
	*	@method getInterval
	*	Returns the current target time between ticks, as set with setInterval.
	*
	*/
	public static function getInterval ():Float;
	
	/**
	*	@method getMeasuredFPS
	*	Returns the actual frames / ticks per second.
	*	@param ticks (Number)  Optional. The number of previous ticks over which to measure the actual 
	*	frames / ticks per second. Defaults to the number of ticks per second.
	*
	*/
	public static function getMeasuredFPS (ticks:Float):Float;
	
	/**
	*	@method getPaused
	*	Returns a boolean indicating whether Ticker is currently paused, as set with setPaused.
	*
	*/
	public static function getPaused ():Bool;
	
	/**
	*	@method getTicks
	*	Returns the number of ticks that have been broadcast by Ticker.
	*	@param pauseable (Boolean)  Indicates whether to include ticks that would have been broadcast
	*	while Ticker was paused. If false only tick events broadcast while Ticker is not paused will be returned.
	*	If true, tick events that would have been broadcast while Ticker was paused will be included in the return
	*	value. The default value is false.
	*
	*/
	public static function getTicks (pauseable:Bool):Float;
	
	/**
	*	@method getTime
	*	Returns the number of milliseconds that have elapsed since the first tick event listener was added to
	*	Ticker. For example, you could use this in a time synchronized animation to determine the exact amount of 
	*	time that has elapsed.
	*	@param pauseable (Boolean)  Indicates whether to include time elapsed
	*	while Ticker was paused. If false only time elapsed while Ticker is not paused will be returned.
	*	If true, the value returned will be total time elapsed since the first tick event listener was added.
	*
	*/
	public static function getTime (pauseable:Bool):Float;
	
	/**
	*	@method init
	*	Initializes or resets the timer, clearing all associated listeners and fps measuring data, starting the tick.
	*	This is called automatically when the first listener is added.
	*
	*/
	public static function init ():Dynamic;
	
	/**
	*	@method removeAllListeners
	*	Removes all listeners.
	*
	*/
	public static function removeAllListeners ():Dynamic;
	
	/**
	*	@method removeListener
	*	Removes the specified listener.
	*	@param o (Object)  The object or function to remove from listening from the tick event.
	*
	*/
	public static function removeListener (o:Dynamic):Dynamic;
	
	/**
	*	@method setFPS
	*	Sets the target frame rate in frames per second (FPS). For example, with an interval of 40, getFPS() will 
	*	return 25 (1000ms per second divided by 40 ms per tick = 25fps).
	*	@param value (Number)  Target number of ticks broadcast per second.
	*
	*/
	public static function setFPS (value:Float):Dynamic;
	
	/**
	*	@method setInterval
	*	Sets the target time (in milliseconds) between ticks. Default is 50 (20 FPS).
	*	Note actual time between ticks may be more than requested depending on CPU load.
	*	@param interval (Number)  Time in milliseconds between ticks. Default value is 50.
	*
	*/
	public static function setInterval (interval:Float):Dynamic;
	
	/**
	*	@method setPaused
	*	While Ticker is paused, pausable listeners are not ticked. See addListener for more information.
	*	@param value (Boolean)  Indicates whether to pause (true) or unpause (false) Ticker.
	*
	*/
	public static function setPaused (value:Bool):Dynamic;
	
	private function _getTime ():Dynamic;
	
	private function _handleAF ():Dynamic;
	
	private function _handleTimeout ():Dynamic;
	
	private function _setupTick ():Dynamic;
	
	private function _tick ():Dynamic;

}