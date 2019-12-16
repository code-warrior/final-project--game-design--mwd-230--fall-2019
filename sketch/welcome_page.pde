void drawWelcome(){
  fill(#0099cc);
  rect(60,55,1080,600);
  textFont(readingTypeface);
  fill(255);
  text("WELCOME", 540,(DISPLAY_TYPE_SIZE + 200));
  text("TO", 575,(DISPLAY_TYPE_SIZE + 260));
  text("RIDDLE TRIVIA", 510,(DISPLAY_TYPE_SIZE + 320));
  text("Press (RIGHT ARROW) to begin", 435,(DISPLAY_TYPE_SIZE + 550));

}
