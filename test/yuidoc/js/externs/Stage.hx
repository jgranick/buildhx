package ;

@:native ("Stage")
extern class Stage extends Container {

	public var _activeMouseEvent:MouseEvent;
	public var _activeMouseTarget:DisplayObject;
	public var _mouseOverIntervalID:Float;
	public var _mouseOverTarget:DisplayObject;
	public var _mouseOverX:Float;
	public var _mouseOverY:Float;
	public var _snapToPixelEnabled:Bool;
	public var autoClear:Bool;
	public var canvas:HTMLCanvasElement;
	public var mouseInBounds:Bool;
	public var mouseX:Float;
	public var mouseY:Float;
	public var snapToPixelEnabled:Bool;
	public var tick:Dynamic;
	public var tickOnUpdate:Bool;

	//public function toString ():String;
	public function _enableMouseEvents (enabled:Bool):Dynamic;
	public function _handleDoubleClick (e:MouseEvent):Dynamic;
	public function _handleMouseDown (e:MouseEvent):Dynamic;
	public function _handleMouseMove (e:MouseEvent):Dynamic;
	public function _handleMouseUp (e:MouseEvent):Dynamic;
	public function _testMouseOver ():Dynamic;
	public function _updateMousePosition (pageX:Float, pageY:Float):Dynamic;
	public function clear ():Dynamic;
	public function enableMouseOver (frequency:Float):Dynamic;
	public function initialize!~YUIDOC_LINE~!param  canvas A canvas object, or the string id of a canvas object in the current document. ():Dynamic;
	public function toDataURL (backgroundColor:String, mimeType:String):String;
	public function update ():Dynamic;

}