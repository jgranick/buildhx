package ;

@:native ("Filter")
extern class Filter {

	private function initialize ():Dynamic;
	public function applyFilter (ctx:Void, x:Void, y:Void, width:Void, height:Void, targetCtx:Void, targetX:Void, targetY:Void):Dynamic;
	public function clone ():Filter;
	public function getBounds ():Rectangle;
	public function toString ():String;

}