GTextField enterName;
GTextField enterCodeName;
GTextField enterSpecialty;

String name;
String codeName;
String specialty;
int s = 0; // which slide are we up to?
boolean countClicks = true;
boolean stopLoop = false;
boolean [] filled = {false,false,false};

// welcome page
PImage bg0;
PImage welcs;

// scene 1
PImage cert;
PImage grid;
PFont fo; 
int step; // which cert field? (used only in scene 1)

// scene 2
PFont sf;
String s2m; // scene 2's message to user
PImage matrix;

// scene 3
PFont tf;
String s3m; // my message to user
PImage scroll;

void Opening() {

  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);

  bg0 = loadImage("tutbg.jpg"); // must be 800x600
  welcs = loadImage("WelcomeMessage.png");
  cert = loadImage("AgentBadge.jpg"); // 621x321  
  grid = loadImage("oopsgrid.jpg"); // 800x600
  matrix = loadImage("matrix.png"); // 800x600
  scroll = loadImage("scroll.jpg"); // 960x1222
  background(bg0);
  image(welcs, 50, 140, width/1.1, height/2);
  fo = createFont("Trebuchet MS Bold Italic", 16, true);
  textFont(fo, 18); // size 18 
  fill(111, 111, 111);
  text("click to begin...", 650, 570);
  sf = createFont("Courier New Bold", 16, true);  
  tf = createFont("Blackadder ITC", 16, true);
  if (s==1) {
    s1Setup();
    filledOut();
  }else if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }
}

void s1Setup() {
  stopLoop = true;
  background(grid);
  image(cert, 90, 165);  
  fill(255);
  textFont(fo, 20);
  text("Fill out your certificate!", 280, 55);
  enterName = new GTextField(this, 250, 250, 200, 20);
  enterName.addEventHandler(this, "nameHandler");
  enterCodeName = new GTextField(this, 280, 290, 200, 20);
  enterName.addEventHandler(this, "codeNameHandler");
  enterSpecialty = new GTextField(this, 260, 320, 200, 20);
  enterSpecialty.addEventHandler(this, "specialtyHandler");

  //text("Press 3 to move to next field", 260, 80);
  //text("Press 4 to clear certificate", 270, 105);
  text("After filling in, click anywhere to continue...", 370, 570);
}

void nameHandler(GTextField source, GEvent event) {
  name = source.getText();
  if (event.toString().equals("GETS_FOCUS")) {
    //countClicks = false;
  }
  if (event.toString().equals("CHANGED")){
   filled[0] = true; 
  }
}

void codeNameHandler(GTextField source, GEvent event) {
  codeName = source.getText();
  if (event.toString().equals("GETS_FOCUS")) {
    //countClicks = false;
  }
  if (event.toString().equals("CHANGED")){
   filled[1] = true; 
  }
}

void specialtyHandler(GTextField source, GEvent event) {
  specialty = source.getText();
  if (event.toString().equals("GETS_FOCUS")) {
    //countClicks = false;
  }
  if (event.toString().equals("CHANGED")){
   filled[2] = true; 
  }
}

void filledOut(){
  boolean goOn = true;
 for(int i = 0; i < filled.length; i++){
   goOn = goOn && filled[i];
 }
 if(goOn){
  stopLoop = false; 
  print("here");
  s=1;
 }
}

void scene2(){
  /*
  give backstory pt1
  your agency is fighting another nation
  you guys recovered an enemy laptop
  */
  
  background(matrix);
  fill(0);
  noStroke();
  rect(20,50,760,380);
  textFont(sf,17); // size 17
  fill(0,255,0);
  
  s2m = " Secret Agent" + codeName + ", \n\n" + 
        " We have recently uncovered an enemy laptop near your base. \n" +
        " The enemy was holding onto it with his dear life until...\n one of our men took him down. \n" +
        " We believe that there is very sensitive information to be uncovered. \n" +
        " You are the only one who can unlock it. \n" +
        " Your talent in" + specialty + " makes you perfect for the job. \n" + 
        name + ", we are relying on you to save the world. \n \n" +
        " Signed, \n Agent P"; //  P&F fandom (?!)
        
  text(s2m, 35, 95);
  fill(0);
  rect(320,550,455,35);
  fill(0,255,0);
  text("click anywhere on the screen to continue...", 330, 570);
}

void scene3(){
  /*
  blah blah blah ready to begin
  */
  background(0);
  image(scroll, 0, 10, width/1.005, height/1.1);//960x1222
  textFont(tf,20);
  fill(0);
  
  s3m = "Wow, Secret Agent " + codeName + ", that was intense.\n" +
        "It looks like you have quite a journey ahead of you. \n" +
        "The fate of justice lies on your shoulders. \n" +
        "Should you be brave enough to accept this mission, best of luck. \n" + 
        "If not, I am sorry that you live such a cowardly life. It must be hard. \n\n" +
        "All the Best,\n Agent Yuniclo";      
  text(s3m, 45, 120);
  fill(200);
  text("to accept, click anywhere on the screen...", 375, 580);  
}