package createjs.tween;



/**
*	The Ease class provides a collection of easing functions for use with TweenJS.
*	It does not use the standard 4 param easing signature. Instead it uses a single param
*	which indicates the current linear ratio (0 to 1) of the tween.<br/>
*	<br/>
*	Most methods on Ease can be passed directly as easing functions:<br/>
*	Tween.get(target).to({x:100}, 500, Ease.linear);<br/>
*	<br/>
*	However, methods beginning with "get" will return an easing function based on parameter values:<br/>
*	Tween.get(target).to({y:200}, 500, Ease.getPowIn(2.2));<br/>
*	<br/>
*	Equations derived from work by Robert Penner.
*
*/
@:native ("Ease")
extern class Ease {

	
	/**
	*	@method get
	*	Mimics the simple -100 to 100 easing in Flash Pro.
	*	@param amount (Dynamic)  A value from -1 (ease in) to 1 (ease out) indicating the strength and direction of the ease.
	*
	*/
	public static function get (amount:Dynamic):Dynamic;
	
	/**
	*	@method getBackIn
	*	Configurable "back in" ease.
	*	@param amount (Dynamic)  The strength of the ease.
	*
	*/
	public static function getBackIn (amount:Dynamic):Dynamic;
	
	/**
	*	@method getBackInOut
	*	Configurable "back in out" ease.
	*	@param amount (Dynamic)  The strength of the ease.
	*
	*/
	public static function getBackInOut (amount:Dynamic):Dynamic;
	
	/**
	*	@method getBackOut
	*	Configurable "back out" ease.
	*	@param amount (Dynamic)  The strength of the ease.
	*
	*/
	public static function getBackOut (amount:Dynamic):Dynamic;
	
	/**
	*	@method getElasticIn
	*	Configurable elastic ease.
	*	@param amplitude (Dynamic)  
	*	@param period (Dynamic)  
	*
	*/
	public static function getElasticIn (amplitude:Dynamic, period:Dynamic):Dynamic;
	
	/**
	*	@method getElasticInOut
	*	Configurable elastic ease.
	*	@param amplitude (Dynamic)  
	*	@param period (Dynamic)  
	*
	*/
	public static function getElasticInOut (amplitude:Dynamic, period:Dynamic):Dynamic;
	
	/**
	*	@method getElasticOut
	*	Configurable elastic ease.
	*	@param amplitude (Dynamic)  
	*	@param period (Dynamic)  
	*
	*/
	public static function getElasticOut (amplitude:Dynamic, period:Dynamic):Dynamic;
	
	/**
	*	@method getPowIn
	*	Configurable exponential ease.
	*	@param pow (Dynamic)  The exponent to use (ex. 3 would return a cubic ease).
	*
	*/
	public static function getPowIn (pow:Dynamic):Dynamic;
	
	/**
	*	@method getPowInOut
	*	Configurable exponential ease.
	*	@param pow (Dynamic)  The exponent to use (ex. 3 would return a cubic ease).
	*
	*/
	public static function getPowInOut (pow:Dynamic):Dynamic;
	
	/**
	*	@method getPowOut
	*	Configurable exponential ease.
	*	@param pow (Dynamic)  The exponent to use (ex. 3 would return a cubic ease).
	*
	*/
	public static function getPowOut (pow:Dynamic):Dynamic;
	
	/**
	*	@method none
	*	Identical to linear.
	*
	*/
	public static function none ():Dynamic;
	
	public static function backIn ():Dynamic;
	
	public static function backInOut ():Dynamic;
	
	public static function backOut ():Dynamic;
	
	public static function bounceIn ():Dynamic;
	
	public static function bounceInOut ():Dynamic;
	
	public static function bounceOut ():Dynamic;
	
	public static function circIn ():Dynamic;
	
	public static function circInOut ():Dynamic;
	
	public static function circOut ():Dynamic;
	
	public static function cubicIn ():Dynamic;
	
	public static function cubicInOut ():Dynamic;
	
	public static function cubicOut ():Dynamic;
	
	public static function elasticIn ():Dynamic;
	
	public static function elasticInOut ():Dynamic;
	
	public static function elasticOut ():Dynamic;
	
	public static function linear ():Dynamic;
	
	public static function quadIn ():Dynamic;
	
	public static function quadInOut ():Dynamic;
	
	public static function quadOut ():Dynamic;
	
	public static function quartIn ():Dynamic;
	
	public static function quartInOut ():Dynamic;
	
	public static function quartOut ():Dynamic;
	
	public static function quintIn ():Dynamic;
	
	public static function quintInOut ():Dynamic;
	
	public static function quintOut ():Dynamic;
	
	public static function sineIn ():Dynamic;
	
	public static function sineInOut ():Dynamic;
	
	public static function sineOut ():Dynamic;

}