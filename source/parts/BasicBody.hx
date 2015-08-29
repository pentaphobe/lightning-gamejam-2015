package parts;

import flixel.util.FlxColor;

class BasicBody extends VehiclePart {
	override public function init():Void {
		makeGraphic(32, 24, FlxColor.BLUE);
	}
}
