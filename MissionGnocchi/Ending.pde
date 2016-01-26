
PImage letter;
PImage father;
//check which conversation dialogue to show
int index = 1;
PImage dialogue;
boolean fin;

boolean showText = true;

PFont font;

void endSetting() {
  letter = loadImage("letter.jpg");
  father = loadImage("father.png");
  dialogue = loadImage("dialogue"+(index)+".png");
  font = createFont("CourierNewPSMT-18.vlw", 18);
  background(letter);
  image(father, 20, 420, 180, 180);
  if (!fin) {
    image(dialogue, 210, 380, 580, 220);
  } else if (fin) {
    image(dialogue, 0, 0, 800, 600);
    showText = false;
    //environ = 0;
  }
}

void ending() {
  textSize(20);
  textFont(font);
  fill(0);
  text("Press anywhere on the screen to continue", 20, 20);
  text(index, 20, 80);
  if(index == 2){
   text(codeName,350,405);
   text(name,300,530);
  }
  if(index == 6 && showText){
   text(name,400,405);
   text(codeName,340,440);
  }
}