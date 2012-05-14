package ;

@:native ("Touch")
extern class Touch {

	private function _findPrimaryTouch (stage:Stage, touches:Array[Touch]):Dynamic;
	private function _handleTouchEnd (stage:Stage, e:TouchEvent):Dynamic;
	private function _handleTouchMove (stage:Stage, e:TouchEvent):Dynamic;
	private function _handleTouchStart (stage:Stage, e:TouchEvent):Dynamic;
	public static function enable (stage:Stage):Dynamic;
	public static function isSupported ():Bool;

}