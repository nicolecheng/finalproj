PImage bg;
PImage welcs;
PImage cert;
PFont f; 
int s; // which slide are we up to?
int textx; // x pos on cert
int texty; // y pos on cert

// for the cute little certificate they can fill out in the tutorial
String name;
String codeName;
String specialty;

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
  text("click to begin...", 700, 440);
  
  textx = 5;
  
}

void mouseClicked(){
  s++;
}

void draw(){
  
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
  /*
  fill out certificate
  */
  background(255);
  keyPressed();
  //mouseclicked to change field -> texty += n
}
/*
alternative: 
  void keyPressed(){
    if (key=='a'){
      name += "a";
    }else if (key=='b'){
      name += "b";
    }
  }
etc.
*** create an array of letters
*** almost like a library to make the ifs/elses easier
*/
void keyPressed(){
  if (key == 'a'){
    text("a",textx,texty);
    textx+=5;
  }  
}
 
void scene2(){
  /*
  give backstory pt1
  your agency is fighting another nation
  you guys recovered an enemy laptop
  */
  
}

void scene3(){
  /*
  backstory pt2
  you are the most tech saavy person they have
  you are given the task of cracking open the files
  */
  
}

void scene4(){
  /*
  blah blah blah ready to begin
  */
}