BuildHX
=======

Helps generate externs for native libraries.

Current Features
----------------

* Generate externs from manually defined XML
* Generate JS externs for libraries supporting JSDuck and YUIDoc
* Initial support for binding native C++ libraries

Usage
-----

BuildHX is simple to use:
	
	haxelib run buildhx [options] build.xml
	
...where options are:
 * -v, -verbose    Verbose output.    
 * -Dkey           Define key.
 * -lpath          Include path.
 * key=value       Define key with a value.

"build.xml" is your XML definitions file:
```xml
<build>
	<source path="path_to_folder_with_js_files" parser="jsduck|yuidoc|cpp" />
	<type name="name" remap="new_name" />
	<class name="name" ignore="true" native="native_name" header="native_header" type="type" extends="parent_class_name" implements="a,b" config="true">
	    <import name="name" />
	    <property type="Dynamic" getter="getter" setter="setter" native="native_name" ignore="true" owner="owner" static="true" />
	    <static-property type="Dynamic" getter="getter" setter="setter" native="native_name" ignore="true" owner="" />
	    <method name="name" native="" ignore="true" owner="" parameters="" params="" return="" static="true">
	        <parameter name="name" type="type" optional="true" />
	        <return type="" />
	    <static-method  name="name" native="" ignore="true" owner="" parameters="" params="" return="">
	        <parameter name="name" type="type" optional="true" />
	        <return type="" />
	    </static-method>
	    <constructor native="native_name" ignore="true" owner="" parameters="" params="" static="true">
	        <parameter name="name" type="type" optional="true" />
	    </constructor>
	</class>
	<output path="path_to_folder" namespace="custom_namespace" native="native_namespace" />
	<library name="ndll_file_name_without extension" type="cpp" />
</build>
```
