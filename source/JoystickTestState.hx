package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;

class JoystickTestState extends FlxState {
	var playerInputs:Array<FlxGamepad> = new Array<FlxGamepad>();

	override public function create():Void {
		super.create();

		#if (!FLX_NO_JOYSTICK && (cpp || neko))
		for (i in 0...1) {
			playerInputs[i] = FlxG.gamepads.getByID(i);
		}
		trace(FlxG.gamepads.getActiveGamepadIDs());
		trace(FlxG.gamepads.numActiveGamepads);
		#else
		FlxG.log("Joysticks aren't supported on this platform");
		#end
	}

	override public function update():Void {
		super.update();

		for (i in 0...1) {
			var joy:FlxGamepad = playerInputs[i];
			var xAxis = joy.getAxis(0);
			var yAxis = joy.getAxis(1);

			trace('$i: $xAxis, $yAxis');
		}
	}

	override public function destroy():Void {
		super.destroy();
	}
}
