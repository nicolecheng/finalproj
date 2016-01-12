class Window{

float winx = 200;
float winy = 150;

Window(float x, float y){
 winx = x;
 winy = y;
}

float xcoord(){
   return winx;
 }
 
 float ycoord(){
  return winy; 
 }
 
 void setX(float x){
   winx = x;
 }
 
 void setY(float y){
  winy = y; 
 }

void draw(){



}

void creatWindow(){
 noStroke();
 fill(255,255,240);
 rect(winx,winy,400,300);
 fill(193,205,193);
 rect(winx,winy-30,400,30);
 image(toolBar1,winx+300,winy-30,28,19);
 image(toolBar2,winx+328,winy-30);
 image(toolBar3,winx+355,winy-30);
 toolbarSelect();
 stroke(1);
}

void toolbarSelect(){
 if(mouseX>winx+300 && mouseX<winx+328 && mouseY>winy-30 && mouseY<winy-10){
  tint(3,158,168,100);
  image(toolBar1,winx+300,winy-30,28,19);
 }
 if(mouseX>winx+328 && mouseX<winx+355 && mouseY>winy-30 && mouseY<winy-10){
   tint(3,158,168,100);
   image(toolBar2, winx+328, winy-30);
 }
 else if (mouseX>winx+355 && mouseX<winx+400 && mouseY>winy-30 && mouseY<winy-10){
   tint(255,0,0,100);
   image(toolBar3, winx+355, winy-30);
   overClose = true;
 }
 noTint(); 
}

void openWindow(){
  openNew = true;
}

void check(){
//check for dragging window purpose
 if(mouseX> winx && mouseX<winx+400 && mouseY>winy-30 && mouseY<winy){
 over = true; 
 }else{
 over = false; 
 }
 
 
 
}
}