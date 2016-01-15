boolean  again = false;
boolean exit = false;
 
 void gameOver(){
   if(chances <= 0){
  tab = 1;   
   }
 }
 
 void optionDialog(){
   fill(#E2E8DA);
   rect(150,100,350,200);
   textSize(18);
   fill(0);
   text("Sorry, you didn't finish the puzzle", 175, 140);
   image(restart,225,200,50,50);
   image(quit,375,200,50,50);
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
 }
 
 void mousePressed(){
  
   if(again){
    tab = 0;
    setup();
    again = false;
   }
   if(exit){
    tab = 2;;
    exit = false;
   }
   
 }