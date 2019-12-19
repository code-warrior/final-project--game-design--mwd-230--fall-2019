// Authored by James Pinckney
import java.util.Iterator;
//Require controlP5
import controlP5.*;

ControlP5 cp5;
ArrayList<Boundary> walls;
Boundary[] wallsRay = new Boundary[5+4];
Particle particle;

float particleXPos, particleYPos;
float xoff = 0;
float yoff = 10000;

final static float MOVEMENT_SPEED = 10;

final static int PARTICLE_DIAMETER = 50;
int finishX, finishY;
int lastKeyPress = keyCode;
int levelNum = 0;

StringList levelNames;

boolean isUIVisible = true;

String levelNameNice;

void setup() {
  size(1920, 1080);
  cp5 = new ControlP5(this);

  //Grab a list of the levels
  levelNames = listLevels();
  
  //Generate random walls for the Title Screen
  for (int i = 0; i < wallsRay.length; i++) {
    float x1 = random(width);
    float x2 = random(width);
    float y1 = random(height);
    float y2 = random(height);
    wallsRay[i] = new Boundary(x1, y1, x2, y2, 255);
  }

  //This walls array is for the actual level
  walls = new ArrayList();

  //This is the player 
  particle = new Particle();

  //Try to parse the levels - See LevelLoader.pde
  try {
    setupLevelSelect(levelNames);
  } catch (LevelFormatException e) {
    System.out.println(e);
  }
}

void draw() {
  //If it is first load then the UI is visible and we see the title screen
  if(!isUIVisible){
    //Remove UI elements
    cp5.remove("Level");
    cp5.remove("Play");
    background(0);
    textSize(32);
    fill(255);
    text(levelNameNice, 0, height-10);
    //Show level walls
    for (Boundary wall : walls) {
      wall.show();
    }
    //These 4 walls are the boundary of the rays - the farthest the rays will go out
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
    //Move the player
    particle.update(particleXPos, particleYPos);
    particle.show();
    //Cast rays at the walls
    particle.look(walls);
    //End state particle
    Particle end = new Particle();
    end.update(finishX, finishY);
    end.show();
    //Collision detection for ending
    if(pointCircle(finishX, finishY, particle.pos.x, particle.pos.y, PARTICLE_DIAMETER/2)) {
      isUIVisible = !isUIVisible;
      try {
        setupLevelSelect(levelNames);
      } catch (LevelFormatException e) {
        System.out.println(e);
      }
    }
  }
  else {
    //UI Code
    background(0);
    //Dan Schiffmans original code is here as the background to the Title Screen
    wallsRay[wallsRay.length-4] = (new Boundary(0, 0, width, 0, 0));
    wallsRay[wallsRay.length-3] = (new Boundary(width, 0, width, height, 0));
    wallsRay[wallsRay.length-2] = (new Boundary(width, height, 0, height, 0));
    wallsRay[wallsRay.length-1] = (new Boundary(0, height, 0, 0, 0));
    for (Boundary wall : wallsRay) {
      wall.show();
    }
    particle.update(noise(xoff) * width, noise(yoff) * height);
    particle.show();
    particle.look(wallsRay);

    xoff += 0.01;
    yoff += 0.01;
    //Title
    textSize(128);
    fill(255);
    text("Into The Darkness", width/2-128*4.4, 150);
  }
}

boolean hasCollided() {
  boolean result = false;
  for(Boundary wall : walls) {
    //Use library in CollisionDetection.pde
    result = lineCircle(wall.wallVector1.x, wall.wallVector1.y, wall.wallVector2.x, wall.wallVector2.y, particle.pos.x, particle.pos.y, PARTICLE_DIAMETER/2);
    if(result){
      return result;
    }
  }
  return result;
}

void keyPressed() {
  //Make sure that the last key pressed is not pressed again. This makes it so that the player can move away from the wall.
  if(!hasCollided() || keyCode != lastKeyPress) {
    //Walls of the screen
    if(keyCode == 38 && particleYPos > 0) {
      particleYPos -= MOVEMENT_SPEED;
    }
    else if(keyCode == 40 && particleYPos < height - PARTICLE_DIAMETER/2) {
      particleYPos += MOVEMENT_SPEED;
    }
    else if(keyCode == 37 && particleXPos > 0) {
      particleXPos -= MOVEMENT_SPEED;
    }
    else if(keyCode == 39 && particleXPos < width - PARTICLE_DIAMETER/2) {
      particleXPos += MOVEMENT_SPEED;
    }
  }
  lastKeyPress = keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40 ? keyCode : lastKeyPress;
}
