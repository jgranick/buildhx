package ;

import js.w3c.html5.Canvas2DContext;



/**
*	A Container is a nestable display lists that allows you to work with compound display elements. For
*	example you could group arm, leg, torso and head Bitmaps together into a Person Container, and
*	transform them as a group, while still being able to move the individual parts relative to each
*	other. Children of containers have their transform and alpha properties concatenated with their
*	parent Container. For example, a Shape with x=100 and alpha=0.5, placed in a Container with
*	x=50 and alpha=0.7 will be rendered to the canvas at x=150 and alpha=0.35. Containers have some
*	overhead, so you generally shouldn't create a Container to hold a single child.
*
*/
@:native ("Container")
extern class Container extends DisplayObject {

	
	/**
	*	@type Array[DisplayObject]
	*	The array of children in the display list. You should usually use the child management methods,
	*	rather than accessing this directly, but it is included for advanced users.
	*
	*/
	public var children:Array<DisplayObject>;
	
	private var DisplayObject_draw:Dynamic;
	
	private var DisplayObject_initialize:Dynamic;

	
	/**
	*	@method addChild
	*	Adds a child to the top of the display list. You can also add multiple children, such as "addChild(child1, child2, ...);".
	*	Returns the child that was added, or the last child if multiple children were added.
	*	@param child (DisplayObject)  The display object to add.
	*
	*/
	public function addChild (child:DisplayObject):DisplayObject;
	
	/**
	*	@method addChildAt
	*	Adds a child to the display list at the specified index, bumping children at equal or greater indexes up one, and setting
	*	its parent to this Container. You can also add multiple children, such as "addChildAt(child1, child2, ..., index);". The
	*	index must be between 0 and numChildren. For example, to add myShape under otherShape in the display list, you could use:
	*	container.addChildAt(myShape, container.getChildIndex(otherShape)). This would also bump otherShape's index up by one.
	*	Returns the last child that was added, or the last child if multiple children were added. Fails silently if the index 
	*	is out of range.
	*	@param child (DisplayObject)  The display object to add.
	*	@param index (Number)  The index to add the child at.
	*
	*/
	public function addChildAt (child:DisplayObject, index:Float):DisplayObject;
	
	/**
	*	@method contains
	*	Returns true if the specified display object either is this container or is a descendent.
	*	(child, grandchild, etc) of this container.
	*	@param child (DisplayObject)  The DisplayObject to be checked.
	*
	*/
	public function contains (child:DisplayObject):Bool;
	
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
	*	@method getChildAt
	*	Returns the child at the specified index.
	*	@param index (Number)  The index of the child to return.
	*
	*/
	public function getChildAt (index:Float):DisplayObject;
	
	/**
	*	@method getChildIndex
	*	Returns the index of the specified child in the display list, or -1 if it is not in the display list.
	*	@param child (DisplayObject)  The child to return the index of.
	*
	*/
	public function getChildIndex (child:DisplayObject):Float;
	
	/**
	*	@method getNumChildren
	*	Returns the number of children in the display list.
	*
	*/
	public function getNumChildren ():Float;
	
	/**
	*	@method getObjectsUnderPoint
	*	Returns an array of all display objects under the specified coordinates that are in this container's display list.
	*	This routine ignores any display objects with mouseEnabled set to false. The array will be sorted in order of visual
	*	depth, with the top-most display object at index 0. This uses shape based hit detection, and can be an expensive operation
	*	to run, so it is best to use it carefully. For example, if testing for objects under the mouse, test on tick (instead of on
	*	mousemove), and only if the mouse's position has changed.
	*	@param x (Number)  The x position in the container to test.
	*	@param y (Number)  The y position in the container to test.
	*
	*/
	public function getObjectsUnderPoint (x:Float, y:Float):Array<DisplayObject>;
	
	/**
	*	@method getObjectUnderPoint
	*	Similar to getObjectsUnderPoint(), but returns only the top-most display object. This runs significantly faster than
	*	getObjectsUnderPoint(), but is still an expensive operation. See getObjectsUnderPoint() for more information.
	*	@param x (Number)  The x position in the container to test.
	*	@param y (Number)  The y position in the container to test.
	*
	*/
	public function getObjectUnderPoint (x:Float, y:Float):DisplayObject;
	
	/**
	*	@method hitTest
	*	Tests whether the display object intersects the specified local point (ie. draws a pixel with alpha > 0 at the specified
	*	position). This ignores the alpha, shadow and compositeOperation of the display object, and all transform properties
	*	including regX/Y.
	*	@param x (Dynamic)  The x position to check in the display object's local coordinates.
	*	@param y (Dynamic)  The y position to check in the display object's local coordinates.
	*
	*/
	//public function hitTest (x:Dynamic, y:Dynamic):Bool;
	
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
	*	A Container is a nestable display lists that allows you to work with compound display elements. For
	*	example you could group arm, leg, torso and head Bitmaps together into a Person Container, and
	*	transform them as a group, while still being able to move the individual parts relative to each
	*	other. Children of containers have their transform and alpha properties concatenated with their
	*	parent Container. For example, a Shape with x=100 and alpha=0.5, placed in a Container with
	*	x=50 and alpha=0.7 will be rendered to the canvas at x=150 and alpha=0.35. Containers have some
	*	overhead, so you generally shouldn't create a Container to hold a single child.
	*
	*/
	public function new ():Void;
	
	/**
	*	@method removeAllChildren
	*	Removes all children from the display list.
	*
	*/
	public function removeAllChildren ():Dynamic;
	
	/**
	*	@method removeChild
	*	Removes the specified child from the display list. Note that it is faster to use removeChildAt() if the index is already
	*	known. You can also remove multiple children, such as "removeChild(child1, child2, ...);". Returns true if the child
	*	(or children) was removed, or false if it was not in the display list.
	*	@param child (DisplayObject)  The child to remove.
	*
	*/
	public function removeChild (child:DisplayObject):Bool;
	
	/**
	*	@method setChildIndex
	*	Changes the depth of the specified child. Fails silently if the child is not a child of this container, or the index is out of range.
	*	@param child (Dynamic)  
	*	@param index (Dynamic)  
	*
	*/
	public function setChildIndex (child:Dynamic, index:Dynamic):Dynamic;
	
	/**
	*	@method sortChildren
	*	Performs an array sort operation on the child list.
	*	@param sortFunction (Function)  the function to use to sort the child list. See javascript's Array.sort documentation
	*	for details.
	*
	*/
	public function sortChildren (sortFunction:Dynamic):Dynamic;
	
	/**
	*	@method swapChildren
	*	Swaps the specified children's depth in the display list. Fails silently if either child is not a child of this Container.
	*	@param child1 (Dynamic)  
	*	@param child2 (Dynamic)  
	*
	*/
	public function swapChildren (child1:Dynamic, child2:Dynamic):Dynamic;
	
	/**
	*	@method swapChildrenAt
	*	Swaps the children at the specified indexes. Fails silently if either index is out of range.
	*	@param index1 (Dynamic)  
	*	@param index2 (Dynamic)  
	*
	*/
	public function swapChildrenAt (index1:Dynamic, index2:Dynamic):Dynamic;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	//public function toString ():String;
	
	//private function _tick ():Dynamic;
	
	private function _getObjectsUnderPoint (x:Float, y:Float, arr:Array <Dynamic>, mouseEvents:Float):Array<DisplayObject>;

}