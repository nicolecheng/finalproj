import g4p_controls.*;

GPassword pw1;
GPassword pw2;

String strPw1 = "";
String strPw2 = "";

public void createPW(){
  fill(150);
  rect(250,250,250,160);
  G4P.setCursor(ARROW); 
  if (winNum == 0){
 pw1 = new GPassword(this, 300, 300, 150, 40);
 pw1.setMaxWordLength(100);
 pw1.setOpaque(true);
 pw1.addEventHandler(this, "password1_change2");
  }else if(winNum == 1){
    pw2 = new GPassword(this, 300, 300, 150, 40);
 pw2.setMaxWordLength(100);
 pw2.setOpaque(true);
 pw2.addEventHandler(this, "password2_change2");
  }
  openPW = false;
}

public void password1_change2(GPassword source, GEvent event) { //_CODE_:password1:804951
  if (event.toString() == "ENTERED"){
    strPw1 = source.getPassword();
  }
} //_CODE_:password1:804951:

public void password2_change2(GPassword source, GEvent event) { //_CODE_:password1:804951
  if (event.toString() == "ENTERED"){
    strPw2 = source.getPassword();
  }
}

void checkPW(){
 if(strPw1.equals("CodingIsFun") || strPw2.equals("KittensAreCute")){
   fill(255);
  openNew = true;
  strPw1 = "";
  strPw2 = "";
  if(winNum == 0){
  pw1.setVisible(false);
  }else if(winNum == 1){
   pw2.setVisible(false); 
  }
 }
}