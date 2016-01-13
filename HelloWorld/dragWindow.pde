
void mousePressed(){
    //if mouse over the close-window button, then close the window
   if(overClose){
   openNew = false;
   overClose = false;
   mouseClicks = 0;
   coords[winNum][0] = 200;
   coords[winNum][1] = 150;
   offs[winNum][0] = 0;
   offs[winNum][1] = 0;
  }
  
  //if mouse over the tool bar, then make the boolean true
  if(over){
  locked = true; 
  }else{
  locked = false; 
 } 
 
 //calculate the value at which the window should be generated to create motion of movement
 offs[winNum][0] = mouseX - coords[winNum][0];
 offs[winNum][1] = mouseY - coords[winNum][1];
 
//if mouse over folder, and left mouse is clicked, then add 1 to mouseClicks
if(overFolder1 || overFolder2 || overFolder3){
   if(mouseButton == LEFT){
    mouseClicks +=1; 
   }
  }
   }

 
 void mouseDragged(){
   //if it's locked(meaning mouse over toolbar and clicked), change the coordinate of the window to create motion along with mouse movement
   if(locked){
   coords[winNum][0] = (mouseX - offs[winNum][0]);
   coords[winNum][1] = (mouseY - offs[winNum][1]);
   }
 
 }
 
 
 void mouseReleased(){
   //when mouse released, don't want the window to move anymore
 locked = false; 
 }
  