package ;

@:native ("MouseEvent")
extern class MouseEvent {

	public var nativeEvent:MouseEvent;
	public var stageX:Float;
	public var stageY:Float;
	public var target:DisplayObject;
	public var type:String;

	private function initialize ():Dynamic;
	public function clone ():MouseEvent;
	public function toString ():String;

}