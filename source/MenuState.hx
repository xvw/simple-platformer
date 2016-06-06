package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		disableCursor();
		createTitle();
	}

	private function disableCursor() {
		FlxG.mouse.visible = false;
	}

	private function createTitle() {
		var text = createText("A jumping square", 46);
  	text.screenCenter();
  	add(text);
	}

	private function createText(txt:String, size:Int) {
		var text = new FlxText();
		text.text = txt;
		text.size = size;
		text.color = FlxColor.WHITE;
		return text;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
