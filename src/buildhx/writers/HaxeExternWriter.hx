package buildhx.writers;


import buildhx.data.ClassDefinition;
import buildhx.data.ClassMethod;
import buildhx.data.ClassProperty;
import buildhx.parsers.AbstractParser;
import buildhx.parsers.YUIDocParser;
import sys.io.File;


/**
 * ...
 * @author Joshua Granick
 */

class HaxeExternWriter {
	
	
	private var parser:AbstractParser;
	
	
	public function new (parser:AbstractParser) {
		
		this.parser = parser;
		
	}
	
	
	public function writeConfigClass (definition:ClassDefinition, basePath:String):Void {
		
		var targetPath = basePath + BuildHX.resolvePackageNameDot (definition.className).split (".").join ("/") + BuildHX.resolveClassName (definition.className) + ".hx";
		
		BuildHX.print ("Writing " + targetPath);
		BuildHX.makeDirectory (targetPath);
		
		var imports = new Array<String> ();
		var methods = new Array<String> ();
		var properties = new Array<String> ();
		var staticMethods = new Array<String> ();
		var staticProperties = new Array<String> ();
		
		for (importPath in definition.imports) {
			
			imports.push (importPath);
			
		}
		
		for (property in definition.properties) {
			
			if (!property.ignore) {
				
				properties.push (writeClassProperty (property, false));
				
			}
			
		}
		
		imports.sort (BuildHX.alphabeticalSorting);
		properties.sort (BuildHX.alphabeticalSorting);
		
		var output = File.write (targetPath, false);
		
		output.writeString ("package " + BuildHX.resolvePackageName (definition.className) + ";\n\n");
		
		var parentClassImport = parser.resolveImport (definition.parentClassName);
		
		for (importPath in imports) {
			
			output.writeString ("import " + importPath + ";\n");
			
		}
		
		if (imports.length > 0) {
			
			output.writeString ("\n");
			
		}
		
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
			
		} else {
			
			output.writeString (" implements Dynamic");
			
		}
		
		output.writeString ("\n{\n");
		
		for (property in properties) {
			
			output.writeString ("	" + property);
			
		}
		
