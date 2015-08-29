package;

import flixel.system.FlxSound;
import flixel.FlxG;

@:build(flixel.system.FlxAssets.buildFileReferences("assets", true))
class AssetPaths {
	public static var shootSound:FlxSound;
	public static var deathSound:FlxSound;

	public static function init() {
		shootSound = FlxG.sound.load(shoot__mp3);
		deathSound = FlxG.sound.load(explode__mp3);
	}
}
