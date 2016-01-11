void  setup(){
size(800,600);
background(0);
}

void draw(){
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
}