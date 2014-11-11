ArrayList<Firework> boom = new ArrayList<Firework>();

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(500, 500, P3D);
  boom.add(new Firework(random(width), random(height), random(1, 3), random(360)));
}

void draw() {
  float num = int(random(500));
  if (num%10 == 0) {
    boom.add(new Firework(random(width), random(height), random(1, 3), random(360)));
  }
  background(0);
  for (int i = boom.size()-1; i >= 0; i--) {
    Firework f = boom.get(i);
    f.display();
    if (f.bang.size() == 0) {
      boom.remove(i);
    }
  }
}

void mousePressed() {
  boom.add(new Firework(mouseX, mouseY, random(1, 3), random(360)));
}

class Firework {
  ArrayList<FireworkParticle> bang;

  Firework(float x, float y, float spread, float hue) {
    bang = new ArrayList<FireworkParticle>();
    for (int i = 0; i < 400; i++) {
      bang.add(new FireworkParticle(x, y, spread, hue));
    }
  }

  void display() {
    for (int i = bang.size()-1; i >= 0; i--) {
      FireworkParticle p = bang.get(i);
      p.display();
      p.move();
      p.update();
      if (p.life < 0) {
        bang.remove(i);
      }
    }
  }
}


class FireworkParticle {
  PVector loc, vel, acc, oldLoc, olderLoc;
  int size;
  float hue;
  float minLife, maxLife, life;
  float spread;

  FireworkParticle(float x, float y, float spread_, float hue_) {
    loc =  new PVector(x, y, 0);
    oldLoc = loc.get();
    olderLoc = oldLoc.get();
    spread = spread_;
    //    vel = new PVector(random(-spread, spread), random(-4, -1), random(-spread, spread));
    vel = PVector.random3D();
    acc = vel.get();
    acc.mult(.01);
    acc.y = .06;
    size = 3;
    hue = hue_;
    minLife = 900;
    maxLife = 1100;
    life = random(minLife, maxLife);
  }
  void display() {
    strokeWeight(size);
    float bright = map(life, minLife, maxLife, 0, 100);
    stroke(hue, 100, bright);
    line(olderLoc.x, olderLoc.y, olderLoc.z, oldLoc.x, oldLoc.y, oldLoc.z);
    line(loc.x, loc.y, loc.z, oldLoc.x, oldLoc.y, oldLoc.z);
  }
  void move() {
    olderLoc = oldLoc.get();
    oldLoc = loc.get();
    vel.add(acc);
    loc.add(vel);
  }

  void update() {
    life--;
  }
}

