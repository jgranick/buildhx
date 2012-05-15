package ;

import js.w3c.html5.Canvas2DContext;



/**
*	Allows you to display one or more lines of dynamic text (not user editable) in the display list.
*	Line wrapping support (using the lineWidth is very basic, wrapping on spaces and tabs only. Note
*	that as an alternative to Text, you can position HTML text above or below the canvas relative to 
*	items in the display list using the localToGlobal() method.
*
*/
@:native ("Text")
extern class Text extends DisplayObject {

	
	/**
	*	@type Number
	*	Indicates the maximum width for a line of text before it is wrapped to multiple lines. If null, 
	*	the text will not be wrapped.
	*
	*/
	public var lineWidth:Float;
	
	/**
	*	@type Number
	*	shrunk to make it fit in this width. For detailed information view the 
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#text-0">
	*	whatwg spec</a>.
	*
	*/
	public var maxWidth:Float;
	
	/**
	*	@type Number
	*	the value of getMeasuredLineHeight is used.
	*
	*/
	public var lineHeight:Float;
	
	/**
	*	@type String
	*	"ideographic", or "bottom". For detailed information view the 
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#text-0">
	*	whatwg spec</a>.
	*
	*/
	public var textBaseline:String;
	
	/**
	*	@type String
	*	The color to draw the text in. Any valid value for the CSS color attribute is acceptable (ex. "#F00").
	*
	*/
	public var color:String;
	
	/**
	*	@type String
	*	The font style to use. Any valid value for the CSS font attribute is acceptable (ex. "bold 36px Arial").
	*
	*/
	public var font:String;
	
	/**
	*	@type String
	*	The horizontal text alignment. Any of "start", "end", "left", "right", and "center". For detailed 
	*	information view the 
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#text-0">
	*	whatwg spec</a>.
	*
	*/
	public var textAlign:String;
	
	/**
	*	@type String
	*	The text to display.
	*
	*/
	public var text:String;
	
	private var _workingContext:CanvasRenderingContext2D;
	
	private var DisplayObject_cloneProps:Dynamic;
	
	private var DisplayObject_draw:Dynamic;
	
	private var DisplayObject_initialize:Dynamic;
	
	public var outline:Bool;

	
	/**
	*	@method _getWorkingContext
	*	Draws multiline text.
	*
	*/
	private function _getWorkingContext ():Float;
	
	/**
	*	@method clone
	*	Returns a clone of the Point instance.
	*
	*/
	//public function clone ():Point;
	
	/**
	*	@method draw
	*	Draws the Text into the specified context ignoring it's visible, alpha, shadow, and transform.
	*	Returns true if the draw was handled (useful for overriding functionality).
	*	NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	*	@param ctx (CanvasRenderingContext2D)  The canvas 2D context object to draw into.
	*	@param ignoreCache (Boolean)  Indicates whether the draw operation should ignore any current cache. 
	*	For example, used for drawing the cache (to prevent it from simply drawing an existing cache back
	*	into itself).
	*
	*/
	//public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	
	/**
	*	@method getMeasuredHeight
	*	Returns the approximate height of multiline text by multiplying the number of lines against
	*	either the lineHeight (if specified) or getMeasuredLineHeight(). Note that this operation
	*	requires the text flowing logic to run, which has an associated CPU cost.
	*
	*/
	public function getMeasuredHeight ():Float;
	
	/**
	*	@method getMeasuredLineHeight
	*	Returns an approximate line height of the text, ignoring the lineHeight property. This is based 
	*	on the measured width of a "M" character multiplied by 1.2, which approximates em for most fonts.
	*
	*/
	public function getMeasuredLineHeight ():Float;
	
	/**
	*	@method getMeasuredWidth
	*	Returns the measured, untransformed width of the text without wrapping.
	*
	*/
	public function getMeasuredWidth ():Float;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	//private function initialize ():Dynamic;
	
	/**
	*	@method isVisible
	*	Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	*	This does not account for whether it would be visible within the boundaries of the stage.
	*	NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	*
	*/
	//public function isVisible ():Bool;
	
	/**
	*	@method new
	*	Allows you to display one or more lines of dynamic text (not user editable) in the display list.
	*	Line wrapping support (using the lineWidth is very basic, wrapping on spaces and tabs only. Note
	*	that as an alternative to Text, you can position HTML text above or below the canvas relative to 
	*	items in the display list using the localToGlobal() method.
	*	@param text (String)  
	*	@param font (String)  
	*	@param color (String)  
	*
	*/
	public function new (text:String, font:String, color:String):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	//public function toString ():String;
	
	//private function cloneProps (o:Text):Dynamic;
	
	private function _drawTextLine (ctx:CanvasRenderingContext2D, text:Text, y:Float):Dynamic;

}