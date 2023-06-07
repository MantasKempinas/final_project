public class Hoop {

void drawHoopBack(int hoopY) {
    stroke(232, 58, 23);
    strokeWeight(5);
    fill(232, 58, 23);
    noFill();
    arc(1200, hoopY, 100, 10, PI, TWO_PI);
}

void drawHoopFront(int hoopY) {
    stroke(232, 58, 23);
    strokeWeight(5);
    noFill();
    fill(232, 58, 23);
    arc(1200, hoopY, 100, 10, 0, PI);
    newHoop = false;
    stroke(0, 0, 0);
}

void drawBackBoard(int hoopY) {
  strokeWeight(1);
  fill(0,0,0);
  rect(hoopX + 60, hoopY + 10, 20, height - hoopY - 110);
  //triangle(hoopX + 60, hoopY - 15, hoopX + 75, hoopY, hoopX + 60, hoopY);
  fill(0,0,200);
  rect(hoopX + 50, hoopY - 100, 30, 110);
}
}
