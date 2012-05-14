package ;

@:native ("SpriteSheetUtils")
extern class SpriteSheetUtils {

	public static var _workingCanvas:HTMLCanvasElement;
	public static var _workingContext:CanvasRenderingContext2D;

	public static function extractFrame (spriteSheet:Image, frame:Float):Image;
	public static function flip (spriteSheet:Image, flipData:Dynamic):Dynamic;

}