Dot dot;
Fish fish;
PImage img;
ArrayList<Dot> dots = new ArrayList<Dot>();
ArrayList<Fish> fishs = new ArrayList<Fish>();
Fish nf;
void setup() {
  size(800, 600);
  frameRate(60);
  background(0);
  //dot = new Dot(new Vector(10,10),new Vector(0,0),new Vector(0,0),1,10);
  nf = new Fish(new Vector(100, 200), new Vector(0, 0), new Vector(0, 0), 10, 50);
  fishs.add(nf);
  //fish.setTarget(new Vector(width,height));
  img = loadImage("fish.png");
  surface.setTitle("Fish Game Level:" + 1);
}

boolean fc = false;
boolean fm = true;
float cx,cy,mx,my;
void draw() {
  fill(184, 236, 255);
    rect(0, 0, width, height/4);

    fill(0, 187, 255);
    rect(0, height/4, width, height);
  if (mousePressed && ((mouseX >= nf.pos.x && mouseX <= nf.pos.x + 200 && mouseY >= nf.pos.y && mouseY <= nf.pos.y + 200) || !fm)) {
    if (fm) {
        fm = false;
        cx = nf.pos.x;
        cy = nf.pos.y;
        mx = mouseX;
        my = mouseY;
    }
    nf.pos.x = cx + (mouseX - mx);
    nf.pos.y = cy + (mouseY - my);
    for (int i = 0; i < fishs.size(); i++) {
      fish = fishs.get(i);
      fish.update();
    }
  } else {
    fm = true;
    if (fc && !mousePressed) {
      dots.add(dot);
      fc = false;
    }
    
    if (dots.size() > 0) {


      for (int i = 0; i < dots.size(); i++) {
        Dot dot = dots.get(i);
        if (dot.pos.y > height/4) {
          dot.addForce(new Vector(-dot.velo.x*2, -dot.velo.y*2));
        }
        dot.addForce(new Vector(0, dot.mass*1)); 
        dot.update();

        if (dot.pos.y > height - 10)
          dots.remove(i);
      }

      if (dots.size() > 0 && fishs.size() > 0) fishs.get((int)random(0, fishs.size())).setTarget(dots.get((int)random(0, 0)));
    }
    for (int i = 0; i < fishs.size(); i++) {
      fish = fishs.get(i);
      fish.update();
    }
    if (mousePressed) { 
      if (!fc) {
        dot = new Dot(new Vector(mouseX, mouseY), new Vector(0, 0), new Vector(0, 0), 5, 10);

        fc = true;
      }
      dot.move(new Vector(mouseX, mouseY));
    }
  }
}
void drawbackground() {
}
