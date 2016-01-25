//variable used across all platform to transfer from desktop to gaming environment
// -1 = opening
// 0 = desktop
// 1 = Hang man
// 2 = Kitten drop
// 3 = ending
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

//Hang man variables
String[] wordlist;
int [] correct = {0};
int wordSelect;
float listLen;
int chances;
int tab = 0;
PImage restart;
PImage quit;
char input;
boolean pressed = false;
String inputs = "";
boolean  again = false;
boolean exit = false;
boolean finished = false;

//Kitten Drop variable
PImage bg; // background
int ncat; // number of cats to create
double[][]cats; // array of cats and its [xcor, ycor, speed, loopval,falling?(1=yes)(0=no)]
int score; // player's score
int remcat; // remaining cats to catch
PFont f; // player's stats to display
PImage cat; // cat image!
PImage basket;

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
  if (environ == 1) {
    correct = subset(correct, correct.length-1);
    correct[0] = 0;
    chances = 5;
    input = '-';
    inputs = "";

    //reading in word list file, remove any white space from the words
    wordlist = trim(loadStrings("#wordList.txt#"));
    listLen = wordlist.length;

    //make sure everything is lower case
    for (int i = 0; i < listLen; i++) {
      wordlist[i] = wordlist[i].toLowerCase();
    }

    //randomly choose a word from word list
    wordSelect = int(random(listLen));

    //set defaul value of correct to 0( = incorrect)
    for (int i = 0; i < wordlist[wordSelect].length()-1; i++) {
      correct = append(correct, 0);
    }
  }

  //__________Related to Kitten Drop_____________________
  if (environ == 2) {
    background(255);
    bg = loadImage("thesky.jpg");
    noStroke();

    //  var init
    ncat =  30;
    cats = new double[ncat][5];
    score = 0;
    remcat = ncat;
    f = createFont("Algerian", 16, true);
    textFont(f, 20); // size 20  
    cat = loadImage("cat1.png");

    // basket
    basket = loadImage("basket1.png"); //640x535
    //  fill(102,51,0);
    //  rect(300,525,90,70);

    // setup cats
    for (int m = 0; m < ncat; m++) {
      cats[m][0] = (int)(Math.random() * 800); // xcor
      cats[m][1] = (-1)*(int)(Math.random() * 1000); // when will the kittens fall down?
      cats[m][2] = 5; // init speed
      cats[m][3] = 1;
      cats[m][4] = 1; // yes, it is falling
    }
  }

  if (environ == 3) {
    endSetting();
  }
}

void draw() {

  playMusic();    
  //____________________________Related to Opening
  if (environ == -1 && !stopLoop) {
    println(s);
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
        desktop.pause();
        playGeoDash = true;
        //_______________________________________________________Put GeoDash stuff here______________________________________________________
      } else if (overSecret) {
        environ = 3;
        desktop.pause();
        playEnding = true;
      }
      setup();
    }
  }

  // ____________________________Related to Hang Man________________________________
  if (environ == 1) {
    //use tab to determine which background to load
    //tab 0 is the gaming environment background
    if (tab == 0) {
      background(#AEF0EC);
      //check if it's game over or solved
      gameOver();
      solved();
      //draw the stick figure 
      stickFigure();
      //create puzzle 
      questionSlot(wordlist[wordSelect]);
      //Show how many chances left
      textSize(18);
      fill(0);
      text("" + chances + "  Tries left", 330, 100);
      //Show letters guessed so far
      text(inputs, 400-3*inputs.length(), 180);
      //since I cannot figure out the word lol
      text(wordlist[wordSelect], 50, 50);

      //tab 1 is the pop-up window background
    } else if (tab == 1) {
      background(#AEF0EC);
      //draw the stick figure 
      stickFigure();
      popUp(); 
      //tab 2 gdesktop
    } else if (tab == 2) {
      background(0);
    }
  }

  //______________________________Related to Kitten Drop_______________________________
  if (environ == 2) {
    background(bg);
    int baskety = 525;
    if (mouseY > 525) {
      baskety = mouseY;
    }    
    //fill(102, 51, 0);
    //rect(mouseX, baskety, 90,70);
    image(basket, mouseX, baskety, width/8, height/10); // 80x53.5

    // cat falling!
    for (int r = 0; r < ncat; r++) {
      if (cats[r][4] == 1) { // if still falling
        if (cats[r][1] > 0) {
          cats[r][2] += .003 * cats[r][3]; // increase speed
          cats[r][1] += cats[r][2]; // ycor change
          cats[r][3]++; // increase loopval thingy
        } else { // cat is not yet on the screen
          cats[r][1]++; // don't start accelerating yet
        }
        image(cat, (float)cats[r][0], (float)cats[r][1], width/25, height/25);
      }

      // past ycor threshold and in basket range?
      if (cats[r][1] >= 525 && cats[r][0] >= mouseX && cats[r][0] <= mouseX + 80 && cats[r][4] == 1) { 
        cats[r][4] = 0;
        score += 10; // 10 pts to griffindor!  
        remcat--;
      }

      if (cats[r][1] >= 625 && (cats[r][0] < mouseX || cats[r][0] > mouseX + 80) && cats[r][4] == 1) {
        cats[r][4] = 0;
        score -= 20; // lose 20 pts for dropping the kitten
        remcat--;
      }
    }

    fill(255);
    text("Kitten Drop", 15, 25);
    text("Score:" + score, 690, 25);
    text("Cats remaining:"+remcat, 600, 50);
    text("Move your mouse to catch the kittens!",15, 50);
  
    //println(score);

    if (remcat == 0) {
      Congrats();
    }
  }

  //___________________________________________Related to Ending__________________________________
  if (environ == 3) {
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

  //_______________________Related to Ending___________________________
  if (environ == 3) {
    if (index<=10) {
      index++;
    }
    if (index == 11) {
      fin = true;
    }
  endSetting();
}
}