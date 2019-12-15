// Authored by James Pinckney

Boundary[] walls;
Particle particle;
float particleXPos, particleYPos;
float MOVEMENT_SPEED = 10;
final static int PARTICLE_HEIGHT_WIDTH = 50;
int lastKeyPress = keyCode;
int levelNum = 0;

void setup() {
  size(1920, 1080);
  StringList levelNames = listLevels();
  drawLevel(loadJSONObject(levelNames.get(levelNum)));


  //Start Player in middle
  //particleXPos = width/2;
  //particleYPos = height/2;
  //Boundaries are just lines from x1, y1 to x2, y2 with color at the end
  walls = new Boundary[4];
  //walls[0] = new Boundary(0, height/3, width, height/3, 0);
  //walls[1] = new Boundary(0, 2*(height/3), width, 2*(height/3), 0);
  walls[walls.length-4] = (new Boundary(particleXPos-99, particleYPos-99, particleXPos+101, particleYPos-99, 0));
  //top left corner to bottom left
  walls[walls.length-3] = (new Boundary(particleXPos-99, particleYPos-99, particleXPos-99, particleYPos+101, 0));
  //top right corner to bottom right corner
  walls[walls.length-2] = (new Boundary(particleXPos+101, particleYPos-99, particleXPos+101, particleYPos+101, 0));
  //bottom left corner to bottom right corner
  walls[walls.length-1] = (new Boundary(particleXPos+101, particleYPos+101, particleXPos-99, particleYPos+101, 0));
  particle = new Particle();
}

void draw() {
  background(0);
  drawLevel(loadJSONObject(levelNames.get(levelNum)));
  for (Boundary wall : walls) {
    wall.show();
  }
  //Top left corner to top right
  walls[walls.length-4] = (new Boundary(particleXPos-99, particleYPos-99, particleXPos+101, particleYPos-99, 0));
  //top left corner to bottom left
  walls[walls.length-3] = (new Boundary(particleXPos-99, particleYPos-99, particleXPos-99, particleYPos+101, 0));
  //top right corner to bottom right corner
  walls[walls.length-2] = (new Boundary(particleXPos+101, particleYPos-99, particleXPos+101, particleYPos+101, 0));
  //bottom left corner to bottom right corner
  walls[walls.length-1] = (new Boundary(particleXPos+101, particleYPos+101, particleXPos-99, particleYPos+101, 0));
  particle.update(particleXPos, particleYPos);
  particle.show();
  particle.look(walls);
}

boolean hasCollided() {
  boolean result = false;
  for(Boundary wall : walls) {
    //Use library in CollisionDetection.pde
    result = lineCircle(wall.wallVector1.x, wall.wallVector1.y, wall.wallVector2.x, wall.wallVector2.y, particle.pos.x, particle.pos.y, PARTICLE_HEIGHT_WIDTH/2);
    if(result){
      return result;
    }
  }
  return result;
}

void keyPressed() {
  if(!hasCollided() || keyCode != lastKeyPress) {
    if(keyCode == 38 && particleYPos > 0) {
      particleYPos -= MOVEMENT_SPEED;
    }
    else if(keyCode == 40 && particleYPos < height - PARTICLE_HEIGHT_WIDTH) {
      particleYPos += MOVEMENT_SPEED;
    }
    else if(keyCode == 37 && particleXPos > 0) {
      particleXPos -= MOVEMENT_SPEED;
    }
    else if(keyCode == 39 && particleXPos < width - PARTICLE_HEIGHT_WIDTH) {
      particleXPos += MOVEMENT_SPEED;
    }
    //Debugging
    else {
      
      //left up right down
      // 37  38 39    40
    }
  }
  lastKeyPress = keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40 ? keyCode : lastKeyPress;
  //System.out.println("No way jose " + key + " " + keyCode + " " + starting_x + " " + starting_y + " Has collided: " + hasCollided(currentPoints, TOTAL_WIDTH, TOTAL_HEIGHT));
}