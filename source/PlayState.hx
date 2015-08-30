package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;

import controls.*;
import parts.*;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private static var instance:PlayState = null;

	var player:Vehicle;
	var playerGroup:FlxGroup;
	var enemyGroup:FlxGroup;
	var enemyBulletGroup:FlxGroup;
	var playerBulletGroup:FlxGroup;
	var scenery:Level;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();
		instance = this;
		setupGroups();

		player = new BasicVehicle();
		player.x = FlxG.width / 2;
		player.y = FlxG.height / 2;
		player.control = new PlayerControl();
		player.mass = 10;
		playerGroup.add(player);

		for (i in 0...10) {
			var testEnemy:Vehicle = new BasicVehicle();
			testEnemy.x = Math.random() * FlxG.width;
			testEnemy.y = Math.random() * FlxG.height;
			testEnemy.control = new DummyControl();
			testEnemy.health = 10;
			testEnemy.mass = 10;
			enemyGroup.add(testEnemy);
		}
	}

	function setupGroups():Void {
		playerGroup = new FlxGroup();
		enemyGroup = new FlxGroup();
		playerBulletGroup = new FlxGroup();
		enemyBulletGroup = new FlxGroup();
		scenery = new Level();


		add(scenery);
		add(playerGroup);
		add(enemyGroup);
		add(enemyBulletGroup);
		add(playerBulletGroup);
	}

	public function addPlayerBullet(bullet:FlxSprite):FlxSprite {
		playerBulletGroup.add(bullet);
		return bullet;
	}

	public function addEnemyBullet(bullet:FlxSprite):FlxSprite {
		enemyBulletGroup.add(bullet);
		return bullet;
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		instance = null;
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

		doCollisions();
	}

	public function doCollisions():Void {
		FlxG.collide(playerGroup, enemyGroup);
		FlxG.collide(playerGroup, scenery);
		FlxG.collide(enemyGroup, scenery);

		// collide bullets
		FlxG.collide(enemyBulletGroup, playerBulletGroup);
		FlxG.collide(playerBulletGroup, enemyGroup);
		FlxG.collide(enemyBulletGroup, playerGroup);
		FlxG.collide(playerBulletGroup, scenery);
		FlxG.collide(enemyBulletGroup, scenery);

		FlxG.overlap(playerBulletGroup, enemyGroup, function (first, second) {
			second.hurt(1 /*player.stats.strength*/);
			// second.flicker(1.5);
			var dx:Float = second.x - player.x;
			var dy:Float = second.y - player.y;
			var div:Float = Math.max(Math.abs(dx), Math.abs(dy));
			dx /= div;
			dy /= div;
			var knockback:Float = 500;
			second.velocity.x += dx * knockback;
			second.velocity.y += dy * knockback;
			AssetPaths.deathSound.play();
			// hitEnemy = true;
		});
	}

	public static function get():PlayState {
		return instance;
	}
}
