//variable used across all platform to transfer from desktop to gaming environment
// 0 = desktop
// 1 = Hang man
// 2 = Kitten drop
int environ = 1;

//Main desktop stimulation variables
PImage toolBar1;
PImage toolBar2;
PImage toolBar3;
int mouseClicks;
boolean overFolder1 = false;
boolean overFolder2 = false;
boolean overFolder3 = false;
boolean openNew = false;
boolean overClose = false;
float xOff = 0;
float yOff = 0;
boolean over = false;
boolean locked = false;
float winx = 200;
float winy = 150;
Window w,e,r;

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

//testing
float coords[][] = {{200,150},{200,150},{200, 150}};
float offs[][] ={{0,0},{0,0},{0,0}};
int winNum = 0;

void  setup(){
size(800,600);

//_____________desktop set up_______________________
if (environ == 0) {
toolBar1 = loadImage("minimize.PNG");
toolBar2 = loadImage("square.PNG");
toolBar3 = loadImage("x.PNG");
}

//______________Related to Hangman___________________
if(environ == 1){
  //when restarting, reset everything
  for(int i = 0; i < correct.length; i++){
   correct[i] = 0; 
  }
  chances = 5;
  input = '-';
  inputs = "";
  
   //reading in word list file, remove any white space from the words
wordlist = trim(loadStrings("#wordList.txt#"));
listLen = wordlist.length;

  //make sure everything is lower case
  for(int i = 0; i < listLen; i++){
   wordlist[i] = wordlist[i].toLowerCase(); 
  }

  //randomly choose a word from word list
  wordSelect = int(random(listLen));
  
   //set defaul value of correct to 0( = incorrect)
  for(int i = 0; i < wordlist[wordSelect].length()-1; i++){
   correct = append(correct, 0); 
  }
  
  //load image for button "restart" and "quit"
  restart = loadImage("restart.png");
  quit = loadImage("quit.png");
}

if(environ == 2){
  
}

}

void draw(){
  if( environ == 0){
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
}

if (environ == 1){
  //use tab to determine which background to load
  //tab 0 is the gaming environment background
   if(tab == 0){
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
  text("" + chances + "  Tries left",330,100);
  //Show letters guessed so far
  text(inputs, 400-3*inputs.length(), 180);
  //since I cannot figure out the word lol
  text(wordlist[wordSelect],50,50);
  
   //tab 1 is the pop-up window background
   }else if (tab == 1){
    background(#AEF0EC);
     //draw the stick figure 
    stickFigure();
    popUp(); 
    //tab 2 is entirely black, which is a substitution for the desktop 
    //for now because the files are not combined yet
   }else if (tab == 2){
     background(0);
   }
}

}