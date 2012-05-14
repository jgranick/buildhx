package ;

@:native ("MouseEvent")
extern class MouseEvent {

	public var nativeEvent:MouseEvent;
	public var stageX:Float;
	public var stageY:Float;
	public var target:DisplayObject;
	public var type:String;

	public function clone ():MouseEvent;
	public function initialize ():Dynamic;
	public function toString ():String;

}