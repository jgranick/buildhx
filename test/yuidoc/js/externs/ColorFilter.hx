package ;

@:native ("ColorFilter")
extern class ColorFilter {

	public var alphaOffset:Float;
	public var blueMultiplier:Float;
	public var blueOffset:Float;
	public var greenMultiplier:Float;
	public var greenOffset:Float;
	public var redMultiplier:Float;
	public var redOffset:Float;

	public function applyFilter (ctx:Void, x:Void, y:Void, width:Void, height:Void, targetCtx:Void, targetX:Void, targetY:Void):Dynamic;
	public function clone ():ColorFilter;
	public function initialize ():Dynamic;
	public function toString ():String;

}