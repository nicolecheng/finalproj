//import library for playing music
import ddf.minim.*;

//check whether each music started playing yet
//make them false once music start playing or else music will start each frame
boolean playOpening = true;
boolean playDesktop = false;
boolean playEnding = false;

Minim minim;

//play music when it's not played yet
void playMusic() {
  if (playOpening) {
    opening.loop();
  } else if (playDesktop) {
    desktop.loop();
    playDesktop = false;
  } else if (playEnding) {
    ending.loop();
    playEnding = false;
  }
}