// Authored by James Pinckney
import java.util.Iterator;
import controlP5.*;

ControlP5 cp5;
ArrayList<Boundary> walls;
Particle particle;
float particleXPos, particleYPos;
int finishX, finishY;
float MOVEMENT_SPEED = 10;
final static int PARTICLE_HEIGHT_WIDTH = 50;
int lastKeyPress = keyCode;
int levelNum = 0;
StringList levelNames;
boolean isUIVisible = true;

void setup() {
  size(1920, 1080);
  cp5 = new ControlP5(this);

  levelNames = listLevels();
  //System.out.println("levels/" + levelNames.get(levelNum));
  try {
    setInitialPosition(loadJSONObject("levels/" + levelNames.get(levelNum)));
  } catch (LevelFormatException e) {
    System.out.println(e);
  }
  walls = new ArrayList();
  //Top left corner to top right
  walls.add(new Boundary(particleXPos-199, particleYPos-199, particleXPos+201, particleYPos-199, 0));
  //top left corner to bottom left
  walls.add(new Boundary(particleXPos-199, particleYPos-199, particleXPos-199, particleYPos+201, 0));
  //top right corner to bottom right corner
  walls.add(new Boundary(particleXPos+201, particleYPos-199, particleXPos+201, particleYPos+201, 0));
  //bottom left corner to bottom right corner
  walls.add(new Boundary(particleXPos+201, particleYPos+201, particleXPos-199, particleYPos+201, 0));
  //Start Player in middle
  //particleXPos = width/2;
  //particleYPos = height/2;
  //Boundaries are just lines from x1, y1 to x2, y2 with color at the end
  //walls[0] = new Boundary(0, height/3, width, height/3, 0);
  //walls[1] = new Boundary(0, 2*(height/3), width, 2*(height/3), 0);
  particle = new Particle();
  setupLevelSelect(levelNames);
}

void draw() {
  if(!isUIVisible){
    cp5.remove("Level");
    cp5.remove("Play");
    background(0);
    for (Boundary wall : walls) {
      wall.show();
    }
    walls = new ArrayList();
    //Top left corner to top right
    walls.add(new Boundary(particleXPos-199, particleYPos-199, particleXPos+201, particleYPos-199, 0));
    //top left corner to bottom left
    walls.add(new Boundary(particleXPos-199, particleYPos-199, particleXPos-199, particleYPos+201, 0));
    //top right corner to bottom right corner
    walls.add(new Boundary(particleXPos+201, particleYPos-199, particleXPos+201, particleYPos+201, 0));
    //bottom left corner to bottom right corner
    walls.add(new Boundary(particleXPos+201, particleYPos+201, particleXPos-199, particleYPos+201, 0));
    try {
      drawLevel(loadJSONObject("levels/" + levelNames.get(levelNum)));
    } catch (LevelFormatException e) {
      System.out.println(e);
    }
    //System.out.println(walls.size());
    particle.update(particleXPos, particleYPos);
    particle.show();
    particle.look(walls);
  }
  else {
    background(0);
    textSize(128);
    fill(255);
    text("Into The Darkness", width/2-128*4.4, 150);
  }
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