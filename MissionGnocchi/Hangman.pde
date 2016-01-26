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

void hangmanSetup() {
  //reset
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

void hangmanDraw() {
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
    
    //_____________________________________________________________________CHEAT HERE__________________________________________________
    //if you can't figure out the word, un-comment this code
    //since I can't figure out the word myself lol
    //text(wordlist[wordSelect], 50, 50);

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