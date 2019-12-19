class Ground {
  constructor() {
    // Starts at the right edge
    this.x = width;

    // How fast
    this.speed = 4.5;

    //Width of Ground
    this.w = 1280;
  }

  // Draws the Ground Images
  showOnce() {
    image(GroundImg, this.x - width, 0);
  }

  show() {
    image(GroundImg, this.x, 0);
  }

  // Updates X Position of Ground
  update() {
    this.x -= this.speed;
  }

  // Check to see if Ground moved off screen
  offscreen() {
    if (this.x < -this.w) {
      return true;
    } else {
      return false;
    }
  }
}
