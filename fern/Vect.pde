class Vect {
  float x, y;
  Vect(float a, float b) {
    x = a;
    y = b;
  }
  Vect add(Vect v) {
    Vect result = new Vect(v.x + x, v.y + y);
    return result;
  }
};