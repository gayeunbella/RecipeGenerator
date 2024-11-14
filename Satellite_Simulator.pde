import g4p_controls.*;
String selectedplanet;


void setup() {
  size(800, 800);
  createGUI();

  if (selectedplanet == null) {
    selectedplanet= "Earth";
  }
}

void draw() {
  background(0);
}
