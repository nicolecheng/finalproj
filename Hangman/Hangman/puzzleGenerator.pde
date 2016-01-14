//create slots according to how long the word is
void questionSlot(String word){
  int chars = word.length();
  int ycoord = 200;
  int xcount = 0;
  text(chars,15,150);
  for(int i = 0;  i < chars; i++){
    if(20+xcount*50>545){
      ycoord += 50;
      xcount = 0;
    }else{
      //grey
   fill(#B1C9C7);
   rect(20+xcount*50,ycoord,35,35);
   xcount += 1;
    }
      //connecting punc not counted
    if(word.charAt(i) != '-'){
  textSize(20);
  fill(0);
  text(word.charAt(i),30+(xcount-1)*50,ycoord+25);
    }
  }
}