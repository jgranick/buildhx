package ;



/**
*	Represents an affine transformation matrix, and provides tools for constructing and concatenating matrixes.
*
*/
@:native ("Matrix2D")
extern class Matrix2D {

	
	/**
	*	@type Matrix2D
	*	An identity matrix, representing a null transformation. Read-only.
	*
	*/
	public static var identity:Matrix2D;
	
	/**
	*	@type Number
	*	Multiplier for converting degrees to radians. Used internally by Matrix2D. Read-only.
	*
	*/
	public static var DEG_TO_RAD:Float;
	
	/**
	*	@type Number
	*	Position (0, 0) in a 3x3 affine transformation matrix.
	*
	*/
	public var a:Float;
	
	/**
	*	@type Number
	*	Position (0, 1) in a 3x3 affine transformation matrix.
	*
	*/
	public var b:Float;
	
	/**
	*	@type Number
	*	Position (1, 0) in a 3x3 affine transformation matrix.
	*
	*/
	public var c:Float;
	
	/**
	*	@type Number
	*	Position (1, 1) in a 3x3 affine transformation matrix.
	*
	*/
	public var d:Float;
	
	/**
	*	@type Number
	*	Position (2, 0) in a 3x3 affine transformation matrix.
	*
	*/
	public var atx:Float;
	
	/**
	*	@type Number
	*	Position (2, 1) in a 3x3 affine transformation matrix.
	*
	*/
	public var ty:Float;
	
	/**
	*	@type Number
	*	Property representing the alpha that will be applied to a display object. This is not part of matrix
	*	operations, but is used for operations like getConcatenatedMatrix to provide concatenated alpha values.
	*
	*/
	public var alpha:Float;
	
	/**
	*	@type Shadow
	*	Property representing the shadow that will be applied to a display object. This is not part of matrix
	*	operations, but is used for operations like getConcatenatedMatrix to provide concatenated shadow values.
	*
	*/
	public var shadow:Shadow;
	
	/**
	*	@type String
	*	Property representing the compositeOperation that will be applied to a display object. This is not part of
	*	matrix operations, but is used for operations like getConcatenatedMatrix to provide concatenated
	*	compositeOperation values. You can find a list of valid composite operations at:
	*	<a href="https://developer.mozilla.org/en/Canvas_tutorial/Compositing">https://developer.mozilla.org/en/Canvas_tutorial/Compositing</a>
	*
	*/
	public var compositeOperation:String;

	
	/**
	*	@method append
	*	Appends the specified matrix properties with this matrix. All parameters are required.
	*	@param a (Number)  
	*	@param b (Number)  
	*	@param c (Number)  
	*	@param d (Number)  
	*	@param tx (Number)  
	*	@param ty (Number)  
	*
	*/
	public function append (a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix2D;
	
	/**
	*	@method appendMatrix
	*	Appends the specified matrix with this matrix.
	*	@param matrix (Matrix2D)  
	*
	*/
	public function appendMatrix (matrix:Matrix2D):Matrix2D;
	
	/**
	*	@method appendProperties
	*	Appends the specified visual properties to the current matrix.
	*	@param alpha (Number)  desired alpha value
	*	@param shadow (Shadow)  desired shadow value
	*	@param compositeOperation (String)  desired composite operation value
	*
	*/
	public function appendProperties (alpha:Float, shadow:Shadow, compositeOperation:String):Matrix2D;
	
	/**
	*	@method appendTransform
	*	Generates matrix properties from the specified display object transform properties, and appends them with this matrix.
	*	For example, you can use this to generate a matrix from a display object: var mtx = new Matrix2D();
	*	mtx.appendTransform(o.x, o.y, o.scaleX, o.scaleY, o.rotation);
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param scaleX (Number)  
	*	@param scaleY (Number)  
	*	@param rotation (Number)  
	*	@param skewX (Number)  
	*	@param skewY (Number)  
	*	@param regX (Number)  Optional.
	*	@param regY (Number)  Optional.
	*
	*/
	public function appendTransform (x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, regX:Float, regY:Float):Matrix2D;
	
	/**
	*	@method clone
	*	Returns a clone of the Matrix2D instance.
	*
	*/
	public function clone ():Matrix2D;
	
	/**
	*	@method decompose
	*	Decomposes the matrix into transform properties (x, y, scaleX, scaleY, and rotation). Note that this these values
	*	may not match the transform properties you used to generate the matrix, though they will produce the same visual
	*	results.
	*	@param target (Object)  The object to apply the transform properties to. If null, then a new object will be returned.
	*
	*/
	public function decompose (target:Dynamic):Matrix2D;
	
	/**
	*	@method identity
	*	Sets the properties of the matrix to those of an identity matrix (one that applies a null transformation).
	*
	*/
	//public function identity ():Matrix2D;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Matrix2D;
	
	/**
	*	@method invert
	*	Inverts the matrix, causing it to perform the opposite transformation.
	*
	*/
	public function invert ():Matrix2D;
	
	/**
	*	@method isIdentity
	*	Returns true if the matrix is an identity matrix.
	*
	*/
	public function isIdentity ():Dynamic;
	
	/**
	*	@method new
	*	Represents an affine transformation matrix, and provides tools for constructing and concatenating matrixes.
	*	@param a (Number)  
	*	@param b (Number)  
	*	@param c (Number)  
	*	@param d (Number)  
	*	@param tx (Number)  
	*	@param ty (Number)  
	*
	*/
	public function new (a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	
	/**
	*	@method prepend
	*	Concatenates the specified matrix properties with this matrix. All parameters are required.
	*	@param a (Number)  
	*	@param b (Number)  
	*	@param c (Number)  
	*	@param d (Number)  
	*	@param tx (Number)  
	*	@param ty (Number)  
	*
	*/
	public function prepend (a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix2D;
	
	/**
	*	@method prependMatrix
	*	Prepends the specified matrix with this matrix.
	*	@param matrix (Matrix2D)  
	*
	*/
	public function prependMatrix (matrix:Matrix2D):Dynamic;
	
	/**
	*	@method prependProperties
	*	Prepends the specified visual properties to the current matrix.
	*	@param alpha (Number)  desired alpha value
	*	@param shadow (Shadow)  desired shadow value
	*	@param compositeOperation (String)  desired composite operation value
	*
	*/
	public function prependProperties (alpha:Float, shadow:Shadow, compositeOperation:String):Matrix2D;
	
	/**
	*	@method prependTransform
	*	Generates matrix properties from the specified display object transform properties, and prepends them with this matrix.
	*	For example, you can use this to generate a matrix from a display object: var mtx = new Matrix2D();
	*	mtx.prependTransform(o.x, o.y, o.scaleX, o.scaleY, o.rotation);
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param scaleX (Number)  
	*	@param scaleY (Number)  
	*	@param rotation (Number)  
	*	@param skewX (Number)  
	*	@param skewY (Number)  
	*	@param regX (Number)  Optional.
	*	@param regY (Number)  Optional.
	*
	*/
	public function prependTransform (x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, regX:Float, regY:Float):Matrix2D;
	
	/**
	*	@method rotate
	*	Applies a rotation transformation to the matrix.
	*	@param angle (Number)  The angle in degrees.
	*
	*/
	public function rotate (angle:Float):Matrix2D;
	
	/**
	*	@method scale
	*	Applies a scale transformation to the matrix.
	*	@param x (Number)  
	*	@param y (Number)  
	*
	*/
	public function scale (x:Float, y:Float):Matrix2D;
	
	/**
	*	@method skew
	*	Applies a skew transformation to the matrix.
	*	@param skewX (Number)  The amount to skew horizontally in degrees.
	*	@param skewY (Number)  The amount to skew vertically in degrees.
	*
	*/
	public function skew (skewX:Float, skewY:Float):Matrix2D;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;
	
	/**
	*	@method translate
	*	Translates the matrix on the x and y axes.
	*	@param x (Number)  
	*	@param y (Number)  
	*
	*/
	public function translate (x:Float, y:Float):Matrix2D;

}