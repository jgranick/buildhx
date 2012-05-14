package ;

@:native ("Text")
extern class Text extends DisplayObject {

	private var _workingContext:CanvasRenderingContext2D;
	private var DisplayObject_cloneProps:Dynamic;
	private var DisplayObject_draw:Dynamic;
	private var DisplayObject_initialize:Dynamic;
	public var color:String;
	public var font:String;
	public var lineHeight:Float;
	public var lineWidth:Float;
	public var maxWidth:Float;
	public var outline:Bool;
	public var text:String;
	public var textAlign:String;
	public var textBaseline:String;

	//private function cloneProps (o:Text):Dynamic;
	//private function initialize ():Dynamic;
	//public function clone ():Point;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	private function _drawTextLine (ctx:CanvasRenderingContext2D, text:Text, y:Float):Dynamic;
	private function _getWorkingContext ():Float;
	public function getMeasuredHeight ():Float;
	public function getMeasuredLineHeight ():Float;
	public function getMeasuredWidth ():Float;

}