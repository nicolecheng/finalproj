PImage intro, geo, dash, cont, cont2;
int stat; // static continue text

void setup(){
  intro = loadImage("intro.jpg");
  dash = loadImage("dash.png");
  geo = loadImage("geo.png");
  cont = loadImage("cont.png");
  cont2 = loadImage("cont2.png");
  size(800,600);
}

void draw(){
  
  background(intro);
  image(dash, 10, 40, width/3, height/3);
  image(geo, 40, 130, width/3, height/3);
  image(cont, 150, 400, width/4, height/4);
  
  stat = (int)(Math.random()*2);
  if(stat>1){
  }
    
}