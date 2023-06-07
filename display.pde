public class Display {
  void display(int type) {
     // basketball
     if (type == 1) {
         fill(224, 119, 20);
         circle(260, 100, 30);
         stroke(0, 0, 0);
         line(260-15, 100, 260+15, 100);
         line(260, 100-15, 260, 100+15);
         noFill();
         arc(260-18, 100, 25, 25, -QUARTER_PI, QUARTER_PI);
         arc(260+18, 100, 25, 25, HALF_PI+QUARTER_PI, PI+QUARTER_PI);
     }
     
     // bowling ball
     else if (type == 2) {
         fill(26, 178, 184);
         circle(280, 100, 30);
         stroke(0, 0, 0);
         noFill();
         fill(10, 10, 10);
         circle(282, 100, 3);
         circle(288, 105, 3);
         circle(288, 97, 3);
     }
     
     // bouncy ball
     else if (type == 3) {
        fill(237, 43, 43);
        circle(272, 100, 30);
     }
     
     // balloon
     else if (type == 4) {
        fill(26, 178, 0);
        ellipse(224, 100, 22, 28);
        triangle(224, 113, 219, 118, 229, 118);
     }
  }
  
}
