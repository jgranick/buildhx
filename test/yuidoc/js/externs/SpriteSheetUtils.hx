package ;

@:native ("SpriteSheetUtils")
extern class SpriteSheetUtils {

	public var _workingCanvas:HTMLCanvasElement;
	public var _workingContext:CanvasRenderingContext2D;

	public function extractFrame (spriteSheet:Image, frame:Float):Image;
	public function flip (spriteSheet:Image, flipData:Dynamic):Dynamic;

}