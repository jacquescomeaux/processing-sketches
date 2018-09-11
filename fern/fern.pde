Mat[] A;
Vect[] B;
Vect p;

void setup() {
  
  size(1000, 800);
  frameRate(100);
  background(0, 105, 0);
  stroke(255);
  p = new Vect(0, 0);
  A = new Mat[4];
  

  A[0] = new Mat(0, 0, 0, 0.16);
  A[1] = new Mat(0.85, 0.04, -0.04, 0.85);
  A[2] = new Mat(0.20, -0.26, 0.23, 0.22);
  A[3] = new Mat(-0.15, 0.28, 0.26, 0.24);
  
  B = new Vect[4];
  
  B[0] = new Vect(0, 0);
  B[1] = new Vect(0, 1.6);
  B[2] = new Vect(0, 1.6);
  B[3] = new Vect(0, 0.44);

}

void draw(){
  int r = 1 + (int) random(100);
  if(r == 1) r = 0;
  else if(r <= 86) r = 1;
  else if(r <= 93) r = 2;
  else r = 3;
  p = (A[r].mult(p)).add(B[r]); 
  point(60 * p.x + width/2, -1 * 60 * p.y + height/2 + 300);
}