PImage toolBar1;
PImage toolBar2;
PImage toolBar3;

float winx;
float winy;
float xOff = 0;
float yOff = 0;
boolean over = false;
boolean locked = false;

void  setup(){
size(800,600);
toolBar1 = loadImage("minimize.PNG");
toolBar2 = loadImage("square.PNG");
toolBar3 = loadImage("x.PNG");
winx=200;
winy=150;
}

void draw(){
  background(0);

  //First Folder
  folders(30,30,"Hello World");
  //Second Folder
  folders(30,150,"Hello World");  
  //Third Folder
  folders(30,270,"Hello World");
 
 if(mouseX>winx && mouseX<winx+400 && mouseY>winy-30 && mouseY<winy){
  over = true; 
 }else{
  over = false; 
 }
 
 Window(winx,winy);
 toolbarSelect(winx,winy);
 
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

void Window(float x, float y){
 noStroke();
 fill(255,255,240);
 rect(x,y,400,300);
 fill(193,205,193);
 rect(x,y-30,400,30);
 image(toolBar1,x+300,y-30,28,19);
 image(toolBar2,x+328,y-30);
 image(toolBar3,x+355,y-30);
 stroke(1);
}

void toolbarSelect(float x, float y){
 if(mouseX>x+300 && mouseX<x+328 && mouseY>y-30 && mouseY<y+10){
  tint(3,158,168,100);
  image(toolBar1,x+300,y-30,28,19);
 }
 if(mouseX>x+328 && mouseX<x+355 && mouseY>y-30 && mouseY<y+10){
   tint(3,158,168,100);
   image(toolBar2, x+328, y-30);
 }
 else if (mouseX>x+355 && mouseX<x+400 && mouseY>y-30 && mouseY<y+10){
   tint(255,0,0,100);
   image(toolBar3, x+355, y-30);
 }
 noTint(); 
}