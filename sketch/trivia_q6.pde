void drawTrivia_Q6(){
  fill(#bf80ff);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 3", 540,(DISPLAY_TYPE_SIZE + 15));
  text("QUESTION 2", 512,(DISPLAY_TYPE_SIZE + 60));
  text("Maria went to the bread store to buy a load of bread for dinner.", 270,(DISPLAY_TYPE_SIZE + 130));
  text("She had 2 quarters, 4 dimes, 3 nickels, and 2 pennies. The total", 270,(DISPLAY_TYPE_SIZE + 160));
  text("cost of the bread was $0.82. She promised to make sure she had", 270,(DISPLAY_TYPE_SIZE + 190));
  text(" exactly 1 coin remaining after making her purchase.", 270,(DISPLAY_TYPE_SIZE + 220));
  text("Which coin did she have left after buying the loaf of bread?", 270,(DISPLAY_TYPE_SIZE + 250));
  text("R. 1 Quarter", 500,(DISPLAY_TYPE_SIZE + 300));
  text("S. 1 Nickel", 500,(DISPLAY_TYPE_SIZE + 350));
  text("T. 1 Dime", 500,(DISPLAY_TYPE_SIZE + 400));
  text("PICK A LETTER ... CHOOSE WISELY", 400,(DISPLAY_TYPE_SIZE + 450));
}

void drawLoseQ6() {
  background(#bfbfbf);
  fill(#ff0000);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 3: Q2", 540,(DISPLAY_TYPE_SIZE + 15));
  text("INCORRECT", 540, (DISPLAY_TYPE_SIZE + 60));
  text("Press (DOWN ARROW KEY) to TRY AGAIN", 380, (DISPLAY_TYPE_SIZE + 160));
}
void drawWinQ6(){
  background(#bfbfbf);
  fill(#47d147);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("LEVEL 3: Q2", 540,(DISPLAY_TYPE_SIZE + 15));
  text("CORRECT", 540,(DISPLAY_TYPE_SIZE + 60));
  text("The answer was  R. 1 Quarter", 450,(DISPLAY_TYPE_SIZE + 120));
  text(" CONGRATS! YOU HAVE WON RIDDLE TRIVIA!", 350,(DISPLAY_TYPE_SIZE + 300));
  text("Press (SPACEBAR) to play again from the beginning", 330,(DISPLAY_TYPE_SIZE + 380));
}
