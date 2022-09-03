# AsepriteAtlas
 A haxelib meant for parsing the Asprite JSON format & making a frame atlas.

# Setup (Aseprite)
1. Properly tag your animations.<br>
<p align="left">
	<img align="left" src="guide and project files/guide0.png">
</p>
<br>2. Select all frames.<br>
<p align="left">
	<img align="left" src="guide and project files/guide1.png">
</p>
<br>3. File > Export Sprite Sheet<br>
4. (optional) Edit the "Borders" tab for optimization<br>
<p align="left">
	<img align="left" src="guide and project files/guide2.png">
</p>
<br>5. Go to output and enable both JSON and PNG output.<br>
6. Export!<br>

# Usage (Haxe)
1. Add <haxelib name="asepriteatlas"/> to Project.xml
2. Initiate an FlxSprite. (flixel.FlxSprite)<br>
3. Set the FlxSprite variable "frames" to "asepriteatlas.AsepriteAtlasFrames.fromI8('assets/images/spr.png', 'assets/images/spr.json')";<br>
4. For every animation you want, use "animation.addByPrefix('yourAnimName', 'Tag Name', 12, false, false, false);"<br>
5. Add it to the game & play animation using "animation.play('yourAnimName', true);"<br>
6. Compile<br>
<br>
Visual example:<br>
<img align="left" src="guide and project files/example.png"><br>