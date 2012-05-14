package ;

@:native ("ColorMatrix")
extern class ColorMatrix {

	public var DELTA_INDEX:Array <Dynamic>;
	public var IDENTITY_MATRIX:Array <Dynamic>;
	public var LENGTH:Float;

	public function _cleanValue ():Dynamic;
	public function _fixMatrix ():Dynamic;
	public function _multiplyMatrix ():Dynamic;
	public function initialize ():Dynamic;
	public function reset ():ColorMatrix;

}