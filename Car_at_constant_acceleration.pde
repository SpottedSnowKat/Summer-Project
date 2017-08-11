int a = 20;
int r = 10;
float time = -5;

float speed(float t) {
  float frac;
  frac = (0.5*a*sq(t))/r;
  float mult;
  mult = (a*t)/r;
  float dtheta;
  dtheta = (1/(1+sq(frac)))*mult;
  return abs(dtheta);
}


float position(float t) {
  float theta;
  theta = atan((0.5*a*sq(t))/r);
  float newx;
  if (t<0) {
    newx = theta*(-200)+400;
  } else {
    newx = theta*(200)+400;
  }
  return newx;
}

void setup()
{
  size (800,600);
  smooth();
  stroke(0);
  fill(255);
  strokeWeight(1);
  rect(200, 350, 400, 200);
}

void draw()
{ noStroke();
  fill(0,100,0);
  rect(0,0,200,600);
  rect(0,0,800,350);
  rect(200,550,400,50);
  rect(600,0,200,600);
  
  
  strokeWeight(1);
  stroke(0);
  int XPos;
  XPos = int(position(time));
  fill(255,0,0);
  noStroke();
  triangle(XPos-20, 90, XPos-20, 110, XPos+20, 110);
  
  fill(255,255,255);
  stroke(0);
  ellipse(200,200,75,75);
  float dt;
  dt = abs(speed(time));
  strokeWeight(3);
  line(200,200,200-37.5*cos(dt),200-37.5*sin(dt));
  
  strokeWeight(1);
  fill(255,255,255);
  stroke(0);
  ellipse(600,200,75,75);
  strokeWeight(3);
  line(600,200,600-37.5*cos(0.03*a*abs(time)),200-37.5*sin(0.03*a*abs(time)));
  
  textSize(20);
  fill(255);
  textAlign(RIGHT);
  text(time, 795, 290);
  
  textSize(12);
  fill(255);
  textAlign(CENTER);
  text("Rotational velocity", 200, 255);
  
  textSize(12);
  fill(255);
  textAlign(CENTER);
  text("Linear velocity", 600, 255);
  
  strokeWeight(1);
  stroke(0);
  fill(0);
  ellipse(400+time*40,550-dt*150, 5, 5); 
  
  textSize(12);
  fill(255);
  textAlign(CENTER);
  text("Time", 400, 560);
  
  textSize(12);
  fill(255);
  textAlign(RIGHT);
  text("Rotational", 195, 440);
  text("Velocity", 195, 460);
  
  
  time = time + 0.01;
  if (time>5.01) {
    noLoop(); 
  }
  
}