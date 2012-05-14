package ;

@:native ("BitmapAnimation")
extern class BitmapAnimation extends DisplayObject {

	private var _advanceCount:Float;
	private var _animation:Dynamic;
	private var DisplayObject_cloneProps:Dynamic;
	private var DisplayObject_draw:Dynamic;
	private var DisplayObject_initialize:Dynamic;
	public var currentAnimation:String;
	public var currentAnimationFrame:Float;
	public var currentFrame:Float;
	public var offset:Float;
	public var onAnimationEnd:Dynamic;
	public var paused:Bool;
	public var spriteSheet:SpriteSheet;

	//private function _tick ():Dynamic;
	//private function cloneProps (o:Text):Dynamic;
	//private function initialize ():Dynamic;
	//public function cache ():Dynamic;
	//public function clone ():Point;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	//public function uncache ():Dynamic;
	//public function updateCache ():Dynamic;
	private function _goto (frameOrAnimation:Dynamic):Dynamic;
	private function _normalizeCurrentFrame ():Dynamic;
	public function advance ():Dynamic;
	public function gotoAndPlay (frameOrAnimation:Dynamic):Dynamic;
	public function gotoAndStop (frameOrAnimation:Dynamic):Dynamic;
	public function play ():Dynamic;
	public function stop ():Dynamic;

}