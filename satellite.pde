class Satellite {
  // satellite variables
  float xMiddle, yMiddle, radius, mass, speed, angle, satelliteheight;
  color col;
  
  // constructor
  Satellite(int r, int m, float sa, float sp, color c) {
    this.radius = r;
    this.mass = m;
    this.speed = sp;
    this.angle = sa;
    this.col = c;
  }
  
  void updatePosition() { 
    if (!(paused)){     // only update if the simulation is not paused
      angle += speed;
      
      // calculate the x and y position based on the angle and mass
      xMiddle = width/2 + (radius + 140) * cos(angle/(this.mass/100));
      yMiddle = height/2 + (radius + 140) * sin(angle/(this.mass/100));
    }
  }
  
  // Draw the satellite
  void drawSatellite() {
    translate(xMiddle, yMiddle); 
    float adjustedAngle = angle / (this.mass / 100) + 20; 
    rotate(adjustedAngle);  //rotate the satellite image
    image(satelliteImg, 0, 0, 70, 70); // draw the satellite image
  }
}
