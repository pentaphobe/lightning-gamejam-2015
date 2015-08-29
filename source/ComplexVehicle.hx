package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;

import parts.*;

class ComplexVehicle extends Vehicle {
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic)
	{
		super(X, Y, SimpleGraphic);

		//add(new FlxSprite(0, 0).makeGraphic(32, 32, FlxColor.BLUE));
		add(new BasicBody());
		add(new BasicGun());
	}

	override public function fire():Void {
		super.fire();
		forEachOfType(VehiclePart, function (child) {
			child.fire();
		});
	}

	override public function accelerate(amount:Float):Void {
		super.accelerate(amount);

		forEachOfType(VehiclePart, function (child) {
			child.accelerate(amount);
		});
	}

	override public function turn(amount:Float):Void {
		super.turn(amount);

		forEachOfType(VehiclePart, function (child) {
			child.turn(amount);
		});
	}
}
