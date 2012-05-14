package ;

@:native ("Shadow")
extern class Shadow {

	public static var identity:Shadow;

	private function initialize (color:String, offsetX:Float, offsetY:Float, blur:Float):Dynamic;
	public function clone ():Shadow;
	public function toString ():String;

}