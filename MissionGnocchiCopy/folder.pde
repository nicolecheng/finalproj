//related to desktop

//create folder with given names,also check whether mouse is over the folder, when mouse hovering over folder, highlight and change cursor
void folders(int x, int y, String name){
  textSize(12);
  fill(255,245,145);
  rect(x,y,80,60);
  rect(x+40,y-10,40,10);
  fill(255);
  text(name,36,y+70);
  MouseOver(x,y);
  cursor();
}

//if mouse is over the folder, then highlight the area
void MouseOver(int x, int y){
 if(mouseX>x && mouseX<x+80 && mouseY>y && mouseY<y+60){
   fill(120,205,205,30);
   stroke(1);
 }else{
  fill(120,205,205,0);   
   stroke(1);
   }
  rect(x-10,y-10,100,80);
   }
   
   //change cursor when hovering over folders
   void cursor(){
     if(mouseX>30 && mouseX<110){
       if(mouseY>30 && mouseY<90){
        overFolder1 = true; 
       }else if (mouseY>150 && mouseY<210){
        overFolder2 = true;
       }else if (mouseY>270 && mouseY<330){
         overFolder3 = true;
       }else{
        overFolder1 = false;
        overFolder2 = false;
        overFolder3 = false;
       }
     }else{
        overFolder1 = false;
        overFolder2 = false;
        overFolder3 = false;
       
     }
     
     if(overFolder1 || overFolder2 || overFolder3){
      cursor(HAND); 
     }else{
      cursor(ARROW); 
     }
     
   }