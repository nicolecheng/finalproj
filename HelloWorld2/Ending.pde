
PImage letter;
PImage father;
//check which conversation dialogue to show
int index = 1;
PImage dialogue;
boolean fin;

void endSetting() {
  letter = loadImage("letter.jpg");
  father = loadImage("father.png");
  dialogue = loadImage("dialogue"+index+".png");
  background(letter);
  image(father,20,420,180,180);
  if(!fin){
  image(dialogue,210,380,580,220);
  }else if (fin){
    image(dialogue,0,0,800,600);
    //environ = 0; 
  }
}

void ending() {
  textSize(20);
  fill(0);
  text("Press anywhere on the screen to continue",20,20);
}