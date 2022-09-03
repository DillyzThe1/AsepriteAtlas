package asepriteatlas;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxAssets.FlxGraphicAsset;
import lime.utils.Assets;

class AsepriteAtlasFrames
{
	// the function meant to read the dat of the json and apply it to add atlas frames
	public static function fromJson(image:FlxGraphicAsset, desc:String):FlxAtlasFrames
	{
		// var newFrames:FlxAtlasFrames = new FlxAtlasFrames();

		// taken from FlxAtlasFrames::fromSparrow
		var graphic:FlxGraphic = FlxG.bitmap.add(image);
		if (graphic == null)
			return null;

		var frames:FlxAtlasFrames = FlxAtlasFrames.findFrame(graphic);
		if (frames != null)
			return frames;

		if (graphic == null || desc == null)
			return null;

		frames = new FlxAtlasFrames(graphic);

		if (Assets.exists(desc))
			desc = Assets.getText(desc);

		// var data:Access = new Access(Xml.parse(Description).firstElement());

		return frames;
	}
}
