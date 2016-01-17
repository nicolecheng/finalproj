PImage kbg; // background
int ncat; // number of cats to create
double[][]cats; // array of cats and its [xcor, ycor, speed, loopval,falling?(1=yes)(0=no)]
int score; // player's score
int remcat; // remaining cats to catch
PFont f; // player's stats to display
PImage cat; // cat image!
PImage basket;

void kittenSetup(){
  
  background(255);
  //size(500,650);
  kbg = loadImage("thesky.jpg");
  noStroke();
  
  //  var init
  ncat =  20;
  cats = new double[ncat][5];
  score = 0;
  remcat = ncat;
  remcat = ncat;
  f = createFont("Algerian",16,true);
  textFont(f, 20); // size 20  
  cat = loadImage("cat1.png");

  // basket
  basket = loadImage("basket1.png"); //640x535
//  fill(102,51,0);
//  rect(300,525,90,70);

  // setup cats
  for (int m = 0; m < ncat; m++){
    cats[m][0] = (int)(Math.random() * 500); // xcor
    cats[m][1] = (-1)*(int)(Math.random() * 1000); // when will the kittens fall down?
    cats[m][2] = 5; // init speed
    cats[m][3] = 1;
    cats[m][4] = 1; // yes, it is falling
  }
  
}

void kittenDraw(){
  background(255);
  //background(kbg);
  int baskety = 525;
  if (mouseY > 525){
    baskety = mouseY;
  }    
  //fill(102, 51, 0);
  //rect(mouseX, baskety, 90,70);
  image(basket,mouseX,baskety,width/8,height/10); // 80x53.5
  
  // cat falling!
  for (int r = 0; r < ncat; r++){
    if(cats[r][4] == 1){ // if still falling
      if (cats[r][1] > 0){
        cats[r][2] += .003 * cats[r][3]; // increase speed
        cats[r][1] += cats[r][2]; // ycor change
        cats[r][3]++; // increase loopval thingy
      }else{ // cat is not yet on the screen
        cats[r][1]++; // don't start accelerating yet
      }
      image(cat,(float)cats[r][0],(float)cats[r][1], width/15, height/25); // 333x500 -> 20.8x20
    }
    
    // past ycor threshold and in basket range?
    if(cats[r][1] >= 525 && cats[r][0] >= mouseX && cats[r][0] <= mouseX + 80 && cats[r][4] == 1){ 
        cats[r][4] = 0;
        score += 10; // 10 pts to griffindor!  
        remcat--;
    }
    
    if (cats[r][1] >= 625 && (cats[r][0] < mouseX || cats[r][0] > mouseX + 80) && cats[r][4] == 1){
        cats[r][4] = 0;
        score -= 20; // lose 20 pts for dropping the kitten
        remcat--;
      }
      
  }
  
/*
  
  // ever so often, print out the status of each kitten 
  if (Math.random() > 0.9){
    for (int r = 0; r < ncat; r++){
      for (int o = 0; o < 4; o++){
        print(cats[r][o] + ", ");
      }
      print( "////"+mouseX+"///" );
    }
  }
  */

  fill(50,150,0);
  text("Kitten Drop",15,25);
  fill(111,111,111);
  text("Score:" + score, 390, 25);
  text("Cats remaining:"+remcat,300,50);

  println(score);
  


  if (remcat == 0){
    Congrats();
  }
  
}

void Congrats(){
  
  if (score > 0){
    background(kbg);
  
    textFont(f, 30); // size 20 
    fill(111,111,111);
    text("CONGRATULATIONS!", 100, 250);
    text("You have saved enough kittens", 7, 300);
    text("to move onto the next stage.", 22, 350);
  }else{
    background(kbg);
  
    textFont(f, 30); // size 20 
    fill(111,111,111);
    text("AH, FIDDLESTICKS!", 120, 250);
    text("You didn't save enough kittens.", 8, 300);
    text("Try again.", 170, 350);
  }    
  
}