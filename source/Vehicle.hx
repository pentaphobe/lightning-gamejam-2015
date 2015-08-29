package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;

import parts.*;

class Vehicle extends FlxSprite {
	static var degToRad:Float = Math.PI / 180.0;

	public var speed:Float = 300;
	public var control:VehicleControl;
	public var turnSpeed:Float = 5;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic)
	{
		super(X, Y, SimpleGraphic);

		// makeGraphic(32, 32, FlxColor.BLUE);

		drag.x = drag.y = 1800;
	}

	public function updateControls():Void {
		if (control != null) {
			control.update(this);
		}
	}

	public function fire():Void {
	}

	public function accelerate(amount:Float):Void {
		acceleration.x = amount * speed * Math.cos(angle * degToRad);
		acceleration.y = amount * speed * Math.sin(angle * degToRad);
	}

	public function turn(amount:Float):Void {
		angle += amount * turnSpeed;
	}

	override public function update():Void {
		updateControls();
		super.update();
	}
}
