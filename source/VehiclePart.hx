package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class VehiclePart extends FlxSprite {
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic)
	{
		super(X, Y, SimpleGraphic);

		init();

		// makeGraphic(32, 24, FlxColor.BLUE);
	}

	public function init():Void {
	}

	public function fire():Void {
	}

	public function accelerate(amount:Float):Void {
	}

	public function turn(amount:Float):Void {
	}
}
