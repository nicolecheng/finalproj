int ncat; // number of cats to create
double[][]cats; // array of cats and its [r, g, b, xcor, ycor, speed, loopval,falling?(1=yes)(0=no)]
int score; // player's score
int remcat; // remaining cats to catch
PFont f; // player's stats to display
PImage bg; // background

void setup(){

  background(255);
  size(500,650);
  bg = loadImage("thesky.jpg");
  noStroke();
  
  //  var init
  ncat =  15;
  cats = new double[ncat][8];
  score = 0;
  remcat = ncat;
  remcat = ncat;
  f = createFont("Algerian",16,true);
  textFont(f, 20); // size 20  

  // rectangle "basket"
  fill(102,51,0);
  rect(300,525,90,70);

  // setup cats
  for (int m = 0; m < ncat; m++){
    for (int r = 0; r < 3; r++){
      cats[m][r] = Math.random() * 255; // give random color vals to each cat
    }
    cats[m][3] = (int)(Math.random() * 500); // xcor
    cats[m][4] = (-1)*(int)(Math.random() * 1000); // when will the kittens fall down?
    cats[m][5] = 5; // init speed
    cats[m][6] = 1;
    cats[m][7] = 1; // yes, it is falling
  }
  
}

void draw(){
  
  background(bg);
  int baskety = 525;
  if (mouseY > 525){
    baskety = mouseY;
  }    
  fill(102, 51, 0);
  rect(mouseX, baskety, 90,70);
  
  // cat falling!
  for (int r = 0; r < ncat; r++){
    if(cats[r][7] == 1){ // if still falling
      if (cats[r][4] > 0){
        cats[r][5] += .003 * cats[r][6]; // increase speed
        cats[r][4] += cats[r][5]; // ycor change
        cats[r][6]++; // increase loopval thingy
      }else{ // cat is not yet on the screen
        cats[r][4]++; // don't start accelerating yet
      }
      fill((float)cats[r][0],(float)cats[r][1],(float)cats[r][2]);
      ellipse((float)cats[r][3],(float)cats[r][4],20,20); // moving kitty
    }
    
    // past ycor threshold and in basket range?
    if(cats[r][4] >= 525 && cats[r][3] >= mouseX && cats[r][3] <= mouseX + 90 && cats[r][7] == 1){ 
        cats[r][7] = 0;
        score += 50; // 50 pts to griffindor!  
        remcat--;
    }
    
    if (cats[r][4] >= 625 && (cats[r][3] < mouseX || cats[r][3] > mouseX + 90) && cats[r][7] == 1){
        cats[r][7] = 0;
        score -= 100; // lose 100 pts for dropping the kitten
        remcat--;
      }
      
  }
  

  /*
  // ever so often, print out the status of each kitten 
  if (Math.random() > 0.9){
    for (int r = 0; r < ncat; r++){
      for (int o = 0; o < 7; o++){
        print(cats[r][o] + ", ");
      }
      print( "///////" );
    }
  }
  */

  fill(50,150,0);
  text("Kitten Drop",15,25);
  fill(111,111,111);
  text("Score:" + score, 390, 25);
  text("Cats remaining:"+remcat,290,50);

  println(score);
  
}
