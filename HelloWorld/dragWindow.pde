


void mousePressed(){
  if(over){
  locked = true; 
  xOff = mouseX - w.xcoord();
  yOff = mouseY - w.ycoord();
 }else{
  locked = false; 
 }   
  
  
  if(overFolder){
   if(mouseButton == LEFT){
    mouseClicks +=1; 
   }
  }
  
  if(overClose){
   openNew = false;
   overClose = false;
   mouseClicks = 0;
  }
  
   }

 
 void mouseDragged(){
  if(locked){
   w.setX(mouseX - xOff);
   w.setY(mouseY - yOff);
 }
 }
 
 void mouseReleased(){
  locked = false; 
 }
  