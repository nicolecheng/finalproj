PImage toolBar1;
PImage toolBar2;
PImage toolBar3;
int mouseClicks;
boolean overFolder = false;
boolean openNew = false;
boolean overClose = false;
float xOff = 0;
float yOff = 0;
boolean over = false;
boolean locked = false;
float winx = 200;
float winy = 150;
Window w;

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
 
 //check if mouse is double-clicked and allow for new window to open, then reset mouse click to 0
 if(mouseClicks>=2){
  openNew = true;
  mouseClicks = 0;
  
 }
 
 //if new window allowed to be opened, create the window and start it at position 200,150
 
  if(openNew){
   w = new Window(winx,winy);
     //check if mouse is over the tool bar, if so, allow user to drag the window
   w.check();
   text(""+winx+" , "+winy,100,500);
   if(over){
    text("over is true",100,520); 
   }
   if(locked){
     text("locked is true",100,550); 
   }
}

}