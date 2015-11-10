//declare variables
float g;
int count = 9999;
float []x = new float [count];
float []y= new float [count];
float []velX = new float [count];
float []velY = new float [count];
float []diam = new float [count];
void setup() {
  //set size of canvas

  size(800, 600);
  for (int i=0; i < count; i++) {
    //initialize variables
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = 20;
    velX[i] = random(5);
    velY[i]= random(10);
    g =.1;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
 
  for (int i=0; i < count; i++) { //for statement adding arrays 

    //draw ball
    velY[i]= velY[i] + g; //adding gravity
    fill(255, 0, 0); //red
    noStroke();  //no line
    ellipse(x[i], y[i], diam[i], diam[i]); //draw ellipse

    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];



    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]); //if the ball hits the right wall, assign x velocity the negative version of itself
      velY[i] = abs(velY[i])*2;
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
      velY[i] = abs(velY[i])*2;
    }
    if (y[i] + diam[i]/2 >= height) { //bounce at bottom 
      velY[i] = -abs(velY[i])*.65; // reduce velY 
    } else if (y[i] - diam[i]/2 <= 0) { //bounce at top
      velY[i] = abs(velY[i]);
    }
    if (y[i] + diam[i]/2 >= height && velY[i] > 0) { //slowing velY at botom 
      velY[i] = 0;
      g = 0;
    }
    if (y[i] + diam[i]/2 >= height && velY[i] > 0 && velX[i] > 0) { //slowing velX at bottom
      velY[i] = 0;
      g=0;
      velX[i] = velX[i] *.5;
    }
    }
}
 