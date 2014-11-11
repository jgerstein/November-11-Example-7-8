int spacing = 40;
int size = 10;
int depth;
void setup() {
  size(500, 500, P3D);
  depth = min(width, height)/2;
  sphereDetail(7);
  colorMode(HSB, width, height, depth);
}

void draw() {

  background(0);
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  camera(mouseX, height-mouseY, -depth, width/2, height/2, 0, 0, 1, 0);
  for (int x = 0; x < width; x += spacing) {
    for (int y = 0; y < height; y+= spacing) {
      for (int z = -depth/2; z < depth/2; z+= spacing) {
        pushMatrix();
        fill(x, y, map(z, -depth/2, depth/2, depth, 0));
        translate(x, y, z);
        sphere(size);
        popMatrix();
      }
    }
  }
}

