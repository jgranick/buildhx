package ;

@:native ("MovieClip")
extern class MovieClip extends Container {

	public var _managed:Dynamic;
	public var _prevPos:Float;
	public var _prevPosition:Float;
	public var _synchOffset:Float;
	public var actionsEnabled:Bool;
	public var Container__tick:Dynamic;
	public var Container_draw:Dynamic;
	public var INDEPENDENT:String;
	public var loop:Bool;
	public var mode:String;
	public var paused:Bool;
	public var SINGLE_FRAME:String;
	public var startPosition:Float;
	public var SYNCHED:String;
	public var timeline:Timeline;

	//public function _tick ():Dynamic;
	//public function clone ():Dynamic;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function initialize ():Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	public function _addManagedChild ():Dynamic;
	public function _goto ():Dynamic;
	public function _reset ():Dynamic;
	public function _setState ():Dynamic;
	public function _updateTimeline ():Dynamic;
	public function gotoAndPlay (positionOrLabel:Void):Dynamic;
	public function gotoAndStop (positionOrLabel:Void):Dynamic;
	public function play ():Dynamic;
	public function stop ():Dynamic;

}