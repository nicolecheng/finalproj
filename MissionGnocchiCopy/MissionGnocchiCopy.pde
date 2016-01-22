boolean moveOn; // is the user allowed to move onto next scene?
int environ = 0;
boolean stuck; // are you stuck in the game? (aka you haven't finished the game yet)

void setup(){
  size(800,600);
  if (environ==0){
    tutorialSetup();
  }else if(environ==1){
    desktopSetup();
  }else if(environ==2){
    hangmanSetup();
  }else if(environ==3){
    kittenSetup();
  }
}

void mouseClicked(){
  if(environ==0 && moveOn){
    s++;
  }
  if (environ==0){ // if on tutorial
    if (s==1){
      s1Setup();
      scene1();
    }else if (s==4){
      environ = 1;
      desktopSetup();
    }
  }else if (environ==1){ // on simulation
    if(overHangman){
      stuck=true;
      hangmanSetup();
    }else if(overKittendrop){
      stuck=true;
      kittenSetup();
    }
  }else if (environ==2 && !stuck){ // not stuck on hangman
      if (moveOn){ // finished game
        environ = 1;
        //moveOn = false;
      }else{ // did not finish game yet
        hangmanSetup();
      }
  }
  println(environ);
  println(s);
  /*
  else if(environ==2 && moveOn){ //idk
    hangmanSetup();
    hangman = true;
    moveOn = false;
  }else if(environ==3 && moveOn && kitten){
    kittenSetup();
    moveOn = false;
  }else if(environ==3 && moveOn && !kitten){
    kittenSetup();
    kitten = true;
    moveOn = false;
  }else if(environ==3 && s==8){
    environ=1;
    desktopSetup();
    s=4;
  }
  */
}

void draw(){
  if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }else if (environ==1){
    desktopDraw();
  }else if(environ==2){
    hangmanDraw();
  }else if(environ==3){
    kittenDraw();
  }
  
}