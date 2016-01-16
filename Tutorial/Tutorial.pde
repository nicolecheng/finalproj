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
  
  name = " ";
  codeName = " ";
  specialty = " ";
  
  f = createFont("FreeMonoBoldOblique",16,true);
  textFont(f, 20); // size 20 
  fill(111,111,111);
  text("click to begin...", 700, 440);
  
  textx = 350;
  texty = 210;
}

void mouseClicked(){
  s++;
  if (s==1){
    background(255);
    image(cert,180,100);
    scene1();
  }
}

void draw(){
  if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }else if (s==4){
    scene4();
  }
  /*
  if (s==1){
    background(255);
    image(cert,180,100);
    scene1();
  }else if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }else if (s==4){
    scene4();
  }
  */
}

void scene1(){
  /*
  fill out certificate
  */
//  background(255);
//  image(cert,180,100);
  text("Fill out your certificate!", 380, 20);
  text("Press enter to move to next field", 340, 40);
  text("Press the . button to clear certificate", 325, 60);
  fill(0);
  text("Click anywhere on the screen to continue", 500, 450);
  keyPressed();
}

void keyPressed(){
  int step = 0;
  //text("ahdjagsaf",textx,texty);
  if (keyPressed){
    if (step == 0){
      name += key;
      text(name, 300,210);
    }
  }
  /*
      if (key == "Enter"){
        step++;
      }
    } else if (step == 1 && keyPressed){
      codeName += key;
      text(codeName, 350, 230);
    //textx += 1;
  }  */
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