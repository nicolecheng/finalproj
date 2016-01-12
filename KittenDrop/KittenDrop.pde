int catx = 40;
int caty = 0;
  
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
  int speed = 1; // init speed
  int i = 0; // loop de loop
  background(255);
  if (mouseY > 390){
//    background(255,255,255);
    fill(102,51,0);
    rect(mouseX,mouseY,90,70);
  }else{
    fill(102,51,0);
    rect(mouseX,390,90,70);
  }    
  
  // cat falling!
  caty += speed;
  fill(100,100,100); 
  ellipse(catx,caty,20,20);
  speed += 9.81 * i; // this line is not working
}