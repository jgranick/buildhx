package ;

@:native ("BitmapAnimation")
extern class BitmapAnimation extends DisplayObject {

	public var _advanceCount:Float;
	public var _animation:Dynamic;
	public var currentAnimation:String;
	public var currentAnimationFrame:Float;
	public var currentFrame:Float;
	public var DisplayObject_cloneProps:Dynamic;
	public var DisplayObject_draw:Dynamic;
	public var DisplayObject_initialize:Dynamic;
	public var offset:Float;
	public var onAnimationEnd:Dynamic;
	public var paused:Bool;
	public var spriteSheet:SpriteSheet;

	//public function _tick ():Dynamic;
	//public function cache ():Dynamic;
	//public function clone ():Point;
	//public function cloneProps (o:Text):Dynamic;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function initialize ():Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	//public function uncache ():Dynamic;
	//public function updateCache ():Dynamic;
	public function _goto (frameOrAnimation:String|Number):Dynamic;
	public function _normalizeCurrentFrame ():Dynamic;
	public function advance ():Dynamic;
	public function gotoAndPlay (frameOrAnimation:String|Number):Dynamic;
	public function gotoAndStop (frameOrAnimation:String|Number):Dynamic;
	public function play ():Dynamic;
	public function stop ():Dynamic;

}