package ;

@:native ("SpriteSheet")
extern class SpriteSheet {

	private var _animations:Void;
	private var _data:Void;
	private var _frameHeight:Void;
	private var _frames:Void;
	private var _frameWidth:Void;
	private var _images:Void;
	private var _loadCount:Void;
	private var _numFrames:Void;
	private var _regX:Void;
	private var _regY:Void;
	public var complete:Bool;

	private function _calculateFrames ():Dynamic;
	private function _handleImageLoad ():Dynamic;
	private function initialize ():Dynamic;
	public function clone ():SpriteSheet;
	public function getAnimation (name:Void):Dynamic;
	public function getAnimations ():Array <Dynamic>;
	public function getFrame (frameIndex:Float):Dynamic;
	public function toString ():String;

}