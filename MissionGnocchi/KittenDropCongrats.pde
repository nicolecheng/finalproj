void Congrats(){
  
  if (score > 0){
    moveOn = true; // gratz. you can move on
    
    background(kbg);
  
    textFont(f, 25); // size 25 
    fill(255);
    text("CONGRATULATIONS!", 270, 220);
    text("You saved enough kittens", 220, 270);
    text("to move onto the next stage.", 205, 320);

    text("Click here to continue.", 240, 370);
    //s=4;
    //print(s);
    environ=1;
    //desktopSetup();
    //s=8;
    //setup();
    //s=8;
  }else{
    background(kbg);
  
    textFont(f, 25); // size 25 
    fill(255);
    text("AH, FIDDLESTICKS!", 285, 220);
    text("You didn't save enough kittens.", 190, 270);
    text("Click here to try again.", 240, 320);
  }   
  
}