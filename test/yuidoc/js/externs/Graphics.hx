package ;

import js.w3c.html5.Canvas2DContext;



/**
*	The Graphics class exposes an easy to use API for generating vector drawing instructions and drawing them to a specified context.
*	Note that you can use Graphics without any dependency on the Easel framework by calling draw() directly,
*	or it can be used with the Shape object to draw vector graphics within the context of an Easel display list.<br/><br/>
*	<pre><code>var g = new Graphics();
*		g.setStrokeStyle(1);
*		g.beginStroke(Graphics.getRGB(0,0,0));
*		g.beginFill(Graphics.getRGB(255,0,0));
*		g.drawCircle(0,0,3);
*	
*		var s = new Shape(g);
*			s.x = 100;
*			s.y = 100;
*	
*		stage.addChild(s);
*		stage.update();</code></pre><br />
*	Note that all drawing methods in Graphics return the Graphics instance, so they can be chained together. For example, the following 
*	line of code would generate the instructions to draw a rectangle with a red stroke and blue fill, then render it to the specified 
*	context2D:<br />
*	<pre><code>myGraphics.beginStroke("#F00").beginFill("#00F").drawRect(20, 20, 100, 50).draw(myContext2D);
*
*/
@:native ("Graphics")
extern class Graphics {

	
	/**
	*	@type Array[String]
	*	Maps numeric values for the caps parameter of setStrokeStyle to corresponding string values.
	*	This is primarily for use with the tiny API. The mappings are as follows: 0 to "butt",
	*	1 to "round", and 2 to "square".
	*	For example, myGraphics.ss(16, 2) would set the line caps to "square".
	*
	*/
	public static var STROKE_CAPS_MAP:Array<String>;
	
	/**
	*	@type Array[String]
	*	Maps numeric values for the joints parameter of setStrokeStyle to corresponding string values.
	*	This is primarily for use with the tiny API. The mappings are as follows: 0 to "miter",
	*	1 to "round", and 2 to "bevel".
	*	For example, myGraphics.ss(16, 0, 2) would set the line joints to "bevel".
	*
	*/
	public static var STROKE_JOINTS_MAP:Array<String>;
	
	/**
	*	@type Function
	*	Maps the familiar ActionScript curveTo() method to the functionally similar quatraticCurveTo() method.
	*
	*/
	public var curveTo:Dynamic;
	
	/**
	*	@type Function
	*	Maps the familiar ActionScript drawRect() method to the functionally similar rect() method.
	*
	*/
	public var drawRect:Dynamic;
	
	/**
	*	@type Object
	*	Map of Base64 characters to values. Used by decodePath().
	*
	*/
	public static var BASE_64:Dynamic;
	
	private var _active:Bool;
	
	private var _activeInstructions:Array<Command>;
	
	private var _dirty:Bool;
	
	private var _fillInstructions:Array<Command>;
	
	private var _instructions:Array<Command>;
	
	private var _oldInstructions:Array<Command>;
	
	private var _strokeInstructions:Array<Command>;
	
	private var _strokeStyleInstructions:Array<Command>;
	
	private var a:Dynamic;
	
	private var at:Dynamic;
	
	private var bf:Dynamic;
	
	private var bs:Dynamic;
	
	private var bt:Dynamic;
	
	private var c:Dynamic;
	
	private var cp:Dynamic;
	
	private var dc:Dynamic;
	
	private var de:Dynamic;
	
	private var dp:Dynamic;
	
	private var dr:Dynamic;
	
	private var ef:Dynamic;
	
	private var es:Dynamic;
	
	private var f:Dynamic;
	
	private var lf:Dynamic;
	
	private var ls:Dynamic;
	
	private var lt:Dynamic;
	
	private var mt:Dynamic;
	
	private var p:Dynamic;
	
	private var qt:Dynamic;
	
	private var r:Dynamic;
	
	private var rc:Dynamic;
	
	private var rf:Dynamic;
	
	private var rr:Dynamic;
	
	private var rs:Dynamic;
	
	private var s:Dynamic;
	
	private var ss:Dynamic;
	
	public static var _ctx:CanvasRenderingContext2D;
	
	public static var beginCmd:Command;
	
	public static var fillCmd:Command;
	
	public static var strokeCmd:Command;

	
	/**
	*	@method _setProp
	*	used to create Commands that set properties
	*	@param name (String)  
	*	@param value (String)  
	*
	*/
	private function _setProp (name:String, value:String):Dynamic;
	
	/**
	*	@method arc
	*	Draws an arc defined by the radius, startAngle and endAngle arguments, centered at the position (x, y). For example 
	*	arc(100, 100, 20, 0, Math.PI*2) would draw a full circle with a radius of 20 centered at (100, 100). For detailed 
	*	information, read the 
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#dom-context-2d-arc">whatwg spec</a>.
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param radius (Number)  
	*	@param startAngle (Number)  Measured in radians.
	*	@param endAngle (Number)  Measured in radians.
	*	@param anticlockwise (Boolean)  
	*
	*/
	public function arc (x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Bool):Graphics;
	
	/**
	*	@method arcTo
	*	Draws an arc with the specified control points and radius.  For detailed information, read the 
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#dom-context-2d-arcto">
	*	whatwg spec</a>.
	*	@param x1 (Number)  
	*	@param y1 (Number)  
	*	@param x2 (Number)  
	*	@param y2 (Number)  
	*	@param radius (Number)  
	*
	*/
	public function arcTo (x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Graphics;
	
	/**
	*	@method beginBitmapFill
	*	Begins a pattern fill using the specified image. This ends the current subpath.
	*	@param image (Dynamic)  The Image, Canvas, or Video object to use as the pattern.
	*	@param repetition (String)  Optional. Indicates whether to repeat the image in the fill area. One of "repeat", "repeat-x",
	*	"repeat-y", or "no-repeat". Defaults to "repeat".
	*
	*/
	public function beginBitmapFill (image:Dynamic, repetition:String):Graphics;
	
	/**
	*	@method beginBitmapStroke
	*	Begins a pattern fill using the specified image. This ends the current subpath.
	*	@param image (Image | HTMLCanvasElement | HTMLVideoElement)  The Image, Canvas, or Video object to use as the pattern.
	*	@param repetition (String)  Optional. Indicates whether to repeat the image in the fill area. One of "repeat", "repeat-x",
	*	"repeat-y", or "no-repeat". Defaults to "repeat".
	*
	*/
	public function beginBitmapStroke (image:Dynamic, repetition:String):Graphics;
	
	/**
	*	@method beginFill
	*	Begins a fill with the specified color. This ends the current subpath.
	*	@param color (String)  A CSS compatible color value (ex. "#FF0000" or "rgba(255,0,0,0.5)"). Setting to null will 
	*	result in no fill.
	*
	*/
	public function beginFill (color:String):Graphics;
	
	/**
	*	@method beginLinearGradientFill
	*	Begins a linear gradient fill defined by the line (x0, y0) to (x1, y1). This ends the current subpath. For example, the
	*	following code defines a black to white vertical gradient ranging from 20px to 120px, and draws a square to display it:<br/>
	*	myGraphics.beginLinearGradientFill(["#000","#FFF"], [0, 1], 0, 20, 0, 120).drawRect(20, 20, 120, 120);
	*	@param colors (Array[String])  An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient 
	*	drawing from red to blue.
	*	@param ratios (Array[Number])  An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw 
	*	the first color to 10% then interpolating to the second color at 90%.
	*	@param x0 (Number)  The position of the first point defining the line that defines the gradient direction and size.
	*	@param y0 (Number)  The position of the first point defining the line that defines the gradient direction and size.
	*	@param x1 (Number)  The position of the second point defining the line that defines the gradient direction and size.
	*	@param y1 (Number)  The position of the second point defining the line that defines the gradient direction and size.
	*
	*/
	public function beginLinearGradientFill (colors:Array<String>, ratios:Array<Number>, x0:Float, y0:Float, x1:Float, y1:Float):Graphics;
	
	/**
	*	@method beginLinearGradientStroke
	*	Begins a linear gradient stroke defined by the line (x0, y0) to (x1, y1). This ends the current subpath. For example, the following code defines a black to white vertical gradient ranging from 20px to 120px, and draws a square to display it:<br/>
	*	myGraphics.setStrokeStyle(10).beginLinearGradientStroke(["#000","#FFF"], [0, 1], 0, 20, 0, 120).drawRect(20, 20, 120, 120);
	*	@param colors (Dynamic)  An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	*	@param ratios (Dynamic)  An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	*	@param x0 (Dynamic)  The position of the first point defining the line that defines the gradient direction and size.
	*	@param y0 (Dynamic)  The position of the first point defining the line that defines the gradient direction and size.
	*	@param x1 (Dynamic)  The position of the second point defining the line that defines the gradient direction and size.
	*	@param y1 (Dynamic)  The position of the second point defining the line that defines the gradient direction and size.
	*
	*/
	public function beginLinearGradientStroke (colors:Dynamic, ratios:Dynamic, x0:Dynamic, y0:Dynamic, x1:Dynamic, y1:Dynamic):Graphics;
	
	/**
	*	@method beginRadialGradientFill
	*	Begins a radial gradient fill. This ends the current subpath. For example, the following code defines a red to blue radial 
	*	gradient centered at (100, 100), with a radius of 50, and draws a circle to display it:<br/>
	*	myGraphics.beginRadialGradientFill(["#F00","#00F"], [0, 1], 100, 100, 0, 100, 100, 50).drawCircle(100, 100, 50);
	*	@param colors (Array[String])  An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient 
	*	drawing from red to blue.
	*	@param ratios (Array[Number])  An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would 
	*	draw the first color to 10% then interpolating to the second color at 90%.
	*	@param x0 (Number)  Center position of the inner circle that defines the gradient.
	*	@param y0 (Number)  Center position of the inner circle that defines the gradient.
	*	@param r0 (Number)  Radius of the inner circle that defines the gradient.
	*	@param x1 (Number)  Center position of the outer circle that defines the gradient.
	*	@param y1 (Number)  Center position of the outer circle that defines the gradient.
	*	@param r1 (Number)  Radius of the outer circle that defines the gradient.
	*
	*/
	public function beginRadialGradientFill (colors:Array<String>, ratios:Array<Number>, x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):Graphics;
	
	/**
	*	@method beginRadialGradientStroke
	*	Begins a radial gradient stroke. This ends the current subpath. For example, the following code defines a red to blue radial gradient centered at (100, 100), with a radius of 50, and draws a rectangle to display it:<br/>
	*	myGraphics.setStrokeStyle(10).beginRadialGradientStroke(["#F00","#00F"], [0, 1], 100, 100, 0, 100, 100, 50).drawRect(50, 90, 150, 110);
	*	@param colors (Dynamic)  An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	*	@param ratios (Dynamic)  An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%, then draw the second color to 100%.
	*	@param x0 (Dynamic)  Center position of the inner circle that defines the gradient.
	*	@param y0 (Dynamic)  Center position of the inner circle that defines the gradient.
	*	@param r0 (Dynamic)  Radius of the inner circle that defines the gradient.
	*	@param x1 (Dynamic)  Center position of the outer circle that defines the gradient.
	*	@param y1 (Dynamic)  Center position of the outer circle that defines the gradient.
	*	@param r1 (Dynamic)  Radius of the outer circle that defines the gradient.
	*
	*/
	public function beginRadialGradientStroke (colors:Dynamic, ratios:Dynamic, x0:Dynamic, y0:Dynamic, r0:Dynamic, x1:Dynamic, y1:Dynamic, r1:Dynamic):Graphics;
	
	/**
	*	@method beginStroke
	*	Begins a stroke with the specified color. This ends the current subpath.
	*	@param color (Dynamic)  A CSS compatible color value (ex. "#FF0000" or "rgba(255,0,0,0.5)"). Setting to null will result in no stroke.
	*
	*/
	public function beginStroke (color:Dynamic):Graphics;
	
	/**
	*	@method clear
	*	Clears all drawing instructions, effectively reseting this Graphics instance.
	*
	*/
	public function clear ():Graphics;
	
	/**
	*	@method clone
	*	Returns a clone of this Graphics instance.
	*
	*/
	public function clone ():Graphics;
	
	/**
	*	@method closePath
	*	Closes the current path, effectively drawing a line from the current drawing point to the first drawing point specified
	*	since the fill or stroke was last set.
	*
	*/
	public function closePath ():Graphics;
	
	/**
	*	@method decodePath
	*	Decodes a compact encoded path string into a series of draw instructions.
	*	This format is not intended to be human readable, and is meant for use by authoring tools.
	*	The format uses a base64 character set, with each character representing 6 bits, to define a series of draw commands.
	*	<br/><br/>
	*	Each command is comprised of a single "header" character followed by a variable number of alternating x and y position values.
	*	Reading the header bits from left to right (most to least significant): bits 1 to 3 specify the type of operation
	*	(0-moveTo, 1-lineTo, 2-quadraticCurveTo, 3-bezierCurveTo, 4-7 unused). Bit 4 indicates whether position values use 12 bits (2 characters) 
	*	or 18 bits (3 characters), with a one indicating the latter. Bits 5 and 6 are currently unused.
	*	<br/><br/>
	*	Following the header is a series of 2 (moveTo, lineTo), 4 (quadraticCurveTo), or 6 (bezierCurveTo) parameters.
	*	These parameters are alternating x/y positions represented by 2 or 3 characters (as indicated by the 4th bit in the command char).
	*	These characters consist of a 1 bit sign (1 is negative, 0 is positive), followed by an 11 (2 char) or 17 (3 char) bit integer value.
	*	All position values are in tenths of a pixel.
	*	Except in the case of move operations, this value is a delta from the previous x or y position (as appropriate).
	*	<br/><br/>
	*	For example, the string "A3cAAMAu4AAA" represents a line starting at -150,0 and ending at 150,0.
	*	A - bits 000000. First 3 bits (000) indicate a moveTo operation. 4th bit (0) indicates 2 chars per parameter.
	*	n0 - 110111011100. Absolute x position of -150.0px. First bit indicates a negative value, remaining bits indicate 1500 tenths of a pixel. 
	*	AA - 000000000000. Absolute y position of 0.
	*	I - 001100. First 3 bits (001) indicate a lineTo operation. 4th bit (1) indicates 3 chars per parameter.
	*	Au4 - 000000101110111000. An x delta of 300.0px, which is added to the previous x value of -150.0px to provide an absolute position of +150.0px.
	*	AAA - 000000000000000000. A y delta value of 0.
	*	@param str (String)  The path string to decode.
	*
	*/
	public function decodePath (str:String):Graphics;
	
	/**
	*	@method draw
	*	Draws the display object into the specified context ignoring it's visible, alpha, shadow, and transform.
	*	Returns true if the draw was handled (useful for overriding functionality).
	*	NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	*	@param ctx (CanvasRenderingContext2D)  The canvas 2D context object to draw into.
	*
	*/
	public function draw (ctx:CanvasRenderingContext2D):Dynamic;
	
	/**
	*	@method drawAsPath
	*	Draws only the path described for this Graphics instance, skipping any
	*	non-path instructions, including fill and stroke descriptions.
	*	Used by DisplayObject.clippingPath to draw the clipping path, for example.
	*	@param ctx (CanvasRenderingContext2D)  The canvas 2D context object to draw into.
	*
	*/
	public function drawAsPath (ctx:CanvasRenderingContext2D):Dynamic;
	
	/**
	*	@method drawCircle
	*	Draws a circle with the specified radius at (x, y).
	*	
	*	<pre><code>var g = new Graphics();
	*		g.setStrokeStyle(1);
	*		g.beginStroke(Graphics.getRGB(0,0,0));
	*		g.beginFill(Graphics.getRGB(255,0,0));
	*		g.drawCircle(0,0,3);
	*	
	*		var s = new Shape(g);
	*			s.x = 100;
	*			s.y = 100;
	*	
	*		stage.addChild(s);
	*		stage.update();</code></pre>
	*	@param x (Number)  x coordinate center point of circle.
	*	@param y (Number)  y coordinate center point of circle.
	*	@param radius (Number)  Radius of circle.
	*
	*/
	public function drawCircle (x:Float, y:Float, radius:Float):Graphics;
	
	/**
	*	@method drawEllipse
	*	Draws an ellipse (oval).
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param w (Number)  
	*	@param h (Number)  
	*
	*/
	public function drawEllipse (x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	*	@method drawPolyStar
	*	Draws a star if pointSize is greater than 0 or a regular polygon if pointSize is 0 with the specified number of points.
	*	For example, the following code will draw a familiar 5 pointed star shape centered at 100, 100 and with a radius of 50:
	*	myGraphics.beginFill("#FF0").drawPolyStar(100, 100, 50, 5, 0.6, -90); // -90 makes the first point vertical
	*	@param x (Number)  Position of the center of the shape.
	*	@param y (Number)  Position of the center of the shape.
	*	@param radius (Number)  The outer radius of the shape.
	*	@param sides (Number)  The number of points on the star or sides on the polygon.
	*	@param pointSize (Number)  The depth or "pointy-ness" of the star points. A pointSize of 0 will draw a regular polygon (no points), 
	*	a pointSize of 1 will draw nothing because the points are infinitely pointy.
	*	@param angle (Number)  The angle of the first point / corner. For example a value of 0 will draw the first point directly to the 
	*	right of the center.
	*
	*/
	public function drawPolyStar (x:Float, y:Float, radius:Float, sides:Float, pointSize:Float, angle:Float):Graphics;
	
	/**
	*	@method drawRoundRect
	*	Draws a rounded rectangle with all corners with the specified radius.
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param w (Number)  
	*	@param h (Number)  
	*	@param radius (Number)  Corner radius.
	*
	*/
	public function drawRoundRect (x:Float, y:Float, w:Float, h:Float, radius:Float):Graphics;
	
	/**
	*	@method drawRoundRectComplex
	*	Draws a rounded rectangle with different corner radiuses.
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param w (Number)  
	*	@param h (Number)  
	*	@param radiusTL (Number)  Top left corner radius.
	*	@param radiusTR (Number)  Top right corner radius.
	*	@param radiusBR (Number)  Bottom right corner radius.
	*	@param radiusBL (Number)  Bottom left corner radius.
	*
	*/
	public function drawRoundRectComplex (x:Float, y:Float, w:Float, h:Float, radiusTL:Float, radiusTR:Float, radiusBR:Float, radiusBL:Float):Graphics;
	
	/**
	*	@method endStroke
	*	Ends the current subpath, and begins a new one with no stroke. Functionally identical to beginStroke(null).
	*
	*/
	public function endStroke ():Graphics;
	
	/**
	*	@method getHSL
	*	Returns a CSS compatible color string based on the specified HSL numeric color values in the format "hsla(360,100,100,1.0)", 
	*	or if alpha is null then in the format "hsl(360,100,100)". For example, Graphics.getHSL(150, 100, 70) will return 
	*	"hsl(150,100,70)".
	*	@param hue (Number)  The hue component for the color, between 0 and 360.
	*	@param saturation (Number)  The saturation component for the color, between 0 and 100.
	*	@param lightness (Number)  The lightness component for the color, between 0 and 100.
	*	@param alpha (Number)  Optional. The alpha component for the color where 0 is fully transparent and 1 is fully opaque.
	*
	*/
	public static function getHSL (hue:Float, saturation:Float, lightness:Float, alpha:Float):Dynamic;
	
	/**
	*	@method getRGB
	*	Returns a CSS compatible color string based on the specified RGB numeric color values in the format 
	*	"rgba(255,255,255,1.0)", or if alpha is null then in the format "rgb(255,255,255)". For example,
	*	Graphics.getRGB(50, 100, 150, 0.5) will return "rgba(50,100,150,0.5)". It also supports passing a single hex color 
	*	value as the first param, and an optional alpha value as the second param. For example, Graphics.getRGB(0xFF00FF, 0.2)
	*	will return "rgba(255,0,255,0.2)".
	*	@param r (Number)  The red component for the color, between 0 and 0xFF (255).
	*	@param g (Number)  The green component for the color, between 0 and 0xFF (255).
	*	@param b (Number)  The blue component for the color, between 0 and 0xFF (255).
	*	@param alpha (Number)  Optional. The alpha component for the color where 0 is fully transparent and 1 is fully opaque.
	*
	*/
	public static function getRGB (r:Float, g:Float, b:Float, alpha:Float):Dynamic;
	
	/**
	*	@method initialize
	*	Initialization method.
	*	@param instructions (String)  
	*
	*/
	private function initialize (instructions:String):Dynamic;
	
	/**
	*	@method lineTo
	*	Draws a line from the current drawing point to the specified position, which become the new current drawing point. 
	*	For detailed information, read the 
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#complex-shapes-(paths)">
	*	whatwg spec</a>.
	*	@param x (Number)  The x coordinate the drawing point should draw to.
	*	@param y (Number)  The y coordinate the drawing point should draw to.
	*
	*/
	public function lineTo (x:Float, y:Float):Graphics;
	
	/**
	*	@method moveTo
	*	Moves the drawing point to the specified position.
	*	@param x (Number)  The x coordinate the drawing point should move to.
	*	@param y (Number)  The y coordinate the drawing point should move to.
	*
	*/
	public function moveTo (x:Float, y:Float):Graphics;
	
	/**
	*	@method new
	*	The Graphics class exposes an easy to use API for generating vector drawing instructions and drawing them to a specified context.
	*	Note that you can use Graphics without any dependency on the Easel framework by calling draw() directly,
	*	or it can be used with the Shape object to draw vector graphics within the context of an Easel display list.<br/><br/>
	*	<pre><code>var g = new Graphics();
	*		g.setStrokeStyle(1);
	*		g.beginStroke(Graphics.getRGB(0,0,0));
	*		g.beginFill(Graphics.getRGB(255,0,0));
	*		g.drawCircle(0,0,3);
	*	
	*		var s = new Shape(g);
	*			s.x = 100;
	*			s.y = 100;
	*	
	*		stage.addChild(s);
	*		stage.update();</code></pre><br />
	*	Note that all drawing methods in Graphics return the Graphics instance, so they can be chained together. For example, the following 
	*	line of code would generate the instructions to draw a rectangle with a red stroke and blue fill, then render it to the specified 
	*	context2D:<br />
	*	<pre><code>myGraphics.beginStroke("#F00").beginFill("#00F").drawRect(20, 20, 100, 50).draw(myContext2D);
	*
	*/
	public function new ():Void;
	
	/**
	*	@method quadraticCurveTo
	*	Draws a quadratic curve from the current drawing point to (x, y) using the control point (cpx, cpy).  For detailed information, 
	*	read the <a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#dom-context-2d-quadraticcurveto">
	*	whatwg spec</a>.
	*	@param cpx (Number)  
	*	@param cpy (Number)  
	*	@param x (Number)  
	*	@param y (Number)  
	*
	*/
	public function quadraticCurveTo (cpx:Float, cpy:Float, x:Float, y:Float):Graphics;
	
	/**
	*	@method rect
	*	Draws a rectangle at (x, y) with the specified width and height using the current fill and/or stroke.
	*	 For detailed information, read the 
	*	<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/the-canvas-element.html#dom-context-2d-rect">
	*	whatwg spec</a>.
	*	@param x (Number)  
	*	@param y (Number)  
	*	@param w (Number)  Width of the rectangle
	*	@param h (Number)  Height of the rectangle
	*
	*/
	public function rect (x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	*	@method setStrokeStyle
	*	Sets the stroke style for the current subpath. Like all drawing methods, this can be chained, so you can define the stroke style and color in a single line of code like so:
	*	myGraphics.setStrokeStyle(8,"round").beginStroke("#F00");
	*	@param thickness (Dynamic)  The width of the stroke.
	*	@param caps (Dynamic)  Optional. Indicates the type of caps to use at the end of lines. One of butt, round, or square. Defaults to "butt". Also accepts the values 0 (butt), 1 (round), and 2 (square) for use with the tiny API.
	*	@param joints (Dynamic)  Optional. Specifies the type of joints that should be used where two lines meet. One of bevel, round, or miter. Defaults to "miter". Also accepts the values 0 (miter), 1 (round), and 2 (bevel) for use with the tiny API.
	*	@param miter (Dynamic)  Optional. If joints is set to "miter", then you can specify a miter limit ratio which controls at what point a mitered joint will be clipped.
	*
	*/
	public function setStrokeStyle (thickness:Dynamic, caps:Dynamic, joints:Dynamic, miter:Dynamic):Graphics;
	
	/**
	*	@method toString
	*	Returns a string representation of this object.
	*
	*/
	public function toString ():String;
	
	private function _newPath ():Dynamic;
	
	private function _updateInstructions ():Dynamic;
	
	public function exec (scope:Dynamic):Dynamic;

}