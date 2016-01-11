void  setup(){
size(800,600);
}

void draw(){
  background(0);

  //First Folder
  folders(30,30,"Hello World");
  //Second Folder
  folders(30,150,"Hello World");  
  //Third Folder
  folders(30,270,"Hello World");
 
}

void folders(int x, int y, String name){
  fill(255,245,145);
  rect(x,y,80,60);
  rect(x+40,y-10,40,10);
  fill(255);
  text(name,36,y+70);
   MouseOver(x,y);
}

void MouseOver(int x, int y){
 if(mouseX>x && mouseX<x+80 && mouseY>y && mouseY<y+60){
   fill(120,205,205,30);
   stroke(1);
 }
   else{
  fill(120,205,205,0);   
   }
  rect(x-10,y-10,100,80);
}