package buildhx.parsers;


import buildhx.data.ClassDefinition;
import buildhx.writers.HaxeExternWriter;


/**
 * ...
 * @author Joshua Granick
 */

class SimpleParser extends AbstractParser {
	
	
	private var definitions:Hash <ClassDefinition>;
	private var types:Hash <String>;
	
	
	public function new (types:Hash <String>, definitions:Hash <ClassDefinition>) {
		
		super (types, definitions);
		
		this.types = types;
		this.definitions = definitions;
		
	}
	
	
	private function getParentDefinition (definition:ClassDefinition):ClassDefinition {
		
		if (definition != null && definition.parentClassName != null && definitions.exists (definition.parentClassName)) {
			
			var parentDefinition = definitions.get (definition.parentClassName);
			
			if (parentDefinition != definition) {
				
				return parentDefinition;
				
			}
			
		}
		
		return null;
		
	}
	
	
	private function resolveClass (definition:ClassDefinition):Void {
		
		BuildHX.addImport (resolveImport (definition.parentClassName), definition);
		
		for (method in definition.methods) {
			
			if (method.owner == definition.className) {
				
				BuildHX.addImport (resolveImport (method.returnType), definition);
				
				for (paramType in method.parameterTypes) {
					
					BuildHX.addImport (resolveImport (paramType), definition);
					
				}
				
			} else {
				
				method.ignore = true;
				
			}
			
		}
		
		for (property in definition.properties) {
			
			if (property.owner == definition.className) {
				
				BuildHX.addImport (resolveImport (property.type), definition);
				
			} else {
				
				property.ignore = true;
				
			}
			
		}
		
		for (method in definition.staticMethods) {
			
			if (method.owner == definition.className) {
				
				BuildHX.addImport (resolveImport (method.returnType), definition);
				
				for (paramType in method.parameterTypes) {
					
					BuildHX.addImport (resolveImport (paramType), definition);
					
				}
				
			} else {
				
				method.ignore = true;
				
			}
			
		}
		
		for (property in definition.staticProperties) {
			
			if (property.owner == definition.className) {
				
				BuildHX.addImport (resolveImport (property.type), definition);
				
			} else {
				
				property.ignore = true;
				
			}
			
		}
		
	}
	
	
	public override function resolveClasses ():Void {
		trace("resolveClasses...");
		for (definition in definitions) {
			trace("resolved..");
			BuildHX.print ("Resolving " + definition.className);
			
			resolveClass (definition);
			resolveConflicts (definition);
			
		}
		
	}
	
	
	private function resolveConflicts (definition:ClassDefinition):Void {
		
		for (method in definition.staticMethods) {
			
			if (BuildHX.isRestrictedName (method.name)) {
				
				method.hasConflict = true;
				
			} else {
				
				for (i in 0...method.parameterNames.length) {
					
					var paramName = method.parameterNames[i];
					
					if (BuildHX.isRestrictedName (paramName)) {
						
						method.parameterNames[i] = "_" + paramName;
						
					}
					
				}
				
			}
			
		}
		
		for (property in definition.staticProperties) {
			
			if (BuildHX.isRestrictedName (property.name) || definition.staticMethods.exists (property.name)) {
				
				property.hasConflict = true;
				
			}
			
		}
		
		for (method in definition.methods) {
			
			if (method.name != "new" && BuildHX.isRestrictedName (method.name)) {
				
				method.hasConflict = true;
				
			} else {
				
				for (i in 0...method.parameterNames.length) {
					
					var paramName = method.parameterNames[i];
					
					if (BuildHX.isRestrictedName (paramName)) {
						
						method.parameterNames[i] = "_" + paramName;
						
					}
					
				}
				
			}
			
			if (definition.staticMethods.exists (method.name) || definition.staticProperties.exists (method.name)) {
				
				method.hasConflict = true;
				
			} else {
				
				var parentClass = getParentDefinition (definition);
				
				while (parentClass != null) {
					
					if (method.name != "new" && parentClass.methods.exists (method.name)) {
						
						method.hasConflict = true;
						
					}
					
					parentClass = getParentDefinition (parentClass);
					
				}
				
			}
			
		}
		
		for (property in definition.properties) {
			
			if (BuildHX.isRestrictedName (property.name)) {
				
				property.hasConflict = true;
				
			}
			
			if (definition.staticMethods.exists (property.name) || definition.staticProperties.exists (property.name) || definition.methods.exists (property.name)) {
				
				property.hasConflict = true;
				
			} else {
				
				var parentClass = getParentDefinition (definition);
				
				while (parentClass != null) {
					
					if (parentClass.properties.exists (property.name)) {
						
						//property.hasConflict = true;
						property.ignore = true;
						
					}
					
					parentClass = getParentDefinition (parentClass);
					
				}
				
			}
			
		}
		
	}
	
	
	public override function resolveImport (type:String):String {
		
		var type = resolveType (type, false);
		
		if (type.indexOf ("Array <") > -1) {
			
			var indexOfFirstBracket = type.indexOf ("<");
			type = type.substr (indexOfFirstBracket + 1, type.indexOf (">") - indexOfFirstBracket - 1);
			
		}
		
		if (type.indexOf (".") == -1) {
			
			return null;
			
		} else {
			
			return type;
			
		}
		
	}
	
	
	public override function resolveType (type:String, abbreviate:Bool = true):String {
		
		if (type == null) {
			
			return "Void";
			
		}
		
		var resolvedType:String = "";
		
		if (types.exists (type)) {
			
			resolvedType = types.get (type);
			
		} else {
			
			if (abbreviate) {
				
				resolvedType = BuildHX.resolveClassName (type);
				
			} else {
				
				resolvedType = BuildHX.resolvePackageNameDot (type) + BuildHX.resolveClassName (type);
				
			}
			
		}
		
		return resolvedType;
		
	}
	
	
	public override function writeClasses (targetPath:String):Void {
		
		BuildHX.makeDirectory (targetPath);
		var writer = new HaxeExternWriter (this);
		
		for (definition in definitions) {
			
			if (!definition.ignore) {
				
				if (definition.isConfigClass) {
					
					writer.writeConfigClass (definition, targetPath);
					
				} else {
					
					writer.writeClass (definition, targetPath);
					
				}
				
			}
			
		}
		
	}
	
	
}