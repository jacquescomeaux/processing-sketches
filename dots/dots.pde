int R = 200;   //radius
int N = 6;     //number of vertices
float D = 0.7; //interpolation distance

//tip: make D smaller as N is increased

PVector[] v = new PoVector[N];

void setup() {
  size(800, 800);
  frameRate(1000);
  background(192, 64, 0);
  stroke(255);
  for(int i = 0; i < v.length; i++) {
    v[i] = new PoVector(R, 90 + 360*i/v.length);
    point(v[i].x, v[i].y);
  }
}

PVector p = new PVector(random(800), random(800));
void draw() {
  p.lerp(v[(int) random(N)], D);
  point(p.x, p.y);
}

class PoVector extends PVector {
  PoVector(float mag, float ang) {
    super((width/2)+mag*cos(radians(ang)), (height/2)-mag*sin(radians(ang)));
  }
}