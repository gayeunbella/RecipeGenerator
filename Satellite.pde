class Satellite {
  // satellite variables
  float xMiddle, yMiddle, radius, mass, speed, angle, satelliteheight;
  
  // constructor
  Satellite(float r, float m, float sa, float sp) {
    this.radius = r;
    this.mass = m;
    this.speed = sp;
    this.angle = sa;
  }
  
  // Calculates the total energy of the satellite
  float totalEnergyFinder(){
    float newRadius = radius*1000 + planetRadius;
    totalEnergy= (-1 * planetMass * gravConstant * mass)/(2 * newRadius);
    return totalEnergy;
  }
  
  // Calculates the total speed of the satellite
  float satelliteSpeedFinder(){
    float newRadius= radius*1000 + planetRadius; 
    if (mass==0){
      satelliteSpeed=0;
    }
    else{
    satelliteSpeed = sqrt((gravConstant*planetMass)/newRadius);
    }
    return satelliteSpeed;
  }
  
  // Calculates the kinetic energy of the satellite
  float kineticEnergyFinder(){
    kineticEnergy= (mass*sq(satelliteSpeed))/2;
    return kineticEnergy;
  }
  
  // Calculates the gravitational potential energy of the satellite
  float gravitationalPotentialFinder(){
    float newRadius = radius*1000 + planetRadius;
    gravitationalPotential = (-1 * gravConstant * planetMass * mass) / newRadius; 
    return gravitationalPotential;
  }
    
  // update position of the satellite
  void updatePosition() { 
    if (!(paused)){     // only update if the simulation is not paused
      angle += speed;
      
      // return the calculated x and y position based on the angle and mass
      xMiddle = width/2 + (radius/50 + 140) * cos(angle/(this.mass/100));
      yMiddle = height/2 + (radius/50 + 140) * sin(angle/(this.mass/100));
    }
  }
  
  // Draw the satellite
  void drawSatellite() {
    pushMatrix();
    translate(xMiddle, yMiddle); 
    float adjustedAngle = angle / (this.mass / 100) + 20; 
    rotate(adjustedAngle);  //rotate the satellite image
    image(satelliteImg, 0, 0, 70, 70); // draw the satellite image   
    popMatrix();
  }
}
