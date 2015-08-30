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



		for (x in 0...FlxG.width) {
			var block:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = x;
			block.y = 0;
			block.frame = 1;
			add(block);
			block = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = x;
			block.y = FlxG.height - 16;
			add(block);
		}

		for (y in 0...FlxG.height) {
			var block:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = 0;
			block.y = y;
			add(block);
			block = new FlxSprite().loadGraphic(AssetPaths.tiles__png, true, 16, 16);
			block.x = FlxG.width - 16;
			block.y = y;
			add(block);
		}

		// tileMap = new FlxTileMap();
		// add(tileMap);
	}

}
