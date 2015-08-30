package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
// import flixel.FlxTilemap;
import flixel.tile.FlxTileblock;

class Level extends FlxGroup {
	// var tileMap:FlxTilemap;
	var floor:FlxTileblock;

	public function new()
	{
		super();

		floor = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
		floor.loadTiles(AssetPaths.ground_tiles__png, 16, 16, 0);
		add(floor);

		var widthInTiles:Int = cast(FlxG.width / 16, Int);
		var heightInTiles:Int = cast(FlxG.height / 16, Int);

		for (x in 0...widthInTiles) {
			var block:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = x * 16;
			block.y = 0;
			block.immovable = true;
			add(block);
			block = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = x * 16;
			block.y = FlxG.height - 16;
			block.immovable = true;
			add(block);
		}

		for (y in 0...heightInTiles) {
			var block:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = 0;
			block.y = y * 16;
			block.immovable = true;
			add(block);
			block = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = FlxG.width - 16;
			block.y = y * 16;
			block.immovable = true;
			add(block);
		}

		// tileMap = new FlxTileMap();
		// add(tileMap);
	}

}
