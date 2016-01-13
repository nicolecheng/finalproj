//create colder with given names,also check whether mouse is over the folder
void folders(int x, int y, String name){
  textSize(12);
  fill(255,245,145);
  rect(x,y,80,60);
  rect(x+40,y-10,40,10);
  fill(255);
  text(name,36,y+70);
  MouseOver(x,y);
}

//if mouse is over the folder, then highlight the area and change the cursor to hand
void MouseOver(int x, int y){
 if(mouseX>x && mouseX<x+80 && mouseY>y && mouseY<y+60){
   overFolder = true;
   fill(120,205,205,30);

//A little bug with cursor
//When hovering over the first two folder, would not turn into hand cursor
//Even if it turn into the hand, it switches back and forth between hand and arrow quickly
   cursor(HAND);
   stroke(1);
 }
   else{
  fill(120,205,205,0);   
  cursor(ARROW);
   }
  rect(x-10,y-10,100,80);
}