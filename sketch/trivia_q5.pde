void drawTrivia_Q5(){
  fill(#bf80ff);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 3", 540,(DISPLAY_TYPE_SIZE + 15));
  text("QUESTION 1", 512,(DISPLAY_TYPE_SIZE + 60));
  text("Find the four-digit number in which the first digit", 320,(DISPLAY_TYPE_SIZE + 130));
  text("is one-fourth of the last digit, the second digit is" , 320,(DISPLAY_TYPE_SIZE + 160));
  text("6 times the first digit, and the third digit is the", 320,(DISPLAY_TYPE_SIZE + 190));
  text("second digit plus three", 320,(DISPLAY_TYPE_SIZE + 220));
  text("O. 2664", 520,(DISPLAY_TYPE_SIZE + 270));
  text("P. 4261", 520,(DISPLAY_TYPE_SIZE + 310));
  text("Q. 1694", 520,(DISPLAY_TYPE_SIZE + 350));
  text("PICK A LETTER ... CHOOSE WISELY", 400,(DISPLAY_TYPE_SIZE + 410));
}

//draws response to players incorrect answer
void drawLoseQ5() {
  background(#bfbfbf);
  fill(#ff0000);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 3: Q1", 540,(DISPLAY_TYPE_SIZE + 15));
  text("INCORRECT", 540, (DISPLAY_TYPE_SIZE + 60));
  text("Press (3) to TRY AGAIN", 482, (DISPLAY_TYPE_SIZE + 160));
}

//draws response to players correct answer
void drawWinQ5(){
  background(#bfbfbf);
  fill(#47d147);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 3: Q1", 535,(DISPLAY_TYPE_SIZE + 15));
  text("CORRECT", 540,(DISPLAY_TYPE_SIZE + 60));
  text("The answer was Q. 1964", 470,(DISPLAY_TYPE_SIZE + 130));
  text("Press (DOWN ARROW KEY) for FINAL QUESTION", 340,(DISPLAY_TYPE_SIZE + 200));
}
