// Authored by Daniel Shiffman
// Modifications by James Pinckney
// https://thecodingtrain.com/CodingChallenges/145-2d-ray-casting.html
// https://youtu.be/TOEi6T2mtHo

// 2D Ray Casting
// https://editor.p5js.org/codingtrain/sketches/Nqsq3DFv-

class Boundary {
  //Simple boundary. (It's really just a line, but we use vectors so we can do math on them in the Ray class)
  PVector wallVector1, wallVector2;
  color c;
  Boundary(float x1, float y1, float x2, float  y2, color c) {
    this.wallVector1 = new PVector(x1, y1);
    this.wallVector2 = new PVector(x2, y2);
    this.c = c;
  }

  void show() {
    stroke(c);
    line(this.wallVector1.x, this.wallVector1.y, this.wallVector2.x, this.wallVector2.y);
  }
}
