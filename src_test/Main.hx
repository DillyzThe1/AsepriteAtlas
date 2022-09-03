package src_test;

import flixel.FlxGame;
import flixel.util.FlxColor;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		// make a new game instance, test out the FPS.
		addChild(new FlxGame(0, 0, AtlasTestState, 1, #if html5 60, 60 #else 120, 120 #end, true, false));
		addChild(new FPS(10, 10, FlxColor.WHITE));
	}
}
