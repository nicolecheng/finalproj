int catx = 40;
int caty = 0;
float speed = 5; // init speed
int i = 0; // keep count of velocity with acceleration  

void setup(){

  background(255,255,255);
  size(500,500);
  noStroke();

// rectangle "basket"
  fill(102,51,0);
  rect(300,400,90,70);

// example "cat"
  fill(100,100,100);
  ellipse(catx,caty,20,20);

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
  caty += speed;
  fill(100,100,100); 
  ellipse(catx,caty,20,20);
  speed = speed + .004 * i; // kitten accelerates downward
  if (Math.random() > 0.9){
    print(speed + " --- ");
  }
  i++;
}