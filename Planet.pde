class Planet {
  String selectedplanet;

  Planet(String s) {
    this.selectedplanet = s;
  }
  
  void Assignvalues() {
    Gravconstant = 6.67 * pow(10, -11);
      
    switch (this.selectedplanet) {
      case "Earth":
        radius = 6.38 * pow(10, 6);
        planetmass = 5.98 * pow(10, 24);     
        break;
      case "Moon":
        radius = 1.74 * pow(10, 6);
        planetmass = 7.35 * pow(10, 22);
        break;
      case "Mars":
        radius = 3.4 * pow(10, 6);
        planetmass = 6.39 * pow(10, 23);
        break;
    }
  }
  
  void drawPlanet() {
    switch (this.selectedplanet) {
      case "Earth":
        image(Earth, width/2-100, height/2-100, 200, 200);
        break;
      case "Moon":
        image(Moon, width/2-100, height/2-100, 200, 200);
        break;
      case "Mars":
        image(Mars, width/2-100, height/2-100, 200, 200);
        break;
    }
  }
}
