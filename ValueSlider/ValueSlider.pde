class Slider {

   public float w;
   public float x;
   public float y;
   public float valMin;
   public float valMax;
   public float value;
   public static final float BOX_HEIGHT = 20.0f;
   public static final float CURSOR_WIDTH = 10.0f;
   private float cursorX;
   private boolean isDragging = false;
   private float maxBoundary;
  
  public Slider(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.cursorX = 0;
    this.valMin = 0.0f;
    this.valMax = 100.0f;
    this.value = 0.0f;
    this.maxBoundary = w - CURSOR_WIDTH;
  }
  
  public void show() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    rect(x, y, w, BOX_HEIGHT);
    
    fill(255);
    if (mouseX >= x + cursorX && mouseX <= x + cursorX + 10 && mouseY >= y && mouseY <= y + BOX_HEIGHT) {
        fill(0xFF52B7E8);
        if (mousePressed) {
          isDragging = true;
        }
    }
    if (!mousePressed) {
      isDragging = false;
    }
    if (isDragging) {
      fill(0xFF228ABC);
      cursorX = mouseX - x - 5;
      
      if (cursorX < 0) {
        cursorX = 0;
      } else if (cursorX > maxBoundary) {
        cursorX = maxBoundary;
      }
    }
    
    rect(cursorX + x, y, CURSOR_WIDTH, BOX_HEIGHT);
    
    value = (valMax / maxBoundary) * cursorX;
    
    fill(0);
    text("" + value, x + w / 2, y + BOX_HEIGHT / 2 + 5);
  }
}

Slider slider = new Slider(200, 100, 300);

void setup() {
  size(600, 400);
  slider.valMax = height;
}

void draw() {
  background(255);
  
  stroke(255, 0, 0);
  float yPos = slider.value;
  text(yPos, 10, yPos);
  line(0, yPos, width, yPos);
  
  slider.show();
}
