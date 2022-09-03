package src_test;

import asepriteatlas.AsepriteAtlasFrames;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

// meant for testing the atlas parsing tool
class AtlasTestState extends FlxState
{
	public var testSprite:FlxSprite;

	override public function create()
	{
		super.create();

		// ok so first you make the sprite (duh)
		testSprite = new FlxSprite();
		// then parse the frames
		testSprite.frames = AsepriteAtlasFrames.fromI8('assets/images/eye test.png', 'assets/images/eye test.json');
		// and add animations as if it were sparrowv2
		testSprite.animation.addByPrefix('Blinking Eye', 'Blink0', 24, false, false, false);
		testSprite.animation.addByPrefix('Static Eye', 'Static0', 24, false, false, false);
		// scale the pixel art up
		testSprite.scale.x = testSprite.scale.y = 12;
		// fix hitbox
		testSprite.updateHitbox();
		// add to canvas
		add(testSprite);
		// "center" it (fail)
		testSprite.screenCenter();
	}

	override public function update(e:Float)
	{
		super.update(e);

		// animation testing :))))))))
		if (FlxG.keys.justPressed.ONE)
			testSprite.animation.play('Blinking Eye', true);
		else if (FlxG.keys.justPressed.TWO)
			testSprite.animation.play('Static Eye', true);
	}
}
