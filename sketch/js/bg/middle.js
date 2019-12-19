class Middle {
  constructor() {
    // Starts at the right edge
    this.x = width;

    // How fast
    this.speed = 2.0;

    //Width of Middle
    this.w = 1280;
  }

  // Draws the Background Images
  showOnce() {
    image(Middle_Decor, this.x - width, 0);
  }

  show() {
    image(Middle_Decor, this.x, 0);
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
