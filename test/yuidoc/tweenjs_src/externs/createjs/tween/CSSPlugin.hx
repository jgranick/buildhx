package createjs.tween;



/**
*	TODO.
*
*/
@:native ("CSSPlugin")
extern class CSSPlugin {

	
	/**
	*	@type Object
	*	Defines the default suffix map for CSS tweens. This can be overridden on a per tween basis by specifying a
	*	cssSuffixMap value for the individual tween. The object maps CSS property names to the suffix to use when
	*	reading or setting those properties. For example a map in the form {top:"px"} specifies that when tweening
	*	the "top" CSS property, it should use the "px" suffix (ex. target.style.top = "20.5px"). This only applies
	*	to tweens with the "css" config property set to true.
	*
	*/
	public static var cssSuffixMap:Dynamic;

	
	/**
	*	@method new
	*	TODO.
	*
	*/
	public function new ():Void;

}