// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/145-2d-ray-casting.html
// https://youtu.be/TOEi6T2mtHo

// 2D Ray Casting
// https://editor.p5js.org/codingtrain/sketches/Nqsq3DFv-

class Boundary {
  PVector a, b;
  float x, y, diameter;
  color c;
  Boundary(float x1, float y1, float x2, float  y2, color c) {
    this.a = new PVector(x1, y1);
    this.b = new PVector(x2, y2);
    this.c = c;
  }

  void show() {
    stroke(c);
    line(this.a.x, this.a.y, this.b.x, this.b.y);
  }
}
