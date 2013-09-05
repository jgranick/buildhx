package buildhx.parsers;

import buildhx.writers.HaxeExternWriter;
import sys.FileSystem;
import sys.io.File;
import buildhx.data.ClassDefinition;
import buildhx.data.ClassMethod;
import buildhx.data.ClassProperty;
using StringTools;

class YUIDocParser extends SimpleParser 
{
	
	public function new (types:Map <String, String>, definitions:Map<String, ClassDefinition>) 
	{	
		super (types, definitions);
		
		if (definitions == null) {
			
			this.definitions = new Map <String, ClassDefinition> ();
			
		} else {
			
			this.definitions = definitions;
			
		}
		
		if (types == null) {
			
			types = new Map <String, String> ();
			
		}
		
		//TODO: match these to YUI Doc types
		types.set ("String", "String");
		types.set ("Number", "Float");
		types.set ("Function", "Dynamic");
		types.set ("Boolean", "Bool");
		types.set ("Object", "Dynamic");
		//types.set ("undefined", "Void");
		types.set ("undefined", "Dynamic");
		//types.set ("null", "Void");
		types.set ("null", "Dynamic");
		types.set ("", "Dynamic");
		types.set ("HTMLElement", "Element");
		types.set ("Mixed", "Dynamic");
		types.set ("Iterable", "Dynamic");
		types.set ("Array", "Array<Dynamic>");
		types.set ("RegExp", "EReg");
		
		// Manual fixes
		types.set ("Any", "Dynamic");
		types.set ("Class", "Dynamic");
		types.set ("AudioGainNode", "GainNode");
		
		this.types = types;
	
	}
	
