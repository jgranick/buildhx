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
	
	haxelib run buildhx build.xml
	
...where "build.xml" is your XML definitions file:

```xml
<buildhx>
	<source [path="path_to_folder"] />
	<type name="name" [remap="new_name"] />
	<class name="name" [ignore="true"] [native="native_name"] [header="native_header"] [type=""] [extends="parent_class_name"] [implements="a,b"] [config="true"]>
	    <import name="name" />
	    <property [type="Dynamic"] [getter=""] [setter=""] [native=""] [ignore="true"] [owner=""] [static="true"] />
	    <static-property [type="Dynamic"] [getter=""] [setter=""] [native=""] [ignore="true"] [owner=""] />
	    <method name="name" native="" ignore="true" owner="" parameters|params="" return="" [static="true"]>
	        <parameter name="name" type="type" optional="true" />
	        <return type="" />
	    <static-method  name="name" native="" ignore="true" owner="" parameters|params="" return="">
	        <parameter name="name" type="type" optional="true" />
	        <return type="" />
	    </static-method>
	    <constructor native="" ignore="true" owner="" parameters|params="" [static="true"]>
	        <parameter name="name" type="type" optional="true" />
	    </constructor>
	</class>
	<output [path="path_to_folder"] [namespace="custom_namespace"] [native="native_namespace"] />
	<library name="lib_name" type="type:" />
</buildhx>
```
