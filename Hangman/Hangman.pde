
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
  
 size(600,400);
   //reading in word list file, remove any white space from the words
wordlist = trim(loadStrings("#wordList.txt#"));

listLen = wordlist.length;

  //make sure everything is lower case
  for(int i = 0; i < listLen; i++){
   wordlist[i] = wordlist[i].toLowerCase(); 
  }

  //randomly choose a word from word list
  wordSelect = int(random(listLen));
  
  //load image for button "restart" and "quit"
  restart = loadImage("restart.png");
  quit = loadImage("quit.png");
}

void draw(){
  
 if(tab == 0){
   background(#AEF0EC);
  gameOver();
  textSize(18);
fill(0);
text("test 1 2",15,100);
text(wordlist[wordSelect],15,130);
text(input,130,100);

 text(""+chances,130,130);
questionSlot(wordlist[wordSelect]);
 }else if (tab == 1){
  background(#AEF0EC);
  optionDialog(); 
 }else if (tab == 2){
   background(0);
 }
 

}