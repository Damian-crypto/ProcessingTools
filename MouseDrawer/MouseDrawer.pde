int NUM_BOXES;
final int BOX_SIZE = 10;
int[][] boxes;

void setup() {
  size(600, 600);
  
  NUM_BOXES = width / BOX_SIZE;
  boxes = new int[NUM_BOXES][NUM_BOXES];
  
  println("Num boxes " + NUM_BOXES);
  for (int i = 0; i < NUM_BOXES; i++) {
    for (int j = 0; j < NUM_BOXES; j++) {
      boxes[i][j] = 0xFF; // argb
    }
  }
}

boolean hover(int x0, int y0, int size) {
  if (mouseX <= x0 + size && mouseX >= x0 && mouseY >= y0 && mouseY <= y0 + size) {
    return true;
  }
  
  return false;
}

void draw() {
  background(255);
  
  for (int i = 0; i < NUM_BOXES; i++) {
    for (int j = 0; j < NUM_BOXES; j++) {
      int x = i * BOX_SIZE;
      int y = j * BOX_SIZE;
      if (hover(x, y, BOX_SIZE)) {
        if (mousePressed && mouseButton == LEFT) {
          boxes[i][j] = 0xFFFF0000;
          
        }
        if (mousePressed && mouseButton == RIGHT) {
          boxes[i][j] = 0xFF;
        }
      }
      fill(boxes[i][j]);
      square(x, y, BOX_SIZE);
      fill(255);
    }
  }
}
