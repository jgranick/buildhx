package ;

@:native ("Stage")
extern class Stage extends Container {

	private var _activeMouseEvent:MouseEvent;
	private var _activeMouseTarget:DisplayObject;
	private var _mouseOverIntervalID:Float;
	private var _mouseOverTarget:DisplayObject;
	private var _mouseOverX:Float;
	private var _mouseOverY:Float;
	private var tick:Dynamic;
	public static var _snapToPixelEnabled:Bool;
	public var autoClear:Bool;
	public var canvas:HTMLCanvasElement;
	public var mouseInBounds:Bool;
	public var mouseX:Float;
	public var mouseY:Float;
	public var snapToPixelEnabled:Bool;
	public var tickOnUpdate:Bool;

	//public function toString ():String;
	private function _enableMouseEvents (enabled:Bool):Dynamic;
	private function _handleDoubleClick (e:MouseEvent):Dynamic;
	private function _handleMouseDown (e:MouseEvent):Dynamic;
	private function _handleMouseMove (e:MouseEvent):Dynamic;
	private function _handleMouseUp (e:MouseEvent):Dynamic;
	private function _testMouseOver ():Dynamic;
	private function _updateMousePosition (pageX:Float, pageY:Float):Dynamic;
	private function initialize!~YUIDOC_LINE~!param  canvas A canvas object, or the string id of a canvas object in the current document. ():Dynamic;
	public function clear ():Dynamic;
	public function enableMouseOver (frequency:Float):Dynamic;
	public function toDataURL (backgroundColor:String, mimeType:String):String;
	public function update ():Dynamic;

}