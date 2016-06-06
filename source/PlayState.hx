package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.FlxObject;

class PlayState extends FlxState
{

	private var hitmap : FlxTypedGroup<FlxSprite>;
	private var player : Player;
	public static var width : Int = 720;
	public static var height : Int = 416;
	public static var box_height : Int = 32;

	override public function create():Void
	{
		super.create();
		createCollisionMap();
		collisions();
		add(hitmap);
		initializePlayer();
	}

	private function initializePlayer() {
		player = new Player();
		add(player);
	}

	private function createCollisionMap() {
		hitmap = new FlxTypedGroup<FlxSprite>(100);
		// Box the level
		box(0, -1, width, 1, FlxColor.WHITE);
		box(-1, 0, 1, height, FlxColor.WHITE);
		box(width+1, 1, 1, height, FlxColor.WHITE);		
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
		box.immovable = true;
		hitmap.add(box);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.overlap(hitmap, player, FlxObject.separate);
	}
}
