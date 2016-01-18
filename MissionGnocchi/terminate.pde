//Related to Hangman

//if no more chances left or puzzle solved
//turn to pop-up window background(tab 1)
 void gameOver(){
   if(chances <= 0 || finished){
  tab = 1;   
   }
 }
 
 //create pop-up window with buttons to restart or quit
 void popUp(){
     //basic background required for both message
   fill(#E2E8DA);
   rect(225,200,350,200);
   textSize(18);
   fill(0);
     //if puzzle not solved
   if(!finished){
   text("Sorry, you didn't finish the puzzle", 250, 260);
   image(restart,280,290,50,50);
   image(quit,450,290,50,50);
     //high light button when hovering over it
   tint(3,158,168,100);
   if(mouseX>280 && mouseX<330 && mouseY>290 && mouseY<340){
     image(restart,280,290,50,50);
     again = true;
   }else if(mouseX>450 && mouseX<500 && mouseY>290 && mouseY<340){
     image(quit,450,290,50,50);
     exit = true;
   }else{
    again = false;
    exit = false;
   }
     //if puzzle solved
   }else if(finished){
     text("Congrats! The Password is :", 250, 280);
     text("CodingIsFUN",290,350);
   }
 }
 
 //see if the puzzle is solved
 void solved(){
   moveOn = true;
   finished = (correct[0] == 1);
  for(int i = 0; i < correct.length; i++){
  finished = finished && (correct[i] == 1);  
  }
 }