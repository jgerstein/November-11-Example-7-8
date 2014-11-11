class Filler {
  PVector loc;
  int d;
  float r;
  float inc;
  color c;

  Filler() {
    inc = .1;
    d = maxSize;
    r = d/2;  
    loc = new PVector(int(random(margin, width-margin)), int(random(margin, height-margin)));
    c = color(frameCount%360, 100, 100);
  }

  void display() {
//    fill(c);
    fill(220,50,70);
    stroke(0,0,100);
    ellipse(loc.x, loc.y, d, d);
  }

  void place(Filler f1) {
    if (loc.dist(f1.loc)<r+f1.r) {
      while (loc.dist (f1.loc)<r+f1.r) {
        d--;
        r=d/2;
        print("TOUCH");
        if (loc.x < f1.loc.x) {
          loc.x-=inc;
        }
        if (loc.x > f1.loc.x) {
          loc.x+=inc;
        }
        if (loc.y < f1.loc.y) {
          loc.y-=inc;
        }
        if (loc.y > f1.loc.y) {
          loc.y+=inc;
        }
      }
    }
  }
}

