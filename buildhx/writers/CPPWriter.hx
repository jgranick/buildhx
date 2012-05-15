package buildhx.writers;


import buildhx.data.ClassDefinition;
import buildhx.data.ClassMethod;
import buildhx.data.ClassProperty;
import buildhx.parsers.AbstractParser;
import neko.io.File;


/**
 * ...
 * @author Joshua Granick
 */

class CPPWriter {
	
	
	private var parser:AbstractParser;
	
	
	public function new (parser:AbstractParser) {
		
		this.parser = parser;
		
	}
	
	
	private function formatNativeMethodName (name:String):String {
		
		var formattedName = "";
		
		for (i in 0...name.length) {
			
			var char = name.charAt (i);
			
			if (char.toLowerCase () != char) {
				
				formattedName += "_" + char.toLowerCase ();
				
			} else {
				
				formattedName += char;
				
			}
			
		}
		
		return formattedName;
		
	}
	
	
	private function getNativeMethodGetterName (definition:ClassDefinition, property:ClassProperty):String {
		
		if (property.getter != null || (property.getter == null && property.setter == null)) { 
			
			return BuildHX.libraryName.toLowerCase () + "_" + BuildHX.resolveClassName (definition.className).toLowerCase () + "_get_" + formatNativeMethodName (property.name);
			
		}
		
		return null;
		
	}
	
	
	private function getNativeMethodName (definition:ClassDefinition, method:ClassMethod):String {
		
		return BuildHX.libraryName.toLowerCase () + "_" + BuildHX.resolveClassName (definition.className).toLowerCase () + "_" + formatNativeMethodName (method.name);
		
	}
	
	
	private function getNativeMethodSetterName (definition:ClassDefinition, property:ClassProperty):String {
		
		if (property.setter != null || (property.getter == null && property.setter == null)) { 
			
			return BuildHX.libraryName.toLowerCase () + "_" + BuildHX.resolveClassName (definition.className).toLowerCase () + "_set_" + formatNativeMethodName (property.name);
		
		}
		
		return null;
		
	}
	
	
	public function writeClasses (definitions:Hash <ClassDefinition>, basePath:String):Void {
		
		var targetPath = basePath + "ExternalInterface.cpp";
		
		BuildHX.print ("Writing " + targetPath);
		BuildHX.makeDirectory (targetPath);
		
		var headers = new Array <String> ();
		var methods = new Array <String> ();
		var properties = new Array <String> ();
		var staticMethods = new Array <String> ();
		var staticProperties = new Array <String> ();
		
		for (definition in definitions) {
			
			if (!definition.ignore) {
				
				if (definition.nativeHeader != null) {
					
					headers.push (definition.nativeHeader);
					
				}
				
				for (method in definition.methods) {
					
					if (!method.ignore) {
						
						methods.push (writeClassMethod (method, false, getNativeMethodName (definition, method), definition, definitions));
						
					}
					
				}
				
				for (property in definition.properties) {
					
					if (!property.ignore) {
						
						var nativeGetterName = getNativeMethodGetterName (definition, property);
						var nativeSetterName = getNativeMethodSetterName (definition, property);
						
						if (nativeGetterName != null) {
							
							methods.push (writeClassPropertyGetter (property, false, nativeGetterName, definition));
							
						}
						
						if (nativeSetterName != null) { 
							
							methods.push (writeClassPropertySetter (property, false, nativeSetterName, definitions, definition));
							
						}
						
					}
					
				}
				
			}
			
		}
		
		/*for (method in definition.staticMethods) {
			
			if (!method.ignore) {
				
				methods.push (writeClassMethod (method, true));
				
			}
			
		}
		
		for (property in definition.staticProperties) {
			
			if (!property.ignore) {
				
				properties.push (writeClassProperty (property, true));
				
			}
			
		}*/
		
		headers.sort (BuildHX.alphabeticalSorting);
		methods.sort (BuildHX.alphabeticalSorting);
		properties.sort (BuildHX.alphabeticalSorting);
		staticMethods.sort (BuildHX.alphabeticalSorting);
		staticProperties.sort (BuildHX.alphabeticalSorting);
		
		var output = File.write (targetPath, false);
		
		output.writeString ("#ifndef IPHONE\n");
		output.writeString ("#define IMPLEMENT_API\n");
		output.writeString ("#endif\n\n");
		output.writeString ("#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)\n");
		output.writeString ("#define NEKO_COMPATIBLE\n");
		output.writeString ("#endif\n\n");
		
		output.writeString ("#include <hx/CFFI.h>\n\n");
		
		for (header in headers) {
			
			output.writeString ("#include <" + header + ">\n");
			
		}
		
		if (headers.length > 0) {
			
			output.writeString ("\n\n");
			
		}
		
		/*for (property in staticProperties) {
			
			output.writeString ("	" + property);
			
		}
		
		if (staticProperties.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		for (property in properties) {
			
			output.writeString ("	" + property);
			
		}
		
		if (properties.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		for (method in staticMethods) {
			
			output.writeString ("	" + method);
			
		}
		
		if (staticMethods.length > 0) {
			
			output.writeString ("\n");
			
		}*/
		
		for (method in methods) {
			
			output.writeString (method);
			
		}
		
		if (methods.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		output.writeString ("extern \"C\" int " + BuildHX.libraryName.toLowerCase () + "_register_prims() { return 0; }\n");
		output.close ();
		
	}
	
	
	private function writeClassMethod (method:ClassMethod, isStatic:Bool, methodName:String, definition:ClassDefinition, definitions:Hash <ClassDefinition>):String {
		
		var output = "";
		
		if (method.name != "new" && (method.returnType == null || method.returnType == "Void")) {
			
			output += "void ";
			
		} else {
			
			output += "value ";
			
		}
		
		output += methodName + " (";
		
		if (method.name != "new") {
			
			output += "value handle";
			
		}
		
		for (i in 0...method.parameterNames.length) {
			
			if (i > 0 || method.name != "new") {
				
				output += ", ";
				
			}
			
			output += "value " + method.parameterNames[i];
			
		}
		
		output += ") {\n\n";
		
		if (method.name == "new") {
			
			var nativeType = definition.nativeClassName;
			
			if (nativeType == null) {
				
				nativeType = definition.className;
				
			}
			
			output += "	" + nativeType + " *instance = new " + nativeType + " (";
			
			for (i in 0...method.parameterNames.length) {
				
				if (i > 0) {
					
					output += ", ";
					
				}
				
				output += writeNativeConversion (definitions, method.parameterNames[i], method.parameterTypes[i]);
				
			}
			
			output += ");\n";
			output += "	return alloc_abstract (0, instance);\n";
			output += "\n}\n";
			
			output += "DEFINE_PRIM (" + methodName + ", " + method.parameterNames.length + ")\n\n\n";
			
		} else {
			
			output += "	" + writeHaxeConversion (method.returnType);
			
			var nativeType = method.nativeName;
			
			if (nativeType == null) {
				
				nativeType = method.name;
				
			}
			
			output += writeNativeHandle (definition) + "->" + nativeType + "(";
			
			for (i in 0...method.parameterNames.length) {
				
				if (i > 0) {
					
					output += ", ";
					
				}
				
				output += writeNativeConversion (definitions, method.parameterNames[i], method.parameterTypes[i]);
				
			}
			
			output += ")";
			
			if (method.returnType != null && method.returnType != "Void") {
				
				output += ")";
				
			}
			
			output += ";\n\n}\n";
			output += "DEFINE_PRIM (" + methodName + ", " + (method.parameterNames.length + 1) + ")\n\n\n";
			
		}
		
		return output;
		
	}
	
	
	private function writeClassPropertyGetter (property:ClassProperty, isStatic:Bool, getterName:String, definition:ClassDefinition):String {
		
		var output = "value " + getterName + " (value handle) {\n\n";
		output += "	" + writeHaxeConversion (property.type);
		
		if (property.getter != null) {
			
			output += writeNativeHandle (definition) + "->" + property.getter + "()";
			
		} else {
			
			var nativeType = property.nativeName;
			
			if (nativeType == null) {
				
				nativeType = property.name;
				
			}
			
			output += writeNativeHandle (definition) + "->" + nativeType;
			
		}
		
		output += ");\n\n}\n";
		output += "DEFINE_PRIM (" + getterName + ", 1)\n\n\n";
		
		return output;
		
	}
	
	
	private function writeClassPropertySetter (property:ClassProperty, isStatic:Bool, setterName:String, definitions:Hash <ClassDefinition>, definition:ClassDefinition):String {
		
		var output = "void " + setterName + " (value handle, value newValue) {\n\n";
		
		if (property.setter != null) {
			
			output += "	" + writeNativeHandle (definition) + "->" + property.setter + "(" + writeNativeConversion (definitions, "newValue", property.type) + ");";
			
		} else {
			
			var nativeType = property.nativeName;
			
			if (nativeType == null) {
				
				nativeType = property.name;
				
			}
			
			output += "	" + writeNativeHandle (definition) + "->" + nativeType + " = " + writeNativeConversion (definitions, "newValue", property.type) + ";";
			
		}
		
		output += "\n\n}\n";
		output += "DEFINE_PRIM (" + setterName + ", 2)\n\n\n";
		
		return output;
		
	}
	
	
	private function writeClassProperty (property:ClassProperty, isStatic:Bool):String {
		
		var output = "public ";
		
		if (isStatic) {
			
			output += "static ";
			
		}
		
		output += "var " + property.name + ":" + parser.resolveType (property.type) + ";\n";
		
		if (property.hasConflict) {
			
			return "//" + output;
			
		} else {
			
			return output;
			
		}
		
	}
	
	
	private function writeHaxeConversion (name:String):String {
		
		switch (name) {
			
			case null, "Void":
				
				return "";
			
			case "Bool":
				
				return "return alloc_bool(";
			
			case "Int":
				
				return "return alloc_int(";
			
			case "Float":
				
				return "return alloc_float(";
			
			case "String":
				
				return "return alloc_string(";
			
			default:
				
				return "return alloc_abstract(0, ";
			
		}
		
	}
	
	
	private function writeNativeConversion (definitions:Hash <ClassDefinition>, name:String, type:String, dereference:Bool = true):String {
		
		switch (type) {
			
			case "Bool":
				
				return "val_bool(" + name + ")";
			
			case "Int":
				
				return "val_int(" + name + ")";
			
			case "Float":
				
				return "val_float(" + name + ")";
			
			case "String":
				
				return "val_string(" + name + ")";
			
			default:
				
				var nativeType = type;
				
				if (definitions != null) {
					
					for (definition in definitions) {
						
						if ((definition.className == type || definition.className.substr (definition.className.lastIndexOf (".") + 1) == type) && definition.nativeClassName != null) {
							
							nativeType = definition.nativeClassName;
							
						}
						
					}
					
				}
				
				if (dereference) {
					
					return "*(" + nativeType + "*)val_data(" + name + ")";
					
				} else {
					
					return "((" + nativeType + "*)val_data(" + name + "))";
					
				}
			
		}
		
	}
	
	
	private function writeNativeHandle (definition:ClassDefinition):String {
		
		var nativeType = definition.nativeClassName;
		
		if (nativeType == null) {
			
			nativeType = definition.className;
			
		}
		
		return writeNativeConversion (null, "handle", nativeType, false);
		
	}
	
	
}