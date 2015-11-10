//declare variables
float x, y, velX, velY, diam, g;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  diam = 80;
  velX = random(5);
  velY = 10;
  g =1;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(x, y, diam, diam);

  //add velocity to position
  x += velX;
  y += velY;

  //bounce ball if it hits walls
  if (x + diam/2 >= width) {
    velX = -abs(velX); //if the ball hits the right wall, assign x velocity the negative version of itself
    velY = -abs(velY)*.15;
  } else if (x - diam/2 <= 0) {
    velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
    velY = -abs(velY)*.15;
  }
  if (y + diam/2 >= height) {
    velY = -abs(velY)*.15;
  } else if (y - diam/2 <= 0) {
    velY = abs(velY);
  }
  if(velY < 0 && y + diam/2 >= height) {
    velY = velY+1;
  }
}