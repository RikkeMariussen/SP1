class DropBalls {
//This class regards the balls that drops down for the user to catch.
  
  //Variables
  int x, y, w, h;
  float speedY; //The speed for the balls going down
  color ballsColor;

  //Constructor
  DropBalls() {
    x = int(random(width));
    y = 0;
    w = int(random(20, 40));
    h = int(random(20, 40));
    speedY = random(3, 15); //Making the speed of each ball random, so they do not go down all at once
    ballsColor = color(150, 150, 207);
  }

  //Methods
  void update() {
    y += speedY;

    if (y > height + h/2) {
      y = -h/2;
    }
  }

  void display() {
    fill(ballsColor);
    ellipse(x, y, w, h);
  }

  //Method for checking if balls was caught
  void caught() {
    speedY = 0; //Stops the balls when the user catches them, so they do not loop around 
    y = 0; //Makes the balls stay in the top, when the user has caught them.
  }
}
