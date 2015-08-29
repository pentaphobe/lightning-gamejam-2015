package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Vehicle extends FlxSprite {
	public var speed:Float = 300;
	public var control:VehicleControl;
	public var turnSpeed:Float = 5;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic)
	{
		super(X, Y, SimpleGraphic);

		makeGraphic(32, 32, FlxColor.BLUE);

		drag.x = drag.y = 800;
	}

	public function updateControls():Void {
		if (control != null) {
			control.update(this);
		}
	}

	// override public function create():Void {
	// 	super.create();
	// }

	// override public function destroy():Void {
	// 	super.destroy();
	// }

	override public function update():Void {
		updateControls();
		super.update();
	}
}
