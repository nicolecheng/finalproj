boolean  again = false;
boolean exit = false;
boolean finished = false;

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
   rect(150,100,350,200);
   textSize(18);
   fill(0);
     //if puzzle not solved
   if(!finished){
   text("Sorry, you didn't finish the puzzle", 175, 140);
   image(restart,225,200,50,50);
   image(quit,375,200,50,50);
     //high light button when hovering over it
   tint(3,158,168,100);
   if(mouseX>225 && mouseX<275 && mouseY>200 && mouseY<250){
     image(restart,225,200,50,50);
     again = true;
   }else if(mouseX>375 && mouseX<425 && mouseY>200 && mouseY<250){
     image(quit,375,200,50,50);
     exit = true;
   }else{
    again = false;
    exit = false;
   }
     //if puzzle solved
   }else if(finished){
     text("Congrats! The Password is :", 175, 140);
     text("CodingIsFUN",230,180);
   }
 }
 
 void mousePressed(){
  
   //player decides to restart the game
   if(again){
    tab = 0;
    setup();
    again = false;
   }
   
   //player decides to end the game
   if(exit){
    tab = 2;;
    exit = false;
   }
   
 }
 
 //see if the puzzle is solved
 void solved(){
   finished = (correct[0] == 1);
  for(int i = 0; i < correct.length; i++){
  finished = finished && (correct[i] == 1);  
  }
 }