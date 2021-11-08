class Vector {
  float x,y,lx,ly;
  Vector(float ix,float iy) {
    x = ix;
    y = iy;
  }
  void add(Vector v) {
    x += v.x;
    y += v.y;
  }
  void multi(Vector v) {
    x *= v.x;
    y *= v.y;
  }
  void multi(float v) {
    x *= v;
    y *= v;
  }
  void sub(Vector v) {
    x -= v.x;
    y -= v.y;
  }
  void limit(float x,float y,float mx,float my) {
    if (abs(this.x) < mx)this.x = mx * sign(this.x);
    if (abs(this.y) < my)this.y = my * sign(this.y);
    if (abs(this.x) > x)this.x = x * sign(this.x);
    if (abs(this.y) > y)this.y = y * sign(this.y);
  }
  int sign(float x) {
     if (x < 0) return -1;
     return 1;
  }
  float dist(Vector v) {
    return (float) Math.sqrt(Math.pow(v.x - x,2) + Math.pow(v.y - y,2));
  }
}
