void drawTrivia_Q3(){
  fill(#ffb31a);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 2", 540,(DISPLAY_TYPE_SIZE + 15));
  text("QUESTION 1", 512,(DISPLAY_TYPE_SIZE + 60));
  text("If you buy a rooster for the purpose of laying eggs and", 280,(DISPLAY_TYPE_SIZE + 130));
  text("you expect to get three eggs each day for breakfast,", 280,(DISPLAY_TYPE_SIZE + 160));
  text("How many eggs will you have after three weeks? ", 280,(DISPLAY_TYPE_SIZE + 190));
  text("H. 63", 540,(DISPLAY_TYPE_SIZE + 250));
  text("I. 0", 540,(DISPLAY_TYPE_SIZE + 300));
  text("J. 21", 540,(DISPLAY_TYPE_SIZE + 350));
  text("PICK A LETTER ... CHOOSE WISELY", 400,(DISPLAY_TYPE_SIZE + 400));
 
}

void drawLoseQ3() {
  background(#bfbfbf);
  fill(#ff0000);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 2: Q1", 540,(DISPLAY_TYPE_SIZE + 15));
  text("INCORRECT", 540, (DISPLAY_TYPE_SIZE + 60));
  text("Press (2) to TRY AGAIN", 482, (DISPLAY_TYPE_SIZE + 160));
}
void drawWinQ3(){
  background(#bfbfbf);
  fill(#47d147);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 2: Q1", 540,(DISPLAY_TYPE_SIZE + 15));
  text("CORRECT", 547,(DISPLAY_TYPE_SIZE + 60));
  text("The answer was I. 0 --> Roosters cannot lay eggs", 350,(DISPLAY_TYPE_SIZE + 140));
  text("Press (UP ARROW KEY) for NEXT QUESTION", 380,(DISPLAY_TYPE_SIZE + 220));
}
