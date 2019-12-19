class Foreground {
  constructor() {
    // Starts at the right edge
    this.x = width;

    // How fast
    this.speed = 2.5;

    //Widht of Foreground
    this.w = 1280;
  }

  // Draws the Background Images
  showOnce() {
    image(ForegroundImg, this.x - width, 0);
  }

  show() {
    image(ForegroundImg, this.x, 0);
  }

  // Updates X Position of Background
  update() {
    this.x -= this.speed;
  }

  // Check to see if Background moved off screen
  offscreen() {
    if (this.x < -this.w) {
      return true;
    } else {
      return false;
    }
  }
}
