boolean moveOn; // is the user allowed to move onto next scene?
boolean hangman = false;
boolean kitten = false;
int environ = 0;

void setup(){
  size(800,600);
  if (environ==0){
    tutorialSetup();
  }else if(environ==1){
    desktopSetup();
  }else if(environ==2){
    kittenSetup();
  }else if(environ==3){
    hangmanSetup();
  }
}

void mouseClicked(){
  if(moveOn){
    s++;
  }
  if (s==1){
    s1Setup();
    scene1();
  }else if (s==4){
    environ = 1;
    desktopSetup();
  }else if(environ==2 && moveOn){
    print("hangman setup stuff");
    hangmanSetup();
    //hangman = true;
    moveOn = false;
  }else if(environ==3 && moveOn){
    kittenSetup();
    kitten = true;
    moveOn = false;
  }
}

void draw(){
  if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }else if (environ==1){
    desktopDraw();
  }else if(environ==2 && hangman){
    hangmanDraw();
  }else if(environ==3 && kitten){
    kittenDraw();
  }
}