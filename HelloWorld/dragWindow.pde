
void mousePressed() {
 
  //_________________Related to desktop_________________

  if (environ == 0) {
    //if click mouse over the close-window button, then close the window
    if (overClose) {
      for(int i = 0; i < openNew.length; i++){
        openNew[i] = false;
      }
      overClose = false;
      mouseClicks = 0;
      coords[winNum][0] = 200;
      coords[winNum][1] = 150;
      offs[winNum][0] = 0;
      offs[winNum][1] = 0;
    }

    //if mouse over the tool bar, then make the boolean true
    if (over) {
      locked = true; 
      //calculate the value at which the window should be generated to create motion of movement
      offs[winNum][0] = mouseX - coords[winNum][0];
      offs[winNum][1] = mouseY - coords[winNum][1];
    } else {
      locked = false;
    } 

    //if mouse over folder, and left mouse is clicked, then add 1 to mouseClicks
    if ((overFolder1 || overFolder2 || overFolder3)&&(mouseButton == LEFT)) {
      mouseClicks +=1;
      if(overFolder1){
       openNew[1]=false;
       openNew[2]=false;
      }else if(overFolder2){
        openNew[0]=false;
       openNew[2]=false;
      }else if(overFolder3){
       openNew[1]=false;
       openNew[0]=false; 
      }
    }
  }

  //___________________Related to Hangman____________________
  if (environ == 1) {
    //player decides to restart the game
    if (again) {
      tab = 0;
      setup();
      again = false;
      finished = false;
    }

    //player decides to end the game
    if (exit) {
      environ = 0;
      exit = false;
      finished = false;
      setup();
      draw();
    }
  }

  //_______________Related to KittenDrop_______________________
  if (environ == 2) {
    if (again) {
      score = 0;
      environ = 2;
      setup();
      draw();
      again = false;
    } else if (exit) {
      environ = 0;
      exit = false;
      setup();
      draw();
    }
  }

  //counting clicks to open content inside folders
  if ((overHangman || overKittendrop) && (mouseButton == LEFT)) {
    gameClicks +=1;
  }
}


void mouseDragged() {
  //if it's locked(meaning mouse over toolbar and clicked), change the coordinate of the window to create motion along with mouse movement
  if (locked) {
    coords[winNum][0] = (mouseX - offs[winNum][0]);
    coords[winNum][1] = (mouseY - offs[winNum][1]);
  }
}


void mouseReleased() {
  //____________related to desktop _____________________
  //when mouse released, don't want the window to move anymore
  locked = false;
}

void mouseClicked(){
 //__________________________Related to Opening______________
  if(environ == -1 && !stopLoop){
   s++; 
  } 
}