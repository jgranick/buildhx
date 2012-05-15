package buildhx.data;

/**
 * ...
 * @author Joshua Granick
 */

class ClassDefinition {
	
	public static var CUSTOM_NAMESPACE:String = "";
	public var className:String;
	public var ignore:Bool;
	public var imports:Hash <String>;
	public var interfaces:Hash <String>;
	public var isConfigClass:Bool;
	public var methods:Hash <ClassMethod>;
	public var parentClassName:String;
	public var properties:Hash <ClassProperty>;
	public var staticMethods:Hash <ClassMethod>;
	public var staticProperties:Hash <ClassProperty>;
	public var comment:String;
	
	public function new () {
		
		imports = new Hash <String> ();
		interfaces = new Hash <String> ();
		methods = new Hash <ClassMethod> ();
		properties = new Hash <ClassProperty> ();
		staticMethods = new Hash <ClassMethod> ();
		staticProperties = new Hash <ClassProperty> ();
		comment = "";
	}
	
	
}