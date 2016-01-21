import g4p_controls.*;

GPassword pw1;
GPassword pw2;

String strPw1 = "";
String strPw2 = "";

public void createPW(){
  G4P.setCursor(ARROW); 
  pw1 = new GPassword(this, 300, 300, 150, 40);
  pw1.setMaxWordLength(100);
  pw1.setOpaque(true);
  pw1.addEventHandler(this, "password1_change2");
}

public void password1_change2(GPassword source, GEvent event) { //_CODE_:password1:804951:
  strPw1 = source.getPassword();
} //_CODE_:password1:804951: