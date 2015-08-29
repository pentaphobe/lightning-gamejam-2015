package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;

import parts.*;

class Vehicle extends FlxSpriteGroup {
	static var degToRad:Float = Math.PI / 180.0;

	public var speed:Float = 300;
	public var control:VehicleControl;
	public var turnSpeed:Float = 5;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic)
	{
		super(X, Y, SimpleGraphic);

		//add(new FlxSprite(0, 0).makeGraphic(32, 32, FlxColor.BLUE));
		add(new BasicBody());
		add(new BasicGun());

		drag.x = drag.y = 800;
	}

	public function updateControls():Void {
		if (control != null) {
			control.update(this);
		}
	}

	public function fire():Void {
		forEachOfType(VehiclePart, function (child) {
			child.fire();
		});
	}

	public function accelerate(amount:Float):Void {
		acceleration.x = amount * speed * Math.cos(angle * degToRad);
		acceleration.y = amount * speed * Math.sin(angle * degToRad);

		forEachOfType(VehiclePart, function (child) {
			child.accelerate(amount);
		});
	}

	public function turn(amount:Float):Void {
		angle += amount * turnSpeed;

		forEachOfType(VehiclePart, function (child) {
			child.turn(amount);
		});
	}

	override public function update():Void {
		updateControls();
		super.update();
	}
}
