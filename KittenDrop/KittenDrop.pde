void setup(){
  size(500,500);
}

void draw(){
  int i = 0;
  noStroke();
  fill(102,51,0);
  if (mouseY > 400){
    background(255,255,255);
    rect(mouseX,mouseY,90,70);
  }
  //rect(150+i,150+i,100,200);
  //i++;
}