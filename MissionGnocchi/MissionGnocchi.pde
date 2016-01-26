//variable used across all platform to transfer from desktop to gaming environment
// -1 = opening
// 0 = desktop
// 1 = Hang man
// 2 = Kitten drop
// 3 = geodash
// 4 = ending

int environ = -1;

//Initiate Music for game
AudioPlayer opening;
AudioPlayer desktop;
AudioPlayer ending;

//Main desktop stimulation variables
PImage toolBar1;
PImage toolBar2;
PImage toolBar3;
//Icon for games and file
PImage gameHangman;
PImage gameKittendrop;
PImage gameGeoDash;
PImage topSecret;

//count mouse clicks on desktop
int mouseClicks;

//whether mouse is hovering over folder
boolean overFolder1 = false;
boolean overFolder2 = false;
boolean overFolder3 = false;
boolean overFolder4 = false;

//list to check which folder should be opened
boolean [] openNew = {false, false, false, false};

//check whether to generate password
boolean openPW = false;

//chech if mouse hovering over close-window
boolean overClose = false;

//check if mouse hovering over the folder content
boolean overHangman = false;
boolean overKittendrop = false;
boolean overGeoDash = false;
boolean overSecret = false;
boolean over = false;
boolean locked = false;

//count mouseclicks on folder content
int gameClicks = 0;

//measurement for window
float xOff = 0;
float yOff = 0;
float winx = 200;
float winy = 150;
float coords[][] = {{200, 150}, {200, 150}, {200, 150}, {200, 150}};
float offs[][] ={{0, 0}, {0, 0}, {0, 0}, {0, 0}};
int winNum = 0;

//Windows
Window w, e, r, t;

void  setup() {

  //Universal setup
  minim = new Minim(this);
  size(800, 600);

  //load music
  opening = minim.loadFile("LessonsInLove_NeonTrees.mp3");
  desktop = minim.loadFile("Fever_TheBlackKeys.mp3");
  ending = minim.loadFile("ending.mp3");

  //load image for button "restart" and "quit"
  restart = loadImage("restart.png");
  quit = loadImage("quit.png");

  //_____________desktop set up_______________________
  if (environ == 0) {
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
    Opening();
    playOpening = false;
  }

  //_________________________________Related to desktop__________________________________
  if ( environ == 0) {
    background(0);

    //First Folder
    folders(30, 30, "Secret Hangar");

    //Second Folder
    folders(30, 150, "Concatenation");

    //Third Folder
    folders(30, 270, "Dash-tective");

    //fourth folder
    folders(30, 390, "Cluesing");

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
    //first folder, don't require password
    if (openNew[0]) {
      w = new Window(coords[0][0], coords[0][1]);
      //check if mouse is over the tool bar, if so, allow user to drag the window
      w.check();
    }
    //other folders, require password
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
      } else if (overKittendrop) {
        environ = 2;
      } else if (overGeoDash) {
        environ = 3;
      } else if (overSecret) {
        //stop desktop music and start ending music
        desktop.pause();
        playDesktop = false;
        playEnding = true;
        environ = 4;
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
  //Opening scene
  //check if all three fields are filled out, if no, don't allow user to go to next stage
  if (environ==-1 && filledOut()) {
    stopLoop=false;
  }
  //if all filled out, move on to next stage
  if (environ==-1 && !stopLoop) {
    s++;
  }

  //GeoDash
  if (environ==3) {
    if (g==-1 || g==0) {
      g++; // move to instructions page
    }
    if (geohealth<=0) { // lost dashing geometry -- click to restart
      setup();
    } else if (steps>=1000) {
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
  }
}