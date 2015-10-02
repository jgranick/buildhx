package buildhx.writers;


import buildhx.data.ClassDefinition;
import buildhx.data.ClassMethod;
import buildhx.data.ClassProperty;
import buildhx.parsers.AbstractParser;
import sys.io.File;


/**
 * ...
 * @author Joshua Granick
 */

class HaxeCFFIWriter {
	
	
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
	
	
	private function getClassPropertyGetterName (property:ClassProperty):String {
		
		if (property.getter != null || (property.getter == null && property.setter == null)) { 
			
			return "get_" + property.name;
			
		}
		
		return "null";
		
	}
	
	
	private function getClassPropertySetterName (property:ClassProperty):String {
		
		if (property.setter != null || (property.getter == null && property.setter == null)) { 
			
			return "set_" + property.name;
			
		}
		
		return "null";
		
	}
	
	
	private function getNativeMethodGetterName (definition:ClassDefinition, property:ClassProperty):String {
		
		return BuildHX.libraryName.toLowerCase () + "_" + BuildHX.resolveClassName (definition.className).toLowerCase () + "_get_" + formatNativeMethodName (property.name);
		
	}
	
	
	private function getNativeMethodName (definition:ClassDefinition, method:ClassMethod):String {
		
		return BuildHX.libraryName.toLowerCase () + "_" + BuildHX.resolveClassName (definition.className).toLowerCase () + "_" + formatNativeMethodName (method.name);
		
	}
	
	
	private function getNativeMethodSetterName (definition:ClassDefinition, property:ClassProperty):String {
		
		return BuildHX.libraryName.toLowerCase () + "_" + BuildHX.resolveClassName (definition.className).toLowerCase () + "_set_" + formatNativeMethodName (property.name);
		
	}
	
	
	public function writeClass (definition:ClassDefinition, basePath:String):Void {
		
		var targetPath = basePath + BuildHX.resolvePackageNameDot (definition.className).split (".").join ("/") + BuildHX.resolveClassName (definition.className) + ".hx";
		
		BuildHX.print ("Writing " + targetPath);
		BuildHX.makeDirectory (targetPath);
		
		var constructor:String = "";
		var getters = new Array<String> ();
		var imports = new Array<String> ();
		var methods = new Array<String> ();
		var nativeMethodNames = new Array<String> ();
		var nativeMethodParameters = new Array<Int> ();
		var nativeMethods = new Array<String> ();
		var properties = new Array<String> ();
		var setters = new Array<String> ();
		var staticMethods = new Array<String> ();
		var staticProperties = new Array<String> ();
		
		for (importPath in definition.imports) {
			
			imports.push (importPath);
			
		}
		
		for (method in definition.methods) {
			
			if (!method.ignore) {
				
				var nativeMethodName = getNativeMethodName (definition, method);
				nativeMethodNames.push (nativeMethodName);
				
				if (method.name == "new") {
					
					nativeMethodParameters.push (method.parameterNames.length);
					constructor = writeClassMethod (method, false, nativeMethodName);
					
				} else {
					
					nativeMethodParameters.push (method.parameterNames.length + 1);
					methods.push (writeClassMethod (method, false, nativeMethodName));
					
				}
				
			}
			
		}
		
		for (property in definition.properties) {
			
			if (!property.ignore) {
				
				var getterName = getClassPropertyGetterName (property);
				var setterName = getClassPropertySetterName (property);
				
				properties.push (writeClassProperty (property, false, getterName, setterName));
				
				if (getterName != "null") {
					
					var nativeGetterName = getNativeMethodGetterName (definition, property);
					nativeMethodNames.push (nativeGetterName);
					nativeMethodParameters.push (1);
					
					getters.push (writeClassPropertyGetter (property, false, getterName, nativeGetterName));
					
				}
				
				if (setterName != "null") { 
					
					var nativeSetterName = getNativeMethodSetterName (definition, property);
					nativeMethodNames.push (nativeSetterName);
					nativeMethodParameters.push (2);
					
					setters.push (writeClassPropertySetter (property, false, setterName, nativeSetterName));
					
				}
				
			}
			
		}
		
		/*for (method in definition.staticMethods) {
			
			if (!method.ignore) {
				
				methods.push (writeClassMethod (method, true));
				
			}
			
		}*/
		
		/*for (property in definition.staticProperties) {
			
			if (!property.ignore) {
				
				properties.push (writeClassProperty (property, true));
				
			}
			
		}*/
		
		for (i in 0...nativeMethodNames.length) {
			
			nativeMethods.push (writeNativeMethod (nativeMethodNames[i], nativeMethodParameters[i]));
			
		}
		
		getters.sort (BuildHX.alphabeticalSorting);
		imports.sort (BuildHX.alphabeticalSorting);
		methods.sort (BuildHX.alphabeticalSorting);
		nativeMethods.sort (BuildHX.alphabeticalSorting);
		properties.sort (BuildHX.alphabeticalSorting);
		setters.sort (BuildHX.alphabeticalSorting);
		staticMethods.sort (BuildHX.alphabeticalSorting);
		staticProperties.sort (BuildHX.alphabeticalSorting);
		
		var output = File.write (targetPath, false);
		
		output.writeString ("package " + BuildHX.resolvePackageName (definition.className) + ";\n\n\n");
		
		output.writeString ("#if cpp\n");
		output.writeString ("import cpp.Lib;\n");
		output.writeString ("#elseif neko\n");
		output.writeString ("import neko.Lib;\n");
		output.writeString ("#end\n\n");
		
		for (importPath in imports) {
			
			output.writeString ("import " + importPath + ";\n");
			
		}
		
		if (imports.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		output.writeString ("\n");
		
		output.writeString ('class ' + BuildHX.resolveClassName (definition.className));
		
		var parentClassName = "";
		
		if (definition.parentClassName != null && definition.parentClassName != "" && definition.parentClassName != "Object") {
			
			parentClassName = BuildHX.resolveClassName (definition.parentClassName);
			
			if (parentClassName == BuildHX.resolveClassName (definition.className)) {
				
				parentClassName = BuildHX.resolvePackageNameDot (definition.parentClassName) + parentClassName;
				
			}
			
		}
		
		if (parentClassName != "") {
			
			output.writeString (" extends " + parentClassName);
			
		}
		
		var interfaces = "";
		
		for (classInterface in definition.interfaces) {
			
			if (interfaces != "") {
				
				interfaces += ", ";
				
			}
			
			interfaces += BuildHX.resolveClassName (classInterface);
			
		}
		
		if (interfaces != "") {
			
			output.writeString (" implements " + interfaces);
			
		}
		
		output.writeString (" {\n\n");
		
		for (property in staticProperties) {
			
			output.writeString ("	" + property);
			
		}
		
		if (staticProperties.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		if (properties.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		for (property in properties) {
			
			output.writeString ("	" + property);
			
		}
		
		if (properties.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		output.writeString ("	/** @private */\n	public var handle:Dynamic;\n\n\n");
		output.writeString (constructor);
		
		if (methods.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		for (method in staticMethods) {
			
			output.writeString ("	" + method);
			
		}
		
		if (staticMethods.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		for (method in methods) {
			
			output.writeString (method);
			
		}
		
		if (getters.length > 0 || setters.length > 0) {
			
			output.writeString ("\n\n	// Get & Set Methods\n\n\n\n");
			
			for (getter in getters) {
				
				output.writeString (getter);
				
			}
			
			for (setter in setters) {
				
				output.writeString (setter);
				
			}
			
		}
		
		if (nativeMethods.length > 0) {
			
			output.writeString ("\n\n	// Native Methods\n\n\n\n");
			
			for (nativeMethod in nativeMethods) {
				
				output.writeString ("	" + nativeMethod);
				
			}
			
			output.writeString ("\n\n");
			
		}
		
		output.writeString ("}");
		output.close ();
		
	}
	
	
	private function writeClassMethod (method:ClassMethod, isStatic:Bool, nativeMethodName:String):String {
		
		var output = "	public ";
		
		if (isStatic) {
			
			output += "static ";
			
		}
		
		output += "function " + method.name + " (";
		
		for (i in 0...method.parameterNames.length) {
			
			if (i > 0) {
				
				output += ", ";
				
			}
			
			output += method.parameterNames[i] + ":" + parser.resolveType (method.parameterTypes[i]);
			
			if (method.parameterOptional[i]) {
				
				output += " = null";
				
			}
			
		}
		
		output += "):" + parser.resolveType (method.returnType) + " {\n";
		
		output += "		\n";
		
		if (method.name == "new") {
			
			output += "		handle = " + nativeMethodName + " (";
			
		} else {
			
			output += "		";
			
			if (method.returnType != null && method.returnType != "Void") {
				
				output += "return ";
				
			}
			
			output += nativeMethodName + " (handle";
			
		}
		
		for (i in 0...method.parameterNames.length) {
			
			if (i > 0 || method.name != "new") {
				
				output += ", ";
				
			}
			
			output += method.parameterNames[i];
			
			switch (method.parameterTypes[i]) {
				
				case "Int", "String", "Float", "Void":
					
				default:
					
					output += ".handle";
				
			}
			
		}
		
		output += ");\n";
		
		output += "		\n";
		output += "	}\n";
		output += "	\n";
		
		if (method.hasConflict) {
			
			return "//" + output;
			
		} else {
			
			return output;
			
		}
		
	}
	
	
	private function writeClassProperty (property:ClassProperty, isStatic:Bool, getterName:String, setterName:String):String {
		
		var output = "public ";
		
		if (isStatic) {
			
			output += "static ";
			
		}
		
		output += "var " + property.name + " (" + getterName + ", " + setterName + "):" + parser.resolveType (property.type) + ";\n";
		
		if (property.hasConflict) {
			
			return "//" + output;
			
		} else {
			
			return output;
			
		}
		
	}
	
	
	private function writeClassPropertyGetter (property:ClassProperty, isStatic:Bool, getterName:String, nativeGetterName:String):String {
		
		var output = "	private ";
		
		if (isStatic) {
			
			output += "static ";
			
		}
		
		output += "function " + getterName + " (";
		output += "):" + parser.resolveType (property.type) + " {\n";
		output += "		\n";
		output += "		return " + nativeGetterName + " (handle);\n";
		output += "		\n";
		output += "	}\n";
		output += "	\n";
		
		return output;
		
	}
	
	
	private function writeClassPropertySetter (property:ClassProperty, isStatic:Bool, setterName:String, nativeSetterName:String):String {
		
		var output = "	private ";
		
		if (isStatic) {
			
			output += "static ";
			
		}
		
		output += "function " + setterName + " (value:" + parser.resolveType (property.type);
		output += "):" + parser.resolveType (property.type) + " {\n";
		output += "		\n";
		output += "		" + nativeSetterName + " (handle, value);\n";
		output += "		return value;\n";
		output += "		\n";
		output += "	}\n";
		output += "	\n";
		
		return output;
		
	}
	
	
	private function writeNativeMethod (name:String, parameters:Int):String {
		
		return "private static var " + name + " = Lib.load (\"" + BuildHX.libraryName + "\", \"" + name + "\", " + parameters + ");\n";
		
	}
	
	
}