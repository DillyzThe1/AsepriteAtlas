package src_test;

import asepriteatlas.AsepriteAtlasFrames;
import flixel.FlxSprite;
import flixel.FlxState;

class AtlasTestState extends FlxState
{
	// public var testSprite:FlxSprite;
	override public function create()
	{
		super.create();

		// testSprite = new FlxSprite();
		// testSprite.frames = null;
		// add(testSprite);

		// testing purposes
		AsepriteAtlasFrames.fromI8('assets/images/eye test.png', 'assets/images/eye test.json');
	}
}
