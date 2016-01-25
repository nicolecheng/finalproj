//related to desktop


//create a class to generate Windows
class Window{


//constructor
Window(float x, float y){
    coords[winNum][0] = x;
    coords[winNum][1] = y;
createWindow(coords[winNum][0],coords[winNum][1]);
openContent(x, y);
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
 
 //according to different folder, show different content
 if(winNum == 0){
  image(gameHangman, winx+40, winy+35,55,55);
  textSize(12);
  fill(0);
  text("Hang Man", winx+43, winy+110);
 }
 if(winNum == 1){
  image(gameKittendrop, winx+40, winy+35, 55,55);
  textSize(12);
  fill(0);
  text("Kitten Drop", winx+43, winy+110);
 }
 
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


//open different contents in the folders
void openContent(float winx , float winy){
  
  //first folder
  if(winNum == 0){
    if(mouseX>winx+40 && mouseX<winx+95 && mouseY>winy+35 && mouseY<winy+70){
       tint(3,158,168,100);
       image(gameHangman, winx+40, winy+35,55,55);
       overHangman = true;
    }else{
     overHangman = false; 
    }
  }
  
    //second folder
    if(winNum == 1){
     if( mouseX>winx+40 && mouseX<winx+95 && mouseY>winy+35 && mouseY<winy+70){
       tint(3,158,168,100);
       image(gameKittendrop, winx+40, winy+35,55,55);
       overKittendrop = true;
     }else{
      overKittendrop = false; 
     }
    }
    
    noTint();
  } 

}