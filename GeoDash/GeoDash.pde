PImage intro, geo, dash, cont, cont2;
int stat; // static continue text
int g;
PImage wasd, play, geogif;
PFont ins;
PImage redright, redleft; // red panda char

void setup(){
  intro = loadImage("intro.jpg");
  dash = loadImage("dash.png");
  geo = loadImage("geo.png");
  cont = loadImage("cont.png");
  cont2 = loadImage("cont2.png");
  wasd = loadImage("wasd.png");
  play = loadImage("play.png");
  geogif = loadImage("geogif.gif");
  redright = loadImage("redright.png"); // perry for instructions
  redleft = loadImage("redleft.png"); // the character
  ins = createFont("Anonymous Pro Bold", 27);
  textFont(ins);
  size(800,600);
  g = 0;
}

void draw(){
  if(g==0){
    background(intro);
    stat = (int)(Math.random()*2);
    if(stat>0){
    image(cont, 535, 510, width/3, height/6);
    image(dash, 135, 40, width/1.5, height/3);
    image(geo, 135, 175, width/1.5, height/3);
    }else{
    image(cont2, 535, 510, width/3, height/6);
    image(dash, 145, 40, width/1.5, height/3);
    image(geo, 145, 175, width/1.5, height/3);
    }
  }else if(g==1){
    background(geogif);
    image(play, 140, 0, width/1.5, height/6);
    image(wasd, 40, 125);
    fill(255);
    text("Use the W, A, S, and D keys to move up,\n left, down, and right, respectively.", 210, 160);
    image(redleft, 500, 230, width/3, height/3);
    text("Meet Wren, the red panda.\nYou are going to guide him\nthrough this arduous journey.", 40, 290);
  }else if(g==2){
    geo();
  }
    
}

void mouseClicked(){
  g++;
}

void geo(){
  background(intro);
  
}