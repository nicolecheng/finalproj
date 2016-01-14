PImage bg;
PImage welcs;
PImage cert;
PFont f; 
int s; // which slide are we up to?

void setup(){
  
  bg = loadImage("banner.jpg"); // 960x465
  welcs = loadImage("WelcomeMessage.png");
  cert = loadImage("AgentBadge.jpg"); // 621x321  
  
  size(960,465);
  background(bg);
  image(welcs,90,80, width/1.3,height/1.4);
  
  f = createFont("FreeMonoBoldOblique",16,true);
  textFont(f, 20); // size 20 
  fill(111,111,111);
  text("click to continue...", 700, 440);
  
}

void draw(){
  
  if (mouseClicked()){
    s++;
  }
  
  if (s==1){
    scene1();
  }else if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }else if (s==4){
    scene4();
  }
  
}

void scene1(){
  
}

void scene2(){
  
}

void scene3(){
  
}

void scene4(){
  
}