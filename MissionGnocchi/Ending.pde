// initiate images for ending scene
PImage letter;
PImage father;
PImage dialogue;

//check which conversation dialogue to show
int index = 1;

//whether to show the final picture and remove all text
boolean fin;
boolean showText = true;

PFont font;

//how the final scene would show
void endSetting() {
  letter = loadImage("letter.jpg");
  father = loadImage("father.png");
  //according to different index(add by user mouseclick), change the dialogue picture
  dialogue = loadImage("dialogue"+(index)+".png");
  font = createFont("CourierNewPSMT-18.vlw", 18);
  background(letter);
  image(father, 20, 420, 180, 180);
  //show dialogue
  if (!fin) {
    image(dialogue, 210, 380, 580, 220);
    //show final pic
  } else if (fin) {
    image(dialogue, 0, 0, 800, 600);
    showText = false;
  }
}

void ending() {
  textSize(20);
  textFont(font);
  fill(0);
  text("Press anywhere on the screen to continue", 20, 20);
  //show user's name on screen along with dialogue boxes
  if (index == 2) {
    text(codeName, 350, 405);
    text(name, 300, 530);
  }
  if (index == 6 && showText) {
    text(name, 400, 405);
    text(codeName, 340, 440);
        text(name, 420, 585);
  }
}