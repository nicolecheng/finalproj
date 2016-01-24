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
    
}