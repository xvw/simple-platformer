package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		createTitle();
	}

	private function createTitle() {
		var text = new FlxText();
    	text.text = "A simple platformer";
    	text.color = FlxColor.YELLOW;
    	text.size = 32;
    	text.alignment = FlxTextAlign.CENTER;
    	text.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
    	text.screenCenter();
    	add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
