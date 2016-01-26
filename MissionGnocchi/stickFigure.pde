//related to Hang Man

void stickFigure() {
  //draw initial shape for hang man
  strokeWeight(4);
  noFill();
  beginShape();
  vertex(100, 270);
  vertex(100, 80);
  vertex(160, 80);
  vertex(160, 100);
  endShape();
  ellipse(160, 120, 40, 40);

  //first failed try
  if (chances <= 4) {
    noFill();
    beginShape();
    vertex(150, 138);
    vertex(140, 200);
    vertex(180, 200);
    vertex(170, 138);
    endShape();
  }
  //second failure
  if (chances <= 3) {
    line(150, 138, 130, 160);
  }
  //third failure
  if (chances <=2) {
    line(170, 138, 190, 160);
  }
  //fourth
  if (chances <=1) {
    line(144, 200, 143, 220);
  }
  //final
  if (chances <= 0 && tab ==1) {
    line(176, 200, 177, 220);
  }
}