package buildhx.data;

/**
 * ...
 * @author Joshua Granick
 */

class ClassMethod {

	
	public var hasConflict:Bool;
	public var ignore:Bool;
	public var name:String;
	public var owner:String;
	public var parameterNames:Array <String>;
	public var parameterOptional:Array <Bool>;
	public var parameterTypes:Array <String>;
	public var returnType:String;
	
	public function new () {
		
		parameterNames = new Array <String> ();
		parameterOptional = new Array <Bool> ();
		parameterTypes = new Array <String> ();
		
	}
	
	
}