package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenOptions;

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
		box(0, -1, width, 1);
		box(-1, 0, 1, height);
		box(width+1, 1, 1, height);
	}

	private function collisions() {
		// Here create all of your collisions
		box(0, height-box_height, 150, box_height);
		box(280, height-box_height, width-280, box_height);
		// Movable platform
		var b = box(420, height-(box_height*3) + 12, 200, box_height);
		FlxTween.tween(b, { y: 220 }, 1, { type: FlxTween.PINGPONG });
	}

	private function box(x:Int, y:Int, w:Int, h:Int) : Box {
		var box = new Box(x, y, w, h);
		hitmap.add(box);
		return box;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player, hitmap);
	}
}
