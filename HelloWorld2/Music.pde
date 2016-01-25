import ddf.minim.*;

boolean playOpening = true;
boolean playDesktop = false;
boolean playHangman = false;
boolean playKittenDrop = false;
boolean playGeoDash = false;
boolean playEnding = false;

Minim minim;
void playMusic() {
  if (playOpening) {
    opening.loop();
  } else if (playDesktop){
    desktop.loop();
    playDesktop = false;
  }else if (playHangman){
   hangman.loop();
   playHangman = false;
  }else if(playKittenDrop){
    kittendrop.loop();
    playKittenDrop = false;
  }else if(playGeoDash){
    geodash.loop();
    playGeoDash = false;
  }else if (playEnding){
    ending.loop();
    playEnding = false;
  }
}