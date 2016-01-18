//variable used across all platform to transfer from desktop to gaming environment
// 0 = tutorial
// 1 = desktop
// 2 = Hang man
// 3 = Kitten drop


//Main desktop stimulation variables
PImage toolBar1;
PImage toolBar2;
PImage toolBar3;
PImage gameHangman;
PImage gameKittendrop;
int mouseClicks;
boolean overFolder1 = false;
boolean overFolder2 = false;
boolean overFolder3 = false;
boolean openNew = false;
boolean overClose = false;
boolean overHangman = false;
boolean overKittendrop = false;
int gameClicks = 0;
float xOff = 0;
float yOff = 0;
boolean over = false;
boolean locked = false;
float winx = 200;
float winy = 150;
Window w,e,r;

//testing
float coords[][] = {{200,150},{200,150},{200, 150}};
float offs[][] ={{0,0},{0,0},{0,0}};
int winNum = 0;

void desktopSetup(){
size(800,600);

//_____________desktop set up_______________________
 // if (environ == 0) {
    toolBar1 = loadImage("minimize.PNG");
    toolBar2 = loadImage("square.PNG");
    toolBar3 = loadImage("x.PNG");
    gameHangman = loadImage("hangman.jpeg");
    gameKittendrop = loadImage("kittendrop.jpg");
    mouseClicks = 0;
    gameClicks = 0;
    tab = 0;
 // }
}

void desktopDraw(){
  
//_________________________________Related to desktop__________________________________
//  if( environ == 1){
  background(0);
  //First Folder
  folders(30,30,"Hello World");
 
  //Second Folder
  folders(30,150,"Hello World");
 
//Third Folder
  folders(30,270,"Hello World");
  
  //debugging use
  textSize(18);
  fill(255);
  text(winNum,500,50);
  text(gameClicks,500,70);
  text("folder 1"+coords[0][0]+","+coords[0][1],500,100);
    text("folder 2"+coords[1][0]+","+coords[1][1],500,125);
      text("folder 3"+coords[2][0]+","+coords[2][1],500,150);

  //check if mouse is double-clicked and allow for new window to open, then reset mouse click to 0
 if(mouseClicks>=2){
  openNew = true;
  mouseClicks = 0;
  if(overFolder1){
   winNum = 0; 
  }else if (overFolder2){
   winNum = 1; 
  }else{
    winNum = 2;
  }
 }
 
 //if new window allowed to be opened, create the window and start it at position 200,150
 if(openNew){
    if(winNum == 0){
   w = new Window(coords[0][0],coords[0][1]);
     //check if mouse is over the tool bar, if so, allow user to drag the window
   w.check();
    }else if(winNum == 1){
     e = new Window(coords[1][0],coords[1][1]);
    e.check(); 
    }else{
     r = new Window(coords[2][0],coords[2][1]);
    r.check(); 
    }
   }
/*   
   //open up different games accordingly
   if(gameClicks >= 2){
     if(overHangman){
    environ = 2;
     }else if(overKittendrop){
      environ = 3; 
     }
    setup();
   }
*/
}