// Related to Hangman

void keyPressed(){
  if (environ==0){
    fill(0);
    if (s == 1 && keyPressed){
      if (key == '3'){
        step++;
      }else if(key == '4'){
        s1Setup();
      }
      if (key > 64 || key == ' '){
        if (step == 0){
          name += key;
          text(name, 210,270);    
        } else if (step == 1){
          codeName += key;
          text(codeName, 280, 305);
        } else if (step == 2){
            specialty += key;
            text(specialty, 250, 335);
        }
      }  
    }
  }else if(environ==2){
    //make sure it's also lower case
    input = Character.toLowerCase(key);
    pressed = true;
    if(inputs.indexOf(input) == -1){
     inputs += input+"  "; 
    }
  
    //if input is not correct, minus from the 5 chances
    if(wordlist[wordSelect].indexOf(input) == -1){
      chances -=1;
    }
  }
}

void keyReleased(){
 pressed = false; 
}