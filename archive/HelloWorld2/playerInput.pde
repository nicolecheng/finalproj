// Related to Hangman

void keyPressed(){
  
  if (environ == 1){
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