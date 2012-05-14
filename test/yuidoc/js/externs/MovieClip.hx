package ;

@:native ("MovieClip")
extern class MovieClip extends Container {

	private var _managed:Dynamic;
	private var _prevPos:Float;
	private var _prevPosition:Float;
	private var _synchOffset:Float;
	private var Container__tick:Dynamic;
	private var Container_draw:Dynamic;
	public static var INDEPENDENT:String;
	public static var SINGLE_FRAME:String;
	public static var SYNCHED:String;
	public var actionsEnabled:Bool;
	public var loop:Bool;
	public var mode:String;
	public var paused:Bool;
	public var startPosition:Float;
	public var timeline:Timeline;

	//private function _tick ():Dynamic;
	//private function initialize ():Dynamic;
	//public function clone ():Dynamic;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	private function _addManagedChild ():Dynamic;
	private function _goto ():Dynamic;
	private function _reset ():Dynamic;
	private function _setState ():Dynamic;
	private function _updateTimeline ():Dynamic;
	public function gotoAndPlay (positionOrLabel:Void):Dynamic;
	public function gotoAndStop (positionOrLabel:Void):Dynamic;
	public function play ():Dynamic;
	public function stop ():Dynamic;

}