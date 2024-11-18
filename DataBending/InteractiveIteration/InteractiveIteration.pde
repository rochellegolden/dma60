PImage img;
float corruptionRate = 0.1; // Initial corruption rate
int iterations = 0; // Number of iterations
Button iterateButton; // Declare the button as a global variable

void setup() {
  size(400,400); //add the actual dimensions of your image
  img = loadImage("Teddyfourbyfour.png"); // Replace with the image's file path
  img.loadPixels();
  
  // Create a button to trigger iterative corruption
  iterateButton = new Button(width / 2 - 50, height - 50, 100, 30, "Iterate");
}

void draw() {
  background(255);
  
  // Display the image
  image(img, 0, 0, width, height);
  
  // Display the number of iterations
  fill(0);
  text("Iterations: " + iterations, 20, 30);
  
  // Display the button
  iterateButton.display();
  
  // Check if the mouse is over the button
  if (iterateButton.isMouseOver()) {
    // Highlight the button when the mouse is over it
    iterateButton.highlight();
  } else {
    iterateButton.noHighlight();
  }
}

void mousePressed() {
  // Check if the mouse is over the button and call its mousePressed method
  if (iterateButton.isMouseOver()) {
    iterateButton.mousePressed();
    iterations++;
  }
}

void dataCorruption(PImage img, float rate) {
  img.loadPixels();
  
  for (int i = 0; i < img.pixels.length; i++) {
    // Apply data corruption with a rate determined by the slider
    if (random(1) < rate) {
      img.pixels[i] = color(random(255), random(255), random(255));
    }
  }
  
  img.updatePixels();
}

class Button {
  float x, y, w, h;
  String label;
  boolean highlighted = false; // To track if the button is highlighted
  
  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }
  
  void display() {
    rectMode(CORNER);
    stroke(0);
    if (highlighted) {
      fill(200); // Highlighted color
    } else {
      fill(150); // Default color
    }
    rect(x, y, w, h);
    
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }
  
  boolean isMouseOver() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }
  
  void highlight() {
    highlighted = true;
  }
  
  void noHighlight() {
    highlighted = false;
  }
  
  void mousePressed() {
    // Trigger data corruption when the button is pressed
    dataCorruption(img, corruptionRate);
  }
}