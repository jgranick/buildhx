package ;



/**
*	Global utility for generating sequential unique ID numbers.
*	The UID class uses a static interface (ex. UID.get()) and should not be instantiated.
*
*/
@:native ("UID")
extern class UID {

	
	private var _nextID:Float;

	
	/**
	*	@method get
	*	Returns the next unique id.
	*
	*/
	public static function get ():Float;

}