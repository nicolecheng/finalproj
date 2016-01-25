PImage intro, geo, dash, cont, cont2;
int stat; // static continue text
int g;
PImage wasd, play, geogif;
PFont ins;
PImage redright, redleft; // red panda char
int first, second, third, fourth; // to loop background
boolean right;
boolean bend;
int[]wren = {300,350,0,0}; // xcor, ycor, in air? (0/1), velocity in air (with gravitational acceleration)
int step = 0; // which part of game are we up to? 

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
  fourth = 800; // just to patch first, second, third
  right = true;
  bend = false;
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
    if (key=='a'){ // back
      first+=10;
      second+=10;
      third+=10;
      right=false; // going left
      step-=10;
      fourth=-800+first;
    }else if(key=='d'){ // forward
      first-=10;
      second-=10;
      third-=10;
      right=true; // going right
      step+=10;
      fourth=800+first;
    }else if(key=='w'){ // up
    }else if(key=='s'){ //down
      bend = true;
    }
  }else if(g==1){
    g++; // move to game
  }
}

void keyReleased(){
  bend=false;
}

void geo(){
  
  background(111);
  image(intro, first, 0);
  image(intro, second, 0);
  image(intro, third, 0);
  image(intro, fourth, 0);
  fill(111);
  noStroke();
  rect(0,450,800,150);
  
  if(right){
    if(bend){
      image(redright, wren[0], wren[1]+30, width/5, height/7); // if squatting
    }else{
      image(redright, wren[0], wren[1], width/5, height/5);
    }
  }else{
    if(bend){
      image(redleft, wren[0], wren[1]+30, width/5, height/7);
    }else{
      image(redleft, wren[0], wren[1], width/5, height/5);
    }
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
  if(Math.random()>.8){
  println(first);
  println(second);
  println(third);
  }
  rect(1000-step, 300, 120, 30);
}