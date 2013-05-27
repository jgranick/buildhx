BuildHX
=======

Helps generate externs for native libraries.

Current Features
----------------

* Generate JS externs for libraries supporting JSDuck
* Generate externs from manually defined XML
* Initial support for binding native C++ libraries

Planned Features
----------------

* Improve native C++ binding support
* Migrate support for creating Java/JNI bindings
* Generate bindings to use native Objective-C libraries

Usage
-----

BuildHX is simple to use:
	
	haxelib run buildhx build.xml
	
...where "build.xml" is your XML definitions file.
