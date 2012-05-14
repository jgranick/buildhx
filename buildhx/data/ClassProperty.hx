package buildhx.data;

/**
 * ...
 * @author Joshua Granick
 */

class ClassProperty {

	
	public var hasConflict:Bool;
	public var ignore:Bool;
	public var name:String;
	public var owner:String;
	public var type:String;
	public var accessModifier:String;
	
	
	public function new () {
		accessModifier = "public";
	}
	
	
}