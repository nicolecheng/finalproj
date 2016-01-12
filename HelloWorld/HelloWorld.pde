PImage toolBar1;
PImage toolBar2;
PImage toolBar3;
float winx;
float winy;
float xOff = 0;
float yOff = 0;
boolean over = false;
boolean locked = false;
boolean openNew = false;
int mouseClicks;

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
    MouseOver(30,30);
  //Second Folder
  folders(30,150,"Hello World");
    MouseOver(30,150);
  //Third Folder
  folders(30,270,"Hello World");
    MouseOver(30,270);
 
if (openNew){
 Window(winx, winy); 
}

openWindow(200,150);
 
 //check for dragging window purpose
 if(mouseX>winx && mouseX<winx+400 && mouseY>winy-30 && mouseY<winy){
 over = true; 
 }else{
 over = false; 
 }
 
 ////load window 
 //Window(winx,winy);
}