package buildhx.parsers;


import buildhx.writers.HaxeExternWriter;
import sys.io.File;
import buildhx.data.ClassDefinition;
import buildhx.data.ClassMethod;
import buildhx.data.ClassProperty;


/**
 * ...
 * @author Joshua Granick
 */

class JSDuckParser extends SimpleParser {
	
	
	private var ignoredFiles:Array <String>;
	
	
	public function new (types:Hash <String>, definitions:Hash <ClassDefinition>) {
		
		super (types, definitions);
		
		if (definitions == null) {
			
			this.definitions = new Hash <ClassDefinition> ();
			
		} else {
			
			this.definitions = definitions;
			
		}
		
		ignoredFiles = [ "globals.json" ];
		
		if (types == null) {
			
			types = new Hash <String> ();
			
		}
		
		types.set ("String", "String");
		types.set ("Number", "Float");
		types.set ("Function", "Dynamic");
		types.set ("Boolean", "Bool");
		types.set ("Object", "Dynamic");
		types.set ("undefined", "Void");
		types.set ("null", "Void");
		types.set ("", "Dynamic");
		types.set ("HTMLElement", "HtmlDom");
		types.set ("Mixed", "Dynamic");
		types.set ("Iterable", "Dynamic");
		types.set ("Array", "Array<Dynamic>");
		types.set ("RegExp", "EReg");
		
		this.types = types;
		
	}
	
	
	private function getClassInfo (data:Dynamic, definition:ClassDefinition):Void {
		
		definition.className = data.name;
		definition.parentClassName = Reflect.field (data, "extends");
		
	}
	
	
	private function getClassMembers (data:Dynamic, definition:ClassDefinition):Void {
		
		if (data.singleton) {
			
			processMethods (cast (data.members.method, Array <Dynamic>), definition.staticMethods);
			processProperties (cast (data.members.property, Array <Dynamic>), definition.staticProperties);
			
		} else {
			
			processMethods (cast (data.members.method, Array <Dynamic>), definition.methods);
			processProperties (cast (data.members.property, Array <Dynamic>), definition.properties);
			processMethods (cast (data.statics.method, Array <Dynamic>), definition.staticMethods);
			processProperties (cast (data.members.property, Array <Dynamic>), definition.staticProperties);
			
			if (Reflect.hasField (data.members, "cfg")) {
				
				var configProperties = cast (data.members.cfg, Array <Dynamic>);
				
				if (configProperties.length > 0 || cast (data.subclasses, Array <Dynamic>).length > 0) {
					
					var configDefinition = new ClassDefinition ();
					configDefinition.isConfigClass = true;
					configDefinition.className = definition.className + "Config";
					
					if (definition.parentClassName != null && definition.parentClassName != "") {
						
						configDefinition.parentClassName = definition.parentClassName + "Config";
						
					}
					
					processProperties (cast (data.members.cfg, Array <Dynamic>), configDefinition.properties);
					definitions.set (configDefinition.className, configDefinition);
					
				}
				
			}
			
		}
		
	}
	
	
	private function processFile (file:String, basePath:String):Void {
		
		BuildHX.print ("Processing " + file);
		
		var content = BuildHX.getFileContent (basePath + file);
		var data = BuildHX.parseJSON (content);
		
		var definition = definitions.get (data.name);
		
		if (definition == null) {
			
			definition = new ClassDefinition ();
			
		}
		
		getClassInfo (data, definition);
		getClassMembers (data, definition);
		
		definitions.set (definition.className, definition);
		
	}
	
	
	public override function processFiles (files:Array <String>, basePath:String):Void {
		
		for (file in files) {
			
			var process = true;
			
			for (ignoredFile in ignoredFiles) {
				
				if (file == ignoredFile) {
					
					process = false;
					
				}
				
			}
			
			if (process) {
				
				processFile (file, basePath);
				
			}
			
		}
		
	}
	
	
	private function processMethods (methodsData:Array <Dynamic>, methods:Hash <ClassMethod>):Void {
		
		for (methodData in methodsData) {
			
			if (methodData.name == "constructor" || methodData.deprecated == null) {
				
				var method = new ClassMethod ();
				
				if (methodData.name == "constructor") {
					
					method.name = "new";
					method.returnType = "Void";
					
				} else {
					
					method.name = methodData.name;
					method.returnType = Reflect.field (methodData, "return").type;
					
				}
				
				method.owner = methodData.owner;
				
				for (param in cast (methodData.params, Array <Dynamic>)) {
					
					method.parameterNames.push (param.name);
					method.parameterOptional.push (param.optional);
					method.parameterTypes.push (param.type);
					
				}
				
				if (!methods.exists (method.name)) {
					
					methods.set (method.name, method);
					
				}
				
			}
			
		}
		
	}
	
	
	private function processProperties (propertiesData:Array <Dynamic>, properties:Hash <ClassProperty>):Void {
		
		for (propertyData in propertiesData) {
			
			if (propertyData.deprecated == null) {
				
				var property = new ClassProperty ();
				property.name = propertyData.name;
				property.owner = propertyData.owner;
				property.type = propertyData.type;
				
				if (!properties.exists (property.name)) {
					
					properties.set (property.name, property);
					
				}
				
			}
			
		}
		
	}
	
	
	private override function resolveClass (definition:ClassDefinition):Void {
		
		BuildHX.addImport (resolveImport (definition.parentClassName), definition);
		
		for (method in definition.methods) {
			
			if (method.owner == definition.className || method.owner.indexOf ("mixin") > -1) {
				
				BuildHX.addImport (resolveImport (method.returnType), definition);
				
				for (paramType in method.parameterTypes) {
					
					BuildHX.addImport (resolveImport (paramType), definition);
					
				}
				
			} else {
				
				method.ignore = true;
				
			}
			
		}
		
		for (property in definition.properties) {
			
			if (property.owner == definition.className || (definition.isConfigClass && property.owner == definition.className.substr (0, definition.className.length - "Config".length)) || property.owner.indexOf ("mixin") > -1) {
				
				BuildHX.addImport (resolveImport (property.type), definition);
				
			} else {
				
				property.ignore = true;
				
			}
			
		}
		
		for (method in definition.staticMethods) {
			
			if (method.owner == definition.className || method.owner.indexOf ("mixin") > -1) {
				
				BuildHX.addImport (resolveImport (method.returnType), definition);
				
				for (paramType in method.parameterTypes) {
					
					BuildHX.addImport (resolveImport (paramType), definition);
					
				}
				
			} else {
				
				method.ignore = true;
				
			}
			
		}
		
		for (property in definition.staticProperties) {
			
			if (property.owner == definition.className || property.owner.indexOf ("mixin") > -1) {
				
				BuildHX.addImport (resolveImport (property.type), definition);
				
			} else {
				
				property.ignore = true;
				
			}
			
		}
		
	}
	
	
	public override function resolveImport (type:String):String {
		
		var type = resolveType (type, false);
		
		if (type.indexOf ("Array <") > -1) {
			
			var indexOfFirstBracket = type.indexOf ("<");
			type = type.substr (indexOfFirstBracket + 1, type.indexOf (">") - indexOfFirstBracket - 1);
			
		}
		
		if (type == "HtmlDom") {
			
			type = "js.Dom";
			
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
		
		var isArray = false;
		
		if (type.substr (-2) == "[]") {
			
			isArray = true;
			type = type.substr (0, type.length - 2);
			
		}
		
		var resolvedType:String = "";
		
		if (type.indexOf ("/") > -1) {
			
			resolvedType = "Dynamic";
			
		} else if (types.exists (type)) {
			
			resolvedType = types.get (type);
			
		} else {
			
			if (abbreviate) {
				
				resolvedType = BuildHX.resolveClassName (type);
				
			} else {
				
				resolvedType = BuildHX.resolvePackageNameDot (type) + BuildHX.resolveClassName (type);
				
			}
			
		}
		
		if (isArray) {
			
			return "Array <" + resolvedType + ">";
			
		} else {
			
			return resolvedType;
			
		}
		
	}
	
	
}