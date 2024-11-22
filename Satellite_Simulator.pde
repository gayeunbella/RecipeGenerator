// Title: Satellite Simulator
// Authors: Bella Kim, Ahmad Aldirieh, Henrique Silverio Sponchiado
// Purpose: To simulate and calculate satellites' movement

// START of the Code

// Importing necessary functions for running the code
import g4p_controls.*;

// Setting up global variables
import g4p_controls.*;
String selectedPlanet = "Earth";
Float gravConstant, planetRadius, planetMass;
int lastCreatedTime=0;
String feedbackMessage="";
int feedbackMessageTime=0;
int numStars = 200;
Star[] stars;
PImage Moon, Earth, Mars, satelliteImg;
Planet planet;
boolean paused = false;
boolean introScreen= true;
boolean createsatellite= false;
float totalEnergy;
float gravitationalPotential;
float kineticEnergy;
float satelliteSpeed;
ArrayList<Satellite> satellites;


void setup() {
  size(800, 800);
  createGUI();
  
  // Loading external images needed to run the code
  Moon= loadImage("Images/Moon.png");
  Earth= loadImage("Images/Earth.png");
  Mars= loadImage("Images/Mars.png");
  satelliteImg = loadImage("Images/satelliteImg.png");
  
  // Sets up planet and satellites with set initial values
  planet = new Planet(selectedPlanet);
  planet.Assignvalues();

  satellites = new ArrayList<Satellite>();
  satellites.add(new Satellite(5000, 2500, 0, 0.015));
  
  // Sets random coordinates of stars
  stars = new Star[numStars];
  for (int i = 0; i < numStars; i++) {
    float x = random(width);
    float y = random(height);
    stars[i] = new Star(x, y);
  }

}

void draw() {
 // Check if the intro screen has been run 
 if (introScreen){
   // Draw the intro screen
   drawIntroScreen();
 }
 
 // If not, run the simulator
 else{
  // Sets up the background color
  background(20, 20, 70);
      
    // Drawing random stars
    for (int i = 0; i < numStars; i++) {
      stars[i].drawStar();
    }
    
    // Check if the feedback message has been shown on the screen
    if (!feedbackMessage.isEmpty() && millis() - feedbackMessageTime < 1500) { 
      // If it has not been shown, print the feedback message
      fill(255,255,0); 
      textSize(16); 
      textAlign(CENTER, CENTER);
      text(feedbackMessage, width / 2, 50);
    }
    
    // If it has been shown already, there's no need to show it again!
    else if (millis() - feedbackMessageTime >= 1500) {
      // Resets the message so the message doesn't show on the screen
      feedbackMessage = ""; 
    }
    
    // Draws the planet
    planet.drawPlanet();
    
    if (createsatellite){
      createSatellite();
    }
    
    // Updating all satellites related values to redraw
    for (Satellite satellite : satellites) {
      satellite.updatePosition();
      satellite.drawSatellite();
      totalEnergy = satellite.totalEnergyFinder();
      satelliteSpeed=  satellite.satelliteSpeedFinder();
      gravitationalPotential= satellite.gravitationalPotentialFinder();
      kineticEnergy = satellite.kineticEnergyFinder();
    }
  }
}

// Intro screen before starting the actual code
void drawIntroScreen(){
   background(20, 20, 70); 
  
  // Shows the game's name 
  textAlign(CENTER);
  fill(255);
  textSize(45);
  text("Galactic Satellite Simulator", width / 2, 200);
  
  // Shows the instructions
  textSize(18);
  text("Explore satellite motion around celestial bodies.", width / 2, 250);
  text("Use the GUI to select a planet, adjust parameters, and pause/resume the simulation.", width / 2, 280);
  
  // Places stars on random coordinates
  for (int i = 0; i < numStars; i++) {
    stars[i].drawStar();
  } 
}

//Created a function to avoid concurrentmodificationexception error code
void createSatellite(){
    int currentTime=millis();
  // To prevent people spamming the generate button, make generation possible after 5 seconds from generating the last satellite
  // if 5 seconds have passed
  if (currentTime-lastCreatedTime>=5000){
   // Generate the satellite + tell them that a satellite has been created
   if (!satellites.isEmpty()) {
      Satellite firstSatellite = satellites.get(0);
      Satellite newSatellite = new Satellite(firstSatellite.radius, firstSatellite.mass, 0, firstSatellite.speed);
      satellites.add(newSatellite);
      lastCreatedTime = currentTime;
      feedbackMessage = "Satellite successfully created!";
      feedbackMessageTime = millis();
      createsatellite=false;
    }
  }
  
  // if 5 seconds hasn't passsed, tell them to wait
  else if (currentTime-lastCreatedTime<5000){
    feedbackMessage="Please wait for 5 seconds before creating another satellite.";
    feedbackMessageTime=millis();
  }
}
