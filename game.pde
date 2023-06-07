// imports
import java.util.Arrays;
import java.util.Random;

// fields and global stuff
float x, y, time, textXpos, textYpos;
int hoopX, hoopY, angle, initialVelocity, score, xVelo, yVelo, bounces, modeCounter, bounceCount, spinTime, type; 
boolean angleNotSet, velocityNotSet, increase, newHoop, scoredPoint, ballMoving, hitBackBoard, goingDown, ballInCannon;

Ball ball = new Ball();
Hoop hoop = new Hoop();

Cannon cannon = new Cannon();
Display display = new Display();


void setup() {
    size(1300, 700);
    background(50, 153, 227);
    frameRate(45);
    
    noStroke();
    fill(100, 100, 100);
    rect(0, 500, width, 100);
    
    x     = 90;
    y     = 525;
    time  = 0;
    hoopX = 1200;
    angle = 0;
    initialVelocity = 0;
    score           = 0;
    angleNotSet    = true;
    velocityNotSet = true;
    increase       = true;
    newHoop        = true;
    ballInCannon   = true;
    scoredPoint    = false;
    ballMoving     = false;
    hitBackBoard   = false;
    goingDown      = false;
    bounces = 0;
    modeCounter = 0;
    bounceCount = 0;
    spinTime = 0;
    type = 1;
}

void draw() {
    background(50, 153, 227);
    noStroke();
    fill(100, 100, 100);
    rect(0, 600, width, 100);
    if (modeCounter % 2 == 1) {
      if (goingDown){
        hoopY += 3;
        if (hoopY > 500){
          goingDown = false;
        }
      }
      else {
        hoopY -= 3;
        if (hoopY < 100){
          goingDown = true;
        }
      }
    }
    else {
      if (newHoop) {
          hoopY = int(random(100, type != 4 ? 500 : 350));
      }
    }
    
    hoop.drawHoopBack(hoopY);
    ball.drawBall(type);
    cannon.drawCannon();
    hoop.drawHoopFront(hoopY);
    hoop.drawBackBoard(hoopY);
    display.display(type);

    if (angleNotSet) {
        setAngle();
    } else if (velocityNotSet) {
        ball.setVelocity();
        yVelo = initialVelocity;
        xVelo = initialVelocity;
    } else if (ballInCannon) {
        ball.shoot();
    } else {
        ball.updateBall(type);
    }
    if (!scoredPoint) {
        updateScore();
    }
  
    if (x > width + 25 || initialVelocity == 0 && y >= 600) {
        reset();
    }
    
    if (frameCount < 200) {
      String instructions1 = "Press space bar to set angle and power.";
      textSize(15);
      fill(225, 198, 153);
      text(instructions1, 20, 650);
    }
    else if (frameCount < 400) {
      String instructions2 = "Press M to change modes and R to reset. Press B to change ball types.";
      textSize(15);
      fill(225, 198, 153);
      text(instructions2, 20, 650);
    }
    
    // score text code
    stroke(0, 0, 0);
    fill(100, 200, 0);
    rect(10, 10, 200, 65);
    String output = "Score: " + score;
    textSize(50);
    fill(0, 0, 0);
    text(output, 20, 60);
    
    // angle text code
    String displayAngle = angle + "º";
    if (!(ballMoving)){
      textSize(20);
      text(displayAngle, 140, 570);
    }
    
    // velocity text code
    String displayPower = initialVelocity + "";
    if (!(angleNotSet || ballMoving)){
      textSize(20);
      fill(255, 255 - 4 * initialVelocity, 0);
      text(displayPower, textXpos, textYpos);
    }
    
    // displays type of ball
    String stringType = "";
    if (type == 1) stringType = "basketball";
    else if (type == 2) stringType = "bowling ball";
    else if (type == 3) stringType = "bouncy ball";
    else if (type == 4) stringType = "balloon";
    String ballType = "Ball type: " + stringType;
    textSize(25);
    fill(225, 198, 153);
    text(ballType, 20, 110);
    
    // condition to reset
    if (y >= 575 && yVelo == 0 || (x < hoopX - 300 && bounces == 1) || (y < 0 && type == 4)){
          reset();  
    }
}



void setAngle() {
    stroke(255, 255, 255);
    strokeWeight(1);
    line(x, y, x + 140 * cos(radians(angle)), y - 140 * sin(radians(angle)));
    if (increase) {
        angle++;
    } else {
        angle--;
    }
    if (angle == 90) {
        increase = false;
    } else if (angle == 0) {
        increase = true;
    }
}



void keyPressed() {
  if (key == 'm'){
     modeCounter++;
  }
  if (key == 'b') {
    type += 1; 
    if (type == 5) {
      type = 1; 
    }
  }
  if (angleNotSet && key != 'm' && key!= 'r' && key != 'b') {
        angleNotSet = false;
        increase = true;
  } else if (velocityNotSet && key != 'm' && key != 'r' && key != 'b') {
        velocityNotSet = false;
        ballMoving = true; 
        increase = true;
  } else if (key == 'r') {
        reset();
  }
}

void updateScore() {    
    if (x >= hoopX - 25 && x <= hoopX + 25 && y >= hoopY - 20 && y <= hoopY) {
        score++;
        scoredPoint = true;
    }
}

void reset() {
    x     = 90;
    y     = 525;
    time  = 0;
    angle = 0;
    initialVelocity = 0;
    angleNotSet     = true;
    velocityNotSet  = true;
    increase        = true;
    if (scoredPoint) {
        newHoop     = true;
    }
    ballInCannon    = true;
    scoredPoint     = false;
    ballMoving      = false;
    hitBackBoard    = false;
    bounces     = 0;
    bounceCount = 0;
    spinTime    = 0;
}
