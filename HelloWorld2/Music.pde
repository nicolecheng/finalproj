import ddf.minim.*;

boolean playOpening = true;
boolean playDesktop = false;
boolean playHangman = false;

Minim minim;
void playMusic() {
  if (playOpening) {
    opening.loop();
  } else if (playDesktop){
    desktop.loop();
    playDesktop = false;
  }else if (playHangman){
   hangman.loop();
   println(hangman.isLooping());
   playHangman = false;
  }
}