import g4p_controls.*;

GPassword pw1;
GPassword pw2;

GLabel rule;

String strPw1 = "";
String strPw2 = "";

public void createPW(){
  rule = new GLabel(this,200,350,350,40,"Please press \"Enter\" key to confirm password");
  rule.setVisible(true);
  rule.setLocalColorScheme(8);
  G4P.setCursor(ARROW); 
  if (winNum == 1){
 pw1 = new GPassword(this, 300, 300, 150, 40);
 pw1.setFocus(true);
 pw1.setVisibleChar('*');
 pw1.setMaxWordLength(100);
 pw1.setOpaque(true);
 pw1.addEventHandler(this, "password1_change2");
  }else if(winNum == 2){
    pw2 = new GPassword(this, 300, 300, 150, 40);
    pw2.setFocus(true);
    pw2.setVisibleChar('*');
 pw2.setMaxWordLength(100);
 pw2.setOpaque(true);
 pw2.addEventHandler(this, "password2_change2");
  }
}

public void password1_change2(GPassword source, GEvent event) { //_CODE_:password1:804951
  if (event.toString() == "ENTERED"){
    strPw1 = source.getPassword();
  }
  if(event.toString() == "LOST_FOCUS"){
   pw1.setVisible(false);
   rule.setVisible(false);
  }
} //_CODE_:password1:804951:

public void password2_change2(GPassword source, GEvent event) { //_CODE_:password1:804951
  if (event.toString() == "ENTERED"){
    strPw2 = source.getPassword();
  }
  if(event.toString() == "LOST_FOCUS"){
   pw2.setVisible(false);
    rule.setVisible(false);
  }
}

void checkPW(){
 if(strPw1.equals("KittensAreCute") || strPw2.equals("PAWSITIVE")){
   fill(255);
  strPw1 = "";
  strPw2 = "";
  if(winNum == 1){
   openNew[1] = true; 
  }else if (winNum == 2){
   openNew[2] = true; 
  }
  if(winNum == 0 || winNum == 1){
  pw1.setVisible(false);
  }else if(winNum == 2){
   pw2.setVisible(false); 
  }
 }
}