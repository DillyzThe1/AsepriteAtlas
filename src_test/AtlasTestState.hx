package src_test;

import asepriteatlas.AsepriteAtlasFrames;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class AtlasTestState extends FlxState
{
	public var testSprite:FlxSprite;

	override public function create()
	{
		super.create();

		testSprite = new FlxSprite();
		testSprite.frames = AsepriteAtlasFrames.fromI8('assets/images/eye test.png', 'assets/images/eye test.json');
		testSprite.animation.addByPrefix('Blinking Eye', 'Blink0', 24, false, false, false);
		testSprite.animation.addByPrefix('Static Eye', 'Static0', 24, false, false, false);
		testSprite.scale.x = testSprite.scale.y = 12;
		testSprite.updateHitbox();
		add(testSprite);
		testSprite.screenCenter();
	}

	override public function update(e:Float)
	{
		super.update(e);

		if (FlxG.keys.justPressed.ONE)
			testSprite.animation.play('Blinking Eye', true);
		else if (FlxG.keys.justPressed.TWO)
			testSprite.animation.play('Static Eye', true);
	}
}
