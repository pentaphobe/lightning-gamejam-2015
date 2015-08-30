package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;

import parts.*;

/**
 * This is an inheritance version of the vehicle
 *
 * Should only be used for rapid prototyping, as it duplicates a lot of
 * functionality which is compositional elsewhere
 */
class BasicVehicle extends Vehicle {
	var attackDelay:Float = 5;
	var attackTimeoutCounter:Float = 0;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic)
	{
		super(X, Y, SimpleGraphic);

		attackTimeoutCounter = attackDelay;
		makeGraphic(32, 24, FlxColor.BLUE);
	}

	override public function fire():Void {
		super.fire();

		if (attackTimeoutCounter < attackDelay) {
			return;
		}

		attackTimeoutCounter = 0;
		// [@todo NAUGHTY - shouldn't need PlayState to be a singleton]
		var playState = PlayState.get();
		var bullet:FlxSprite = playState.addPlayerBullet(new FlxSprite(x, y));
		var bulletSpeed:Float = 600;

		bullet.velocity.x = velocity.x + Math.cos(angle * Math.PI / 180.0)*bulletSpeed;
		bullet.velocity.y = velocity.y + Math.sin(angle * Math.PI / 180.0)*bulletSpeed;
		bullet.angularVelocity = 300;

		AssetPaths.shootSound.play();
	}

	override public function update():Void {
		super.update();
		attackTimeoutCounter++;
	}

	override public function accelerate(amount:Float):Void {
		super.accelerate(amount);
	}

	override public function turn(amount:Float):Void {
		super.turn(amount);
	}
}
