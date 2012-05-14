package ;

@:native ("SpriteSheet")
extern class SpriteSheet {

	public var _animations:Void;
	public var _data:Void;
	public var _frameHeight:Void;
	public var _frames:Void;
	public var _frameWidth:Void;
	public var _images:Void;
	public var _loadCount:Void;
	public var _numFrames:Void;
	public var _regX:Void;
	public var _regY:Void;
	public var complete:Bool;

	public function _calculateFrames ():Dynamic;
	public function _handleImageLoad ():Dynamic;
	public function clone ():SpriteSheet;
	public function getAnimation (name:Void):Dynamic;
	public function getAnimations ():Array <Dynamic>;
	public function getFrame (frameIndex:Float):Dynamic;
	public function initialize ():Dynamic;
	public function toString ():String;

}