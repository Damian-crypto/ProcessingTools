PImage img;

void setup() {
  size(600, 600);
  frameRate(60);
  img = loadImage("Tree.jpeg");
}

double start = 0.0f;
double end = 0.0f;

boolean red = false;
void draw() {
  background(0);
  
  //double dt = end - start;
  //println(dt / 1000);
  //start = end;
  //end = System.currentTimeMillis();
  
  if (red) {
    red = false;
    //fill(255, 0, 0);
  } else {
    red = true;
    //fill(0, 0, 255);
    image(img, 0, 0);
  }
  //ellipse(300, 300, 20, 20);
}
