//import library for GUI
import g4p_controls.*;

//initiate password field for different folders
GPassword pw1;
GPassword pw2;
GPassword pw3;

//initiate label telling user what to do
GLabel rule;

//usable variable for user input
String strPw1 = "";
String strPw2 = "";
String strPw3 = "";

//create password
public void createPW() {
  rule = new GLabel(this, 200, 350, 350, 40, "Please press \"Enter\" key to confirm password");
  rule.setVisible(true);
  rule.setLocalColorScheme(8);
  G4P.setCursor(ARROW);
  //password for second folder
  if (winNum == 1) {
    pw1 = new GPassword(this, 300, 300, 150, 40);
    pw1.setFocus(true);
    pw1.setVisibleChar('*');
    pw1.setMaxWordLength(100);
    pw1.setOpaque(true);
    pw1.addEventHandler(this, "password1_change2");
    //password for third folder
  } else if (winNum == 2) {
    pw2 = new GPassword(this, 300, 300, 150, 40);
    pw2.setFocus(true);
    pw2.setVisibleChar('*');
    pw2.setMaxWordLength(100);
    pw2.setOpaque(true);
    pw2.addEventHandler(this, "password2_change2");
    //password for fourth folder
  } else if (winNum == 3) {
    pw3 = new GPassword(this, 300, 300, 150, 40);
    pw3.setFocus(true);
    pw3.setVisibleChar('*');
    pw3.setMaxWordLength(100);
    pw3.setOpaque(true);
    pw3.addEventHandler(this, "password3_change2");
  }
}


//event handlers for password
//when "enter" key pressed, check the password
//if user click somewhere else on the screen (=lost focus), password field disappears
public void password1_change2(GPassword source, GEvent event) { //_CODE_:password1:804951
  if (event.toString() == "ENTERED") {
    strPw1 = source.getPassword();
  }
  if (event.toString() == "LOST_FOCUS") {
    pw1.setVisible(false);
    rule.setVisible(false);
  }
} //_CODE_:password1:804951:

public void password2_change2(GPassword source, GEvent event) { //_CODE_:password1:804951
  if (event.toString() == "ENTERED") {
    strPw2 = source.getPassword();
  }
  if (event.toString() == "LOST_FOCUS") {
    pw2.setVisible(false);
    rule.setVisible(false);
  }
}

public void password3_change2(GPassword source, GEvent event) { //_CODE_:password1:804951
  if (event.toString() == "ENTERED") {
    strPw3 = source.getPassword();
  }
  if (event.toString() == "LOST_FOCUS") {
    pw3.setVisible(false);
    rule.setVisible(false);
  }
}

//____________________________________________________CHEAT HERE_____________________________________________________
//contains top secret password, if you can't finish the game, come here..............
void checkPW() {
  if (strPw1.equals("KittensAreCute") || strPw2.equals("PAWSITIVE") || strPw3.equals("SnowDay")) {
    fill(255);
    strPw1 = "";
    strPw2 = "";
    strPw3 = "";
    //if password matches, allow folder to be opened
    if (winNum == 1) {
      openNew[1] = true;
    } else if (winNum == 2) {
      openNew[2] = true;
    } else if (winNum == 3) {
      openNew[3] = true;
    }
    //when other folder opened, make other password fields disappear
    if (winNum == 0 || winNum == 1) {
      pw1.setVisible(false);
    } else if (winNum == 2) {
      pw2.setVisible(false);
    } else if (winNum == 3) {
      pw3.setVisible(false);
    }
  }
}