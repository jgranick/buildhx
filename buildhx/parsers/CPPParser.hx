package buildhx.parsers;


import buildhx.data.ClassDefinition;
import buildhx.writers.CPPWriter;
import buildhx.writers.HaxeCFFIWriter;


/**
 * ...
 * @author Joshua Granick
 */

class CPPParser extends SimpleParser {
	
	
	public function new (types:Hash <String>, definitions:Hash <ClassDefinition>) {
		
		super (types, definitions);
		
	}
	
	
	public override function writeClasses (targetPath:String):Void {
		
		var cppTargetPath = targetPath + "project/common/";
		
		BuildHX.makeDirectory (targetPath);
		BuildHX.makeDirectory (cppTargetPath);
		
		var haxeWriter = new HaxeCFFIWriter (this);
		var cppWriter = new CPPWriter (this);
		
		for (definition in definitions) {
			
			if (!definition.ignore) {
				
				haxeWriter.writeClass (definition, targetPath);
				
			}
			
		}
		
		cppWriter.writeClasses (definitions, cppTargetPath);
		
	}
	
	
}