void setup(){
  rect(mouseX,450,90,70);
  fill(102,51,0);
  ellipse(10,10,10,10);
  fill(100,100,100);
  noStroke();

  background(255,255,255);
  size(500,500);
}

void draw(){
  int speed = 1;
  int i = 0;
  if (mouseY > 400){
    background(255,255,255);
    fill(102,51,0);
    rect(mouseX,mouseY,90,70);
  }
  ellipse(10,10+speed,10,10);
  fill(100,100,100);
  speed *= 9.81;
  //print(speed);
  //rect(150+i,150+i,100,200);
  //i++;
}