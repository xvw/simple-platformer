package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Box extends FlxSprite {
  override public function new(_x:Int, _y:Int, w:Int, h:Int) {
    super();
    makeGraphic(w, h, FlxColor.WHITE);
    x = _x;
    y = _y;
    immovable = true;
  }
}
