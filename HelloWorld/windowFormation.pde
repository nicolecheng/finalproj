//related to desktop

//create a class to generate Windows
class Window{


//constructor
Window(float x, float y){
    coords[winNum][0] = x;
    coords[winNum][1] = y;
createWindow(coords[winNum][0],coords[winNum][1]);
}

//create window with tool bar, load image for window buttons
void createWindow(float winx, float winy){
 noStroke();
 fill(255,255,240);
 rect(winx,winy,400,300);
 fill(193,205,193);
 rect(winx,winy-30,400,30);
 image(toolBar1,winx+300,winy-30,28,19);
 image(toolBar2,winx+328,winy-30);
 image(toolBar3,winx+355,winy-30);
 toolbarSelect(winx,winy);
 stroke(1);
}

//create tool bar, check if mouse is over any of the buttons, if so, highlight the area
void toolbarSelect(float winx, float winy){
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

//check for dragging window purpose
void check(){
 if(mouseX> coords[winNum][0] && mouseX<coords[winNum][0]+400 && mouseY>coords[winNum][1]-30 && mouseY<coords[winNum][1]){
 over = true; 
 }else{
 over = false; 
 }
 
}


}