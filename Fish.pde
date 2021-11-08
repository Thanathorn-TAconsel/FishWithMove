class Fish {
  float mass;
  float diameter;
  float ddd;
  int level = 1;
  Dot dot;
  Vector velo,pos,acc,tar;
  Fish(Vector p,Vector v,Vector a,float m,float d) {
    mass = m;
    ddd = d;
    diameter = ddd;
    velo = v;
    pos = p;
    acc = a;
    tar = new Vector(width-300,height-300);
  }
  void setTarget(Dot dot) {
    
      this.dot = dot;
       tar = dot.pos;
   
  }
  void addForce(Vector force) {
    acc.x += force.x / mass;
    acc.y += force.y / mass;
  }
  void update() {
    //velo.add(acc); 
    
    if (dot != null ) {
      float mx = (tar.x - pos.x) * 0.05;
      float my = (tar.y - pos.y) * 0.05;
      velo = new Vector( mx,my);
      velo.limit(5,5,1,3);
      if (pos.dist(tar) <= 30) {
        dot.pos.y = 1000;
        dot = null;
        level ++;
        
        diameter = ddd + level*10;
        surface.setTitle("Fish Game Level:" + level);
      }
      
    } 
    
    pos.add(velo);
    if (pos.x > width-diameter/2) {
      velo.x *= -1; 
      pos.x = width-diameter/2; 
    }
    if (pos.x <diameter/2) {
      velo.x *= -1; 
      pos.x = diameter/2; 
    }
    if (pos.y > height-diameter/2) {
      velo.y *= -1; 
      pos.y = height-diameter/2; 
    }
    if (pos.y < height/4 + diameter/2) {
      velo.y *= -1; 
      pos.y = height/4 + diameter/2; 
    }
    
    setPos(pos);
    acc.x = 0;
    acc.y = 0;
  }
  float ox,oy;
  void move(Vector posttomove) {
    pos = posttomove;
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
  void setPos(Vector postoset) {
    pos = postoset;
      /*
      fill(0);
      circle(ox,oy,diameter+1);
      */
      //fill(255);
      //circle(pos.x,pos.y,diameter);
      image(img, pos.x-50, pos.y-50,diameter*2, diameter*2);
      ox = pos.x;
      oy = pos.y;
    
  }
}
