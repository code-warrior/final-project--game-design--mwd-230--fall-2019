// Authored by Daniel Shiffman
// Modifications by James Pinckney
// https://thecodingtrain.com/CodingChallenges/145-2d-ray-casting.html
// https://youtu.be/TOEi6T2mtHo

// 2D Ray Casting
// https://editor.p5js.org/codingtrain/sketches/Nqsq3DFv-

class Ray {
  //Position and DIrection
  PVector pos, dir;
  Ray(PVector _pos, float angle) {
    this.pos = _pos;
    this.dir = PVector.fromAngle(angle);
  }

  //Draw a line using the normal vector
  void lookAt(float x, float y) {
    this.dir.x = x - this.pos.x;
    this.dir.y = y - this.pos.y;
    this.dir.normalize();
  }

  //Show the line of the vector
  void show() {
    stroke(255);
    push();
    translate(this.pos.x, this.pos.y);
    line(0, 0, this.dir.x * 10, this.dir.y * 10);
    pop();
  }

  //Find the point at which the ray intersects with the wall
  PVector cast(Boundary wall) {
    float x1 = wall.wallVector1.x;
    float y1 = wall.wallVector1.y;
    float x2 = wall.wallVector2.x;
    float y2 = wall.wallVector2.y;

    float x3 = this.pos.x;
    float y3 = this.pos.y;
    float x4 = this.pos.x + this.dir.x;
    float y4 = this.pos.y + this.dir.y;

    float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    if (den == 0) {
      return null;
    }

    float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
    float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
    if (t > 0 && t < 1 && u > 0) {
      PVector pt = new PVector();
      pt.x = x1 + t * (x2 - x1);
      pt.y = y1 + t * (y2 - y1);
      return pt;
    } else {
      return null;
    }
  }
}
