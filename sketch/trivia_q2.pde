void drawTrivia_Q2(){
  fill(#ff4da6);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 1", 540,(DISPLAY_TYPE_SIZE + 15));
  text("QUESTION 2", 512,(DISPLAY_TYPE_SIZE + 60));
  text("A man is standing in front of a painting of a man, and he tells us the following:", 200,(DISPLAY_TYPE_SIZE + 130));
  text("Brothers and sisters have I none, but this man's father is my father's son.", 200,(DISPLAY_TYPE_SIZE + 160)); 
  text("Who is on the painting? ", 460,(DISPLAY_TYPE_SIZE + 220));
  text("E. His father ", 500,(DISPLAY_TYPE_SIZE + 290));
  text("F. He himself", 500,(DISPLAY_TYPE_SIZE + 340));
  text("G. His son", 500,(DISPLAY_TYPE_SIZE + 390));
  text("PICK A LETTER ... CHOOSE WISELY", 400,(DISPLAY_TYPE_SIZE + 450));
}

//draws response to players incorrect answer
void drawLoseQ2() {
  background(#bfbfbf);
  fill(#ff0000);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 1: Q2", 540,(DISPLAY_TYPE_SIZE + 15));
  text("INCORRECT", 540, (DISPLAY_TYPE_SIZE + 60));
  text("Press (RIGHT ARROW KEY) to TRY AGAIN", 380, (DISPLAY_TYPE_SIZE + 160));
}

//draws response to players correct answer
void drawWinQ2(){
  background(#bfbfbf);
  fill(#47d147);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 1: Q2", 530,(DISPLAY_TYPE_SIZE + 15));
  text("CORRECT", 540,(DISPLAY_TYPE_SIZE + 60));
  text("The answer was G. His son --> We can replace my father's son by myself", 250,(DISPLAY_TYPE_SIZE + 140));
  text("since he is the only child. Now remains: This mans' father is himself,", 250,(DISPLAY_TYPE_SIZE + 180));
  text("so this man is his son.", 250,(DISPLAY_TYPE_SIZE + 220));
  text("Press (2) for LEVEL 2", 480,(DISPLAY_TYPE_SIZE + 280));
}
