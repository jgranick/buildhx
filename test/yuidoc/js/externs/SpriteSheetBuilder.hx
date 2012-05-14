package ;

@:native ("SpriteSheetBuilder")
extern class SpriteSheetBuilder {

	public var _animations:Array <Dynamic>;
	public var _callback:Dynamic;
	public var _data:Array <Dynamic>;
	public var _frames:Array <Dynamic>;
	public var _index:Float;
	public var _nextFrameIndex:Float;
	public var _timerID:Float;
	public var _timeSlice:Float;
	public var maxHeight:Float;
	public var maxWidth:Float;
	public var spriteSheet:SpriteSheet;

	public function _drawNext ():Void;
	public function _endBuild ():Dynamic;
	public function _fillRow ():Float;
	public function _run ():Dynamic;
	public function _startBuild ():Dynamic;
	public function addFrame (name:String, frames:Array <Dynamic>, next:String, frequency:Float):Dynamic;
	public function addMovieClip (source:MovieClip, sourceRect:Rectangle):Dynamic;
	public function build ():Void;
	public function buildAsync (_callback:Dynamic, timeSlice:Float):Dynamic;
	public function clone ():Dynamic;
	public function initialize ():Dynamic;
	public function stopAsync ():Dynamic;
	public function toString ():String;

}