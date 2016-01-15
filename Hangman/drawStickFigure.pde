void stickFigure(){
 strokeWeight(4);
 noFill();
 beginShape();
 vertex(50,180);
 vertex(50,30);
 vertex(110,30);
 vertex(110,50);
 endShape();
 ellipse(110,70,40,40);
 
 //first failed try
 if(chances <= 4){
   noFill();
   beginShape();
   vertex(100,88);
   vertex(90,150);
   vertex(130,150);
   vertex(120,88);
   endShape();
 }
 //second failure
 if(chances <= 3){
   line(100,88,80,110);
 }
 //third failure
 if(chances <=2){
  line(120,88,140,110); 
 }
 //fourth
 if(chances <=1){
  line(94,150,93,170); 
 }
 //final
 if(chances == 0 && tab ==1){
   line(126,150,127,170);
 }
}