package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxObject;

class Player extends FlxSprite {

  private var last_y: Float;
  private var jumping: Bool;

  override public function new() {
    super();
    makeGraphic(32, 32, FlxColor.RED);
    initializePhysic();
  }

  private function initializePhysic() {
    jumping = false;
    maxVelocity.x = 200;
		maxVelocity.y = 1200;
		acceleration.y = 2200;
    last_y = velocity.y;
  }

  public function falls(): Bool {
    return last_y != velocity.y;
  }

  public function jumps(): Bool {
    return jumping;
  }

  private function resetVelocityParameters() {
    var result = velocity.x / 2;
    velocity.x = result > 0 ? result : 0;
  }

  private function updateLateralMovement() {
    if (FlxG.keys.pressed.SPACE) {
      jump();
    }
    if (FlxG.keys.pressed.RIGHT) {
      velocity.x += maxVelocity.x / 5;
    } else if (FlxG.keys.pressed.LEFT) {
      velocity.x -= maxVelocity.x / 5;
    } else {
      resetVelocityParameters();
    }
  }

  public function jump() {
    if (!falls()) {
      jumping = true;
    }
  }

  private function updateJump() {
    if (jumps()) {
      velocity.y -= maxVelocity.y / 2;
      if (velocity.y <= -maxVelocity.y / 10) {
        jumping = false;
      }
    }
  }


  private function updatePhysic() {
    last_y = velocity.y;
    updateJump();
  }

  override public function update(elapsed:Float) {
    updateLateralMovement();
    updatePhysic();
    super.update(elapsed);
  }

}
