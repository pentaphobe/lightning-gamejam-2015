package;

import flixel.FlxG;

class DummyControl extends VehicleControl {

	public function new() {  }

	override public function update(target:Vehicle):Void {
		if (Math.random() > 0.5) {
			target.accelerate(0.25);
		}
		target.turn(1);
	}
}
