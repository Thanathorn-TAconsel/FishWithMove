class Dot {
  float mass;
  float diameter;
  Vector velo,pos,acc;
  Dot(Vector p,Vector v,Vector a,float m,float d) {
    mass = m;
    diameter = d;
    velo = v;
    pos = p;
    acc = a;
  }
  void addForce(Vector force) {
    acc.x += force.x / mass;
    acc.y += force.y / mass;
  }
  void update() {
    velo.add(acc); 
    pos.add(velo);
    if (pos.x > width) {
      velo.x *= -1; 
      pos.x = width; 
    }
    if (pos.x < 0) {
      velo.x *= -1; 
      pos.x = 0; 
    }
    if (pos.y > height) {
      velo.y *= -1; 
      pos.y = height; 
    }
    if (pos.y < 0) {
      velo.y *= -1; 
      pos.y = 0; 
    }
    setPos(pos);
    acc.x = 0;
    acc.y = 0;
  }
  float ox,oy;
  void move(Vector posttomove) {
    pos = posttomove;
    if (pos.x != ox || pos.y != oy) {
      /*
      fill(64);
      circle(ox,oy,diameter+1);
      */
      fill(255);
      circle(pos.x,pos.y,diameter);
      velo.x = pos.x - ox;
      velo.y = pos.y - oy;
      ox = pos.x;
      oy = pos.y;
    }
  }
  void setPos(Vector postoset) {
    pos = postoset;
    if (pos.x != ox || pos.y != oy) {
      /*
      fill(0);
      circle(ox,oy,diameter+1);
      */
      fill(255);
      circle(pos.x,pos.y,diameter);
      ox = pos.x;
      oy = pos.y;
    }
  }
}
