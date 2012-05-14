package ;

@:native ("Matrix2D")
extern class Matrix2D {

	//public var identity:Matrix2D;
	public var a:Float;
	public var alpha:Float;
	public var atx:Float;
	public var b:Float;
	public var c:Float;
	public var compositeOperation:String;
	public var d:Float;
	public var DEG_TO_RAD:Float;
	public var shadow:Shadow;
	public var ty:Float;

	public function append (a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix2D;
	public function appendMatrix (matrix:Matrix2D):Matrix2D;
	public function appendProperties (alpha:Float, shadow:Shadow, compositeOperation:String):Matrix2D;
	public function appendTransform (x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, regX:Float, regY:Float):Matrix2D;
	public function clone ():Matrix2D;
	public function decompose (target:Dynamic):Matrix2D;
	public function identity ():Matrix2D;
	public function initialize ():Matrix2D;
	public function invert ():Matrix2D;
	public function isIdentity ():Void;
	public function prepend (a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix2D;
	public function prependMatrix (matrix:Matrix2D):Dynamic;
	public function prependProperties (alpha:Float, shadow:Shadow, compositeOperation:String):Matrix2D;
	public function prependTransform (x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, regX:Float, regY:Float):Matrix2D;
	public function rotate (angle:Float):Matrix2D;
	public function scale (x:Float, y:Float):Matrix2D;
	public function skew (skewX:Float, skewY:Float):Matrix2D;
	public function toString ():String;
	public function translate (x:Float, y:Float):Matrix2D;

}