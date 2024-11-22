// Class for stars those are randomly placed

class Star {
  float x, y;
  
  // Star constructor
  Star(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  // Draw a small star at the star's position
  void drawStar() {
    fill(255);
    noStroke();
    ellipse(x, y, 3, 3); // Small circle with a radius of 3 px for a star
  }
}  
