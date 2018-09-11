
ArrayList<Node> nodes;
ArrayList<Spring> springs;
int n;

int M(int n) {
  return (n == 0) ? 0 : n - F(M(n-1));
}

int F(int n) {
  return (n == 0) ? 1 : n - M(F(n-1));
}

int G(int n) {
  return (n == 0) ? 0 : n - G(G(n-1));
}

void setup() {
  n = 0;
  size(1080, 720);
  nodes = new ArrayList<Node>();
  springs = new ArrayList<Spring>();
  nodes.add(new Node(width/2, height/2, n));
  n++;
}

void draw() {
  background(255); 
  for(Spring s : springs) {
    s.update();
    s.display();
  }

  for(Node b : nodes) {
    b.update();
    b.display();
    b.drag(mouseX, mouseY);
  }
  
  for(int i = 0; i < nodes.size(); i++) for(int j = 0; j < nodes.size(); j++) if(i != j) nodes.get(i).repel(nodes.get(j));
 
}


void mousePressed() {
  for(Node b : nodes) {
    b.clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for(Node b : nodes) {
    b.stopDragging();
  }
}

void keyPressed() {
  if(n > M(n)) nodes.add(new Node(nodes.get(M(n)).position.x + 1, nodes.get(M(n)).position.y + 40, n)); 
  else nodes.add(new Node(width/2, nodes.size() * 40, n)); 
  if(n != M(n)) springs.add(new Spring(nodes.get(n), nodes.get(M(n)), 40));
  n++;
}