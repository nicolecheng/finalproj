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
  shapes = new double[nshapes][9]; //[xcor, ycor, velocity, loopval, hit?, shape, r, g, b]
  health = 100;
  
  for (int m = 0; m < nshapes; m++) {
    shapes[m][0] = 800+(int)(Math.random() * 20000); // when will they come onto the screen?
    shapes[m][1] = (int)(Math.random() * 500); // ycor
    shapes[m][2] = 5; // init speed
    shapes[m][3] = 1; // used to multiply by acceleration constant to determine velocity
    shapes[m][4] = 0; // no, it has not hit wren yet
    shapes[m][5] = (int)(Math.random()*3); // 0 = circle, 1 = square, 2 = triangle
    for(int i=6; i<9;i++){
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
    textSize(27);
    background(geogif);
    image(play, 140, 0, width/1.5, height/6);
    fill(255);
    image(wasd, 40, 135);
    text("Use the W, A, S, and D keys to move up,\n left, down, and right, respectively,\n to dodge the geometric shapes.", 210, 170);
    image(redleft, 500, 260, width/3, height/3);
    text("Meet Wren, the red panda.\nYou are going to guide him\nthrough this arduous journey.", 40, 320);
    text("Are you ready? This is it.\n Press any key to begin.", 180, 490);
    textSize(17);
    text("Note: Wren can levitate. Gravity and jumping don't exist for him.", 100, 580);
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
  
  background(111);
  image(intro, first, 0);
  image(intro, second, 0);
  image(intro, third, 0);
  image(intro, fourth, 0);
  fill(111);
  noStroke();
  rect(0,450,800,150);
  
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
    if (shapes[r][4] == 0) { // if still hasn't hit wren
      if (shapes[r][0] < 800) { // if on screen
        shapes[r][2] += .003 * shapes[r][3]; // increase speed
        shapes[r][0] -= shapes[r][2]; // xcor change
        shapes[r][3]++; // increase loopval thingy
      } else { // shape is not yet on the screen
        shapes[r][0]--; // don't start accelerating yet
      }
      if(shapes[r][5]==0){
        fill((float)shapes[r][6],(float)shapes[r][7],(float)shapes[r][8]);
        ellipse((float)shapes[r][0], (float)shapes[r][1],10,10);
      }else if(shapes[r][5]==1){
        fill((float)shapes[r][6],(float)shapes[r][7],(float)shapes[r][8]);
        rect((float)shapes[r][0], (float)shapes[r][1],10,10);
      }else if(shapes[r][5]==2){
        fill((float)shapes[r][6],(float)shapes[r][7],(float)shapes[r][8]);
        triangle((float)shapes[r][0], (float)shapes[r][1],(float)shapes[r][0]-5, (float)shapes[r][1]+10,(float)shapes[r][0]+5, (float)shapes[r][1]+10);
      }
      //image(cat, (float)cats[r][0], (float)cats[r][1], width/15, height/25); // 333x500 -> 20.8x20
    }

    if (shapes[r][0] <= 430 && shapes[r][1] >= wren[1] && shapes[r][1] <= wren[1]+110 && shapes[r][4] == 1) { 
      shapes[r][4] = 0;
      health -= 10; // ouch 
      remshapes--;
    }
/*
    if (cats[r][1] >= 625 && (cats[r][0] < mouseX || cats[r][0] > mouseX + 80) && cats[r][4] == 1) {
      cats[r][4] = 0;
      score -= 20; // lose 20 pts for dropping the kitten
      remcat--;
    }
  
  */
  }
}