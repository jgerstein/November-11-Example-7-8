float startAng, angVel, speed;      //declare variables

void setup() {
  size(600, 200);                          
  colorMode(HSB, width, 100, 100,height);
  startAng = 0;        //set start angle
  angVel = .2;         //set rate at which angle changes
  speed = .01;         //set speed of movement
  strokeWeight(3);
}

void draw() {
  background(0);    
  float angle = startAng;    //each frame, set the angle to the start angle

  for (int x = 0; x < width; x+=10) {    //for loop increasing by 10...

    angle+=angVel;                       //angle increases
    float y = map(sin(angle), -1, 1, 0, height);    //assign y a value based on sign
    fill(x, 100, 100, y);
    stroke(x, 100, 100,height-y);
    ellipse(x, y, 25, 25);
  }
  startAng+=speed;       //increase start angle
}

