String name;
String codeName;
String specialty;
int s; // which slide are we up to?

// welcome page
PImage bg;
PImage welcs;

// scene 1
PImage cert;
PFont fo; 
int step; // which cert field? (used only in scene 1)

// scene 2
PFont sf;
String s2m; // scene 2's message to user

// scene 3
PFont tf;
String s3m; // my message to user

void setup(){

  String[] fontList = PFont.list();
  printArray(fontList);

  bg = loadImage("tutbg.jpg"); // must be 800x600
  welcs = loadImage("WelcomeMessage.png");
  cert = loadImage("AgentBadge.jpg"); // 621x321  
  
  size(800,600);
  background(bg);
  image(welcs,50,140, width/1.1,height/2);
  
  fo = createFont("Trebuchet MS Bold Italic",16,true);
  textFont(fo, 18); // size 18 
  fill(111,111,111);
  text("click to begin...", 650, 570);

  sf = createFont("Courier New Bold",16,true);  
  tf = createFont("Blackadder ITC",16,true);
  
}

void mouseClicked(){
  s++;
  if (s==1){
    s1Setup();
    scene1();
  }else if (s==4){
    kittenSetup();
  }
}

void draw(){
  if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }else if (s==4){
    kittenDraw();
  }
}

void scene1(){
  //fill out certificate
  keyPressed();
}

void s1Setup(){
  name = " ";
  codeName = " ";
  specialty = " ";
  step = 0;
  background(255);
  image(cert,90,165);  
  fill(0);
  textFont(fo, 20);
  text("Fill out your certificate!", 280, 45);
  text("Press 3 to move to next field", 260, 70);
  text("Press 4 to clear certificate", 270, 95);
  fill(70);
  text("click anywhere on the screen to continue...", 370, 570);
}

void keyPressed(){
  if (s == 1 && keyPressed){
    if (key == '3'){
      step++;
    }
    if (key == '4'){
      s1Setup();
    }
    if (key > 64 || key == ' '){
      if (step == 0){
        name += key;
        text(name, 210,270);    
      } else if (step == 1){
        codeName += key;
        text(codeName, 280, 305);
      } else if (step == 2){
          specialty += key;
          text(specialty, 250, 335);
      }
    }  
  }
}
 
void scene2(){
  /*
  give backstory pt1
  your agency is fighting another nation
  you guys recovered an enemy laptop
  */
  
  background(245,245,204);
  fill(255);
  noStroke();
  rect(20,20,780,400);
  textFont(sf,14); // size 14
  fill(111,111,111);
  
  s2m = " Secret Agent" + codeName + ", \n" + 
        " We have recently uncovered an enemy laptop near your base. \n" +
        " The enemy was holding onto it with his dear life until one of our men took him down. \n" +
        " We believe that there is very sensitive information stored deep inside of it. \n" +
        " You are the only one who can unlock it. \n" +
        " Your talent in" + specialty + " makes you perfect for the job. \n" + 
        name + ", we are relying on you to save the world. \n \n" +
        " Signed, \n Agent P"; //  P&F fandom (?!)
        
  text(s2m, 80,70);
  text("click anywhere on the screen to continue...", 370, 570);
}

void scene3(){
  /*
  blah blah blah ready to begin
  */
  background(255);
  textFont(tf,30);
  fill(0);
  
  s3m = "Wow, Secret Agent " + codeName + ", that was intense.\n" +
        "It looks like you have quite a journey ahead of you. \n" +
        "The fate of justice lies on your shoulders. \n" +
        "Should you be brave enough to accept this mission, click anywhere to begin. \n" + 
        "If not, I am sorry that you live a cowardly life. It must be hard. \n\n" +
        "All the Best,\n Agent Yuniclo";
        
  text(s3m, 60, 70);
  
}