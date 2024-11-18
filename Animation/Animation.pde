

/*
Explanation:

The setup() function sets up the canvas size.

The draw() function continuously updates the animation.

The ball's position (x and y) is continuously updated by adding the speed values (xSpeed and ySpeed) to its position on each frame.

The code uses conditionals to detect collisions with the window edges, changing the ball's direction upon impact.

The ellipse() function draws the ball at its updated position.

This simple example demonstrates a bouncing ball animation within the Processing window. As the draw() function continuously updates the positions of the ball and checks for collisions, the ball appears to bounce within the defined boundaries.

To create more complex animations, consider using variables to control different aspects of shapes, colors, and sizes. You can introduce transformations, create multiple shapes, incorporate interaction through mouse or keyboard input, and create more intricate movements and visuals to build dynamic and engaging animations in Processing. Additionally, integrating frame rate control (frameRate()) and conditional checks enables more precise control and interaction in animations.
*/

float x = 100; // X position of the ball
float y = 100; // Y position of the ball
float xSpeed = 2; // Speed of the ball along the x-axis
float ySpeed = 2; // Speed of the ball along the y-axis

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  println(frameRate);
  // Update ball position
  x += xSpeed; 
  y += ySpeed;
  
  // Check and handle collisions with window edges
  if (x > width || x < 0) {
    xSpeed *= -1;
    
    // Change direction on reaching horizontal window boundaries
  }
  if (y > height || y < 0) {
    ySpeed *= -1; // Change direction on reaching vertical window boundaries
  }
  
  // Draw the bouncing ball
  fill(255,178,10);
  ellipse(x, y, 20, 20);
}

  
