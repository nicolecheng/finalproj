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


void hangmanSetup(){
  //______________Related to Hangman___________________
//  if(environ == 2){
    //when restarting, reset everything
    for(int i = 0; i < correct.length; i++){
     correct[i] = 0; 
    }
    chances = 6;
    input = '-';
    inputs = "";
  
   //reading in word list file, remove any white space from the words
  //wordlist = trim(loadStrings("#wordList.txt#"));
  wordlist = trim(loadStrings("words.txt"));
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
//  }
}

//related to Hang Man

void hangmanDraw(){
  // ____________________________Related to Hang Man________________________________
//  if (environ == 2){
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
      //wordlist = trim(loadStrings("words.txt"));
      print(wordlist[wordSelect]);
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
 // }
}

void stickFigure(){
 strokeWeight(4);
 noFill();
 beginShape();
 vertex(100,270);
 vertex(100,80);
 vertex(160,80);
 vertex(160,100);
 endShape();
 //first failed try
  if (chances<=5){
   ellipse(160,120,40,40);
  }
//second
 if(chances <= 4){
   noFill();
   beginShape();
   vertex(150,138);
   vertex(140,200);
   vertex(180,200);
   vertex(170,138);
   endShape();
 }
 //third failure
 if(chances <= 3){
   line(150,138,130,160);
 }
 //fourth failure
 if(chances <=2){
  line(170,138,190,160); 
 }
 //fifth
 if(chances <=1){
  line(144,200,143,220); 
 }
 //final
 if(chances <= 0 && tab ==1){
   line(176,200,177,220);
 }
}