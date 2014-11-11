float startAng, angVel, speed;

void setup() {
  size(600, 200);
  colorMode(HSB, width, 100, 100,height);
  startAng = 0;
  angVel = .2;
  speed = .01;
  strokeWeight(3);
}

void draw() {
  background(0);    
  float angle = startAng;

  for (int x = 0; x < width; x+=10) {

    angle+=angVel;
    float y = map(sin(angle), -1, 1, 0, height);
    fill(x, 100, 100, y);
    stroke(x, 100, 100,height-y);
    ellipse(x, y, 25, 25);
  }
  startAng+=speed;
}

