// Class for planet selected by the user

class Planet {
  String selectedPlanet;
  
  // Planet constructor
  Planet(String s) {
    this.selectedPlanet = s;
  }
  
  // Assigning values for calculations
  void Assignvalues() {
    // gravitational constant is universal -- doesn't need to change
    gravConstant = 6.67 * pow(10, -11);
      
    switch (this.selectedPlanet) {
      // if the user selected Earth as their planet, sets the radius and mass of Earth
      case "Earth":
        planetRadius = 6.38 * pow(10, 6);
        planetMass = 5.98 * pow(10, 24);     
        break;
      // if the user selected Moon as their planet, sets the radius and mass of Moon
      case "Moon":
        planetRadius = 1.74 * pow(10, 6);
        planetMass = 7.35 * pow(10, 22);
        break;
      // if the user selected Mars as their planet, sets the radius and mass of Mars
      case "Mars":
        planetRadius = 3.4 * pow(10, 6);
        planetMass = 6.39 * pow(10, 23);
        break;
    }
  }
  
  // Draw planet
  void drawPlanet() {
    switch (this.selectedPlanet) {
      // if earth, use the earth image to draw it
      case "Earth":
        image(Earth, width/2-100, height/2-100, 200, 200);
        break;
      // if moon, use moon image
      case "Moon":
        image(Moon, width/2-100, height/2-100, 200, 200);
        break;
      // if mars, use mars image
      case "Mars":
        image(Mars, width/2-100, height/2-100, 200, 200);
        break;
    }
  }
}
