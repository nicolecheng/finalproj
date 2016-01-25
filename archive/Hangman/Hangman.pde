
String[] wordlist;
int [] correct = {0};
int wordSelect;
float listLen;
int chances;
int tab = 0;
PImage restart;
PImage quit;

void setup(){
  
  //when restarting, reset everything
     
  for(int i = 0; i < correct.length; i++){
   correct[i] = 0; 
  }
  chances = 5;
  input = '-';
  inputs = "";
  size(800,600);
  
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

void draw(){
  
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