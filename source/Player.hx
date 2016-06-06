package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;

class Player extends FlxSprite {

  private var jumping: Bool;

  override public function new() {
    super();
    makeGraphic(32, 32, FlxColor.RED);
    initializePhysic();
  }

  private function initializePhysic() {
    jumping = false;
    maxVelocity.x = 1200;
		maxVelocity.y = 5000;
		acceleration.y = 2000;
  }

  private function resetVelocityParameters() {
    var result = velocity.x / 2;
    velocity.x = result > 0 ? result : 0;
  }

  private function updateKey() {
    if (FlxG.keys.pressed.RIGHT) {
      velocity.x += 10;
    } else if (FlxG.keys.pressed.LEFT) {
      velocity.x -= 10;
    } else {
      resetVelocityParameters();
    }
  }

  private function updatePhysic() {

  }

  override public function update(elapsed:Float) {
    super.update(elapsed);
    updatePhysic();
    updateKey();
  }

}
