package src_test;

import flixel.FlxSprite;
import flixel.FlxState;

class AtlasTestState extends FlxState
{
	public var testSprite:FlxSprite;

	override public function create()
	{
		super.create();

		testSprite = new FlxSprite();
		testSprite.frames = null;
		add(testSprite);
	}
}
