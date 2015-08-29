package;

import flixel.FlxG;

class PlayerControl extends VehicleControl {
	var degToRad:Float = Math.PI / 180.0;

	public function new() {  }

	override public function update(target:Vehicle):Void {
		var upPressed:Bool = false;
		var downPressed:Bool = false;
		var leftPressed:Bool = false;
		var rightPressed:Bool = false;

		var turnAmount:Float = 0;
		var moveAmount:Float = 0;

		upPressed = FlxG.keys.anyPressed(["UP", "W"]);
		downPressed = FlxG.keys.anyPressed(["DOWN", "S"]);
		leftPressed = FlxG.keys.anyPressed(["LEFT", "A"]);
		rightPressed = FlxG.keys.anyPressed(["RIGHT", "D"]);

		if (rightPressed) {
			turnAmount += 1;
		}
		if (leftPressed) {
			turnAmount -= 1;
		}
		target.angle += turnAmount * target.turnSpeed;

		if (upPressed) {
			moveAmount = 1;
		} else if (downPressed) {	// intentionally prioritising forward
			moveAmount = -0.8;
		}

		target.acceleration.x = moveAmount * target.speed * Math.cos(target.angle * degToRad);
		target.acceleration.y = moveAmount * target.speed * Math.sin(target.angle * degToRad);

	}
}
