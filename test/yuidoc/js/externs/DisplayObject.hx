package ;

@:native ("DisplayObject")
extern class DisplayObject {

	public var _cacheDataURL:String;
	public var _cacheDataURLID:Float;
	public var _cacheOffsetX:Float;
	public var _cacheOffsetY:Float;
	public var _hitTestCanvas:HTMLCanvasElement;
	public var _hitTestContext:CanvasRenderingContext2D;
	public var _matrix:Matrix2D;
	public var _nextCacheID:Float;
	public var alpha:Float;
	public var cacheCanvas:HTMLCanvasElement;
	public var cacheID:Float;
	public var compositeOperation:String;
	public var filters:Array[Filter];
	public var hitArea:DisplayObject;
	public var id:Float;
	public var mask:Shape;
	public var mouseEnabled:Bool;
	public var name:String;
	public var parent:DisplayObject;
	public var regX:Float;
	public var regY:Float;
	public var rotation:Float;
	public var scaleX:Float;
	public var scaleY:Float;
	public var shadow:Shadow;
	public var skewX:Float;
	public var skewY:Float;
	public var snapToPixel:Bool;
	public var suppressCrossDomainErrors:Bool;
	public var visible:Bool;
	public var x:Float;
	public var y:Float;

	public function _applyFilters ():Dynamic;
	public function _applyShadow (ctx:CanvasRenderingContext2D, shadow:Shadow):Dynamic;
	public function _testHit (ctx:CanvasRenderingContext2D):Bool;
	public function _tick ():Dynamic;
	public function cache (x:Float, y:Float, width:Float, height:Float):Dynamic;
	public function clone ():DisplayObject;
	public function cloneProps (o:DisplayObject):Dynamic;
	public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	public function getCacheDataURL. ():Dynamic;
	public function getConcatenatedMatrix (mtx:Matrix2D):Matrix2D;
	public function getMatrix (matrix:Matrix2D):Matrix2D;
	public function getStage ():Stage;
	public function globalToLocal (x:Float, y:Float):Point;
	public function hitTest (x:Float, y:Float):Bool;
	public function initialize ():Dynamic;
	public function isVisible ():Bool;
	public function localToGlobal (x:Float, y:Float):Point;
	public function localToLocal (x:Float, y:Float, target:DisplayObject):Point;
	public function setTransform (x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, regX:Float, regY:Float):Dynamic;
	public function setupContext (ctx:CanvasRenderingContext2D):Dynamic;
	public function toString ():String;
	public function uncache ():Dynamic;
	public function updateCache (compositeOperation:String):Dynamic;

}