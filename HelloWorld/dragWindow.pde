
void mousePressed(){
    //if mouse over the close-window button, then close the window
   if(overClose){
   openNew = false;
   overClose = false;
   mouseClicks = 0;
  }
  
  //if mouse over the tool bar, then make the boolean true
  if(over){
  locked = true; 
  }else{
  locked = false; 
 } 
 
 //calculate the value at which the window should be generated to create motion of movement
 xOff = mouseX - winx;
 yOff = mouseY - winy;

//if mouse over folder, and left mouse is clicked, then add 1 to mouseClicks
if(overFolder){
   if(mouseButton == LEFT){
    mouseClicks +=1; 
   }
  }
   }

 
 void mouseDragged(){
   //if it's locked(meaning mouse over toolbar and clicked), change the coordinate of the window to create motion along with mouse movement
   if(locked){
   winx = (mouseX - xOff);
   winy = (mouseY - yOff);
 }
 
 }
 
 
 void mouseReleased(){
   //when mouse released, don't want the window to move anymore
 locked = false; 
 }
  