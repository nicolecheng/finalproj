PImage intro, geo, dash, cont, cont2;
int stat; // static continue text
int g;
PImage wasd, play, geogif;
PFont ins;
PImage redright, redleft; // red panda char
int first, second, third, fourth; // to loop background
boolean right;
boolean bend;
int[]wren = {300,350}; // xcor, ycor
double[][]shapes; // 3d array of shooting shapes
int nshapes, remshapes;
int health;
int step; // you must cover a certain amount of ground to win

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
  nshapes = 200; // how many shooting shapes?
  remshapes = nshapes;
  shapes = new double[nshapes][7]; //[xcor, ycor, hit?, shape, r, g, b]
  health = 100;
  
  for (int m = 0; m < nshapes; m++) {
    shapes[m][0] = 800+(int)(Math.random() * 20000); // when will they come onto the screen?
    shapes[m][1] = (int)(Math.random() * 500); // ycor
    shapes[m][2] = 0; // no, it has not hit wren yet
    shapes[m][3] = (int)(Math.random()*3); // 0 = circle, 1 = square, 2 = triangle
    for(int i=4; i<7;i++){
      shapes[m][i]=(int)(Math.random()*255); // color
    }
  } 
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
    textSize(22);
    background(geogif);
    image(play, 140, 0, width/1.5, height/6);
    fill(240);
    image(wasd, 40, 135);
    text("Use the W, A, S, and D keys to move up,\n left, down, and right, respectively,\n to dodge the geometric shapes.", 250, 170);
    image(redleft, 500, 260, width/3, height/3);
    textSize(18);
    text("Meet Agent Wren, the red panda.\nYou are going to guide him through \nthis arduous journey. Wren levitates \nand moves at the speed of light.",40, 290);
    text("In other words, gravity doesn't apply \nto him, and when he moves forward, \neverything seems to be frozen.", 40, 390 );
    text("For every shape that hits you, you will lose HP. \nIn addition to dodging shapes, you must cover a certain amount of ground.", 40, 465);
    text("Your HP, step count, and the # of bullets remaining will be displayed.", 60, 515);
    text("Are you ready? This is it.\n Press any key to begin.", 240, 550);
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
      fourth=-800+first;
      step+=10;
    }else if(key=='d'){ // forward
      first-=10;
      second-=10;
      third-=10;
      right=true; // going right
      fourth=800+first;
      step-=10;
    }else if(key=='w'){ // up
      wren[1]-=10;
    }else if(key=='s'){ //down
      wren[1]+=10;
    }
  }else if(g==1){
    g++; // move to game
  }
}

void geo(){
  
  background(intro);
  image(intro, first, 0);
  image(intro, second, 0);
  image(intro, third, 0);
  image(intro, fourth, 0);
  //fill(111);
  //noStroke();
  //rect(0,450,800,150);
  
  //wren
  if(right){
    image(redright, wren[0], wren[1], width/5, height/5);
  }else{
    image(redleft, wren[0], wren[1], width/5, height/5);
  }
  
  //bg
  if (first<=-800){
    first = 0;
    second = 800;
    third = 1600;
  }else if(first>=800){
    first = 0;
    second = -800;
    third = -1600;
  }
  
  for (int r = 0; r < nshapes; r++) {
    if (shapes[r][2] == 0) { // if still hasn't hit wren
      if (shapes[r][0] < 800) { // if on screen
        shapes[r][0] -= 5; // xcor change
      } else { // shape is not yet on the screen
        shapes[r][0]--; // don't start accelerating yet
      }
      if(shapes[r][3]==0){
        fill((float)shapes[r][4],(float)shapes[r][5],(float)shapes[r][6]);
        ellipse((float)shapes[r][0], (float)shapes[r][1],20,20);
      }else if(shapes[r][3]==1){
        fill((float)shapes[r][4],(float)shapes[r][5],(float)shapes[r][6]);
        rect((float)shapes[r][0], (float)shapes[r][1],20,20);
      }else if(shapes[r][3]==2){
        fill((float)shapes[r][4],(float)shapes[r][5],(float)shapes[r][6]);
        triangle((float)shapes[r][0], (float)shapes[r][1],(float)shapes[r][0]-10, (float)shapes[r][1]+20,(float)shapes[r][0]+10, (float)shapes[r][1]+20);
      }
    }
    if (shapes[r][0] <= 430 && shapes[r][1] >= wren[1] && shapes[r][1] <= wren[1]+110 && shapes[r][2] == 0) { 
      shapes[r][2] = 1; //hit
      health -= 10; // ouch 
      remshapes--;
    }
    if(shapes[r][0]<=0 && shapes[r][2]==0){ // past page
      shapes[r][2]=1; // past
      remshapes--;
    }
  }
}