package ;

@:native ("Ticker")
extern class Ticker {

	private var _inited:Bool;
	private var _interval:Float;
	private var _lastTime:Float;
	private var _listeners:Array[Object];
	private var _pauseable:Array[Boolean];
	private var _paused:Bool;
	private var _pausedTickers:Float;
	private var _pausedTime:Float;
	private var _rafActive:Bool;
	private var _startTime:Float;
	private var _ticks:Float;
	private var _tickTimes:Array[Number];
	private var _timeoutID:Float;
	private var _times:Array[Number];
	public static var animationTarget:Dynamic;
	public static var useRAF:Bool;

	private function _getTime ():Dynamic;
	private function _handleAF ():Dynamic;
	private function _handleTimeout ():Dynamic;
	private function _setupTick ():Dynamic;
	private function _tick ():Dynamic;
	public static function addListener (o:Dynamic, pauseable:Bool):Dynamic;
	public static function getFPS ():Float;
	public static function getInterval ():Float;
	public static function getMeasuredFPS (ticks:Float):Float;
	public static function getPaused ():Bool;
	public static function getTicks (pauseable:Bool):Float;
	public static function getTime (pauseable:Bool):Float;
	public static function init ():Dynamic;
	public static function removeAllListeners ():Dynamic;
	public static function removeListener (o:Dynamic):Dynamic;
	public static function setFPS (value:Float):Dynamic;
	public static function setInterval (interval:Float):Dynamic;
	public static function setPaused (value:Bool):Dynamic;

}