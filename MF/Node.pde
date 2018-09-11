// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

//Modified by Jacques Comeaux
//Added method to repel other nodes

class Node {
  PFont font;
  int id;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass = 8;
  
  float damping = 0.95;

  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Node(float x, float y, int n) {
    id = n;
    position = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
    
    printArray(PFont.list());
    font = createFont("SourceCodePro-Regular.ttf", 24);
    textFont(font);
    textAlign(CENTER, CENTER);
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    position.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }


  void display() { 
    stroke(0);
    strokeWeight(2);
    fill(175,120);
    if (dragging) {
      fill(50);
    }
    ellipse(position.x,position.y,mass*4,mass*4);
    fill(0, 0, 0);
    text(id, position.x, position.y - 3);
  } 

  void clicked(int mx, int my) {
    float d = dist(mx,my,position.x,position.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = position.x-mx;
      dragOffset.y = position.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      position.x = mx + dragOffset.x;
      position.y = my + dragOffset.y;
    }
  }
  
  void repel(Node m) {
    PVector force = m.position.get().sub(position);
    force.div(pow(force.mag(), 3));
    force.mult(-1000);
    applyForce(force);
  }
}