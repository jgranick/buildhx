package buildhx.data;

/**
 * ...
 * @author Joshua Granick
 */

class ClassProperty {

	
	public var hasConflict:Bool;
	public var ignore:Bool;
	public var getter:String;
	public var name:String;
	public var nativeName:String;
	public var owner:String;
	public var setter:String;
	public var type:String;
	public var accessModifier:String;
	public var comment:String;
	
	public function new () {
		accessModifier = "public";
		comment = "";
	}
	
	
}