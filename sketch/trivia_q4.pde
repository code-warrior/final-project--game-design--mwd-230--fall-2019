void drawTrivia_Q4(){
  fill(#ffb31a);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 2", 540,(DISPLAY_TYPE_SIZE + 15));
  text("QUESTION 2", 512,(DISPLAY_TYPE_SIZE + 60));
  text("A hunter leaves his cabin early in the morning and walks one-mile due south.", 180,(DISPLAY_TYPE_SIZE + 130));
  text("Here he sees a bear and starts chasing it for one-mile due east before he is", 180,(DISPLAY_TYPE_SIZE + 160));
  text("able to shoot the bear. After shooting the bear, he drags it one-mile due north", 180,(DISPLAY_TYPE_SIZE + 190));
  text("back to his cabin where he started that morning.", 180,(DISPLAY_TYPE_SIZE + 220));
  text("What color is the bear?", 450,(DISPLAY_TYPE_SIZE + 280));
  text("K. Black ", 520,(DISPLAY_TYPE_SIZE + 350));
  text("L. White ", 520,(DISPLAY_TYPE_SIZE + 400));
  text("M. Grey", 520,(DISPLAY_TYPE_SIZE + 450));
  text("N. Brown", 520,(DISPLAY_TYPE_SIZE + 500));
  text("PICK A LETTER ... CHOOSE WISELY", 400,(DISPLAY_TYPE_SIZE + 560));
  
}
void drawLoseQ4() {
  background(#bfbfbf);
  fill(#ff0000);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 2: Q2", 540,(DISPLAY_TYPE_SIZE + 15));
  text("INCORRECT", 540, (DISPLAY_TYPE_SIZE + 60));
  text("Press (4) to TRY AGAIN", 482, (DISPLAY_TYPE_SIZE + 160));
}
void drawWinQ4(){
  background(#bfbfbf);
  fill(#47d147);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 2: Q2", 540,(DISPLAY_TYPE_SIZE + 15));
  text("CORRECT", 547,(DISPLAY_TYPE_SIZE + 60));
  text("The answer was B. White --> He can walk one-mile due south, then one-mile",250,(DISPLAY_TYPE_SIZE + 130));
  text("due east and finally one-mile due north where he finds his cabin again.", 250,(DISPLAY_TYPE_SIZE + 160));
  text("This means that his cabin can only be at the North Pole, and for that", 250,(DISPLAY_TYPE_SIZE + 190));
  text("reason the bear will be white.", 250,(DISPLAY_TYPE_SIZE + 220));
  text("Press (5) for LEVEL 3", 490,(DISPLAY_TYPE_SIZE + 280));
}
