float cChange = 255;
float hole = 1;
boolean mouseDragging = false, spacePressed = false;

public void setup()
{
  background(10);
  size(700, 700);
  frameRate(60);
  smooth();
  colorMode(HSB);
}
public void draw()
{
  cChange+=0.3;
  if (cChange > 255) {
    cChange = 0;
  }


  background(10);

  translate(width/2, height/2);
  float theta = map(mouseX, 0, width, 0, TWO_PI);
  rotate(theta);

  if (spacePressed) {
    hole+=0.1;
  }
  scale(hole);

  myFractal(0, 50, 4);
}

public void mousePressed()
{
  cChange = (int)(Math.random()*256);
}
public void mouseDragged()
{
  mouseDragging = true;
}
public void mouseReleased() 
{
  mouseDragging = false;
}
public void keyPressed()
{
  if (key == ' ') {
    spacePressed = true;
  }
}
public void keyReleased()
{
  if (key == ' ') {
    spacePressed = false;
  }
}
public void myFractal(int x, int y, int siz) 
{
  fill(10, 2);
  strokeWeight(1);
  stroke(color(cChange, 255, 255));
  shapeMode(CENTER);
  triangle(x-siz/2, y+siz/4, x, y-siz/2, x+siz/2, y+siz/4);
  // For testing
  //beginShape(TRIANGLES);
  //vertex(x-siz/2, y+siz/4);
  //vertex(x, y-siz/2);
  //vertex(x+siz/2, y+siz/4);
  //endShape();
  if (siz < 600)
  {
    myFractal(x, y, siz+2);
  }
}
