import g4p_controls.*;
String selectedplanet = "Earth";
Float Gravconstant;
Float radius;
Float planetmass;
int f;
Satellite satellite;
Star[] stars;
int numStars = 100;
PImage Moon;
PImage Earth;
PImage Mars;
Planet planet;
boolean paused = false;

void setup() {
  size(800, 800);
  frameRate(60);
  f = 0;
  createGUI();

  Moon= loadImage("Images/Moon.png");
  Earth= loadImage("Images/Earth.png");
  Mars= loadImage("Images/Mars.png");
  
  planet = new Planet(selectedplanet);
  planet.Assignvalues();

  
  satellite = new Satellite(200, 300, 0, 0.02, color(0, 0, 255));
  stars = new Star[numStars];
  for (int i = 0; i < numStars; i++) {
    float x = random(width);
    float y = random(height);
    stars[i] = new Star(x, y);
  }

}

void draw() {
  background(0);
   f++;
    
    for (int i = 0; i < numStars; i++) {
      stars[i].drawStar();
    }
        
    planet.drawPlanet();

    satellite.updatePosition();
    satellite.drawSatellite();
}
