package buildhx.parsers;


import buildhx.data.ClassDefinition;
import buildhx.data.ClassMethod;
import buildhx.data.ClassProperty;


/**
 * ...
 * @author Joshua Granick
 */

class ExtJSParser extends JSDuckParser {
	
	
	public function new () {
		
		super ();
		
		ignoredFiles = [ "global.json" ];
		
		types.set ("Mixed...", "Dynamic");
		types.set ("Object...", "Dynamic");
		types.set ("String...", "String");
		types.set ("Event", "js.Dom.Event");
		types.set ("Ext.Container", "ext.container.Container");
		types.set ("Ext.Core.Element", "ext.Element");
		
	}
	
	
	public override function resolveClasses ():Void {
		
		super.resolveClasses ();
		
		// Adding missing class definitions
		
		var base = new ClassDefinition ();
		base.className = "Ext.Base";
		definitions.set (base.className, base);
		
		var baseConfig = new ClassDefinition ();
		baseConfig.className = "Ext.BaseConfig";
		baseConfig.isConfigClass = true;
		definitions.set (baseConfig.className, baseConfig);
		
		var abstractElement = new ClassDefinition ();
		abstractElement.className = "Ext.dom.AbstractElement";
		definitions.set (abstractElement.className, abstractElement);
		
		var element = new ClassDefinition ();
		element.className = "Ext.Element";
		definitions.set (element.className, element);
		
		// Adding missing method definitions
		
		var ext = definitions.get ("Ext");
		
		var create = new ClassMethod ();
		create.name = "create";
		create.owner = "Ext";
		create.parameterNames = [ "type", "config" ];
		create.parameterOptional = [ false, false ];
		create.parameterTypes = [ "String", "Dynamic" ];
		create.returnType = "Dynamic";
		
		ext.staticMethods.set (create.name, create);
		
		var controllerConfig = definitions.get ("Ext.app.ControllerConfig");
		
		var launch = new ClassProperty ();
		launch.name = "launch";
		launch.owner = "Ext.app.Application";
		launch.type = "Application -> Void";
		
		var init = new ClassProperty ();
		init.name = "init";
		init.owner = "Ext.app.Application";
		init.type = "Application -> Void";
		
		controllerConfig.properties.set (launch.name, launch);
		controllerConfig.properties.set (init.name, init);
		controllerConfig.imports.set ("ext.app.Application", "ext.app.Application");
		
		definitions.remove ("Ext.Msg");
		
		var msg = new ClassProperty ();
		msg.name = "Msg";
		msg.owner = "Ext";
		msg.type = "Ext.MessageBox";
		
		ext.staticProperties.set (msg.name, msg);
		ext.imports.set ("ext.MessageBox", "ext.MessageBox");
		
	}
	
	
}