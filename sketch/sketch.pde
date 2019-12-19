PImage img, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15;
boolean istarted=false;
boolean shooting=false;
boolean isdamaged = false;
boolean isdamagedcirc = false;
boolean isdamagedsqre = false;
boolean isdamageddia = false;
boolean losegame = false;
int challenge = -1;
int enemyspeed;
void setup() {
   size(1150, 650);
 
 //Images for game used
  img = loadImage("img/spaceball.png");
  img2 = loadImage("img/spaceboss.png");
  img3 = loadImage("img/spacediamond.png");
  img4 = loadImage("img/spacemonsters.png");
  img5 = loadImage("img/spacesquare.png");
  img6 = loadImage("img/spacestartmenu.png");
  img7 = loadImage("img/lose.PNG");
  img8 = loadImage("img/startbutton.png");
  img9 = loadImage("img/spacestage.png");
  img10 = loadImage("img/spaceship.png");
  img11 = loadImage("img/spaceblast.png");
  img12 = loadImage ("img/levelup.PNG");
  img13 = loadImage ("img/easy.PNG");
  img14 = loadImage ("img/medium.PNG");
  img15 = loadImage ("img/hard.PNG");
}
//movement speed of ship and projectile
int x = 200; 
int y = 400; 
int a=x; 
int b=y - 50; 
int speed = 30; 
boolean isRight;
int enemyx=900;
int enemyy=20;
int enemyx2 =enemyx+100;
int enemyy2=enemyy-100;
int enemyx3=enemyx-100;
int enemyy3=enemyy;



void draw (){ //draw startmenu

   background (0, 0, 0);
  
  image (img6, 0, 0);
  if (!istarted)
      image (img8, 530, 160, 90, 90);
  if(istarted  && challenge != -1) //loads creatures and ship on screen when start is pressed
  { 
    drawship();
    drawcreatures();
  }
  if(shooting) //draws attack when shooting
  {
    drawattack();
  }
  if(b<0){
    shooting=false;
    a=0;  
}
  
  
 //checks if the enemies are attacked
  damage();
  
  losinggame();
  
       
}

void keyPressed(){
  if (istarted==false){ //checks if the s button is pressed on start screen
    int key = 's';  
    if(key == 's')
    {
      img6 = img12;
      //drawship();
      istarted=true;
     }
  }

   
  if (key == CODED){ //movement controls for ship
    
    if(keyCode == UP)
    {
     y -= speed;  
    }
    else if(keyCode == DOWN)
    {
          y += speed;  
    }
    else if(keyCode == RIGHT)
    {
          x += speed;  
    }
    if(keyCode == LEFT)
    {
          x -= speed;  
    }
  }
  if (key == 'z') //button for shooting projectile
    {
      a = x;
      b = y - 50;
      shooting = true;
    }
    if (challenge == -1){
      if(key == 'm')
        {
          challenge = 20;
          img6 = img9;
          img6 = img14;
          enemyspeed = 15;
        }
        if(key == 'e')
        {
          challenge = 1;
          img6 = img9;
           img6 = img13;
          enemyspeed = 10;
        }
        if(key == 'h')
        {
          challenge = 3;
          img6 = img9;
          img = img2;
          enemyspeed = 25;
          
          img6 = img15;
        }
    }
}
void drawship() { //determines ships size and position
   image (img10, x, y, 90,90);
}

void drawattack() { //determines attacks size and position
    b-=40;
    image(img11, a, b, 90, 90);
}
void drawcreatures() { //draws monsters you are fighting
  if (isdamagedcirc==false && challenge !=1)
       image (img, enemyx, enemyy, 500, 500);
       else if (isdamagedcirc==false && challenge == 1)
        image (img4, enemyx, enemyy-200, 600, 600);
   if(isdamageddia==false && challenge !=1)
     image (img3, enemyx2, enemyy2, 400, 400);
   if (isdamagedsqre==false && challenge !=1)
     image (img5, enemyx3, enemyy3, 300, 200);
      enemyx2 =enemyx+300;
      enemyy2=enemyy-100;
      enemyx3=enemyx-200;
      enemyy3=enemyy;
   emove();
   if (isdamagedcirc && isdamageddia && isdamagedsqre)
   {
     challenge = -1;
     isdamageddia = false;
     isdamagedsqre = false;
     isdamagedcirc = false;
     
      img6 = img12;
   }
   else if (isdamagedcirc && challenge == 1)
   {
     challenge = -1;

     isdamagedcirc = false;
     
     img6 = img12;
   }

   
}
  void emove(){  
        if(isRight){
            if(enemyx + enemyspeed + 400>= 1150){
                isRight = false;            //this makes the enemy go left when it hits edge of screen
                
            }
            else{
                enemyx+=enemyspeed;    //this makes the enemy continue going to the right
            }
        }
        else{ //this makes the enemy go left
            if(enemyx - enemyspeed -50 <= 0){
                isRight = true;
                enemyy+=10;
            } //this makes the enemy switch from left to right
            else{
                enemyx -= enemyspeed;
            } //this mmakes the enemy stay going to the left
        }
        
    
}

void damage() {
 
    //enemy damage system, determines if enemies are hit
  if (shooting && (enemyx+20 <= a &&enemyx+200 >= a)&& enemyy+100 >= b)
  {
      isdamaged = false;
      isdamagedcirc=true;
      shooting=false;
   }
   else if (shooting&&(enemyx2-100 <= a &&enemyx2+200 >= a)&& enemyy2+100 >= b)
  {
      isdamaged = false;
      isdamageddia=true;
     shooting=false;
 }
   else if (shooting&&(enemyx3-150 <= a &&enemyx3+150 >= a)&& enemyy3+100 >= b)
  {
      isdamaged = false;
      isdamagedsqre=true;
      shooting=false;
   }
   
  }
  
  void losinggame(){ //This tells if the ship has collided with any enemies
    if(enemyx-20 <= x && enemyx+200 >= x && enemyy + 100 >= y)
    {
     img6 = img7;
     losegame = true;
     isdamaged = false;
         isdamagedsqre = false;
             isdamageddia = false;
                 isdamagedcirc = false;
    }
    
    else if (enemyx2-150 <= x && enemyx2 + 150 >= x && enemyy2 + 250 >= y)
      {
     img6 = img7;
     losegame = true;
     isdamaged = false;
         isdamagedsqre = false;
             isdamageddia = false;
                 isdamagedcirc = false;
    }
      
        else if (enemyx3-150 <= x && enemyx3 + 150 >= x && enemyy3 + 100 >= y)
        {
     img6 = img7;
     losegame = true;
     isdamaged = false;
         isdamagedsqre = false;
             isdamageddia = false;
                 isdamagedcirc = false;
    }
  
  
  
  }
