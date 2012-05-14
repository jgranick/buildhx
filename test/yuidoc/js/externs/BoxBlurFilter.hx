package ;

@:native ("BoxBlurFilter")
extern class BoxBlurFilter {

	public var blurX:Float;
	public var blurY:Float;
	public var quality:Float;

	public function applyFilter (ctx:Void, x:Void, y:Void, width:Void, height:Void, targetCtx:Void, targetX:Void, targetY:Void):Dynamic;
	public function getBounds ():Rectangle;

}