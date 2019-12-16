void setup(){
  size(1200,700);
}

void draw(){
  background(#bfbfbf);
  readingTypeface = createFont("fonts/Lilita_One/LilitaOne-Regular.ttf", READING_TYPE_SIZE);
  fill(#0099cc);
  noStroke();
  rect(60,55,1080,600);

// ENTER Key to start game
  if(keyCode == SPACE_KEY){
     drawWelcome();
  }
// space key to get to instruction and levels page
  if(keyCode == ENTER_KEY){
    drawLevelSelection();
  }
  
  //select Level 1 Question 1
  if(keyCode == ONE_KEY || keyCode == A_KEY || keyCode == B_KEY || keyCode == C_KEY || keyCode == D_KEY){
    drawTrivia_Q1();
    
    if(keyCode == D_KEY){
      clear();
     drawWinQ1();
    }
    if(keyCode == B_KEY || keyCode == A_KEY || keyCode == C_KEY){
       clear();
       drawLoseQ1();
    }
  }
  
  //select Level 1 Question 2
    if(keyCode == TWO_KEY || keyCode == E_KEY || keyCode == F_KEY || keyCode == G_KEY ){
      drawTrivia_Q2();
      
      if(keyCode == G_KEY){
         clear();
         drawWinQ2();
      }
      if(keyCode == E_KEY || keyCode == F_KEY){
         clear();
         drawLoseQ2();
      }
    }
    
   //select Level 2 Question 1
    if(keyCode == THREE_KEY || keyCode == H_KEY || keyCode == I_KEY || keyCode == J_KEY ){
      drawTrivia_Q3();
      
      if(keyCode == I_KEY){
         clear();
         drawWinQ3();
      }
      if(keyCode == H_KEY || keyCode == J_KEY){
         clear();
         drawLoseQ3();
      }
    }
    
       //select Level 2 Question 2
    if(keyCode == FOUR_KEY || keyCode == K_KEY || keyCode == L_KEY || keyCode == M_KEY || keyCode == N_KEY){
      drawTrivia_Q4();
      
      if(keyCode == L_KEY){
         clear();
         drawWinQ4();
      }
      if(keyCode == M_KEY || keyCode == K_KEY || keyCode == N_KEY){
         clear();
         drawLoseQ4();
      }
    }
    
    //select Level 3 Question 1
    if(keyCode == FIVE_KEY || keyCode == O_KEY || keyCode == P_KEY || keyCode == Q_KEY ){
      drawTrivia_Q5();
      
      if(keyCode == Q_KEY){
         clear();
         drawWinQ5();
      }
      if(keyCode == O_KEY || keyCode == P_KEY){
         clear();
         drawLoseQ5();
      }
    }
    
    //select Level 3 Question 2
    if(keyCode == SIX_KEY || keyCode == R_KEY || keyCode == S_KEY || keyCode == T_KEY ){
      drawTrivia_Q6();
      
      if(keyCode == R_KEY){
         clear();
         drawWinQ6();
      }
      if(keyCode == S_KEY || keyCode == T_KEY){
         clear();
         drawLoseQ6();
      }
    }
    
   
}
