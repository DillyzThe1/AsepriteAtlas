# AsepriteAtlas
 A haxelib meant for parsing the Asprite JSON format & making a frame atlas.<br>
 Install by typing `haxelib install asepriteatlas` in any shell such as command prompt.

# Setup (Aseprite)
1. Properly tag your animations.<br>
![GitHub Logo](/guide/guide0.png)<br/>
2. Select all frames.<br>
![GitHub Logo](/guide/guide1.png)<br/>
3. File > Export Sprite Sheet<br>
4. (optional) Edit the "Borders" tab for optimization<br>
![GitHub Logo](/guide/guide2.png)<br/>
5. Go to output and enable both JSON and PNG output.<br>
6. Export!<br>

# Usage (HaxeFlixel)
1. Add <haxelib name="asepriteatlas"/> to Project.xml
2. Initiate an FlxSprite. (flixel.FlxSprite)<br>
3. Set the FlxSprite variable "frames" to "asepriteatlas.AsepriteAtlasFrames.fromI8('assets/images/spr.png', 'assets/images/spr.json')";<br>
4. For every animation you want, use "animation.addByPrefix('yourAnimName', 'Tag Name', 12, false, false, false);"<br>
5. Add it to the game & play animation using "animation.play('yourAnimName', true);"<br>
6. Compile<br>
<br>
Visual example:<br>
<img align="left" src="guide/example.png"><br>
