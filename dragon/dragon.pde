void setup() {
  size(1080,640);
  background(255,128,128);
  stroke(0,128,128);
  
  //Establish standard coordinate frame
  translate(width/2, height/2);
  scale(1,-1);
  
  pushMatrix();
  translate(-40, 0);
  _3Dragon(7, 7);
  popMatrix();
  
  pushMatrix();
  translate(250, 150);
  _2Dragon(14, 3);
  popMatrix();
  
  pushMatrix();
  translate(-150, 200);
  _5Dragon(4, 5);
  popMatrix();
}

void _3Dragon(int n, float size) {
  if(n == 0) line(0,0,size,0);
  else {
    _3Dragon(n-1, size);
    translate(size,0);
    rotate(2*PI/3);
    _3Dragon(n-1, size);
    translate(size,0);
    rotate(-2*PI/3);
    _3Dragon(n-1, size);
  }
}

void _5Dragon(int n, float size) {
  if(n == 0) line(0,0,size,0);
  else {
    _5Dragon(n-1, size);
    translate(size,0);
    rotate(2*PI/5);
    _5Dragon(n-1, size);
    translate(size,0);
    rotate(2*PI/5);
    _5Dragon(n-1, size);
    translate(size,0);
    rotate(-2*PI/5);
    _5Dragon(n-1, size);
    translate(size,0);
    rotate(-2*PI/5);
    _5Dragon(n-1, size);
  }
}


void _2Dragon(int n, float size) {
  _2Dragon(n, false, size);
}

void _2Dragon(int n, boolean back, float size) {
  if(n == 0) line(0,0,size,0);
  else {
    _2Dragon(n-1, false, size);
    translate(size,0);
    rotate(back?-1*PI/2:PI/2);
    _2Dragon(n-1, true, size);
  }
}