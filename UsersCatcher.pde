class UsersCatcher {

  //Variables:
  float x, y, w, h;
  color colorOfCatcher;

  //The constructor
  UsersCatcher() {
    //Where do the catcherball start
    x = width/2;
    y = height-50;

    //Size of the catcher:
    w = 80;
    h = 20;
    
    colorOfCatcher = color(137,216,230);
  }


  //Methods
  void update() {
    x = mouseX;
  }

  void display() {
    fill(colorOfCatcher);
    rect(x, y, w, h); //Rect for avoiding
  }
}
