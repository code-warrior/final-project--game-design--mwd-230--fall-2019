class Sky {
  constructor() {
    // Starts at the right edge
    this.x = width;

    // How fast
    this.speed = 1.0;

    //Width of Sky
    this.w = 1280;
  }

  // Draws the Background Images
  showOnce() {
    image(SkyImg, this.x - width, 0);
  }

  //Draw Sky
  show() {
    image(SkyImg, this.x, 0);
  }

  // Updates X position of Background
  update() {
    this.xsky -= this.speed;
  }

  // Check to see if Background moves off screen
  offscreen() {
    if (this.x < -this.w) {
      return true;
    } else {
      return false;
    }
  }
}
