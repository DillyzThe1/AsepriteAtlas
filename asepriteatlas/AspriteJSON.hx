package asepriteatlas;

import haxe.Json;
import lime.utils.Assets;

typedef AsepriteJsonData = {}

// class meant to parse the aseprite json format
class AspriteJSON
{
	public static function getFromFile(path:String):AsepriteJsonData
	{
		return Json.parse(Assets.getText(path));
	}
}
