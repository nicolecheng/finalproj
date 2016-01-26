//variable used across all platform to transfer from desktop to gaming environment
// -1 = opening
// 0 = desktop
// 1 = Hang man
// 2 = Kitten drop
// 3 = geodash
// 4 = ending

int environ = -1;
AudioPlayer opening;
AudioPlayer desktop;
AudioPlayer hangman;
AudioPlayer kittendrop;
AudioPlayer geodash;
AudioPlayer ending;

//Main desktop stimulation variables
PImage toolBar1;
PImage toolBar2;
PImage toolBar3;
PImage gameHangman;
PImage gameKittendrop;
PImage gameGeoDash;
PImage topSecret;

int mouseClicks;

boolean overFolder1 = false;
boolean overFolder2 = false;
boolean overFolder3 = false;
boolean overFolder4 = false;

boolean [] openNew = {false, false, false, false};

boolean openPW = false;

boolean overClose = false;
boolean overHangman = false;
boolean overKittendrop = false;
boolean overGeoDash = false;
boolean overSecret = false;
boolean over = false;
boolean locked = false;

int gameClicks = 0;

float xOff = 0;
float yOff = 0;

float winx = 200;
float winy = 150;

Window w, e, r, t;



float coords[][] = {{200, 150}, {200, 150}, {200, 150}, {200, 150}};
float offs[][] ={{0, 0}, {0, 0}, {0, 0}, {0, 0}};
int winNum = 0;

void  setup() {
  minim = new Minim(this);
  opening = minim.loadFile("Opening.mp3");
  desktop = minim.loadFile("desktop.mp3");
  hangman = minim.loadFile("Hangman.mp3");
  kittendrop = minim.loadFile("kittenDrop.mp3");
  geodash = minim.loadFile("geodash.mp3");
  ending = minim.loadFile("ending.mp3");

  size(800, 600);
  //load image for button "restart" and "quit"
  restart = loadImage("restart.png");
  quit = loadImage("quit.png");

  //_____________desktop set up_______________________
  if (environ == 0) {
    toolBar1 = loadImage("minimize.PNG");
    toolBar2 = loadImage("square.PNG");
    toolBar3 = loadImage("x.PNG");
    gameHangman = loadImage("hangman.jpeg");
    gameKittendrop = loadImage("kittendrop.jpg");
    gameGeoDash = loadImage("GeoDash.jpg");
    topSecret = loadImage("secretFile.gif");
    mouseClicks = 0;
    gameClicks = 0;
    tab = 0;
  }

  //______________Related to Hangman___________________
  else if (environ == 1) {
    hangmanSetup();
  }

  //__________Related to Kitten Drop_____________________
  else if (environ == 2) {
    kittenSetup();
  }

  //__________Related to Dashing Geometry_____________________  
  else if (environ == 3) { 
    geoSetup();
  } else if (environ == 4) {
    endSetting();
  }
}

void draw() {

  playMusic();    
  //____________________________Related to Opening
  if (environ == -1 && !stopLoop) {
    //println(s);
    Opening();
    playOpening = false;
  }

  //_________________________________Related to desktop__________________________________
  if ( environ == 0) {
    // setup();
    background(0);
    //First Folder
    folders(30, 30, "Hello World");

    //Second Folder
    folders(30, 150, "Hello World");

    //Third Folder
    folders(30, 270, "Hello World");

    //fourth folder
    folders(30, 390, "Hello World");

    ////debugging use
    //textSize(18);
    //fill(255);
    //text(winNum, 500, 50);
    //text(gameClicks, 500, 70);
    //text("folder 1"+coords[0][0]+","+coords[0][1], 500, 100);
    //text("folder 2"+coords[1][0]+","+coords[1][1], 500, 125);
    //text("folder 3"+coords[2][0]+","+coords[2][1], 500, 150);

    //check if mouse is double-clicked ,if so, check for password
    if (mouseClicks>=2) {
      mouseClicks = 0;
      if (overFolder1) {
        winNum = 0;
      } else if (overFolder2) {
        winNum = 1;
      } else if (overFolder3) {
        winNum = 2;
      } else if (overFolder4) {
        winNum = 3;
      }
      if (winNum == 1 || winNum == 2 || winNum == 3) {
        createPW();
      } else if (winNum == 0) {
        openNew[0] = true;
      }
    }

    //check if password is correct
    checkPW();

    //if new window allowed to be opened(Password is correct), create the window and start it at position 200,150
    //first folder
    if (openNew[0]) {
      w = new Window(coords[0][0], coords[0][1]);
      //check if mouse is over the tool bar, if so, allow user to drag the window
      w.check();
    }
    //second folder
    else if ((winNum == 1) && openNew[1]) {
      e = new Window(coords[1][0], coords[1][1]);
      e.check();
    } else if ((winNum == 2) && openNew[2]) {
      r = new Window(coords[2][0], coords[2][1]);
      r.check();
    } else if ((winNum == 3) && openNew[3]) {
      t = new Window(coords[3][0], coords[3][1]);
      t.check();
    }

    //open up different games accordingly
    if (gameClicks >= 2) {
      if (overHangman) {
        environ = 1;
        desktop.pause();
        playHangman = true;
      } else if (overKittendrop) {
        environ = 2;
        desktop.pause();
        playKittenDrop = true;
      } else if (overGeoDash) {
        environ = 3;
        desktop.pause();
        playGeoDash = true;
        //_______________________________________________________Put GeoDash stuff here______________________________________________________
      } else if (overSecret) {
        environ = 4;
        desktop.pause();
        playEnding = true;
      }
      setup();
    }
  }

  // ____________________________Related to Hang Man________________________________
  if (environ == 1) {
    hangmanDraw();
  }

  //______________________________Related to Kitten Drop_______________________________
  if (environ == 2) {
    kittenDraw();
  }

  //______________________________Related to Kitten Drop_______________________________
  if (environ == 3) {
    geoDraw();
  }

  //___________________________________________Related to Ending__________________________________
  if (environ == 4) {
    ending();
  }
}

void mouseClicked() {
  if (environ==-1 && filledOut()) {
    stopLoop=false;
  }
  if (environ==-1 && !stopLoop) {
    s++;
  }

  if (environ==3) {
    if(g==-1 || g==0) {
      g++; // move to instructions page
    }
    if (geohealth<=0) { // lost dashing geometry -- click to restart
      setup();
    }else if(steps>=1000){
      geodash.close();
      playDesktop = true;
      environ = 0; 
    }
  }

  //_____________Related to Ending___________________________
  if (environ == 4) {
        endSetting();
    if (index<=5) {
      index++;
    }
    if (index == 6) {
      fin = true;
    }
    //endSetting();
  }
}