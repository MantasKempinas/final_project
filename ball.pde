public class Ball {
  public Ball() { 
  }


void drawBall(int type) {
  stroke(0, 0, 0);
  if (type == 1) {
      strokeWeight(1);
      fill(224, 119, 20);
    
      // backwards spin
      if (bounceCount < 1 || bounces == 1) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(-spinTime * PI / 100);

          circle(0, 0, 50);
          stroke(0, 0, 0);
          line(0-25, 0, 0+25, 0);
          line(0, 0-25, 0, 0+25);
          noFill();
          arc(0-35, 0, 50, 50, -QUARTER_PI, QUARTER_PI);
          arc(0+35, 0, 50, 50, HALF_PI+QUARTER_PI, PI+QUARTER_PI);

          rotate(spinTime * PI / 100);
          translate(-x, -y); 
      }
    
      // forwards spin
      else if (!hitBackBoard) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          circle(0, 0, 50);
          stroke(0, 0, 0);
          line(0-25, 0, 0+25, 0);
          line(0, 0-25, 0, 0+25);
          noFill();
          arc(0-35, 0, 50, 50, -QUARTER_PI, QUARTER_PI);
          arc(0+35, 0, 50, 50, HALF_PI+QUARTER_PI, PI+QUARTER_PI);

          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      }
      else {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          circle(0, 0, 50);
          stroke(0, 0, 0);
          line(0-25, 0, 0+25, 0);
          line(0, 0-25, 0, 0+25);
          noFill();
          arc(0-35, 0, 50, 50, -QUARTER_PI, QUARTER_PI);
          arc(0+35, 0, 50, 50, HALF_PI+QUARTER_PI, PI+QUARTER_PI);

          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      
      }
   }
   else if (type == 2) {
      strokeWeight(1);
      fill(26, 178, 184);
    
      // backwards spin
      if (bounceCount < 1 || bounces == 1) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(-spinTime * PI / 100);

          circle(0, 0, 50);
          stroke(0, 0, 0);
          noFill();
          fill(10, 10, 10);
          circle(9, 0, 4);
          circle(16, 5, 4);
          circle(16, -5, 4);

          rotate(spinTime * PI / 100);
          translate(-x, -y); 
      }
    
      // forwards spin
      else if (!hitBackBoard) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          circle(0, 0, 50);
          stroke(0, 0, 0);
          noFill();
          fill(10, 10, 10);
          circle(9, 0, 4);
          circle(16, 5, 4);
          circle(16, -5, 4);

          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      }
      else {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          circle(0, 0, 50);
          stroke(0, 0, 0);
          noFill();
          fill(10, 10, 10);
          circle(9, 0, 4);
          circle(16, 5, 4);
          circle(16, -5, 4);
          
          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      
      }
   }
   else if (type == 3) {
      strokeWeight(1);
      fill(237, 43, 43);
    
      // backwards spin
      if (bounceCount < 1 || bounces == 1) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(-spinTime * PI / 100);

          circle(0, 0, 50);

          rotate(spinTime * PI / 100);
          translate(-x, -y); 
      }
    
      // forwards spin
      else if (!hitBackBoard) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          circle(0, 0, 50);

          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      }
      else {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          circle(0, 0, 50);
          
          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      
      }
   }
      else if (type == 4) {
      strokeWeight(1);
      fill(26, 178, 0);
    
      // backwards spin
      if (bounceCount < 1 || bounces == 1) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(-spinTime * PI / 100);

          ellipse(0, 0, 55, 70);
          triangle(0, 35, -5, 40, 5, 40);

          rotate(spinTime * PI / 100);
          translate(-x, -y); 
      }
    
      // forwards spin
      else if (!hitBackBoard) {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          ellipse(0, 0, 55, 70);
          triangle(0, 35, -5, 40, 5, 40);

          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      }
      else {
          translate(x, y);
          // the 100 changes how it rotates
          rotate(spinTime * PI / 100);

          ellipse(0, 0, 55, 70);
          triangle(0, 35, -5, 40, 5, 40);
          
          rotate(-spinTime * PI / 100);
          translate(-x, -y);
      
      }
   }
}

void setVelocity() {
    stroke(255, 255, 255);
    strokeWeight(1);
    line(x, y, x + 2 * initialVelocity * cos(radians(angle)), y - 2 * initialVelocity * sin(radians(angle)));
    textXpos = x + 100 * cos(radians(angle));
    textYpos = y - 100 * sin(radians(angle));
    if (increase) {
        initialVelocity++;
    } else {
        initialVelocity--;
    }
    if (initialVelocity == 70) {
        increase = false;
    } else if (initialVelocity == 0) {
        increase = true;
    }
}

void shoot() {
    x += initialVelocity * cos(radians(angle));
    y -= initialVelocity * sin(radians(angle));
    if (x >= 90 + 165 * cos(radians(angle))) {
        ballInCannon = false;
    }
}

void updateBall(int type) {
/* ---------------------------------- hitting rim or backboard code -------------------------------- */

    // if hits the backboard
    if (x >= hoopX + 10 && x < hoopX + 40 && y >= hoopY - 125 && y <= hoopY + 35) {
      hitBackBoard = true;
      bounces = 1;
    }
    // if it hits the front of rim and NOT the backboard
    if (hitBackBoard == false && y > hoopY - 20 && y < hoopY + 20 && x > hoopX - 80) { 
      bounces = 1;
    }
    // if it hits the front of rim AND backboard
    if (hitBackBoard == true && y > hoopY - 25 && y < hoopY + 25 && x < hoopX + 5 && x > hoopX - 30) {
      bounces = 2;
    }

/* ---------------------------------- normal kinematic motion code -------------------------------- */  
    
    // ball flying through the air normally
    if (y < 575) {
      if (bounces == 0){
        if (type != 4) {
          x += xVelo * cos(radians(angle));
        } else {
          x += xVelo * cos(radians(angle));
          xVelo /= 1.0002;
        }
      }
      else { 
        if (bounces == 1) {
          x -= 0.2 * xVelo * cos(radians(angle));
        }
        else {
          x += 0.25 * xVelo * cos(radians(angle));
        }
      }
      y += time/2 - yVelo * sin(radians(angle));
      // increasing time increases the gravity
      if (type == 1) {
        time += 2.5; 
      }
      if (type == 2) {
        time += 4.5; 
      }
      if (type == 3) {
        time += 2.4; 
      }
      if (type == 4) {
        time -= 0.5;
      }
      spinTime += 2;
    }
    
/* ---------------------------------- bouncing off the ground code -------------------------------- */ 
    // deincrements the value of y as the ball bounces
    else if (yVelo > 0) {
        while (y >= 575) {
            y += time - yVelo * sin(radians(angle))/2;
        }
    }
    // lowering velocities as a result of friction
    if (y >= 575) {
        // change yVelo to change bounciness
        // different values for types of balls
        if (type == 1) yVelo /= 1.8;
        if (type == 2) yVelo /= 3.5;
        if (type == 3) yVelo /= 1.05;
        
        time = 0;
        xVelo /= 1.1;
        bounceCount += 1;
    }
}

}
