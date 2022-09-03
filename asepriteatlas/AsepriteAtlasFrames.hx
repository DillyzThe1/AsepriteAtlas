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
import haxe.Exception;
import haxe.Json;
import lime.utils.Assets;
import openfl.geom.Rectangle;

using Type;

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
		// trace('class name -2 ' + AsepriteAtlasFrames.getClassName());
		// trace('class name -1 ' + AseprtieJsonMetaData.getClassName());
		// trace('class name 0 ' + frameTags.getClass().getClassName());
		// trace('class name 1 ' + data.meta.getClass().getClassName());
		// trace('class name 2 ' + data.frames.getClass().getClassName());

		var highestIndex:Int = 0;
		for (o in frameTags)
			if (o.to > highestIndex)
				highestIndex = o.to;
		highestIndex++;
		// trace(highestIndex);
		// trace(data.frames);
		// trace(frameTags);

		var imgName:String = data.meta.image.substring(0, data.meta.image.lastIndexOf('.'));
		// trace(imgName);

		for (i in 0...highestIndex)
		{
			try
			{
				var frameData:AsperiteFrameData = Reflect.getProperty(data.frames, '$imgName $i.aseprite');
				// trace(frameData);

				var size:Rectangle;
				if (frameData.trimmed)
					size = new Rectangle(-frameData.spriteSourceSize.x, -frameData.spriteSourceSize.y, frameData.spriteSourceSize.w,
						frameData.spriteSourceSize.h);
				else
					size = new Rectangle(0, 0, frameData.sourceSize.x, frameData.sourceSize.y);
				var sourceSize = FlxPoint.get(size.width, size.height);

				if (frameData.rotated && !frameData.trimmed)
					sourceSize.set(size.height, size.width);

				var namee:String = thousandNumbFormat(i);

				for (o in frameTags)
				{
					if (i >= o.from && i <= o.to)
						namee = '${o.name}${thousandNumbFormat(i)}';
				}

				// trace(namee);

				frames.addAtlasFrame(FlxRect.get(frameData.frame.x, frameData.frame.y, frameData.frame.w, frameData.frame.h), sourceSize,
					FlxPoint.get(-size.left, -size.top), namee, frameData.rotated ? 90 : 0, false, false);
			}
			catch (e:Exception)
			{
				trace('Error parsing/recieving frame! ${e} (Are you using the .asperite format?)\n${e.message}');
			}
		}

		return frames;
	}
}
