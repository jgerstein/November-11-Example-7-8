int l = 100;
float theta = radians(45);
void setup() {
  size(600, 600);
  noLoop();
}

void draw() {
  stroke(0, 200);
  theta = map(mouseX, 0, width, 0, PI/2);
  background(255);
  translate(width/2, height);
  branch(l);
}

void mousePressed() {
  redraw();
}

void branch(float len) {
  strokeWeight(map(len, 2, 100, .5, 10));
  line(0, 0, 0, -len);
  translate(0, -len);
  len*=random(.6,.8);
  if (len > 2) {
    int rand = int(random(2, 4));
    for (int i = 0; i < rand; i++) {
      theta = random(-PI/4, PI/4);
      pushMatrix();
      rotate(theta);
      branch(len);
      popMatrix();
    }
  }
}

