void drawTrivia_Q1(){
  fill(#ff4da6);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 1", 540,(DISPLAY_TYPE_SIZE + 15));
  text("QUESTION 1", 512,(DISPLAY_TYPE_SIZE + 60));
  text("Three doctors say Robert is their brother. However, Robert says he has no brother. Who's lying?", 110,(DISPLAY_TYPE_SIZE + 130));
  text("A. Doctor 1", 530,(DISPLAY_TYPE_SIZE + 200));
  text("B. Doctor 2", 530,(DISPLAY_TYPE_SIZE + 250));
  text("C. Doctor 3", 530,(DISPLAY_TYPE_SIZE + 300));
  text("D. No One", 530,(DISPLAY_TYPE_SIZE + 350));
  text("SELECT A LETTER ... CHOOSE WISELY", 400,(DISPLAY_TYPE_SIZE + 430));
}

void drawLoseQ1() {
  background(#bfbfbf);
  fill(#ff0000);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 1: Q1", 540,(DISPLAY_TYPE_SIZE + 15));
  text("INCORRECT", 540, (DISPLAY_TYPE_SIZE + 60));
  text("Press (1) to TRY AGAIN", 482, (DISPLAY_TYPE_SIZE + 160));
}
void drawWinQ1(){
  background(#bfbfbf);
  fill(#47d147);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 1: Q1", 540,(DISPLAY_TYPE_SIZE + 15));
  text("CORRECT", 540,(DISPLAY_TYPE_SIZE + 60));
  text("The answer was D. No One --> The doctors were Robert's sisters.", 290,(DISPLAY_TYPE_SIZE + 140));
  text("Press (RIGHT ARROW KEY) for NEXT QUESTION", 370,(DISPLAY_TYPE_SIZE + 220));
}
