package asepriteatlas;

import asepriteatlas.AspriteJSON.AsepriteJsonData;
import asepriteatlas.AspriteJSON.AseprtieJsonMetaDataFrameTag;
import asepriteatlas.AspriteJSON.AsperiteFrameData;
import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxAssets.FlxGraphicAsset;
import haxe.Json;
import lime.utils.Assets;
import openfl.geom.Rectangle;

class AsepriteAtlasFrames
{
	public static function thousandNumbFormat(initNumb:Int):String
	{
		var initStrConv:String = '$initNumb';

		switch (initStrConv.length)
		{
			case 1:
				return '000$initNumb';
			case 2:
				return '00$initNumb';
			case 3:
				return '0$initNumb';
			case 4:
				return initStrConv;
			default:
				return '0000';
		}
	}

	// the function meant to read the dat of the json and apply it to add atlas frames
	public static function fromI8(image:FlxGraphicAsset, desc:String):FlxAtlasFrames
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
		var data:AsepriteJsonData = Json.parse(desc);

		// used to find the frame we're on
		var frameTags:Array<AseprtieJsonMetaDataFrameTag> = data.meta.frameTags;

		// trace(data == null);
		// trace('class name 1 ' + Type.getClassName(Type.getClass(data.meta)));
		// trace('class name 2 ' + Type.getClassName(Type.getClass(data.frames)));
		trace(data.frames);

		var convFrames:Map<String, AsperiteFrameData> = cast(data.frames);

		trace(convFrames);

		var allChecksBefore:Iterator<String> = convFrames.keys();
		var allChecksOrdered:Map<Int, String> = [];

		var highestIndex:Int = 0;

		for (i in allChecksBefore)
		{
			var checkNumb:Int = Std.parseInt(i.substring(i.lastIndexOf(" "), i.lastIndexOf(".") - 1));
			allChecksOrdered.set(checkNumb, i);

			if (checkNumb > highestIndex)
				highestIndex = checkNumb;
		}

		highestIndex++;

		for (i in 0...highestIndex)
		{
			var frameData:AsperiteFrameData = convFrames.get(allChecksOrdered.get(i));

			var size:Rectangle;
			if (frameData.trimmed)
				size = new Rectangle(-frameData.spriteSourceSize.x, -frameData.spriteSourceSize.y, frameData.spriteSourceSize.w, frameData.spriteSourceSize.h);
			else
				size = new Rectangle(0, 0, frameData.sourceSize.x, frameData.sourceSize.y);
			var sourceSize = FlxPoint.get(size.width, size.height);

			if (frameData.rotated && !frameData.trimmed)
				sourceSize.set(size.height, size.width);

			var namee:String = thousandNumbFormat(i);

			for (o in frameTags)
				if (o.from >= i && o.to <= i)
					namee = '${o.name}${thousandNumbFormat(i)}';

			trace(namee);

			frames.addAtlasFrame(FlxRect.get(frameData.frame.x, frameData.frame.y, frameData.frame.w, frameData.frame.h), sourceSize,
				FlxPoint.get(-size.left, -size.top), namee, frameData.rotated ? 90 : 0, false, false);
		}

		return frames;
	}
}
