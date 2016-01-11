float winx;
float winy;
boolean over = false;
boolean locked = false;
float xOff = 0;
float yOff = 0;


void mousePressed(){
  if(mouseX>winx && mouseX<winx+400 && mouseY>winy && mouseY<winy+30){
   over = true; 
  }else{
   over = false; 
  }
  
  if(over){
   locked = true; 
  }else{
   locked = false; 
   
   xOff = mouseX - winx;
   yOff = mouseY - winy;
  }
  
}