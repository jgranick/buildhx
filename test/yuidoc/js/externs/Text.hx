package ;

@:native ("Text")
extern class Text extends DisplayObject {

	public var _workingContext:CanvasRenderingContext2D;
	public var color:String;
	public var DisplayObject_cloneProps:Dynamic;
	public var DisplayObject_draw:Dynamic;
	public var DisplayObject_initialize:Dynamic;
	public var font:String;
	public var lineHeight:Float;
	public var lineWidth:Float;
	public var maxWidth:Float;
	public var outline:Bool;
	public var text:String;
	public var textAlign:String;
	public var textBaseline:String;

	//public function clone ():Point;
	//public function cloneProps (o:Text):Dynamic;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function initialize ():Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	public function _drawTextLine (ctx:CanvasRenderingContext2D, text:Text, y:Float):Dynamic;
	public function _getWorkingContext ():Float;
	public function getMeasuredHeight ():Float;
	public function getMeasuredLineHeight ():Float;
	public function getMeasuredWidth ():Float;

}