	private function processFile (file:String, basePath:String):Void {
		
		BuildHX.print ("Processing " + file);
		
		var content = BuildHX.getFileContent (basePath + file);
		//var data = BuildHX.parseJSON (content);
		
		var data:YUIDocRoot = BuildHX.parseJSON (content);
		
		for (key in Reflect.fields(data.classes))
		{
			var cl:YUIClass = Reflect.field(data.classes, key);
		
			var claz = Reflect.field(data.classes, key);
			//trace("Class - "+cl.name);
			var classDef = new ClassDefinition();
			
			var sourcePath = BuildHX.sourcePath.toLowerCase().replace("\\", "/");
			var classFile = cl.file.toLowerCase().replace("\\", "/");
			var pack = classFile.startsWith(sourcePath) 
				? BuildHX.resolvePackageNameDot(BuildHX.resolvePackageName(classFile.substr(sourcePath.length + 1).replace("/", ".")))
				: "";
			
			classDef.className = pack + cl.name;
			classDef.nativeClassName = (cl.module != null ? cl.module.toLowerCase() + "." : "") + cl.name;
			
			if(cl.description != null)
			{
				classDef.comment = "/**\n* "+ cl.description.split("\n").join("\n*\t") +"\n*/";
				
			}
			
			if(Reflect.hasField(claz, "extends"))
			{
				//trace("extends "+ Reflect.field(claz, "extends"));
				classDef.parentClassName = Reflect.field(claz, "extends");
			}
			
			definitions.set (cl.name, classDef);
			
			var isContructor = false;
			
			if(Reflect.hasField(claz, "is_constructor")){
				if(claz.is_constructor == 1) 
				{
					isContructor = true;
					
					var constructorDef = new ClassMethod();
					constructorDef.owner = cl.name;
					constructorDef.name = "new";
					constructorDef.accessModifier = "public";
					
					if(Reflect.hasField(claz, "params"))
					{
						var params:Array<YUIMethodParam> = cl.params;
						//trace("i.params "+i.params);
						for(param in params)
						{
							constructorDef.parameterNames.push(param.name);
							constructorDef.parameterTypes.push(param.type);
							constructorDef.parameterOptional.push(param.optional != null ? param.optional : false);
							constructorDef.parameterDescriptions.push(param.description);
						}
					}
					
					if(cl.description != null)
					{
						constructorDef.description = cl.description;
						
						constructorDef.comment = createMethodComment(constructorDef);
						
					}
					
					classDef.methods.set(constructorDef.name, constructorDef);		
				}
			}
			
		}
		
		var classItems:Array<YUIClassItem> = data.classitems;
		
		for(item in classItems)
		{
			var i:YUIClassItem = item;
			if(Reflect.hasField(item, "name"))
			{
				var access = i.access; //nowhere to assign this at the moment?
				if(access =="protected") access = "private";
				
				var itemType = i.itemtype;
				var ownerClass = Reflect.field(item, "class");
				var classDef = definitions.get(ownerClass);
				//trace(i.clazz + "-> "+access + "  "+ itemType + " "+i.name);
				//trace(ownerClass + "-> "+access + "  "+ itemType + " "+i.name);
				
				var isStatic = false;
				
				if(Reflect.hasField(item, "static"))
				{
					isStatic = Std.parseInt(Reflect.field(item, "static")) == 1;
					//trace("isStatic "+isStatic);
				}
				
				if(itemType == "method")
				{
					var methodDef = new ClassMethod();
					methodDef.owner = ownerClass;
					methodDef.name = i.name;
					methodDef.accessModifier = access;
					
					if(Reflect.hasField(item, "params"))
					{
						var params:Array<YUIMethodParam> = i.params;
						//trace("i.params "+i.params);
						for(param in params)
						{
							//trace("param "+ param.name + ":" + param.type);
							methodDef.parameterNames.push(param.name);
							methodDef.parameterTypes.push(param.type != null ? param.type : "Dynamic");
							methodDef.parameterDescriptions.push(param.description);
							methodDef.parameterOptional.push(param.optional != null ? param.optional : false);
						}
					}
					
					if(Reflect.hasField(item, "return"))
					{
						var returnObject:YUIReturnObject = Reflect.field(item, "return");
						//trace("returns "+returnObject.type);
						methodDef.returnType = returnObject.type != null ? returnObject.type : "Dynamic";
					}
					else
					{
						methodDef.returnType = "Dynamic";
					}
					
					if(isStatic)
					{
						classDef.staticMethods.set(methodDef.name, methodDef);
					}
					else
					{
						classDef.methods.set(methodDef.name, methodDef);
					}
					
					if(i.description != null)
					{
						methodDef.description = i.description;
						
						methodDef.comment = createMethodComment(methodDef);
						
					}
				
				}
				else if(itemType == "property")
				{
					var  propertyDef = new ClassProperty();
					propertyDef.owner = ownerClass;
					propertyDef.name = i.name;
					propertyDef.type = i.type != null ? i.type : "Dynamic";
					propertyDef.hasConflict = false;//?
					propertyDef.ignore = false;//?
					propertyDef.accessModifier = access;
					
					if(i.description != null)
					{
						//propertyDef.comment = "\n\t/**\n\t*	"+ "@type " + i.type + "\n\t*\t" + i.description.split("\n").join("\n\t*\t") +"\n\t*\n\t*/";
						propertyDef.comment = "/**\n\t* "+ i.description.split("\n").join(" ") +"\n\t*/";
					}
					
					if(isStatic)
					{
						classDef.staticProperties.set(propertyDef.name, propertyDef);
					}
					else
					{
						classDef.properties.set(propertyDef.name, propertyDef);
					}
				}
			}
			
		}
	}
	
	private function createMethodComment(methodDef:ClassMethod):String
	{
		var str = "/**";
		
		str += "\n\t* " + methodDef.description.split("\n").join("\n\t*\t");
		
		for(i in 0...methodDef.parameterNames.length)
		{
			
			str += "\n\t* "+ "@param " + methodDef.parameterNames[i] + " ";
			if(methodDef.parameterDescriptions[i] != null)
			{	
				str += methodDef.parameterDescriptions[i].split("\n").join("\n\t*\t");
			}
		}
		
		str += "\n\t*/";
		
		return str;
	}
	
