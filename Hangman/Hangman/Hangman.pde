String[] wordlist;
int [] correct = {};

void setup(){
 size(600,400);
   //reading in word list file, remove any white space from the words
wordlist = trim(loadStrings("#wordList.txt#"));
}

void draw(){
  background(#AEF0EC); 
  textSize(18);
fill(0);
text("test 1 2",15,100);
text(wordlist[10],15,130);
questionSlot(wordlist[10]);

}