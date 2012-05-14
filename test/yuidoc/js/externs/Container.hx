package ;

@:native ("Container")
extern class Container extends DisplayObject {

	public var children:Array[DisplayObject];
	public var DisplayObject_draw:Dynamic;
	public var DisplayObject_initialize:Dynamic;

	//public function _tick ():Dynamic;
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	//public function hitTest (x:Void, y:Void):Bool;
	//public function initialize ():Dynamic;
	//public function isVisible ():Bool;
	//public function toString ():String;
	public function _getObjectsUnderPoint (x:Float, y:Float, arr:Array <Dynamic>, mouseEvents:Float):Array[DisplayObject];
	public function addChild (child:DisplayObject):DisplayObject;
	public function addChildAt (child:DisplayObject, index:Float):DisplayObject;
	public function contains (child:DisplayObject):Bool;
	public function getChildAt (index:Float):DisplayObject;
	public function getChildIndex (child:DisplayObject):Float;
	public function getNumChildren ():Float;
	public function getObjectsUnderPoint (x:Float, y:Float):Array[DisplayObject];
	public function getObjectUnderPoint (x:Float, y:Float):DisplayObject;
	public function removeAllChildren ():Dynamic;
	public function removeChild (child:DisplayObject):Bool;
	public function setChildIndex (child:Void, index:Void):Dynamic;
	public function sortChildren (sortFunction:Dynamic):Dynamic;
	public function swapChildren (child1:Void, child2:Void):Dynamic;
	public function swapChildrenAt (index1:Void, index2:Void):Dynamic;

}