import ddf.minim.*;

boolean playOpening = true;
boolean playDesktop = false;
boolean playEnding = false;

Minim minim;
void playMusic() {
  if (playOpening) {
    opening.loop();
  } else if (playDesktop){
    desktop.loop();
    playDesktop = false;
  }else if (playEnding){
    ending.loop();
    playEnding = false;
  }
}