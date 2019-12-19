class Player {
  constructor(speed) {
    //Animations
    this.animationRun = animationRun;
    this.animationRunL = this.animationRun.length;
    // this.animationJump = animationJump;
    // this.animationJumpL = this.animationJump.length;

    //How fast?
    this.speed = speed;

    //index of Animation Array
    this.index = 0;

    //is space clicked twice?
    this.spaceClickedTwice = false;

    //Positions of Player
    this.ground = 450;
    this.y = 450;
    this.x = 400;
    this.h = 274;
    this.w = 250;

    // Gravity, lift and velocity
    this.gravity = 7;
    this.lift = -315;
    this.velocity = 0;

    //Score
    this.score = 0;
  }

  //Draw animation/player
  show() {
    image(this.animationRun[this.index % this.animationRunL], 200, this.y);
  }

  //check if key is pressed then jump if conditions met
  jump() {
    if (keyWentDown(32) === true) {
      if (this.spaceClickedTwice != true || this.y === this.ground) {
        this.y += this.lift;
      }
    }
  }

  //Move character back to normal position after jump has been initiated
  move() {
    if (this.y < this.ground) {
      this.y += this.gravity;
    }

    //Space click set to true which stops allowing jump until this.y == this.ground
    if (this.y <= this.ground + this.lift) {
      this.spaceClickedTwice = true;
    }
  }

  //Updates variables back to start point when y position is equal to ground position
  update() {
    if (this.y === this.ground) {
      this.velocity = 0;
      this.spaceClickedTwice = false;
    }
  }

  //sets speed to animation
  animate() {
    this.index += this.speed;
  }

  // Did this Enemy collide with the player?
  hits(enemies) {
    if (this.x > enemies.x) {
      if (this.y + this.h > enemies.y + 50) {
        return true;
      }
    }
    return false;
  }
}
