PImage toolBar1;
PImage toolBar2;
PImage toolBar3;

void  setup(){
size(800,600);
toolBar1 = loadImage("minimize.PNG");
toolBar2 = loadImage("square.PNG");
toolBar3 = loadImage("x.PNG");
}

void draw(){
  background(0);

  //First Folder
  folders(30,30,"Hello World");
  //Second Folder
  folders(30,150,"Hello World");  
  //Third Folder
  folders(30,270,"Hello World");
 
 Window();
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

void Window(){
 noStroke();
 fill(255,255,240);
 rect(200,150,400,300);
 fill(193,205,193);
 rect(200,120,400,30);
 /*fill(250);
 rect(500,132,25,5);
 rect(535,125,20,20);
 */
 image(toolBar1,500,120,28,19);
 image(toolBar2,528,120);
 image(toolBar3,555,120);
 stroke(1);
}