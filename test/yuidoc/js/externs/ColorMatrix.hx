package ;



/**
*	Provides helper functions for assembling a matrix for use with the ColorMatrixFilter.
*	Can be used directly as the matrix for a ColorMatrixFilter. Most methods return the instance
*	to facilitate chained calls. Ex. myColorMatrix.adjustHue(20).adjustBrightness(50);
*
*/
@:native ("ColorMatrix")
extern class ColorMatrix {

	
	/**
	*	@type Array
	*	Array of delta values for contrast calculations.
	*
	*/
	public static var DELTA_INDEX:Array <Dynamic>;
	
	/**
	*	@type Array
	*	Identity matrix values.
	*
	*/
	public static var IDENTITY_MATRIX:Array <Dynamic>;
	
	/**
	*	@type Number
	*	The constant length of a color matrix.
	*
	*/
	public static var LENGTH:Float;

	
	/**
	*	@method _cleanValue
	*	Make sure values are within the specified range, hue has a limit of 180, brightness is 255, others are 100.
	*
	*/
	private function _cleanValue ():Dynamic;
	
	/**
	*	@method _fixMatrix
	*	Makes sure matrixes are 5x5 (25 long).
	*
	*/
	private function _fixMatrix ():Dynamic;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method new
	*	Provides helper functions for assembling a matrix for use with the ColorMatrixFilter.
	*	Can be used directly as the matrix for a ColorMatrixFilter. Most methods return the instance
	*	to facilitate chained calls. Ex. myColorMatrix.adjustHue(20).adjustBrightness(50);
	*	@param brightness (Number)  
	*	@param contrast (Number)  
	*	@param saturation (Number)  
	*	@param hue (Number)  
	*
	*/
	public function new (brightness:Float, contrast:Float, saturation:Float, hue:Float):Void;
	
	/**
	*	@method reset
	*	Resets the matrix to identity values.
	*
	*/
	public function reset ():ColorMatrix;
	
	private function _multiplyMatrix ():Dynamic;

}