import java.util.ArrayList;

class Point {
  int x;
  int y;
  
  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public String toString() {
    return "[" + x + ", " + y + "]";
  }
}

ArrayList<Point> points = new ArrayList<>();

void setup() {
  size(600, 600);
}

void draw() {
  background(128, 128, 128);
  
  fill(0);
  for (int i = 0; i < points.size(); i++) {
    Point p = points.get(i);
    if (i + 1 < points.size()) {
      Point p2 = points.get(i + 1);
      stroke(0);
      strokeWeight(5);
      line(p.x, p.y, p2.x, p2.y);
    }
    stroke(255, 0, 0);
    strokeWeight(10);
    point(p.x, p.y);
    text("(" + p.x + ", " + p.y + ")", p.x, p.y);
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    points.add(new Point(mouseX, mouseY));
  } else if (points.size() > 0) {
    points.remove(points.size() - 1);
  }
}

void keyReleased() {
  if (key == 'p' || key == 'P') {
    for (int i = 0; i < points.size(); i++) {
      print(points.get(i));
      if (i < points.size() - 1) {
        print(", ");
      }
    }
    println("");
  }
}
