class Star {
  float x;
  float y;
  
  Star(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  // Draw a small star at the star's position
  void drawStar() {
    fill(255);
    noStroke();
    ellipse(x, y, 3, 3); // Small circle for a star
  }
}  
