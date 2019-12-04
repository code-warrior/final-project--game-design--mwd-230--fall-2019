// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/145-2d-ray-casting.html
// https://youtu.be/TOEi6T2mtHo

// 2D Ray Casting
// https://editor.p5js.org/codingtrain/sketches/Nqsq3DFv-

Boundary[] walls;
//Ray ray;
Particle particle;
float xoff = 0;
float yoff = 10000;

void setup() {
  size(1920, 1080);
  walls = new Boundary[5+4];
  for (int i = 0; i < walls.length; i++) {
    float x1 = random(width);
    float x2 = random(width);
    float y1 = random(height);
    float y2 = random(height);
    walls[i] = new Boundary(x1, y1, x2, y2, 255);
  }
  
  particle = new Particle();
}

void draw() {
  background(0);
  for (Boundary wall : walls) {
    wall.show();
  }
  //Top left corner to top right
  walls[walls.length-4] = (new Boundary(mouseX-99, mouseY-99, mouseX+101, mouseY-99, 0));
  //top left corner to bottom left
  walls[walls.length-3] = (new Boundary(mouseX-99, mouseY-99, mouseX-99, mouseY+101, 0));
  //top right corner to bottom right corner
  walls[walls.length-2] = (new Boundary(mouseX+101, mouseY-99, mouseX+101, mouseY+101, 0));
  //bottom left corner to bottom right corner
  walls[walls.length-1] = (new Boundary(mouseX+101, mouseY+101, mouseX-99, mouseY+101, 0));
  particle.update(mouseX, mouseY);
  particle.show();
  particle.look(walls);

  xoff += 0.01;
  yoff += 0.01;
}