	public override function processFiles (files:Array<String>, basePath:String):Void 
	{	
		//expecting only one file called data.json but may be hidden files in dir (e.g., .DS_store)
		for (file in files) 
		{		
			if (file == "data.json") 
			{
				processFile (file, basePath);
				break;
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
	
	
	public override function resolveImport (type:String):Array<String> {

		var type = resolveType (type, false);

		if (type.indexOf ("Array<") > -1) {

			var indexOfFirstBracket = type.indexOf ("<");
			type = type.substr (indexOfFirstBracket + 1, type.indexOf (">") - indexOfFirstBracket - 1);

		}
		
		// Try to resolve types from js std definitions
		var path:String = Sys.getEnv("HAXEPATH");
		var dirs = ["audio", "fs", "idb", "rtc", "sql", "svg", "webgl"];
		if (path != null)
		{
			var html = path + "std/js/html/" + type + ".hx";
			if (FileSystem.exists(html)) type = "js.html." + type;
			else 
			{
				for (dir in dirs)
				{
					var file = path + "std/js/html/" + dir + "/" + type + ".hx";
					if (FileSystem.exists(file)) type = "js.html." + dir + "." + type;
				}
			}
		}

		if (type.indexOf (".") == -1) {

			return [];

		} else {

			if (definitions.exists (type)) {

				if (BuildHX.customNamespace != null) {

					type = BuildHX.customNamespace + type;

				}

			}

			return  [type];

		}

	}
	
	
	public override function resolveType (type:String, abbreviate:Bool = true):String {
		
		if (type == null) {
			
			return "Void";
			
		}
		
		if (type.indexOf ("|") > -1) {
			
			return "Dynamic";
			
		}
		
		if (type.indexOf ("{") > -1) {
			
			type = type.split("{").join("").split("}").join("");
		}
		
		var isArray = false;
		
		if (type.substr (-2) == "[]") {
			
			isArray = true;
			type = type.substr (0, type.length - 2);
			
		}
		
		if (type.indexOf ("[") > -1) {
			
			type = type.split("[").join("<").split("]").join(">");
			var r = ~/(Number+)/;
			type = r.replace(type, "Float");
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
			
			return "Array<" + resolvedType + ">";
			
		} else {
			
			return resolvedType;
			
		}
		
	}
	
}

//http://yui.github.com/yuidoc/syntax/index.html

typedef YUIDocRoot =
{
	var project:Dynamic;
	var files:Dynamic;
	var modules:Dynamic;
	var classes:Dynamic; //list of classes (YUIClass)
	var classitems:Array<YUIClassItem>; //the details of each class (properties,methods)
}

typedef YUIClass =
{
	var name:String;
	var shortname:String;
	var classitems:Array<Dynamic>;
	var plugins:Array<Dynamic>;
	var extensions:Array<Dynamic>;
	var plugin_for:Array<Dynamic>;
	var module:String;
	var extension_for:Array<Dynamic>;
	var file:String;
	var line:Int;
	var description:String;
	//var extends:String; //parent class
	var is_constructor:Int; //1 = constructor
	var params:Array<YUIMethodParam>; //constructor params
}

typedef YUIClassItem = 
{
	var file:String;
	var line:Int;
	var description:String;
	var itemtype:String;//property
	var name:String; //of method/property
	var type:String; //a var of type Function, Number, String
	//var method:String;
	var params:Array<YUIMethodParam>; //when itemtype is a method
	//var return:YUIReturnObject; //optional
	//var class:String; //belongs to class
	var example:Array<String>;
	var access:String; //public/protected, default is public when not specified
	//var static:Int; //1 = static method or property
}

typedef YUIReturnObject = 
{
	var description:String;
	var type:String;
}

typedef YUIMethodParam =
{
	var name:String;
    var description:String;
    var type:String;
	var optional:Bool;
}