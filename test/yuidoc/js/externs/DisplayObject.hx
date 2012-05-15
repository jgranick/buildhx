package ;

import js.w3c.html5.Canvas2DContext;
import js.w3c.html5.Core;



/**
*	DisplayObject is an abstract class that should not be constructed directly. Instead construct subclasses such as
*	Sprite, Bitmap, and Shape. DisplayObject is the base class for all display classes in the CanvasDisplay library.
*	It defines the core properties and methods that are shared between all display objects.
*
*/
@:native ("DisplayObject")
extern class DisplayObject {

	
	/**
	*	@type Array[Filter]
	*	An array of Filter objects to apply to this display object. Filters are only applied / updated when cache() or
	*	updateCache() is called on the display object, and only apply to the area that is cached.
	*
	*/
	public var filters:Array<Filter>;
	
	/**
	*	@type Boolean
	*	Indicates whether the display object should have it's x & y position rounded prior to drawing it to stage.
	*	Snapping to whole pixels can result in a sharper and faster draw for images (ex. Bitmap & cached objects).
	*	This only applies if the enclosing stage has snapPixelsEnabled set to true. The snapToPixel property is true
	*	by default for Bitmap and BitmapAnimation instances, and false for all other display objects.
	*	<br/><br/>
	*	Note that this applies only rounds the display object's local position. You should
	*	ensure that all of the display object's ancestors (parent containers) are also on a whole pixel. You can do this
	*	by setting the ancestors' snapToPixel property to true.
	*
	*/
	public var snapToPixel:Bool;
	
	/**
	*	@type Boolean
	*	Indicates whether this display object should be rendered to the canvas and included when running
	*	Stage.getObjectsUnderPoint().
	*
	*/
	public var visible:Bool;
	
	/**
	*	@type Boolean
	*	Indicates whether to include this object when running Stage.getObjectsUnderPoint(). Setting this to true for
	*	Sprites will cause the Sprite to be returned (not its children) regardless of whether it's mouseChildren property
	*	is true.
	*
	*/
	public var mouseEnabled:Bool;
	
	/**
	*	@type Boolean
	*	Suppresses errors generated when using features like hitTest, onPress/onClick, and getObjectsUnderPoint with cross
	*	domain content
	*
	*/
	public static var suppressCrossDomainErrors:Bool;
	
	/**
	*	@type DisplayObject
	*	A display object that will be tested when checking mouse interactions or testing getObjectsUnderPoint. The hit area
	*	will have its transformation applied relative to this display object's coordinate space (as though the hit test object were a child of this
	*	display object and relative to its regX/Y). It is NOT used for hitTest().
	*
	*/
	public var hitArea:DisplayObject;
	
	/**
	*	@type DisplayObject
	*	A reference to the Sprite or Stage object that contains this display object, or null if it has not been added to
	*	one. READ-ONLY.
	*
	*/
	public var parent:DisplayObject;
	
	/**
	*	@type HTMLCanvasElement
	*	If a cache is active, this returns the canvas that holds the cached version of this display object. See cache()
	*	for more information. READ-ONLY.
	*
	*/
	public var cacheCanvas:HTMLCanvasElement;
	
	/**
	*	@type Number
	*	Returns an ID number that uniquely identifies the current cache for this display object.
	*	This can be used to determine if the cache has changed since a previous check.
	*
	*/
	public var cacheID:Float;
	
	/**
	*	@type Number
	*	The alpha (transparency) for this display object. 0 is fully transparent, 1 is fully opaque.
	*
	*/
	public var alpha:Float;
	
	/**
	*	@type Number
	*	The factor to skew this display object horizontally.
	*
	*/
	public var skewX:Float;
	
	/**
	*	@type Number
	*	The factor to skew this display object vertically.
	*
	*/
	public var skewY:Float;
	
	/**
	*	@type Number
	*	The factor to stretch this display object horizontally. For example, setting scaleX to 2 will stretch the display
	*	object to twice it's nominal width.
	*
	*/
	public var scaleX:Float;
	
	/**
	*	@type Number
	*	The factor to stretch this display object vertically. For example, setting scaleY to 0.5 will stretch the display
	*	object to half it's nominal height.
	*
	*/
	public var scaleY:Float;
	
	/**
	*	@type Number
	*	The rotation in degrees for this display object.
	*
	*/
	public var rotation:Float;
	
	/**
	*	@type Number
	*	The x (horizontal) position of the display object, relative to its parent.
	*
	*/
	public var x:Float;
	
	/**
	*	@type Number
	*	The x offset for this display object's registration point. For example, to make a 100x100px Bitmap rotate around
	*	it's center, you would set regX and regY to 50.
	*
	*/
	public var regX:Float;
	
	/**
	*	@type Number
	*	The y offset for this display object's registration point. For example, to make a 100x100px Bitmap rotate around
	*	it's center, you would set regX and regY to 50.
	*
	*/
	public var regY:Float;
	
	/**
	*	@type Number
	*	Unique ID for this display object. Makes display objects easier for some uses.
	*
	*/
	public var id:Float;
	
	/**
	*	@type Shadow
	*	A shadow object that defines the shadow to render on this display object. Set to null to remove a shadow. If
	*	null, this property is inherited from the parent container.
	*
	*/
	public var shadow:Shadow;
	
	/**
	*	@type Shape
	*	A Shape instance that defines a vector mask (clipping path) for this display object.  The shape's transformation
	*	will be applied relative to the display object's parent coordinates (as if it were a child of the parent).
	*
	*/
	public var mask:Shape;
	
	/**
	*	@type String
	*	An optional name for this display object. Included in toString(). Useful for debugging.
	*
	*/
	public var name:String;
	
	/**
	*	@type String
	*	The composite operation indicates how the pixels of this display object will be composited with the elements
	*	behind it. If null, this property is inherited from the parent container. For more information, read the
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#compositing">
	*	whatwg spec on compositing</a>.
	*
	*/
	public var compositeOperation:String;
	
	private var _cacheDataURL:String;
	
	private var _cacheDataURLID:Float;
	
	private var _cacheOffsetX:Float;
	
	private var _cacheOffsetY:Float;
	
	private var _matrix:Matrix2D;
	
	public static var _hitTestCanvas:HTMLCanvasElement;
	
	public static var _hitTestContext:CanvasRenderingContext2D;
	
	public static var _nextCacheID:Float;
	
	public var y:Float;

	
	/**
	*	@method cache
	*	Draws the display object into a new canvas, which is then used for subsequent draws. For complex content
	*	that does not change frequently (ex. a Sprite with many children that do not move, or a complex vector Shape),
	*	this can provide for much faster rendering because the content does not need to be re-rendered each tick. The
	*	cached display object can be moved, rotated, faded, etc freely, however if it's content changes, you must manually
	*	update the cache by calling updateCache() or cache() again. You must specify the cache area via the x, y, w,
	*	and h parameters. This defines the rectangle that will be rendered and cached using this display object's
	*	coordinates. For example if you defined a Shape that drew a circle at 0, 0 with a radius of 25, you could call
	*	myShape.cache(-25, -25, 50, 50) to cache the full shape.
	*	@param x (Number)  The x coordinate origin for the cache region.
	*	@param y (Number)  The y coordinate origin for the cache region.
	*	@param width (Number)  The width of the cache region.
	*	@param height (Number)  The height of the cache region.
	*
	*/
	public function cache (x:Float, y:Float, width:Float, height:Float):Dynamic;
	
	/**
	*	@method clone
	*	Returns a clone of this DisplayObject. Some properties that are specific to this instance's current context are
	*	reverted to their defaults (for example .parent).
	*
	*/
	public function clone ():DisplayObject;
	
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
	public function draw (ctx:CanvasRenderingContext2D, ignoreCache:Bool):Dynamic;
	
	/**
	*	@method getCacheDataURL
	*	Returns a data URL for the cache, or null if this display object is not cached.
	*	Uses cacheID to ensure a new data URL is not generated if the cache has not changed.
	*
	*/
	public function getCacheDataURL ():Dynamic;
	
	/**
	*	@method getConcatenatedMatrix
	*	Generates a concatenated Matrix2D object representing the combined transform of
	*	the display object and all of its parent Containers up to the highest level ancestor
	*	(usually the stage). This can be used to transform positions between coordinate spaces,
	*	such as with localToGlobal and globalToLocal.
	*	@param mtx (Matrix2D)  Optional. A Matrix2D object to populate with the calculated values. If null, a new
	*	Matrix object is returned.
	*
	*/
	public function getConcatenatedMatrix (mtx:Matrix2D):Matrix2D;
	
	/**
	*	@method getMatrix
	*	Returns a matrix based on this object's transform.
	*	@param matrix (Matrix2D)  Optional. A Matrix2D object to populate with the calculated values. If null, a new
	*	Matrix object is returned.
	*
	*/
	public function getMatrix (matrix:Matrix2D):Matrix2D;
	
	/**
	*	@method getStage
	*	Returns the stage that this display object will be rendered on, or null if it has not been added to one.
	*
	*/
	public function getStage ():Stage;
	
	/**
	*	@method globalToLocal
	*	Transforms the specified x and y position from the global (stage) coordinate space to the
	*	coordinate space of the display object. For example, this could be used to determine
	*	the current mouse position within the display object. Returns a Point instance with x and y properties
	*	correlating to the transformed position in the display object's coordinate space.
	*	@param x (Number)  The x position on the stage to transform.
	*	@param y (Number)  The y position on the stage to transform.
	*
	*/
	public function globalToLocal (x:Float, y:Float):Point;
	
	/**
	*	@method hitTest
	*	Tests whether the display object intersects the specified local point (ie. draws a pixel with alpha > 0 at
	*	the specified position). This ignores the alpha, shadow and compositeOperation of the display object, and all
	*	transform properties including regX/Y.
	*	@param x (Number)  The x position to check in the display object's local coordinates.
	*	@param y (Number)  The y position to check in the display object's local coordinates.
	*
	*/
	public function hitTest (x:Float, y:Float):Bool;
	
	/**
	*	@method initialize
	*	Initialization method.
	*
	*/
	private function initialize ():Dynamic;
	
	/**
	*	@method isVisible
	*	Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	*	This does not account for whether it would be visible within the boundaries of the stage.
	*	NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	*
	*/
	public function isVisible ():Bool;
	
	/**
	*	@method localToGlobal
	*	Transforms the specified x and y position from the coordinate space of the display object
	*	to the global (stage) coordinate space. For example, this could be used to position an HTML label
	*	over a specific point on a nested display object. Returns a Point instance with x and y properties
	*	correlating to the transformed coordinates on the stage.
	*	@param x (Number)  The x position in the source display object to transform.
	*	@param y (Number)  The y position in the source display object to transform.
	*
	*/
	public function localToGlobal (x:Float, y:Float):Point;
	
	/**
	*	@method localToLocal
	*	Transforms the specified x and y position from the coordinate space of this display object to the
	*	coordinate space of the target display object. Returns a Point instance with x and y properties
	*	correlating to the transformed position in the target's coordinate space. Effectively the same as calling
	*	var pt = this.localToGlobal(x, y); pt = target.globalToLocal(pt.x, pt.y);
	*	@param x (Number)  The x position in the source display object to transform.
	*	@param y (Number)  The y position on the stage to transform.
	*	@param target (DisplayObject)  The target display object to which the coordinates will be transformed.
	*
	*/
	public function localToLocal (x:Float, y:Float, target:DisplayObject):Point;
	
	/**
	*	@method new
	*	DisplayObject is an abstract class that should not be constructed directly. Instead construct subclasses such as
	*	Sprite, Bitmap, and Shape. DisplayObject is the base class for all display classes in the CanvasDisplay library.
	*	It defines the core properties and methods that are shared between all display objects.
	*
	*/
	public function new ():Void;
	
	/**
	*	@method setTransform
	*	Shortcut method to quickly set the transform properties on the display object. All parameters are optional.
	*	Omitted parameters will have the default value set (ex. 0 for x/y, 1 for scaleX/Y).
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param scaleX (Number)  
	*	@param scaleY (Number)  
	*	@param rotation (Number)  
	*	@param skewX (Number)  
	*	@param skewY (Number)  
	*	@param regX (Number)  
	*	@param regY (Number)  
	*
	*/
	public function setTransform (x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, regX:Float, regY:Float):Dynamic;
	
	/**
	*	@method setupContext
	*	Applies this display object's transformation, alpha, globalCompositeOperation, clipping path (mask), and shadow to the specified
	*	context. This is typically called prior to draw.
	*	@param ctx (CanvasRenderingContext2D)  The canvas 2D to update.
	*
	*/
	public function setupContext (ctx:CanvasRenderingContext2D):Dynamic;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;
	
	/**
	*	@method uncache
	*	Clears the current cache. See cache() for more information.
	*
	*/
	public function uncache ():Dynamic;
	
	/**
	*	@method updateCache
	*	Redraws the display object to its cache. Calling updateCache without an active cache will throw an error.
	*	If compositeOperation is null the current cache will be cleared prior to drawing. Otherwise the display object
	*	will be drawn over the existing cache using the specified compositeOperation.
	*	@param compositeOperation (String)  The compositeOperation to use, or null to clear the cache and redraw it.
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#compositing">
	*	whatwg spec on compositing</a>.
	*
	*/
	public function updateCache (compositeOperation:String):Dynamic;
	
	private function _applyFilters ():Dynamic;
	
	private function _applyShadow (ctx:CanvasRenderingContext2D, shadow:Shadow):Dynamic;
	
	private function _testHit (ctx:CanvasRenderingContext2D):Bool;
	
	private function _tick ():Dynamic;
	
	private function cloneProps (o:DisplayObject):Dynamic;

}