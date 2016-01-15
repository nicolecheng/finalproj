

//create slots according to how long the word is
void questionSlot(String word){
  int chars = word.length();
  int ycoord = 200;
  int xcount = 0;
  
    //check which slots should show the letter
  toShow(word,chars);
  
  //looping through given word to generate slots accordingly 
  for(int i = 0;  i < chars; i++){
    
      //if too long, change to new line
    if(20+xcount*50>545){
      ycoord += 50;
      xcount = 0;
    }else{
      //create slot accordingly
   fill(#B1C9C7);
   rect(20+xcount*50,ycoord,35,35);
   xcount += 1;
    }
      //'-' is not counted
      //and check if the letter is guessed right
      //if yes, then show
    if(word.charAt(i) != '-' && correct[i] == 1){
  textSize(20);
  fill(0);
  text(word.charAt(i),30+(xcount-1)*50,ycoord+25);
    }
  }
}

//check whether the character of the word is typed by user
//if so, make the corresponding element in array "correct" = 1( = correct)
//automatically set to 1 if character is '-'
void toShow(String word, int len){
 for(int i = 0; i < len; i++){
  if(word.charAt(i) == input || word.charAt(i) == '-'){
   correct[i] = 1; 
  }
 }
 }
 