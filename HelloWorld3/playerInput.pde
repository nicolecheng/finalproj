// Related to Hangman

void keyPressed() {

  if (environ == 1) {
    //make sure it's also lower case
    input = Character.toLowerCase(key);
    pressed = true;
    if (inputs.indexOf(input) == -1) {
      inputs += input+"  ";
    }

    //if input is not correct, minus from the 5 chances
    if (wordlist[wordSelect].indexOf(input) == -1) {
      chances -=1;
    }
  }

  if (environ==3) { // dashing geometry
    if (g==2) {
      if (key=='a' || key=='A') { // back
        first+=10;
        second+=10;
        third+=10;
        right=false; // going left
        fourth=-800+first;
        steps-=1;
      } else if (key=='d' || key=='D') { // forward
        first-=10;
        second-=10;
        third-=10;
        right=true; // going right
        fourth=800+first;
        steps+=1;
      } else if (key=='w' || key=='W') { // up
        wren[1]-=10;
      } else if (key=='s' || key=='S') { //down
        wren[1]+=10;
      }
    } else if (g==1) {
      g++; // move to game
    }
  }
}

void keyReleased() {
  pressed = false;
}