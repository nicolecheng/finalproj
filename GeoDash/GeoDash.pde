PImage intro, geo, dash, cont, cont2;
int stat; // static continue text
int g;
PImage wasd, play, geogif;
PFont ins;
PImage redright, redleft; // red panda char
int first, second, third; // to loop background
boolean right;
float[]wren = {300,350,0,0}; // xcor, ycor, in air? (0/1), velocity in air (with gravitational acceleration)

void setup(){
  intro = loadImage("intro.jpg");
  dash = loadImage("dash.png");
  geo = loadImage("geo.png");
  cont = loadImage("cont.png");
  cont2 = loadImage("cont2.png");
  wasd = loadImage("wasd.png");
  play = loadImage("play.png");
  geogif = loadImage("geogif.gif");
  redright = loadImage("redright.gif"); 
  redleft = loadImage("redleft.png"); // the character
  ins = createFont("Anonymous Pro Bold", 27);
  textFont(ins);
  size(800,600);
  g = 0;
  first = 0; // center
  second = 800; // right
  third = -800; // left
  right = true;
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
    fill(255);
    image(wasd, 40, 135);
    text("Use the W, A, S, and D keys to move up,\n left, down, and right, respectively.", 210, 170);
    image(redleft, 500, 250, width/3, height/3);
    text("Meet Wren, the red panda.\nYou are going to guide him\nthrough this arduous journey.", 40, 310);
    text("Are you ready? This is it.\n Press any key to begin.", 180, 500);
  }else if(g==2){
    geo();
  }
    
}

void mouseClicked(){
  if(g==0){
    g++; // move to instructions page
  }
}

void keyPressed(){
  if(g==2){
    if (key=='a'){
      first+=10;
      second+=10;
      third+=10;
      right=false; // going left
    }else if(key=='d'){
      first-=10;
      second-=10;
      third-=10;
      right=true; // going right
    }
  }else if(g==1){
    g++; // move to game
  }
}

void geo(){
  
  background(111);
  image(intro, first, 0);
  image(intro, second, 0);
  image(intro, third, 0);
  fill(111);
  noStroke();
  rect(0,450,800,150);
  
  if(right){
    image(redright, wren[0], wren[1], width/5, height/5);
  }else{
    image(redleft, wren[0], wren[1], width/5, height/5);
  }
  if (first<=-800){
    first = 0;
    second = 800;
    third = 1600;
  }else if(first>=800){
    first = 0;
    second = -800;
    third = -1600;
  }
}