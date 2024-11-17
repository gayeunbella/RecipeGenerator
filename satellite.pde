class Satellite {
  float xMiddle;
  float yMiddle;
  float radius;
  float mass;
  float speed;
  float angle;
  color col;
  float satelliteheight;
  
  Satellite(int r, int m, float sa, float sp, color c) {
    this.radius = r;
    this.mass = m;
    this.speed = sp;
    this.angle = sa;
    this.col = c;
  }
  
  void updatePosition() { 
    if (!(paused)){
      angle += speed;
      xMiddle = width/2 + (this.radius + 92)* cos(angle/(this.mass/100));
      yMiddle = height/2 + (this.radius + 92) * sin(angle/(this.mass/100));
    }
  }
  
  // Draw the satellite
  void drawSatellite() {
    fill(this.col);
    rectMode(CENTER);
    stroke(0);
    rect(this.xMiddle, this.yMiddle, 50, 105); // satellite body
    
    fill(128,128,128);
    stroke(0);
    rect(this.xMiddle + 44, this.yMiddle, 40, 25); // satellite "wings"
    rect(this.xMiddle - 44, this.yMiddle, 40, 25);
  }
}
