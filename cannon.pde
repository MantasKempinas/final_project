public class Cannon {

  void drawCannon() {
    // cannon body
    noStroke();
    fill(30, 30, 30);
    translate(90, 525);
    rotate(-radians(angle));
    rect(0, -35, 140, 70);
    rotate(radians(angle));
    translate(-90, -525);
    circle(90, 525, 70);
    
    // wheel
    fill(150, 75, 0);
    circle(95, 570, 77);
  }
}
