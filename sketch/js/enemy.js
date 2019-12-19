class Enemy {
  constructor() {
    // Random for y position to display enemy at different heights
    let randomTop = random(126, 170);

    // Y position of Enemy
    this.y = height - randomTop;

    // Starts at the edge
    this.x = width;

    // How fast
    this.speed = speed;
  }

  // Draw Enemy
  show() {
    image(enemy, this.x, this.y);
  }

  // Update X position of Enemy
  update() {
    this.x -= this.speed;
  }

  // Check to see if Background moves off screen
  offscreen() {
    if (this.x < enemy.width - 100) {
      return true;
    } else {
      return false;
    }
  }
}
