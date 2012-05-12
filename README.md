BuildHX
=======

Helps generate externs for native libraries.


Current Features
----------------

* Generate JS externs for libraries supporting JSDuck
* Generate externs from manually defined XML


Planned Features
----------------

* Generate bindings to use native C++ libraries
* Import support for creating Java/JNI bindings
* Generate bindings to use native Objective-C libraries


Usage
-----

BuildHX is simple to use:
	
	
	haxelib run buildhx build.xml
	
	
...where "build.xml" is your XML definitions file.


More Details
------------

You can currently find XML examples in the "senchatouch" and "joapp" libraries.

Although support for more JS doc generators is not planned, your contributions are welcome. For example, the EaselJS library is designed to work with YUIDoc. With a little bit of work, it should be possible to use YUIDoc to export the EaselJS definitions in a readable format. Then it would not be difficult to create a new parser so that externs could be made automatically.