package ;

@:native ("Bitmap")
extern class Bitmap extends DisplayObject {

	public var DisplayObject_draw:Dynamic;
	public var DisplayObject_initialize:Dynamic;
	public var image:Image | HTMLCanvasElement | HTMLVideoElement;
	public var sourceRect:Rectangle;

	//public function cache ():Dynamic;
	//public function clone ():Bitmap;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function initialize ():Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	//public function uncache ():Dynamic;
	//public function updateCache ():Dynamic;

}