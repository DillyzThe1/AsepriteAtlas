package test;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, AtlasTestState, 1, #if html5 60, 60 #else 120, 120 #end, true, false));
		addChild(new FPS());
	}
}
