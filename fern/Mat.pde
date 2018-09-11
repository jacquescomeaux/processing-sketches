class Mat {
  Vect l, r;
  Mat(float a, float b, float c, float d) {
    l = new Vect(a, c);
    r = new Vect(b, d);
  }
  Vect mult(Vect v) {
    Vect result = new Vect(l.x * v.x + r.x * v.y, l.y * v.x + r.y * v.y);
    return result;
  }
  Mat mult(Mat m) {
    Mat result = new Mat(l.x * m.l.x + r.x * m.l.y, l.x * m.r.x + r.x * m.r.y, 
                         l.y * m.l.x + r.y * m.l.y, l.y * m.r.x + r.y * m.r.y);
    return result;
  }
  Mat add(Mat m) {
    Mat result = new Mat(m.l.x + l.x, m.r.x + r.x, m.l.y + l.y, m.r.y + r.y);
    return result;
  }
}