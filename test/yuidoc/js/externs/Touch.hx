package ;

@:native ("Touch")
extern class Touch {

	public function _findPrimaryTouch (stage:Stage, touches:Array[Touch]):Dynamic;
	public function _handleTouchEnd (stage:Stage, e:TouchEvent):Dynamic;
	public function _handleTouchMove (stage:Stage, e:TouchEvent):Dynamic;
	public function _handleTouchStart (stage:Stage, e:TouchEvent):Dynamic;
	public function enable (stage:Stage):Dynamic;
	public function isSupported ():Bool;

}