package ;

@:native ("Shadow")
extern class Shadow {

	public var identity:Shadow;

	public function clone ():Shadow;
	public function initialize (color:String, offsetX:Float, offsetY:Float, blur:Float):Dynamic;
	public function toString ():String;

}