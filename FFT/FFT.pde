import java.util.ArrayList;

float time = 0;
ArrayList<Float> wave = new ArrayList<>();

void setup() {
  size(600, 400);
}

void draw() {
  background(0);
  
  translate(180, 200);
  
  float x = 0, y = 0;
  
  for (int i = 0; i < 15; i++) {
    float prvX = x;
    float prvY = y;
    
    int n = i * 2 + 1;
    float r = 75 * (4 / (n * PI));
    x += r * cos(n * time);
    y += r * sin(n * time);
  
    stroke(255, 100);
    noFill();
    ellipse(prvX, prvY, 2 * r, 2 * r); //<>//
    
    //fill(255);
    stroke(255);
    line(prvX, prvY, x, y);
    //ellipse(x, y, 8, 8);
  }
  wave.add(0, y);
  
  translate(200, 0);
  line(x - 200, y, 0, wave.get(0));
  beginShape();
  stroke(0xFF00FF00);
  noFill();
  for (int i = 0; i < wave.size(); i++) {
    vertex(i, wave.get(i));
  }
  endShape();
  
  time += 0.03;
  
  if (wave.size() > 250) {
    wave.remove(wave.size() - 1);
  }
}

// References: https://youtu.be/Mm2eYfj0SgA
