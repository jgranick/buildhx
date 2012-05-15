package ;



/**
*	Global utility for working with touch enabled devices in EaselJS.
*
*/
@:native ("Touch")
extern class Touch {

	
	/**
	*	@method enable
	*	Enables touch interaction for the specified EaselJS stage. This
	*	currently only supports iOS, and simply maps single touch events
	*	to the existing EaselJS mouse events.
	*	@param stage (Stage)  The stage to enable touch on.
	*
	*/
	public static function enable (stage:Stage):Dynamic;
	
	/**
	*	@method isSupported
	*	Enables touch interaction for the specified EaselJS stage. This
	*	currently only supports iOS, and simply maps single touch events
	*	to the existing EaselJS mouse events.
	*
	*/
	public static function isSupported ():Bool;
	
	private function _findPrimaryTouch (stage:Stage, touches:Array<Touch>):Dynamic;
	
	private function _handleTouchEnd (stage:Stage, e:TouchEvent):Dynamic;
	
	private function _handleTouchMove (stage:Stage, e:TouchEvent):Dynamic;
	
	private function _handleTouchStart (stage:Stage, e:TouchEvent):Dynamic;

}