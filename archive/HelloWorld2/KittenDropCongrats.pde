void Congrats() {
//if the player win the game
  if (score > 0) {
    background(bg);
    textFont(f, 30); // size 20 
    fill(111, 111, 111);
    text("CONGRATULATIONS!", 270, 220);
    text("You have saved enough kittens", 220, 270);
    text("The password is: PAWSITIVE", 205, 320);
    //Allow user to go back to desktop
    image(quit, 450, 450, 50, 50);
    if (mouseX>450 && mouseX<500 && mouseY>450 && mouseY<500) {
      tint(3, 158, 168, 100);
      image(quit, 450, 450, 50, 50);
      exit = true;
    }
    //if player lose
  } else {
    background(bg);
    textFont(f, 25); // size 25 
    fill(255);
    text("AH, FIDDLESTICKS!", 285, 220);
    text("You didn't save enough kittens.", 190, 270);
    text("Try again.", 310, 320);
//allow user to choose between going back(quit) to desktop or play the game again
    image(restart, 280, 450, 50, 50);
    image(quit, 450, 450, 50, 50);
    //high light button when hovering over it
    tint(3, 158, 168, 100);
    if (mouseX>280 && mouseX<330 && mouseY>450 && mouseY<500) {
      image(restart, 280, 450, 50, 50);
      again = true;
    } else if (mouseX>450 && mouseX<500 && mouseY>450 && mouseY<500) {
      image(quit, 450, 450, 50, 50);
      exit = true;
    } else {
      again = false;
      exit = false;
    }
  }
  noTint();
}