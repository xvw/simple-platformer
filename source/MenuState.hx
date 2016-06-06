package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	// Constructor
	override public function create():Void {
		super.create();
		disableCursor();
		createTitle();
	}

	// Disable the cursor of the game
	private function disableCursor() {
		FlxG.mouse.visible = false;
	}

	// Draw title on the state
	private function createTitle() {
		var text = createText("A jumping square", 46);
  	text.screenCenter();
  	add(text);
	}

	// Create a txt object
	private function createText(txt:String, size:Int) {
		var text = new FlxText();
		text.text = txt;
		text.size = size;
		text.color = FlxColor.WHITE;
		return text;
	}

	// Update Keyboard statement
	private function updateKeyboard() {
		if(FlxG.keys.justReleased.ENTER) {
			FlxG.switchState(new PlayState());
		}
	}

	// General update
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		updateKeyboard();
	}
}
