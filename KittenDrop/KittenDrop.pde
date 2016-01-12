int ncat = 15; // number of cats to create
//int catx = 40;
//int caty = 0;
//float speed = 5; // init speed
double[][]cats = new double[ncat][7]; // array of cats and its [r, g, b, xcor, ycor, speed, loopval]

void setup(){

  background(255,255,255);
  size(500,500);
  noStroke();

// rectangle "basket"
  fill(102,51,0);
  rect(300,400,90,70);

/*
// example "cat"
  fill(100,100,100);
  ellipse(catx,caty,20,20);
*/

// setup cats
  for (int m = 0; m < ncat; m++){
    for (int r = 0; r < 3; r++){
      cats[m][r] = Math.random() * 255; // give random color vals to each cat
    }
    cats[m][3] = (int)(Math.random() * 500); // xcor
    cats[m][4] = (-1)*(int)(Math.random() * 500); // when will the kittens fall down?
    cats[m][5] = 5; // init speed
    cats[m][6] = 1;
}
}

void draw(){

  background(255);
  if (mouseY > 400){
//    background(255,255,255);
    fill(102,51,0);
    rect(mouseX,mouseY,90,70);
  }else{
    fill(102,51,0);
    rect(mouseX,400,90,70);
  }    
  
  // cat falling!
/*
  caty += speed;
  fill(100,100,100); 
  ellipse(catx,caty,20,20);
  speed += .004 * i; // kitten accelerates downward
*/

  for (int r = 0; r < ncat; r++){
    if (cats[r][4] > 0){
      cats[r][5] += .004 * cats[r][6]; // increase speed
      cats[r][4] += cats[r][5]; // ycor change
      cats[r][6]++; // increase loopval thingy
    }else{
      cats[r][4]++;
    }
    fill((float)cats[r][0],(float)cats[r][1],(float)cats[r][2]);
    ellipse((float)cats[r][3],(float)cats[r][4],20,20); // moving kitty
  }
  
  // ever so often, print out the status of each kitten 
  if (Math.random() > 0.9){
    for (int r = 0; r < ncat; r++){
      for (int o = 0; o < 7; o++){
        print(cats[r][o] + ", ");
      }
      print( "///////" );
    }
  }
}