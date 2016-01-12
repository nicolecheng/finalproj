PImage toolBar1;
PImage toolBar2;
PImage toolBar3;

float xOff = 0;
float yOff = 0;
boolean over = false;
boolean locked = false;
boolean overFolder = false;
boolean openNew = false;
boolean overClose = false;
int mouseClicks;

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
 
 if(mouseClicks>=2){
  openNew = true;
  mouseClicks = 0;
}

if (openNew){
  w = new Window(200,150); 
}

}