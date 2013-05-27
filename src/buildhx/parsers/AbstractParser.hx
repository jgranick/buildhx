package buildhx.parsers;


import buildhx.data.ClassDefinition;


/**
 * ...
 * @author Joshua Granick
 */

class AbstractParser {

	
	public function new (types:Map<String, String>, definitions:Map<String, ClassDefinition>) {
		
		
		
	}
	
	
	public function processFiles (files:Array<String>, basePath:String):Void {
		
		
		
	}
	
	
	public function resolveClasses ():Void {
		
		
		
	}
	
	
	public function resolveImport (type:String):Array<String> {

		return [];

	}
	
	
	public function resolveType (type:String, abbreviate:Bool = true):String {
		
		return "";
		
	}
	
	
	public function writeClasses (targetPath:String):Void {
		
		
		
	}
	
	
}