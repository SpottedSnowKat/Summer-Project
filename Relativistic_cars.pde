float v1 = 0.5;
float v2 = 0.78;
float v3 = 0.95;
float v = 0.1;
float l1 = 0.08;
float l2 = 0.12;
float c = 1;
float t = -0.5;
int i = 1;

float length1() {
  float gamma;
  gamma = 1/sqrt(1-(sq(v)/sq(c)));
  float newlength1;
  newlength1 = l1/gamma;
  return newlength1;
}

float length2(float vel) {
  float gamma2;
  gamma2 = 1/sqrt(1-(sq(vel)/sq(c)));
  float newlength2;
  newlength2 = l2/gamma2;
  return newlength2;
}

void setup()
{
  size (800,300);
  smooth();
  stroke(0);
  fill(255);
  strokeWeight(1);
  background(0,100,0);
}

void draw()
{
  background(0,100,0);
  fill(255,0,0);
  float len1 = length1();
  rect((t*v-len1/2)*800+400, 110, len1*800, 80);
  fill(0,0,255);
  if (i==1) {
    float len2 = length2(v1);
    rect((t*v1-len2/2)*800+400, 110, len2*800, 80);
  }
  if (i==2) {
    float len2 = length2(v2);
    rect((t*v2-len2/2)*800+400, 110, len2*800, 80);
  }
  if (i==3) {
    float len2 = length2(v3);
    rect((t*v3-len2/2)*800+400, 110, len2*800, 80);
  }
  textSize(20);
  fill(255);
  textAlign(RIGHT);
  text(t, 795, 290);
  
  textSize(15);
  fill(255);
  textAlign(LEFT);
  text("v1=0.1c", 5, 270);
  
  textSize(15);
  fill(255);
  textAlign(LEFT);
  text("v2=", 5, 290);
  if (i==1) {
    text("0.5c", 35, 290);
  }
  if (i==2) {
    text("0.78c", 35, 290);
  }
  if (i==3) {
    text("0.95c", 35, 290);
  }

  
  if (t>0.5) {
    if (i<3) {
      t = -0.5;
      i = i + 1;
    }
    else {
      noLoop(); 
    }
  }
  else {
    t = t + 0.004;
  }
    
}  