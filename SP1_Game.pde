//Catch the balls game

//Calls for the classes/Arrays
UsersCatcher uC; //Class for the users "net" which is moved by the mouse on the x-axis.
DropBalls [] dropBalls; //Array of balls which drops randomly.

//Variables
Timer ballsTimer;
int numberOfBalls;
int ballsInterval;
int activeBalls;
int score;


void setup() {
  size(800, 800);
  background(255,255,237);

  uC = new UsersCatcher();

  score = 0;
  numberOfBalls = 50; //Amount of balls that are dropped in total, changing this number also changes when the text changes

  dropBalls = new DropBalls[numberOfBalls]; //Calls the method/class
  for (int i = 0; i < numberOfBalls; i++) {
    dropBalls[i] = new DropBalls();
  }

  activeBalls = 0;
  ballsTimer = new Timer(ballsInterval); //Calls the method/class
  ballsInterval = 100; //This number changes how quickly the balls get dropped.
  ballsTimer.start();
}


void draw() {
  background(255,255,237);
  uC.update();
  uC.display();

  //Timer management:
  if (ballsTimer.complete() == true) {
    ballsTimer.start();
  }

  for (int i = 0; i < numberOfBalls; i++) {
    dropBalls[i].update();
    dropBalls[i].display();
    //check collisions
    if (intersect(uC, dropBalls[i])==true) {
      dropBalls[i].caught();
      score++; //Counts the score with +1 when the user caughts a ball.
    }
  }


  //Score counter:
  fill(0);
  textSize(25);
  textAlign(RIGHT);
  text("Score: " + score, 750, 75);


  //Text on screen, which changes when all balls has been caught.
  if (score == numberOfBalls) {
    textSize(50);
    text("YOU WON!", width/2, height/2);
  } else {
    textSize(50);
    text("Move mouse to play", 600, height/2);
  }
}

//Separate method for dectection.
boolean intersect(UsersCatcher uC, DropBalls dB) {
  float distance = dist(uC.x, uC.y, dB.x, dB.y);
  if (distance < (uC.w/2 + dB.w/2)) {
    return true;
  } else {
    return false;
  }
}
