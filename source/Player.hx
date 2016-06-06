package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;

class Player extends FlxSprite {

  private var last_y: Float;

  override public function new() {
    super();
    makeGraphic(32, 32, FlxColor.RED);
    initializePhysic();
  }

  private function initializePhysic() {
    maxVelocity.x = 1200;
		maxVelocity.y = 5000;
		acceleration.y = 2000;
    last_y = velocity.y;
  }

  public function falls(): Bool {
    return last_y != velocity.y;
  }

  private function resetVelocityParameters() {
    var result = velocity.x / 2;
    velocity.x = result > 0 ? result : 0;
  }

  private function updateLateralMovement() {
    if (FlxG.keys.pressed.RIGHT) {
      velocity.x += 10;
    } else if (FlxG.keys.pressed.LEFT) {
      velocity.x -= 10;
    } else {
      resetVelocityParameters();
    }
  }

  public function jump() {
    trace("JUMP!");
  }

  private function updatePhysic() {
    if (!falls()) {
      updateJump();
    }
    last_y = velocity.y;
  }

  private function updateJump() {
    if (FlxG.keys.pressed.SPACE) {
      jump();
    }
  }

  override public function update(elapsed:Float) {
    super.update(elapsed);
    updateLateralMovement();
    updatePhysic();
  }

}