		if (properties.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		output.writeString ("	public function new (properties:Dynamic = null):Void\n\t{\n");
		//output.writeString ("		\n");
		
		if (parentClassName != "") {
			
			output.writeString ("		super (properties);\n");
			
		} else {
			
			output.writeString ("		untyped __js__ (\"this.__proto__ = {}.__proto__\");\n");
			//output.writeString ("		\n");
			output.writeString ("		if (properties != null)\n\t\t{\n");
			//output.writeString ("			\n");
			output.writeString ("			for (propertyName in Reflect.fields (properties))\n\t\t\t{\n");
			//output.writeString ("				\n");
			output.writeString ("				Reflect.setField (this, propertyName, Reflect.field (properties, propertyName));\n");
			//output.writeString ("				\n");
			output.writeString ("			}\n");
			//output.writeString ("			\n");
			output.writeString ("		}\n");
			
		}
		
		//output.writeString ("		\n");
		output.writeString ("	}\n");
		
		output.writeString ("\n}\n");
		output.close ();
		
	}
	
	
	public function writeClass (definition:ClassDefinition, basePath:String):Void {
		
		var targetPath = basePath + BuildHX.resolvePackageNameDot (BuildHX.customNamespace + definition.className).split (".").join ("/") + BuildHX.resolveClassName (definition.className) + ".hx";
		
		BuildHX.print ("Writing " + targetPath);
		BuildHX.makeDirectory (targetPath);
		
		var imports = new Array<String> ();
		var methods = new Array<String> ();
		var properties = new Array<String> ();
		var staticMethods = new Array<String> ();
		var staticProperties = new Array<String> ();
		
		for (importPath in definition.imports) {
			
			imports.push (importPath);
			
		}
		
		for (method in definition.methods) {
			
			if (!method.ignore) {
				
				methods.push (writeClassMethod (method, false, method.accessModifier));
				
			}
			
		}
		
		for (property in definition.properties) {
			
			if (!property.ignore) {
				
				properties.push (writeClassProperty (property, false, property.accessModifier));
				
			}
			
		}
		
		for (method in definition.staticMethods) {
			
			if (!method.ignore) {
				
				methods.push (writeClassMethod (method, true, method.accessModifier));
				
			}
			
		}
		
		for (property in definition.staticProperties) {
			
			if (!property.ignore) {
				
				properties.push (writeClassProperty (property, true));
				
			}
			
		}
		
		imports.sort (BuildHX.alphabeticalSorting);
		methods.sort (BuildHX.alphabeticalSorting);
		properties.sort (BuildHX.alphabeticalSorting);
		staticMethods.sort (BuildHX.alphabeticalSorting);
		staticProperties.sort (BuildHX.alphabeticalSorting);
		
		var output = File.write (targetPath, false);
		
		output.writeString ("package " + BuildHX.resolvePackageName (BuildHX.customNamespace + definition.className) + ";\n\n");
		
		for (importPath in imports) {
			
			output.writeString ("import " + importPath + ";\n");
			
		}
		
		if (imports.length > 0) {
			
			output.writeString ("\n");
			
		}
		
		if (definition.comment != null && definition.comment != "") {
			
			//output.writeString ("\n");
			output.writeString (definition.comment);
			output.writeString ("\n");
		}
		
		output.writeString ('@:native("' + BuildHX.nativeNamespace + (definition.nativeClassName != null ? definition.nativeClassName : definition.className) + '")\n');
		output.writeString ('extern class ' + BuildHX.resolveClassName (definition.className));
		
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
		
		output.writeString ("\n{");
		
		for (property in staticProperties) {
			
			output.writeString ("\n\t" + property);
			
		}
		
		if (staticProperties.length > 0) {
			
			//output.writeString ("\n");
			
		}
		
		for (property in properties) {
			
			output.writeString ("\n\t" + property);
			
		}
		
		if (properties.length > 0) {
			
			//output.writeString ("\n");
			
		}
		
		for (method in staticMethods) {
			
			output.writeString ("\n\t" + method);
			
		}
		
		if (staticMethods.length > 0) {
			
			//output.writeString ("\n");
			
		}
		
		for (method in methods) {
			
			output.writeString ("\n\t" + method);
			
		}
		
		if (methods.length > 0) {
			
			//output.writeString ("\n");
			
		}
		
		output.writeString ("\n}\n");
		output.close ();
		
	}
	
	
	private function writeClassMethod (method:ClassMethod, isStatic:Bool, access:String="public"):String {
		
		var output = "";
		
		if(method.comment != null && method.comment != "") {
			
			output += method.comment + "\n\t";
			
		}
		
		if (method.hasConflict)
		{
			output += "//";
		}
		
		output += access + " ";
		
		if (isStatic) {
			
			output += "static ";
			
		}
		
		output += "function " + method.name + "(";
		
		for (i in 0...method.parameterNames.length) {
			
			if (i > 0) {
				
				output += ", ";
				
			}
			
			if (method.parameterOptional[i]) {
				
				output += "?";
				
			}
			
			output += method.parameterNames[i] + ":" + parser.resolveType (method.parameterTypes[i]);
			
		}
		
		output += "):" + parser.resolveType (method.returnType) + ";\n\t";
		
		return output;
			
	}
	
	
	private function writeClassProperty (property:ClassProperty, isStatic:Bool, access:String="public"):String {
		
		var output = "";
		
		if(property.comment != null && property.comment != "") {
			
			output += property.comment + "\n\t";
			
		}
		
		if (property.hasConflict)
		{
			output += "//";
		}
		
		output += access + " ";
		
		if (isStatic) {
			
			output += "static ";
			
		}
		
		output += "var " + property.name + ":" + parser.resolveType (property.type) + ";\n\t";
		
		return output;
		
	}

	
}