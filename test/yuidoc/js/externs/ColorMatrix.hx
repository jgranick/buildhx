package ;

@:native ("ColorMatrix")
extern class ColorMatrix {

	public static var DELTA_INDEX:Array <Dynamic>;
	public static var IDENTITY_MATRIX:Array <Dynamic>;
	public static var LENGTH:Float;

	private function _cleanValue ():Dynamic;
	private function _fixMatrix ():Dynamic;
	private function _multiplyMatrix ():Dynamic;
	private function initialize ():Dynamic;
	public function reset ():ColorMatrix;

}