char input;
boolean pressed = false;

void keyPressed(){
    //make sure it's also lower case
  input = Character.toLowerCase(key);
  pressed = true;
}

void keyReleased(){
 pressed = false; 
}