package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

class PlayState extends FlxState
{

	private var hitmap : FlxTypedGroup<FlxSprite>;
	public static var width : Int = 720;
	public static var height : Int = 416;
	public static var box_height : Int = 32;

	override public function create():Void
	{
		super.create();
		createCollisionMap();
		collisions();
		add(hitmap);
	}

	private function createCollisionMap() {
		hitmap = new FlxTypedGroup<FlxSprite>(100);
	}

	private function collisions() {
		// Here create all of your collisions
		box(0, height-box_height, 150, box_height, FlxColor.WHITE);
		box(280, height-box_height, width-280, box_height, FlxColor.WHITE);
	}

	private function box(x:Int, y:Int, w:Int, h:Int, color:FlxColor) {
		var box = new FlxSprite();
		box.makeGraphic(w, h, color);
		box.x = x;
		box.y = y;
		hitmap.add(box);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
