package ;

@:native ("Shape")
extern class Shape extends DisplayObject {

	private var DisplayObject_draw:Dynamic;
	private var DisplayObject_initialize:Dynamic;
	public var graphics:Graphics;

	//public function clone (recursive:Bool):Dynamic;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	private function initialize!~YUIDOC_LINE~!param  graphics ():Dynamic;

}