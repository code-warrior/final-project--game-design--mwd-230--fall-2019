// enemies
let enemies = [];
let speed = 20;

// A frame counter to determine when to add a new Background or Player/Enemy
let counter = 0;

//Level Variable
let setLevel;

//Starts Game
let gameStart = false;

//Space key variable
let spaceClicked = false;

//Array of backgorunds
let sky = [];
let decor = [];
let middle = [];
let foreground = [];
let ground = [];

//Background Images
let SkyImg;
let BG_Decor;
let Middle_Decor;
let ForegroundImg;
let GroundImg;

//Player/Enemy Images
let enemy;

let player;
let playerJump;

let playerSprite;
let playerData;

let jumpSprite;
let jumpData;

let positionPlayer;
let positionJump;

//variable for going through JSON file and search thhrough frames
let framesPlayer;
let framesJump;

//Array of Player/Enemy
let animationRun = [];
let animationJump = [];

//Button Variabless
let buttonStart;
let buttonLevel1;
let buttonLevel2;
let buttonLevel3;
let buttonReset;

let score;
let h1;

function preload() {
  playerSprite = loadImage("img/spritesheets/player.png");
  playerData = loadJSON("img/spritesheets/player.json");

  jumpSprite = loadImage("img/spritesheets/jump.png");
  jumpData = loadJSON("img/spritesheets/jump.json");

  enemy = loadImage("img/mushroom.png");
  SkyImg = loadImage("img/bg/Sky.png");
  BG_Decor = loadImage("img/bg/BG_Decor.png");
  Middle_Decor = loadImage("img/bg/Middle_Decor.png");
  ForegroundImg = loadImage("img/bg/Foreground.png");
  GroundImg = loadImage("img/bg/Ground.png");

  font = loadFont("Girassol-Regular.ttf");
}

function setup() {
  createCanvas(1280, 720);

  textFont(font);

  //Buttons for Play and Pause
  buttonStart = createButton("PLAY");
  buttonStart.position(890, 50);
  buttonStart.size(100, 50);
  buttonStart.mousePressed(gamePlaying);

  buttonPause = createButton("PAUSE");
  buttonPause.position(1000, 50);
  buttonPause.size(100, 50);
  buttonPause.mousePressed(gamePause);

  //Buttons for level selection
  buttonLevel1 = createButton("Easy");
  buttonLevel1.position(900, 115);
  buttonLevel1.mousePressed(Level1);

  buttonLevel2 = createButton("Medium");
  buttonLevel2.position(screen.width / 2, 115);
  buttonLevel2.mousePressed(Level2);

  buttonLevel3 = createButton("Hard");
  buttonLevel3.position(1040, 115);
  buttonLevel3.mousePressed(Level3);

  score = select("#score");

  //Loop through Sprite
  framesPlayer = playerData.frames;
  framesJump = jumpData.frames;

  for (let i = 0; i < framesPlayer.length; i++) {
    positionPlayer = framesPlayer[i].position;
    let walk = playerSprite.get(
      positionPlayer.x,
      positionPlayer.y,
      positionPlayer.w,
      positionPlayer.h
    );
    animationRun.push(walk);
  }

  // for (let i = 0; i < framesJump.length; i++) {
  //   positionJump = framesJump[i].position;
  //   let jump = jumpSprite.get(
  //     positionJump.x,
  //     positionJump.y,
  //     positionJump.w,
  //     positionJump.h
  //   );
  //   animationJump.push(jump);
  // }

  player = new Player(1);
}

function draw() {
  if (gameStart === true) {
    // Show all enemies
    for (let i = enemies.length - 1; i >= 0; i--) {
      enemies[i].update();
      if (enemies[i].offscreen()) {
        enemies.splice(i, 1);
        player.score++;
      }
    }

    // Show Background
    for (let i = sky.length - 1; i >= 0; i--) {
      sky[i].update();
      if (sky[i].offscreen()) {
        sky.splice(i, 1);
      }
    }

    for (let i = decor.length - 1; i >= 0; i--) {
      decor[i].update();
      if (decor[i].offscreen()) {
        decor.splice(i, 1);
      }
    }

    for (let i = middle.length - 1; i >= 0; i--) {
      middle[i].update();
      if (middle[i].offscreen()) {
        middle.splice(i, 1);
      }
    }

    for (let i = foreground.length - 1; i >= 0; i--) {
      foreground[i].update();
      if (foreground[i].offscreen()) {
        foreground.splice(i, 1);
      }
    }

    for (let i = ground.length - 1; i >= 0; i--) {
      ground[i].update();
      if (ground[i].offscreen()) {
        ground.splice(i, 1);
      }
    }

    //Add a new Enemy and Background on increment
    if (counter % 100 === 0) {
      enemies.push(new Enemy());
    }

    if (counter % (width / 2) === 0) {
      sky.push(new Sky());
    }

    if (counter % 854 === 0) {
      decor.push(new Decor());
    }

    if (counter % 640 === 0) {
      middle.push(new Middle());
    }

    if (counter % 512 === 0) {
      foreground.push(new Foreground());
    }

    if (counter % 284 === 0) {
      ground.push(new Ground());
    }

    counter++;

    // Draw Background
    for (let i = 0; i < sky.length; i++) {
      sky[i].showOnce();
      sky[i].show();
    }

    for (let i = 0; i < decor.length; i++) {
      decor[i].showOnce();
      decor[i].show();
    }

    for (let i = 0; i < middle.length; i++) {
      middle[i].showOnce();
      middle[i].show();
    }

    for (let i = 0; i < foreground.length; i++) {
      foreground[i].showOnce();
      foreground[i].show();
    }

    //Draw Enemies and Player
    for (let i = 0; i < enemies.length; i++) {
      enemies[i].show();
      //If player hits enemy then end game and redraw
      if (player.hits(enemies[i])) {
        redraw();
        gameStart = false;
      }
    }

    player.animate();
    player.show();
    player.jump();
    player.move();
    player.update();

    for (let i = 0; i < enemies.length; i++) {
      if (player.hits(enemies[i])) {
        redraw();
        gameStart = false;
      }
    }

    //Draw Ground
    for (let i = 0; i < ground.length; i++) {
      ground[i].showOnce();
      ground[i].show();
    }
    //If game is not started then draw background static
  } else {
    image(SkyImg, 0, 0);
    image(BG_Decor, 0, 0);
    image(Middle_Decor, 0, 0);
    image(ForegroundImg, 0, 0);
    image(GroundImg, 0, 0);
  }
}

//Starts new game
function gamePlaying() {
  gameStart = true;
}

//Pauses Game
function gamePause() {
  gameStart = false;
}

//Buttons for Level Set
function Level1() {
  speed = 20;
  setLevel = 1;
  buttonLevel1.position(890, 115);
  buttonLevel1.size(60, 30);
  buttonLevel2.size(67, 22);
  buttonLevel2.position(screen.width / 2, 115);
  buttonLevel3.position(1040, 115);
  buttonLevel3.size(60, 22);
}

function Level2() {
  speed = 25;
  setLevel = 2;
  buttonLevel2.position(960, 115);
  buttonLevel2.size(70, 30);
  buttonLevel1.size(48, 22);
  buttonLevel1.position(900, 115);
  buttonLevel3.position(1040, 115);
  buttonLevel3.size(60, 22);
}

function Level3() {
  speed = 30;
  setLevel = 3;
  buttonLevel3.position(1035, 115);
  buttonLevel3.size(70, 30);
  buttonLevel2.size(67, 22);
  buttonLevel1.size(48, 22);
  buttonLevel1.position(900, 115);
}
