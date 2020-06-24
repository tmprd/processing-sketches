String sessionid;
float centerX;
float centerY;

float period = 220;
float amplitude = 0.8;

float sizeOsc;
  
void setup() {
  size(800,800);
  centerX = width/2;
  centerY = height/2;
  //frameRate(1);
  sessionid = hex((int)random(0xffff), 4);
}
 
void draw() {
  background(0);
  //noLoop();
  float radius = 400;
  float x = centerX;
  float y = centerY;
  
  sizeOsc = amplitude / tan(PI * frameCount / period);
  //osc %= 3;
 
  pushMatrix();
  //translate(centerX/80, centerY/80);
  //rotate(radians(frameCount*2));
  drawCircle(x, y, radius, false);
  popMatrix();

  //save(fileName);
  //println(circleCount);
}

// PARAMS
//float newRadius(float radius) {
//  return radius/2;
//};
//float right(float x, float newRadius) {
//  x + newRadius;
//};


color orange = color(204, 102, 0);
color black = color(0);
color white = color(255);


int circleCount = 0;
boolean circles[];

 
void alternate(Boolean fill) {
    stroke(orange);
    noFill();
    
    //if (circles[circleCount]) return;
    
    int circleNumber = circleCount;
    
    if (fill) {
      // FILL
      if (fill) {
        fill(orange);
        stroke(black);
      }
    } else {
      if (1==1) {
        fill(black);
        stroke(orange);
      }
    }
    
    //circles[circleCount] = true;
}

void drawCircle(float x, float y, float radius, boolean fill) {
  if(radius > 8) {

    //Boolean fill = true;
    alternate(fill);
    
    float downMovement = (mouseY-centerY)/2;
    float leftMovement = (mouseX-centerX)/2;
    
    float xMoved = centerX - x;
    float xDist = abs(xMoved);
    float yMoved = centerY - y;
    float yDist = abs(xDist);
    
    xMoved /= 1000;
    yMoved /= 1000;
    
    
    float distance;
    //distance = (radius / (osc+2.5));
    distance = radius / 2;
    float right = x + distance+leftMovement;
    float left = x - distance-leftMovement;
    float down = y + distance-downMovement;
    float up = y - distance+downMovement;
    
    
    pushMatrix();
    translate(x, y);
    //rotate(radians(frameCount*2));
    //rotate(radians(45));
    rectMode(CENTER);
    ellipse(2, 2, distance, distance);
    //star(0, 0, distance/3, distance/7, 4);
    popMatrix();
    
    //pushMatrix();
    //translate(x, y);
    //rotate(radians(frameCount));
    //rect(-10,-10,20,20);
    //popMatrix();

  
    float movementOsc = (centerX/4) * sin(TWO_PI * frameCount / 400);
    
    //triangle(x,y, x-distance, y+distance, x+distance, y+distance);

    circleCount += 1;
    
    float num = 2;
    //println(num);
    //println(xDist + " AND " + centerX);
    
    if (1==1) {
      drawCircle(right+movementOsc, y, radius/num, true);
      drawCircle(left+movementOsc, y, radius/num, false);
    }
    else {
      //drawCircle(left, y, radius/num, false);
    }
    
    if (1==1) {
      drawCircle(x, up+movementOsc, radius/num, true);
      drawCircle(x, down+movementOsc, radius/num, false);
    }
    //drawCircle(x,y,radius/6);
    //drawCircle(0,0,0);
  }
  
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

// Saving
String getFileName(float right, float left, float up, float down, float radius) {
  //return sessionid + hex((int)random(0xffff), 4)+".png";
  
  String fileName = String.join("_",
    Float.toString(right),
    Float.toString(left),
    Float.toString(up),
    Float.toString(down),
    Float.toString(radius)
  );
   
  fileName = fileName + ".png";
  return fileName;
}
