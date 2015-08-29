package parts;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class BasicGun extends VehiclePart {
	override public function init():Void {
		makeGraphic(24, 8, FlxColor.RED);
	}

	override public function fire():Void {
		// [@todo NAUGHTY - shouldn't need PlayState to be a singleton]
		var playState = PlayState.get();
		var bullet:FlxSprite = playState.addPlayerBullet(new FlxSprite(x, y));
		var bulletSpeed:Float = 200;

		bullet.velocity.x = velocity.x + Math.cos(angle * Math.PI / 180.0)*bulletSpeed;
		bullet.velocity.y = velocity.y + Math.sin(angle * Math.PI / 180.0)*bulletSpeed;
		bullet.angularVelocity = 300;
	}
}
