int maxSize = 500;
int margin = 0;
ArrayList<Filler> fillers = new ArrayList<Filler>();
void setup() {
  frameRate(200);
  size(displayWidth,displayHeight);
  colorMode(HSB, 360, 100, 100);
  strokeWeight(3);
}

void draw() {
  fillers.add(new Filler());
  background(0);
  Filler newFiller = fillers.get(fillers.size()-1);
  for (int i = fillers.size()-1; i >=0; i--) {
    Filler f = fillers.get(i);
    if (i !=fillers.size()-1) {    
      newFiller.place(f);
    }
    f.display();
  }
}

void mousePressed() {
  fillers.add(new Filler());
}


