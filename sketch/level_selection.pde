// page draws instruction set and level selection
void drawLevelSelection(){
  fill(#0099cc);
  noStroke();
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("RIDDLE TRIVIA", 500,(DISPLAY_TYPE_SIZE + 60));
  text("How to play", 515,(DISPLAY_TYPE_SIZE + 130));
  text("Riddle Trivia is designed to truly challenge its players. It's a fairly simple game to follow.", 150,(DISPLAY_TYPE_SIZE + 200));
  text("You will choose the correct (or incorrect) answer by using the letter keys on your keyboard.", 150,(DISPLAY_TYPE_SIZE + 230));
  text("A riddle will pop up on the screen in a multiple choice style. Each level is a different", 150,(DISPLAY_TYPE_SIZE + 260)); 
  text("category and varies in difficulty. Good luck!", 150,(DISPLAY_TYPE_SIZE + 290));
  text("Level Selection", 490,(DISPLAY_TYPE_SIZE + 400));
  text("Press (1) for Level 1        Press (2) for Level 2        Press (3) for Level 3", 230,(DISPLAY_TYPE_SIZE + 500));
}
