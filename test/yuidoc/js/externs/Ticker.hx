package ;

@:native ("Ticker")
extern class Ticker {

	public var _inited:Bool;
	public var _interval:Float;
	public var _lastTime:Float;
	public var _listeners:Array[Object];
	public var _pauseable:Array[Boolean];
	public var _paused:Bool;
	public var _pausedTickers:Float;
	public var _pausedTime:Float;
	public var _rafActive:Bool;
	public var _startTime:Float;
	public var _ticks:Float;
	public var _tickTimes:Array[Number];
	public var _timeoutID:Float;
	public var _times:Array[Number];
	public var animationTarget:Dynamic;
	public var useRAF:Bool;

	public function _getTime ():Dynamic;
	public function _handleAF ():Dynamic;
	public function _handleTimeout ():Dynamic;
	public function _setupTick ():Dynamic;
	public function _tick ():Dynamic;
	public function addListener (o:Dynamic, pauseable:Bool):Dynamic;
	public function getFPS ():Float;
	public function getInterval ():Float;
	public function getMeasuredFPS (ticks:Float):Float;
	public function getPaused ():Bool;
	public function getTicks (pauseable:Bool):Float;
	public function getTime (pauseable:Bool):Float;
	public function init ():Dynamic;
	public function removeAllListeners ():Dynamic;
	public function removeListener (o:Dynamic):Dynamic;
	public function setFPS (value:Float):Dynamic;
	public function setInterval (interval:Float):Dynamic;
	public function setPaused (value:Bool):Dynamic;

}