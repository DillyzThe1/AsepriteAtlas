package asepriteatlas;

import haxe.Json;
import lime.utils.Assets;

// layer data but you dont need it
typedef AseprtieJsonMetaLayerData =
{
	var name:String;
	var opacity:Int;
	var blendMode:String;
}

// frame tag i could use for animation adding
typedef AseprtieJsonMetaDataFrameTag =
{
	var name:String;
	var from:Int;
	var to:Int;
	var direction:String;
	var color:String;
}

// for stuff like size
typedef BoxDataLol =
{
	var x:Int;
	var y:Int;
	var w:Int;
	var h:Int;
}

// for the meta tag
typedef AseprtieJsonMetaData =
{
	var app:String;
	var version:String;
	var image:String;
	var format:String;
	var size:BoxDataLol;
	var scale:String; // why a string?!
	var frameTags:Array<AseprtieJsonMetaDataFrameTag>;
}

typedef AsperiteFrameData =
{
	var frame:BoxDataLol;
	var rotated:Bool;
	var trimmed:Bool;
	var spriteSourceSize:BoxDataLol;
	var sourceSize:BoxDataLol;
	var duration:Int;
}

// main json
typedef AsepriteJsonData =
{
	var frames:Dynamic; // Map<String, AsperiteFrameData>;
	var meta:AseprtieJsonMetaData;
}

// class meant to parse the aseprite json format
class AspriteJSON
{
	public static function getFromFile(path:String):AsepriteJsonData
	{
		return Json.parse(Assets.getText(path));
	}
}
