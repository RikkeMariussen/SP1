class Timer {

  //Variables:
  int startTime; //For the dropBalls
  int interval;

  //Constructor
  Timer(int timeInterval) {
    interval = timeInterval;
  }

  //Methods
  void start() {
    startTime = millis();
  }


  boolean complete() {
    int elapsedTime = millis() - startTime;
    if (elapsedTime > interval) {
      return true;
    } else {
      return false;
    }
  }
}
