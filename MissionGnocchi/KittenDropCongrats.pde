void Congrats(){
  
  if (score > 0){
    background(bg);
  
    textFont(f, 30); // size 20 
    fill(111,111,111);
    text("CONGRATULATIONS!", 100, 250);
    text("You have saved enough kittens", 7, 300);
    text("to move onto the next stage.", 22, 350);
  }else{
    background(bg);
  
    textFont(f, 30); // size 20 
    fill(111,111,111);
    text("AH, FIDDLESTICKS!", 120, 250);
    text("You didn't save enough kittens.", 8, 300);
    text("Try again.", 170, 350);
  }    
  
}