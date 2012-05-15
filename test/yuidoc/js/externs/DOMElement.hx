package ;

import js.Dom;
import js.w3c.html5.Canvas2DContext;



/**
*	<b>This class is still experimental, and more advanced use is likely to be buggy. Please report bugs.</b><br/><br/>
*	A DOMElement allows you to associate a HTMLElement with the display list. It will be transformed
*	within the DOM as though it is child of the Container it is added to. However, it is not rendered
*	to canvas, and as such will retain whatever z-index it has relative to the canvas (ie. it will be
*	drawn in front of or behind the canvas).<br/><br/>
*	The position of a DOMElement is relative to their parent node in the DOM. It is recommended that
*	the DOM Object be added to a div that also contains the canvas so that they share the same position
*	on the page.<br/><br/>
*	DOMElement is useful for positioning HTML elements over top of canvas content, and for elements
*	that you want to display outside the bounds of the canvas. For example, a tooltip with rich HTML
*	content.<br/><br/>
*	DOMElement instances are not full EaselJS display objects, and do not participate in EaselJS mouse
*	events or support methods like hitTest.
*
*/
@:native ("DOMElement")
extern class DOMElement extends DisplayObject {

	
	/**
	*	@type HTMLElement
	*	The DOM object to manage.
	*
	*/
	public var htmlElement:HtmlDom;
	
	private var _style:Dynamic;
	
	private var DisplayObject_initialize:Dynamic;

	
	/**
	*	@method cache
	*	Not applicable to DOMElement.
	*
	*/
	//public function cache ():Dynamic;
	
	/**
	*	@method clone
	*	This presently clones the DOMElement instance, but not the associated HTMLElement.
	*
	*/
	//public function clone ():DOMElement;
	
	/**
	*	@method draw
	*	Draws the display object into the specified context ignoring it's visible, alpha, shadow, and transform.
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
	*	@method globalToLocal
	*	Not applicable to DOMElement.
	*
	*/
	//public function globalToLocal ():Dynamic;
	
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
	*	@method localToGlobal
	*	Not applicable to DOMElement.
	*
	*/
	//public function localToGlobal ():Dynamic;
	
	/**
	*	@method localToLocal
	*	Not applicable to DOMElement.
	*
	*/
	//public function localToLocal ():Dynamic;
	
	/**
	*	@method new
	*	<b>This class is still experimental, and more advanced use is likely to be buggy. Please report bugs.</b><br/><br/>
	*	A DOMElement allows you to associate a HTMLElement with the display list. It will be transformed
	*	within the DOM as though it is child of the Container it is added to. However, it is not rendered
	*	to canvas, and as such will retain whatever z-index it has relative to the canvas (ie. it will be
	*	drawn in front of or behind the canvas).<br/><br/>
	*	The position of a DOMElement is relative to their parent node in the DOM. It is recommended that
	*	the DOM Object be added to a div that also contains the canvas so that they share the same position
	*	on the page.<br/><br/>
	*	DOMElement is useful for positioning HTML elements over top of canvas content, and for elements
	*	that you want to display outside the bounds of the canvas. For example, a tooltip with rich HTML
	*	content.<br/><br/>
	*	DOMElement instances are not full EaselJS display objects, and do not participate in EaselJS mouse
	*	events or support methods like hitTest.
	*	@param htmlElement (HTMLElement)  
	*
	*/
	public function new (htmlElement:HtmlDom):Void;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	//public function toString ():String;
	
	/**
	*	@method uncache
	*	Not applicable to DOMElement.
	*
	*/
	//public function uncache ():Dynamic;
	
	/**
	*	@method updateCache
	*	Not applicable to DOMElement.
	*
	*/
	//public function updateCache ():Dynamic;

}