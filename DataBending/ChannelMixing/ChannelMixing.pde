PImage img;

void setup() {
  size(800, 600);
  img = loadImage("Teddyfourbyfour.png"); // Replace with the image's file path
  img.loadPixels();

  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    float r = red(c);
    float g = green(c);
    float b = blue(c);

    // Swap Red and Blue channels
    img.pixels[i] = color(b, g, r);
  }

  img.updatePixels();
  image(img, 0, 0, width, height);
}