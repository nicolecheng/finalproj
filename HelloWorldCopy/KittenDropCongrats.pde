void Congrats() {
//if the player win the game
  if (score > 0) {
    background(bg);
    textFont(f, 30); // size 20 
    fill(111, 111, 111);
    text("CONGRATULATIONS!", 100, 250);
    text("You have saved enough kittens", 7, 300);
    text("The Password is :", 22, 350);
    text("PAWSITIVE", 45, 400);
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
    textFont(f, 30); // size 20 
    fill(111, 111, 111);
    text("AH, FIDDLESTICKS!", 120, 250);
    text("You didn't save enough kittens.", 8, 300);
    text("Try again.", 170, 350);
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