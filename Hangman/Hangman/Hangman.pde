String[] wordlist;
int [] correct = {};
int wordSelect;
float listLen;
void setup(){
 size(600,400);
   //reading in word list file, remove any white space from the words
wordlist = trim(loadStrings("#wordList.txt#"));

listLen = wordlist.length;

  //make sure everything is lower case
  for(int i = 0; i < listLen; i++){
   wordlist[i] = wordlist[i].toLowerCase(); 
  }

  //randomly choose a word from word list
  wordSelect = int(random(listLen));
}

void draw(){
  background(#AEF0EC); 
  textSize(18);
fill(0);
text("test 1 2",15,100);
text(wordlist[wordSelect],15,130);
text(input,130,100);
if(pressed){
 text("Key is pressed",130,130); 
}
questionSlot(wordlist[wordSelect]);

}