
PImage img;
TriOsc triOsc;
Env env;
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.2;
int[] midiSequence = { 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72 }; 
// This is an octave in MIDI notes.

// Play a new note every 200ms
int duration = 200;

// This variable stores the point in time when the next note should be triggered
int trigger = millis(); 

// An index to count up the notes
int note = 0; 


void setup() {  
  size(400,400); //add the exact pixel size of your image here
  img = loadImage("Teddyfourbyfour.png"); //add the filename of your image here
 // noLoop();
  background(255);
    // Create triangle wave and start it
  triOsc = new TriOsc(this);

  // Create the envelope 
  env = new Env(this);

 
  // Display the original image on the left
  image(img, 0, 0, width / 2, height);
  
  // Reflect and mirror the image horizontally on the right
  PImage mirroredImage = createImage(img.width, img.height, RGB);
  mirroredImage.loadPixels();
  img.loadPixels();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pixelColor = img.pixels[y * img.width + x];
      mirroredImage.pixels[y * mirroredImage.width + mirroredImage.width - x - 1] = pixelColor;
    }
  }

  mirroredImage.updatePixels();
  
  // Display the mirrored image on the right
  image(mirroredImage, width / 2, 0, width / 2, height);

}
void draw() { 

  // If the determined trigger moment in time matches up with the computer clock and
  // the sequence of notes hasn't been finished yet, the next note gets played.
  if ((millis() > trigger) && (note<midiSequence.length)) {

    // midiToFreq transforms the MIDI value into a frequency in Hz which we use to
    // control the triangle oscillator with an amplitute of 0.5
    triOsc.play(midiToFreq(midiSequence[note]), 0.5);

    // The envelope gets triggered with the oscillator as input and the times and
    // levels we defined earlier
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);

    // Create the new trigger according to predefined duration
    trigger = millis() + duration;

    // Advance by one note in the midiSequence;
    note++; 

    // Loop the sequence, notice the jitter
    if (note == 12) {
      note = 0;
    }
  }
} 
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
}

