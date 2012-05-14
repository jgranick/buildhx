package ;

@:native ("SpriteSheetBuilder")
extern class SpriteSheetBuilder {

	private var _animations:Array <Dynamic>;
	private var _callback:Dynamic;
	private var _data:Array <Dynamic>;
	private var _frames:Array <Dynamic>;
	private var _index:Float;
	private var _nextFrameIndex:Float;
	private var _timerID:Float;
	private var _timeSlice:Float;
	public var maxHeight:Float;
	public var maxWidth:Float;
	public var spriteSheet:SpriteSheet;

	private function _drawNext ():Void;
	private function _endBuild ():Dynamic;
	private function _fillRow ():Float;
	private function _run ():Dynamic;
	private function _startBuild ():Dynamic;
	private function initialize ():Dynamic;
	public function addFrame (name:String, frames:Array <Dynamic>, next:String, frequency:Float):Dynamic;
	public function addMovieClip (source:MovieClip, sourceRect:Rectangle):Dynamic;
	public function build ():Void;
	public function buildAsync (_callback:Dynamic, timeSlice:Float):Dynamic;
	public function clone ():Dynamic;
	public function stopAsync ():Dynamic;
	public function toString ():String;

}